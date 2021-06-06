Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C996739D174
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Jun 2021 22:31:28 +0200 (CEST)
Received: from localhost ([::1]:35502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpzQd-0000pW-Es
	for lists+qemu-devel@lfdr.de; Sun, 06 Jun 2021 16:31:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpzPQ-0008J0-Nz
 for qemu-devel@nongnu.org; Sun, 06 Jun 2021 16:30:12 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:41673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpzPP-0003lp-2I
 for qemu-devel@nongnu.org; Sun, 06 Jun 2021 16:30:12 -0400
Received: by mail-pf1-x433.google.com with SMTP id x73so11554591pfc.8
 for <qemu-devel@nongnu.org>; Sun, 06 Jun 2021 13:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=To+8xBldLDCKBnFc6PeofbhOVCnWst7xZ5YKbnlcvBw=;
 b=oE9TmCVjPntQWS7tRHADgo42YpMsNWbdVeY4/flRJobqpiMelFDx563H2iGKHHn5qF
 uYTsbJer61L7VGKr3NFsUCO1P3qIPxAwMHM91kbQsXJcwR46YHRM+e01mj0Ph3O6W3xM
 4CZRZ47ybR3w8SIP/BLGOdXrQg1m7LVpU9GbGZcPE9ivkFDF7hJ+eU/3FkE85ohHS2N7
 mPQ78xNnhQYQqmAd3+5+DvaVOI7wXsg4yapaHChUz+SOcMNgKf69fky1U8ikvRY9/TAv
 sn+d5JTf31aJc6Ah9gdlcTyrA8y0b70BLYg3J4c9Ed+UhP778SGIgV1ubQHl5qBkPlN9
 A09A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=To+8xBldLDCKBnFc6PeofbhOVCnWst7xZ5YKbnlcvBw=;
 b=NNByWfeKltGARjTCnRTkLfYGCeknWrnQEm8nFju2BTWHikBBPhRZwiR4Z/wfxKNuxt
 gLX0eFr020LdbXraUqxxIT2IsLzQ/aj5jay8CAcwPF+ClS66BqMT2JNlayuypGaIShSm
 faFLHnofLA5BQfPwYJtgAcqKFdA/oaS2V5m77DikUrRI9atvzCM1/PRjH4EEJ2JQsHPs
 D0gO+XdOTIpOVQJVoHIbnyqrtDz1iD0KVjPmrfM6rjVpVMMbHpfYRGNvxMdMTyBh6u59
 PbwVMTLmsSnGhQRCWyuqdR9M5EPnRZW/YUQp5GKRGNUn0zbP/D3ZFJukxGYnnatSizt4
 ekKA==
X-Gm-Message-State: AOAM532YylnUCuh7r/TzZ/X+79tcJdDn8/DnmFQtoTw/6bdXelMY95ht
 OdksY8OqPkVk831Ermx5p70FFJ2YayQUvg==
X-Google-Smtp-Source: ABdhPJwE317HsclijpbhVoAzY+UJJvyWA5XeQCFYwhbfJylMpIjrRN2X3P3VN5lpGdx306TK8uYNJg==
X-Received: by 2002:a62:a217:0:b029:2ee:48e1:fd92 with SMTP id
 m23-20020a62a2170000b02902ee48e1fd92mr5330526pff.55.1623011409688; 
 Sun, 06 Jun 2021 13:30:09 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 m129sm6116493pfb.7.2021.06.06.13.30.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Jun 2021 13:30:09 -0700 (PDT)
Subject: Re: [PATCH 0/8] PALcode fixes required to run NetBSD/alpha.
To: Jason Thorpe <thorpej@me.com>, qemu-devel@nongnu.org
References: <20210603035317.6814-1-thorpej@me.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <67a8fd5c-9a33-b57e-4bd5-21d9b1028fc4@linaro.org>
Date: Sun, 6 Jun 2021 13:30:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210603035317.6814-1-thorpej@me.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/2/21 8:53 PM, Jason Thorpe wrote:
> Jason Thorpe (8):
>    Make qemu-palcode build environment standalone. NFC.
>    Fix delivery of unaligned access exceptions.
>    Fix initialization of the hwrpb.hwrpb.cpuid field.
>    Make some PCI macros available to other files.  NFC.
>    Fix incorrect initialization of PCI BARs.
>    Provide interrupt mapping information in PCI config registers.
>    Provide a Console Terminal Block in the HWRPB.
>    Fixes for seconday CPU start-up.

Thanks.  Applied all but the Console Terminal Block patch, and pushed to my 
upstream github repo.

I'll wait for an update on the ctb patch before refreshing the image in the 
qemu repo.


r~

