Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD709682094
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 01:21:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMeNU-00017D-Oa; Mon, 30 Jan 2023 19:20:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMeNO-00016Q-7y
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 19:19:54 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMeNL-0001eQ-FF
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 19:19:53 -0500
Received: by mail-wm1-x329.google.com with SMTP id l8so9230085wms.3
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 16:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7lxGxyIFXr2JwFlsgdY5rTJ5q6myA+rZ16Oj2UlKX5k=;
 b=oiWhI6uelI072MOoJhEguP/pQQX2qJETTD27d8Bpk9YwYs9FGIAPN6bJH74Z9lniaD
 ZD+iLjAJCPrCNXQYQRUxyJ7yaUvT20DbrkVju79aM+qyGA2E8jiuq8BcgclZl7QJQgZj
 gcI7UQy7xJSXVy4TFbcrUFV1ikjhhD15688OYscmPuIOovISK3gmudoZNlpSsTwhuiJk
 Txchd9UMYVSLtxWkaAhlnaujogLka7PCYKX4ORZGyxsmgJCyg4kd6cUQDNYmlFfaFuDB
 NhE5ofUx3s7wGiE8ZkedfQ1/2Ic473fio2OM2CHNJikYT2VckVd8AzRdgB1XG4bZKVbb
 MFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7lxGxyIFXr2JwFlsgdY5rTJ5q6myA+rZ16Oj2UlKX5k=;
 b=Jquil3jP2e2ZSyXQBov4+8UH8fs66Y3d7eXJAnZiOOHGn//iaolkUdhrfDMg5xDJFW
 CxZ1EX9kzTs/WT7V+8W0/eNOSeQcYTjHVYJylFPYp+XrHuV1Zxzs7cnYC5gLW7YnY/oZ
 NYvhFoKOHCIA60oLSt3JE3JB46eAD8nsHj78oMAmydt8mtYBJnceq4ZUsKyg93mRqXR+
 1YMQdj5XMQnPWiC+ymdt8alw6v9UStRQgIftd1sWzRvKGnxLYehEaWHDjDQ3dm+lLJTy
 DIPk2M13fG4piin8q2z1ZB1rMcrkd4VxACZUY4r8dj8mX62nMf5ry2zehnVVmtPwfxET
 Alkg==
X-Gm-Message-State: AO0yUKVIaD64JIZCJu2jka20fyDLxx9OOqrI81KJfoFsQ3MurVWu2J/u
 KnN1Cs9hOSYOPBlr/T8+/Z1jHw==
X-Google-Smtp-Source: AK7set/41ySKexuf5z9anI0mVnfMjJUgNwR3LeGNlo14ad3Q/JdPzpdkWz/yX7dKLD5u7bT3+1MMgg==
X-Received: by 2002:a05:600c:548c:b0:3dc:5390:6499 with SMTP id
 iv12-20020a05600c548c00b003dc53906499mr1343557wmb.1.1675124389773; 
 Mon, 30 Jan 2023 16:19:49 -0800 (PST)
Received: from [192.168.1.4] ([41.141.105.34])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a05600c35d000b003dd1c15e7fcsm787621wmq.15.2023.01.30.16.19.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 16:19:49 -0800 (PST)
Message-ID: <6d562d73-369d-b1f1-3b80-3e60e5c90c70@linaro.org>
Date: Tue, 31 Jan 2023 01:19:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH] docs/about/deprecated: Deprecate 32-bit host systems
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, libvir-list@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>, Brad Smith <brad@comstyle.com>,
 Stefan Weil <sw@weilnetz.de>, Michael Tokarev <mjt@tls.msk.ru>,
 Yonggang Luo <luoyonggang@gmail.com>
References: <20230130114428.1297295-1-thuth@redhat.com>
 <CAFEAcA89Onb9Dg4zJXQ0Ys-0kJ2-hz5KYRPXMCE7PWDDxVzDyQ@mail.gmail.com>
 <Y9exrDWT2NUoinu1@redhat.com>
 <9c529b2a-14bd-fd50-c0d9-87f2253ee0bb@linaro.org>
 <51e135e0-0c94-43d6-c408-1a9d556e9e42@linaro.org>
 <8a802013-1bdf-8b56-d74c-0e3ee1c203ae@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <8a802013-1bdf-8b56-d74c-0e3ee1c203ae@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 31/1/23 00:33, Richard Henderson wrote:
> On 1/30/23 13:14, Philippe Mathieu-Daudé wrote:
>> On 30/1/23 20:19, Richard Henderson wrote:
>>
>>> But I do question whether we need to support 64-bit guests on 32-bit 
>>> hosts at all.
>>> Retaining 32-bit on 32-bit allows arm32 to emulate i686, which I 
>>> suspect, but have no proof, is the limit of what users actually want.
>>
>> I presume you implicitly restrict that to user emulation, right?
> 
> No, there's no specific reason to eliminate e.g. qemu-system-i386. or 
> any other 32-bit guest.  Though quite often such hardware doesn't really 
> have enough ram to do a good job, that's not a technical argument against.

I am not concerned by the RAM limit but by the community maintenance
cost. As of 2023, QEMU v7.2.0 is usable on 32-bit. Fixes will be
backported in the v7.2.x stable releases. Maybe this is enough for
32-bit host users; and planning the unavailability of features released
in v8.2 or v9.0 for 32-bit hosts doesn't seem unreasonable.

Stefan Weil once posted stats of Win32 vs Win64 binary downloads from
last year IIRC, and Win32 is still consumed (but maybe the difference
comes from mirrors or users always downloading both versions).

>> WRT i686, if your example is "i686 useremu on non-x86 embedded router"
>> then any 32-bit host is potentially interested, not only arm32.
> 
> arm32 was merely an example -- the other 32-bit hosts are i686, mips, 
> ppc.  But we don't have many of them.
> 
>> I remember being able to run armhf binaries on armel hosts (and vice
>> versa) was useful 7 years ago.
> 
> Fair enough.
> 
>> Today I have no clue, we could poll the community and some distributions.
> 
> Sure.
> 
> 
> r~


