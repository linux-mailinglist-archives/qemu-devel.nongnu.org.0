Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D05688A99
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 00:16:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNin9-0005Dy-1M; Thu, 02 Feb 2023 18:14:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNin7-0005Dg-96
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 18:14:53 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNin5-0004Z7-QT
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 18:14:53 -0500
Received: by mail-pj1-x1029.google.com with SMTP id bx22so432355pjb.3
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 15:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UlyNtlsB3bfCYWQrrJ1ahrkRa01+uMJWOU2Vv4bur3M=;
 b=bVwJ4pHN4XLoTFOSg5WKTRuqT88p00HeMkkM6To5SxeI2T2yf5pVgtJqLkaECXz/Sd
 2W75R84iMYti7jxEdLjBI6OxNxYbH2g6W53IR5RiRSpKEn26/W5C3017a3vjkOKK643a
 BewL+sfct74b4nMkY6T+ZykSambpB8lKZrYxTWM8oECnDTVLF7ZKF6/Jmr+zufqkfU18
 x4y06o3ls/uvduelyf4QdKpcc9DS2ek8zkCeJaMnwoUbHvYlyAjd1DsDgNehTygiFGf1
 hCj6DhCXt0+0QI1bfq7a1IJGaicqJA4nDyTibATH1XKMMXUM1qmYrA4aB5F15rKswfN+
 wt5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UlyNtlsB3bfCYWQrrJ1ahrkRa01+uMJWOU2Vv4bur3M=;
 b=OahwM/iR/vZgj+XZJACfE9AHTogr4AtzH6cfYce3KA8IdcgmYOc0bwJbWhtZsMD3ns
 WxFp5fBcKWrd7bBUVHa9dvG48uXrYZlsdZhWJd/KnIdqtWD/Zf/AR/kRO6B0bG/WGl89
 CS1ZCXDQSTPkD3pqV11BUQs51QB4EOzFFmyxfFp4rCgkWEUB33lH162hpPfDKnRQXXrb
 VOJxD8ijhlai2cUSyXVanTIq983VVOqpuZhPaJ70M2HTDTQz9OP+N4P9fKPPgteyzjcr
 q7soeGEGjhm9yqDpz4PqVAV5wEhxOtQ5uGLwwis4Wm87B3JcCJkSr8NV0v9AFqJXea/b
 1AUg==
X-Gm-Message-State: AO0yUKXiF99pbKU5c76rgmZS7yt1Og8vk8XwS9RWV37zDOoR0ytXPaJv
 jqeCIiOPzVoxefyTbs3ooNPVDw==
X-Google-Smtp-Source: AK7set8uFzbs2/4vCc6W8TaI9Nze1+7/OInAB5fW+Of2XGDoHs/hf3buVtLEXcf4mZc5VHusQLJIng==
X-Received: by 2002:a17:902:c70a:b0:194:586a:77ba with SMTP id
 p10-20020a170902c70a00b00194586a77bamr6764333plp.52.1675379689484; 
 Thu, 02 Feb 2023 15:14:49 -0800 (PST)
Received: from [192.168.50.194] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 x23-20020a1709027c1700b001946a3f4d9csm214758pll.38.2023.02.02.15.14.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 15:14:48 -0800 (PST)
Message-ID: <31fc0aab-404d-919c-8ff8-cee75bb29ea2@linaro.org>
Date: Thu, 2 Feb 2023 13:14:44 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 06/39] target/riscv: Add vrol.[vv, vx] and vror.[vv, vx,
 vi] decoding, translation and execution support
Content-Language: en-US
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Cc: Lawrence Hunter <lawrence.hunter@codethink.co.uk>, qemu-devel@nongnu.org, 
 dickon.hood@codethink.co.uk, nazar.kazakov@codethink.co.uk,
 kiran.ostrolenk@codethink.co.uk, frank.chang@sifive.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, pbonzini@redhat.com,
 kvm@vger.kernel.org
References: <20230202124230.295997-1-lawrence.hunter@codethink.co.uk>
 <20230202124230.295997-7-lawrence.hunter@codethink.co.uk>
 <CAAeLtUA188Tdq4rROAWNqNkMSOXVT0BWQX669L6fyt5oM5knZg@mail.gmail.com>
 <CAAeLtUDcpyWkKgAo2Lk0ZoHcdyEeVARYkh05Ps27wbOzDF0sHA@mail.gmail.com>
 <16a6fadf-ca13-d3aa-7e4b-f950db982a21@linaro.org>
 <CAAeLtUCTBASoGMMgzp_LxOiFkJq0wJFQUC4kDzCWA47iLR_N5Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAAeLtUCTBASoGMMgzp_LxOiFkJq0wJFQUC4kDzCWA47iLR_N5Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/2/23 08:07, Philipp Tomsich wrote:
>>>       tcg_gen_gvec_rotls(vece, dofs, aofs, tmp, oprsz, maxsz);
>>
>> We can add rotls generically.
>> I hadn't done this so far because there were no users.
> 
> I read this such that your preference is to have a generic gvec rotrs?
> If this is correct, I can drop a patch to that effect…

Yes, please.


r~

