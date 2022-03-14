Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B174D8B31
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 18:56:37 +0100 (CET)
Received: from localhost ([::1]:34154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTovs-0000q6-OK
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 13:56:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTocf-0007rp-EC
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:36:45 -0400
Received: from [2607:f8b0:4864:20::62c] (port=42898
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTocd-00080j-Vl
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:36:45 -0400
Received: by mail-pl1-x62c.google.com with SMTP id p17so14156751plo.9
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 10:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KiZXS7HEyo62tt39D4c4ez94tWjYKJ9EQxGdNS+E4Lk=;
 b=Wa9kO/wpqbVRw6UUxEAzrKe45CrxoE3L4L9zYEdaeFCEXZQnkPAxrRajfugI4SwZlF
 BYVIo4ZTrITZBw2QT5muQnq0pjDYObiv5xwwu7J7x20SlLtMzjL3NaTApDl99JGBygzJ
 WBQOT/7PrvofUfuzqqUXXHFU2Oek++6Xvmm7SroxJCwbFBFaMFenyb1XXSXW1p4SXIg1
 sBLBnjwAsy9GY4eyiLGbAFeY36sTLTECCrUdJXvYvusJyzTVOOBsGXqghmXrLr1I9VK6
 1LZLsuufaMPjDpibfRGrz3juA9TG1oR5wzb7ICw5pB5aapbynYVQ2As3r8yxGTQJAoY8
 UcEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KiZXS7HEyo62tt39D4c4ez94tWjYKJ9EQxGdNS+E4Lk=;
 b=4t3VpdEL2oIRxOdFDMFfIuChGLUX5kdHoMkIyVLKUt4WG1gnIbq1nNLnqwrsIk3nKN
 u8PF9wRfESA4PIjkC103VQPJV2x94ccaqvL2myC1rA5fUJVghvhQ6Kdd2N7HUutmZfXA
 ppc48xxoFRf/zoSZxNxY5CoJk3IXp2tP9pjNOonhmLv7+QBbpQxQvl/VMbkYVvVrGPS4
 sCF3PVgrBj5o02D8IWRgQ3vIlYdOH2s1i8ArXIclRFqD5l9N2agvu8CNUKPE/RkjzTwd
 59zp1H06xiXPIx+s7wllcZ1z/7oyx7B7XP70EOB37H4hm9DjcdPJ3CLipCqztqXg06sY
 +ZiQ==
X-Gm-Message-State: AOAM531u/U6v8ow2Q1KYj5QgQZ1lrYMIG5rViqXW3qp2n01HZr7wyXcF
 Yil2evPCH54wT4rpvwuKhL7c5M0X+yvqBg==
X-Google-Smtp-Source: ABdhPJyjIgHJgSBUDNuS3/3QWQ56SKuDasf8vAAnBuZUS+C1EcTpgSY3UhI2dv5ypDStzHin1IGeWg==
X-Received: by 2002:a17:902:ce05:b0:14f:8cfa:1ace with SMTP id
 k5-20020a170902ce0500b0014f8cfa1acemr24159699plg.149.1647279402675; 
 Mon, 14 Mar 2022 10:36:42 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a17090a65c700b001b936b8abe0sm122243pjs.7.2022.03.14.10.36.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Mar 2022 10:36:42 -0700 (PDT)
Message-ID: <f99c8734-0ea8-c39f-d622-de2944fb4f41@linaro.org>
Date: Mon, 14 Mar 2022 10:36:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/3] tcg/s390x vector fixes
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20220310202751.594961-1-richard.henderson@linaro.org>
 <74689a0a-6b7c-6797-f701-5e122f68e418@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <74689a0a-6b7c-6797-f701-5e122f68e418@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/14/22 05:41, Thomas Huth wrote:
> On 10/03/2022 21.27, Richard Henderson wrote:
>> These 3 issues were found by running risu on arm neon test cases.
>> In the meantime, Thomas encountered one of the same with the new
>> tests of vectorized sha512.
> 
> Thanks! If you don't mind (e.g. if you don't have any other TCG patches pending), I can 
> take these through my s390x-next tree (I'm planning another pull request before the rc0 
> hard freeze tomorrow):

I did have another tcg patch; I've just sent off the lot.  But thanks.


r~

