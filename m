Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EC110E14
	for <lists+qemu-devel@lfdr.de>; Wed,  1 May 2019 22:32:27 +0200 (CEST)
Received: from localhost ([127.0.0.1]:41023 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLvty-0007dx-MP
	for lists+qemu-devel@lfdr.de; Wed, 01 May 2019 16:32:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53460)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hLvst-0007Fe-TL
	for qemu-devel@nongnu.org; Wed, 01 May 2019 16:31:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hLvss-0005lu-Ny
	for qemu-devel@nongnu.org; Wed, 01 May 2019 16:31:19 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:36038)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hLvss-0005i5-Fc
	for qemu-devel@nongnu.org; Wed, 01 May 2019 16:31:18 -0400
Received: by mail-pf1-x435.google.com with SMTP id v80so4512312pfa.3
	for <qemu-devel@nongnu.org>; Wed, 01 May 2019 13:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=DskgtfXdGoqiCNkUvByQGk1cFUqBi6qpgzfCiWYhq+w=;
	b=hXXZCq42XGDxCKGMy/F9hfQqgFjPRR/AssAlSjHHBCGavlm4Zt03Z/bkzwvzPzSkJG
	yuEYxFRVnz8yWFtwfzsPAgBSTiNjIU4OQWNHbKV7kpWAeXiIyzJhfef7UCLE05x8wnkn
	N8k9MzAGPMn6zARaGg65tZir84FlUKCRraIad9+O3Z3BXaixICeKH3/9QvMIc9bnZ4z6
	i7qqUxzhepu333gn/ZR4vK5Rb6hGbUebjUzyqNAn0sxkLAGeUl2CW+JcZG7qA0yeQk+O
	plg28UNHz9sCI+Y70pCSrCXF+vqtuizBfLE9zH1EZCH8RSa4uvilQ0a7NtZtpNuUWYfU
	4nwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=DskgtfXdGoqiCNkUvByQGk1cFUqBi6qpgzfCiWYhq+w=;
	b=Hmv58NHm2zYQl4e9sp5fiOwwynuQ3nb+Pos/VGa/IWh9EH2aBWCAWg2iFp+iT2CT8E
	7joow54WREofQV9h37RLMMSSW/IO3Q8nFWsE6L+P2qk0njUd2c/EJrUsCPcVytkzYXoc
	jMc8sRGqR5HIJndOXwBmRq7q7F8rEp1WFAZREBXitg4hFtXJDm7N1mu4Z20lt0sP0jMR
	ln0D1TGGKx+y4hVtCrTGBGfyrNAHzUAQmJcmGjfaC3oKz57JfII84UumGmEzEgK/a715
	GWK+Ha+DcK3lshEy+fuE+PNTAaZVGP3F2g+E2t81nxraUhUgDWHsEgBTKOZeOXoIdxod
	8rlA==
X-Gm-Message-State: APjAAAXHJlsTFYGJipLtUKB9sSDA6CPblvoR0i4vTAByOw+FMzo3Jtpd
	YJxt9Hr8wod3WpucLicQ9gAkapfewcM=
X-Google-Smtp-Source: APXvYqwIS5TGh6aLcct/9Dgx/kduEQblPoFJpjZae+zFbjpWW4zYgjhnHIt/p4kA2dARno5MEN1bGg==
X-Received: by 2002:a65:6686:: with SMTP id b6mr36658204pgw.419.1556742675570; 
	Wed, 01 May 2019 13:31:15 -0700 (PDT)
Received: from [192.168.1.11] (97-113-189-189.tukw.qwest.net. [97.113.189.189])
	by smtp.gmail.com with ESMTPSA id
	y20sm54095421pfe.188.2019.05.01.13.31.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 May 2019 13:31:14 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org
References: <20190501050536.15580-1-richard.henderson@linaro.org>
	<20190501050536.15580-7-richard.henderson@linaro.org>
	<87o94m5biw.fsf@zen.linaroharston>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <e4686480-1978-5dcd-b773-a2e48df27300@linaro.org>
Date: Wed, 1 May 2019 13:31:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <87o94m5biw.fsf@zen.linaroharston>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::435
Subject: Re: [Qemu-devel] [PATCH v2 06/29] tcg: Return bool success from
 tcg_out_mov
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/1/19 10:29 AM, Alex Bennée wrote:
>> +static inline bool tcg_out_mov(TCGContext *s, TCGType type,
>>                                 TCGReg ret, TCGReg arg)
>>  {
>> -    tcg_out_dat_reg(s, COND_AL, ARITH_MOV, ret, 0, arg, SHIFT_IMM_LSL(0));
>> +    if (ret != arg) {
>> +        tcg_out_dat_reg(s, COND_AL, ARITH_MOV, ret, 0, arg, SHIFT_IMM_LSL(0));
>> +    }
>> +    return true;
>>  }
> 
> You fix a mov folding here.. either mention in commit message or fix in
> a separate commit. I appreciate the other arches already do this.

Fair enough, I've split this out to a separate commit.
And, using tcg_out_mov_reg(s, COND_AL, reg, arg), which
is perhaps even clearer.


r~

