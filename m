Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 896A011E1B
	for <lists+qemu-devel@lfdr.de>; Thu,  2 May 2019 17:37:44 +0200 (CEST)
Received: from localhost ([127.0.0.1]:53254 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMDmJ-0002Jg-8t
	for lists+qemu-devel@lfdr.de; Thu, 02 May 2019 11:37:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33834)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hMDkj-0001SC-DV
	for qemu-devel@nongnu.org; Thu, 02 May 2019 11:36:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hMDki-0006Gh-8c
	for qemu-devel@nongnu.org; Thu, 02 May 2019 11:36:05 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:42982)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hMDki-0006GR-1i
	for qemu-devel@nongnu.org; Thu, 02 May 2019 11:36:04 -0400
Received: by mail-pf1-x429.google.com with SMTP id 13so998455pfw.9
	for <qemu-devel@nongnu.org>; Thu, 02 May 2019 08:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=YecrrvNdO0lTc7lEfxGqmf/+qLE1W6OB0uJHC/E1fYw=;
	b=kybsHBGp4n+suhWeYFh0ovY79R8r/bpCtRY9CsBlGlwb3Wj8ACIQHMprdTQbT9hHed
	hDGUF5atRurU5ygiUvnuGjAdGFcn/6F7fvaSRrA59P6QVgBTRjteR3EpKqaSGYDFVwgU
	Uwuq1E69G5MBCGOUaNMEbbKB7JButJdC1VCKyJUK5WTAnX3ERDV0Rkau7SU9Mh6z8OA3
	CB65DLsWwaSxO81AmfCNowclHaZoxc6JtVajIaVtgBefetXynSV88z9B4gSnpuQOZFi5
	Yu+sjcQB6VZTYyUtqdXeqopRODZoD2nasEgAcViUQWMzdakLlP+nrtgASNszyad/nZMs
	/gMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=YecrrvNdO0lTc7lEfxGqmf/+qLE1W6OB0uJHC/E1fYw=;
	b=ARxH2hOUz2Db5stqqv76T1hnwYmsG/OVG3wUF0eXIfUpPWAHlOTC3UYcTR8PFEIJYu
	XsaWBZhI2JjRHIpvJzXHS6GT1EKRsBHQZSEUgiInt65U9c9UL9TUsolcQi6wLMCIBfNB
	10GxGLpC0gCeNGAVB00msfXDL+gFKS5aY5D3fP5IfOxwE0cKzkamgNRX6S8sOZ4s/ika
	cxQQMs2sRqznK0C4ZhYvnyUb87O2PMTVgrOJLrAUvAyIl87eiVS2JnBJON4AMvbim6j6
	AQ5sy/03lSkKqFIIqmj3zkT6dqm2JSqHToKHw1WLHO8hpyHfjNDeHRQX2sUH2LdarxtO
	5vZg==
X-Gm-Message-State: APjAAAWd1Xx2HqgjAdv4g1uns9pWykbrRhCYhgPs0wEBEsFR5d1uWM5c
	j+WLInEyq3HuvxfwwRRf0Jsut4h0OwM=
X-Google-Smtp-Source: APXvYqxLmBQyVUXpS3Ial0jW1oUOvPDL7tYNVsb5vEV/a7zQg/2YTOT/wO1JiDxJv9R9NLI9NNVnSA==
X-Received: by 2002:a62:e501:: with SMTP id n1mr4855282pff.17.1556811362052;
	Thu, 02 May 2019 08:36:02 -0700 (PDT)
Received: from [192.168.1.11] (97-113-189-189.tukw.qwest.net. [97.113.189.189])
	by smtp.gmail.com with ESMTPSA id
	r87sm74744349pfa.71.2019.05.02.08.36.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 May 2019 08:36:01 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org
References: <20190501050536.15580-1-richard.henderson@linaro.org>
	<20190501050536.15580-13-richard.henderson@linaro.org>
	<87ef5h56nx.fsf@zen.linaroharston>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <7db35187-c7c8-a95e-2d26-efc0339acad6@linaro.org>
Date: Thu, 2 May 2019 08:35:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <87ef5h56nx.fsf@zen.linaroharston>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::429
Subject: Re: [Qemu-devel] [PATCH v2 12/29] tcg/aarch64: Implement
 tcg_out_dupm_vec
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

On 5/2/19 6:26 AM, Alex Bennée wrote:
>> +    /* AdvSIMD load/store single structure.  */
>> +    I3303_LD1R      = 0x0d40c000,
>> +
> 
> I can't recall where these magic numbers come from again? The (moving)
> section numbers of the ARM ARM?

They come from the A_a version of the ARM ARM.

The current D_a version has now even removed the section numbers, instead of
slowly modifying them as they did through B and C revisions.

> I was hoping the XML had a bit more guidance on the encoding names but
> we get:

Yeah, ARM doesn't name these at all.

I have wondered if they are adverse to naming encodings, because if they had to
name them all they would feel constrained to not invent so many strange
encodings.  ;-)

> The above is basically a winge as to what do we really get out of this
> "type checking"?

Well, ignore the "type checking" for a moment.

How would you distinguish all of the different encoding functions?
Or would you just open-code every single instruction like we do in
tcg/arm/ and tcg/ppc/?

Let me know if you come up with a scheme that works better than this.



r~

