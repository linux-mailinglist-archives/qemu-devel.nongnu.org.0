Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6E29B22D
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 16:37:16 +0200 (CEST)
Received: from localhost ([::1]:56968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1Agl-0002QJ-4Q
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 10:37:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50346)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i1AdB-0000FS-0O
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 10:33:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i1Ad9-0001jk-Og
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 10:33:32 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:40449)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i1Ad9-0001j9-Ey
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 10:33:31 -0400
Received: by mail-pf1-x444.google.com with SMTP id w16so6583318pfn.7
 for <qemu-devel@nongnu.org>; Fri, 23 Aug 2019 07:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JRLxlv4cnfXmmIjSEQBc5L2Hqowbo6b3NP22sM3+D4U=;
 b=r7Kj5Pp2MToaBkFmJYU+4YyEwatDEAKFCQR+HUlrsFHPk4URu8NlREmjmk5ZH+D71+
 6RfMGbuyNpAS8CM1ibz+mYIpvxeArpgrOrp37URWmVzLoVISgP77QVsC0tO8ZOcQuOtP
 3xYu0cA6cfOIk+77p7njB2NKnaHr3GQ56za7UzijCFDFUaT1gsoGvEU4mIeGuaT/bVDj
 NkFXyXeGhp4HbNcQIJr9DLA+WUcSgsmfotPykJbtykKhjo9rt5x2/yZOvNcVYYq9zdb0
 pjcLU4U89j18WOo7p/RwcMoV9YPscCM3A2zJ+1yCMhT89gUnmEiZ9uXUX4T2Vltg36Xo
 w8vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JRLxlv4cnfXmmIjSEQBc5L2Hqowbo6b3NP22sM3+D4U=;
 b=D4z2QbXxxm7clVKd8rErob8rRiPDpEJiCIgNWdvhp1addRW/vRE6Gs+7ztpWxsIweH
 U4UIr2Qy4pOliU/Gxbd/sflcLYn7OGh7wSrbrkhAOhfAMZUsrXXnbllkDQlANmzt9WQF
 lkq5JddBw5yltD1bLO3ES7PpmRu/8NVcR7lLw0pEZMIRPOAgFFSmx5D7iF2aTbK7DkUI
 i1WQMkqEG/+Mq6KxT+lp26a64TpO4xGSKkuBp+NlA0n4lr/5jeIApiyoRwGwCd1JvbLJ
 aLdJ5BNwlma6u5Ggz+g13AudFHPvcKIFAPBWOgbm4el5RsHc278/LehjyPI140s+yQck
 greg==
X-Gm-Message-State: APjAAAVUl0tLiMID1o4IwRd3XKvjW5x7oRkAjAfNzHoWTaDlfN6XXiO3
 HdmB1Kb8ISVwhFfX6gMXjEuBuw==
X-Google-Smtp-Source: APXvYqwTjJ++4ByOZ9bTB3jUxO/+bypd2n2FQ/NUPD59nPvuEeKvbPhJRHTyCpvjViwFHKrvCPdu7g==
X-Received: by 2002:a63:1918:: with SMTP id z24mr4103141pgl.94.1566570810219; 
 Fri, 23 Aug 2019 07:33:30 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id a128sm4264708pfb.185.2019.08.23.07.33.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Aug 2019 07:33:29 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-19-richard.henderson@linaro.org>
 <CAFEAcA9xx_bDZ3hf2aTaOxPupmSFQ11g4xTsHow6nxn6j2ZcEw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <64cbcae8-d9a6-9e5b-4acf-825597884a20@linaro.org>
Date: Fri, 23 Aug 2019 07:33:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9xx_bDZ3hf2aTaOxPupmSFQ11g4xTsHow6nxn6j2ZcEw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-devel] [PATCH v2 18/68] target/arm: Convert the rest of
 A32 Miscelaneous instructions
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/23/19 5:03 AM, Peter Maydell wrote:
> On Mon, 19 Aug 2019 at 22:38, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> 
> In subject, typo: "Miscellaneous".
> 
>> This fixes an exiting bug with the T5 encoding of SUBS PC, LR, #IMM,
> 
> "existing"
> 
>> in that it may be executed from user mode as with any other encoding
>> of SUBS, not as ERET.
> 
> Should this paragraph be in the commit message for the previous
> patch? This change doesn't touch SUBS/ERET.
> 
> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Indeed that text should not be here.

And also, as you might be able to tell from the text of the previous patch, it
isn't an existing bug.  It took me a while to see that, and that's why I think
that passing pre-v7m through the usual SUBS path is clearer.


r~

