Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E0E6A4070
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:16:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWbUP-0002Be-Fb; Mon, 27 Feb 2023 06:16:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWbUD-0002A2-7c
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:16:05 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWbUA-0001lZ-Ki
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:16:04 -0500
Received: by mail-wr1-x429.google.com with SMTP id r7so5788465wrz.6
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 03:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O2jpnb8AYjHgEWIXvBQn10yq2NOQ5veSmnyVaeuqNdY=;
 b=zJnX595IiA513cYNlqJWh5E2sjzcQS/B8fZRmY2sdKzc7nad15fGPoHOb2nWAUuBVI
 6XeQPebqN1pLE7j1lzEP49RddjLSsmKFZrMFbSMVVTOJJ+oYFh+vWQ/XWDmBhKC8N3MV
 POZzfRry3Dm5QlRXqeUdtYVom8LkpxXTSZUdeADLeQmQUhZS2pYX11ByIEJjLHAoE8OS
 /RU7xc+IZL1FWSSDOxPt022YobVl+yaEOEWYpqS7pYZp1+4ScK/bhLCv1Q7GZb95cV+x
 uVJfiKR4ILMQpJDepMUmmZf5oWng1NBiuQCwfpYZa4Jm+lCmcy/4KX4AMSPaDvTACctO
 lKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O2jpnb8AYjHgEWIXvBQn10yq2NOQ5veSmnyVaeuqNdY=;
 b=dreTDrPO5djqX7KHdAvLft9CZAxP8B5lcjp9OMjYLiGUvcvUqoxmrwJ0V3Zm5svEXf
 j18Iwsl6771dJt0jyHMVtnbT52C8o16HTCmJoLasiRetQREPnpQosnT3i9aY6s1iluua
 97wTVOqjEzAMDGmWjD7ranbSV6YaIbDwHU3ECcyjuuh8iMpJu/1KOvnyjEi32141/Rgf
 tmt3A32tFJsxsgvpyH0z1DQczrDuzwkQNLSieAMRJINMNQaRTSuJlTUqJho46j5k9E5e
 cU+6YQ+3g57mzTUmUoiYuwegzev6ob5mwRfnFkpW+xiDdoAKO6zaBvb3FTyVHw0FJ0Eh
 vdOA==
X-Gm-Message-State: AO0yUKX9W/GdEMEejB6zd+JlvPXiz2Nmd2MKy0+UBXKl/HIGhoCm0sIb
 c84uJVT2PDyq1zqRWtdL7D7seCb9jwrWuUyG
X-Google-Smtp-Source: AK7set/nJyZDs+f8imJldlAIQNtgNj66tQA5/G2IMe0WkUASY4yb0DurJuzYmcavsywA5E1PGftjig==
X-Received: by 2002:adf:ef4c:0:b0:2c7:8f73:7700 with SMTP id
 c12-20020adfef4c000000b002c78f737700mr8486129wrp.39.1677496560764; 
 Mon, 27 Feb 2023 03:16:00 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p10-20020a5d458a000000b002c559def236sm6793646wrq.57.2023.02.27.03.15.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 03:16:00 -0800 (PST)
Message-ID: <ba7cefe1-7fb7-7b6e-e22c-867eb4f0b3ad@linaro.org>
Date: Mon, 27 Feb 2023 12:15:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 0/6] hw/vfio/ccw: hw: Use QOM macros and remove
 DO_UPCAST() uses
Content-Language: en-US
To: qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>
Cc: Eric Farman <farman@linux.ibm.com>, Eduardo Habkost
 <eduardo@habkost.net>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-s390x@nongnu.org, David Hildenbrand <david@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230213170145.45666-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230213170145.45666-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Alex,

On 13/2/23 18:01, Philippe Mathieu-Daudé wrote:
> QOM housekeeping series which replace the DO_UPCAST() macro
> uses by equivalent QOM ones (and few more trivial cleanups).
> 
> Since v2:
> - Split of bigger series
> - Split in simpler patches
> - Added Eric R-b tags
> 
> v2:
> https://lore.kernel.org/qemu-devel/20230213070820.76881-17-philmd@linaro.org/
> 
> Philippe Mathieu-Daudé (6):
>    hw/s390x/event-facility: Replace DO_UPCAST(SCLPEvent) by SCLP_EVENT()

Thomas took the first patch,

>    hw/vfio/ccw: Simplify using DEVICE() macro
>    hw/vfio/ccw: Use intermediate S390CCWDevice variable
>    hw/vfio/ccw: Replace DO_UPCAST(S390CCWDevice) by S390_CCW_DEVICE()
>    hw/vfio/ccw: Remove pointless S390CCWDevice variable
>    hw/vfio/ccw: Replace DO_UPCAST(VFIOCCWDevice) by VFIO_CCW()

Could you take the other ones via your VFIO tree?
(all patches reviewed).

Thanks,

Phil.

