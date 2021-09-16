Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2C240DBF4
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 15:58:19 +0200 (CEST)
Received: from localhost ([::1]:53890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQru6-00062D-53
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 09:58:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQrpd-0008BG-02; Thu, 16 Sep 2021 09:53:41 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:54795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQrpZ-0007wc-8P; Thu, 16 Sep 2021 09:53:40 -0400
Received: by mail-wm1-x32f.google.com with SMTP id s24so4879068wmh.4;
 Thu, 16 Sep 2021 06:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Xs41x05dcFcumFdYZ0blpNEK9yloXwu3R4GFRqVabY4=;
 b=TiJyuy6IINYsgd3rMEtD5ePunciL8UMKwvDuq2ccFJ+fRiE47AE1+SkSGZqa/QxetU
 fcIpQFxjCqE4CwTu8+xk1RyGHMg8i19JT3xXvOucw6+AiaYIf6yVvNIrNd3NWVpOi8Hx
 VywRqw656eBmvuGNioJaOervTDxGT47nPfb3rzq/5XcWS2shZLYZ1+hhdptqJckW4z5B
 u+7wa9QUtlhMchiZjKo9Yg2jQQ8yOzCkFYx+7nEX0d2hk8VT1jWNCtWunmCrcpcJKd7q
 kmK7GCp5XNCMpFV4d24YlZ81zNwtfr/iHA15K5nylue+CAOoexwgxm8AvdMI2wUMl3Iw
 iC7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Xs41x05dcFcumFdYZ0blpNEK9yloXwu3R4GFRqVabY4=;
 b=p+Ffr8wuAQ0L4sy1ruW7tw6aZDBRXCBcE8yal2A5tmi0Zte409CEzHKC60I+7wC6qQ
 Lk0oxzYey2bUH65f0e0Z8ouLjkeGF/g2jIrvLM8ttReY9rCXaU9XjlLDWOKYh3neTsvU
 HjtCXY1fnNWWwyF5KWJ8SpUEf7cEZLjaajkhMva6l885G+4fq3o2XVfMSyrnIMCoxQGW
 gkpGHNmRsRdGY3xS9uncOjMz7mXOJ/F7W82+GcpemY0BsG/5nbrr167zdIDGWmuvZyND
 9t2R59+GsICGxhca/9TvrajqX/laC6JkKxbtD50dyhwh95YCG/ebh4Ow2r1lmNwcINZ6
 ZtNA==
X-Gm-Message-State: AOAM531Dd4HLkl3WWdKuHL/vBUMtGO1umXCCKNSzUItzaXX810y5uGxy
 x2ZMsk3pOYAj9dskRXeIHoc=
X-Google-Smtp-Source: ABdhPJxQKdRTYhK/oMm3QSol3qeb4fP2k4cXAJtmeLhuDmdK5EllGu+jGXS5O3mGGKlma4/Itxs9Cw==
X-Received: by 2002:a1c:a913:: with SMTP id s19mr5166201wme.26.1631800415450; 
 Thu, 16 Sep 2021 06:53:35 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id o7sm3885580wro.45.2021.09.16.06.53.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Sep 2021 06:53:34 -0700 (PDT)
Subject: Re: [PULL 14/14] hw/arm/aspeed: Add Fuji machine type
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>
References: <20210913161304.3805652-1-clg@kaod.org>
 <20210913161304.3805652-15-clg@kaod.org>
 <88c26520-6b87-e7a2-ac78-c1c92477c814@kaod.org>
 <BBC4A4E0-651C-41DB-81DE-1F6D86AABAB1@fb.com>
 <CACPK8Xdey9_x-ZN1JbgFyTrW59EapH4xcqYbyNQxyQ5t0uWPvw@mail.gmail.com>
 <CAFEAcA8ntPE3GkTNU8bSBhCWzk_jdH4QR1kDgwo6deQ+T1iOKw@mail.gmail.com>
 <1949e204-1bce-f15b-553b-1b42b41e3e08@linaro.org>
 <d00d7eeb-a50c-c039-046c-7749fde25af8@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1d6fb312-ab21-ca9c-d7ec-1043ccc65b10@amsat.org>
Date: Thu, 16 Sep 2021 15:53:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d00d7eeb-a50c-c039-046c-7749fde25af8@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.488,
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Peter Delevoryas <pdel@fb.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/16/21 2:29 PM, Cédric Le Goater wrote:
> On 9/14/21 17:22, Richard Henderson wrote:
>> On 9/14/21 5:26 AM, Peter Maydell wrote:
>>> (2) RAM blocks should have a length that fits inside a
>>>      signed 32-bit type on 32-bit hosts (at least I assume this
>>>      is where the 2047MB limit is coming from; in theory this ought
>>>      to be improveable but auditing the code for mishandling of
>>>      RAMblock sizes to ensure we weren't accidentally stuffing
>>>      their size into a signed 'long' somewhere would be kind
>>>      of painful)

>>> Even if we did fix (2) we'd need to compromise on (3)
>>> sometimes still -- if a board has 4GB of RAM that's
>>> not going to fit in 32 bits regardless. But we would be
>>> able to let boards with 2GB have 2GB.
>>
>> I'm not opposed to deprecating 32-bit hosts...  ;-)
> 
> Until then, I am willing to make the following compromise for the fuji  :
> 
>     mc->default_ram_size = (HOST_LONG_BITS == 32 ? 1 : 2) * GiB;

While I disagree with this approach, better to document it clearly
like commit 25ff112a8cc ("hw/arm/mps2-tz: Add new mps3-an524 board").

