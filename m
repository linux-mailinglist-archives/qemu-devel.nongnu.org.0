Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3461A932
	for <lists+qemu-devel@lfdr.de>; Sat, 11 May 2019 21:15:06 +0200 (CEST)
Received: from localhost ([127.0.0.1]:34374 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hPXSb-0002ZT-OL
	for lists+qemu-devel@lfdr.de; Sat, 11 May 2019 15:15:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47402)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hPXRD-00024Y-Aw
	for qemu-devel@nongnu.org; Sat, 11 May 2019 15:13:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hPXRC-0006vL-Ga
	for qemu-devel@nongnu.org; Sat, 11 May 2019 15:13:39 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:38930)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hPXRC-0006uW-3m
	for qemu-devel@nongnu.org; Sat, 11 May 2019 15:13:38 -0400
Received: by mail-pf1-x442.google.com with SMTP id z26so4978377pfg.6
	for <qemu-devel@nongnu.org>; Sat, 11 May 2019 12:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=jwZAIWrLsdaF22Xq8kepdM1ipOlPhD9uhZ1kYj5m9+o=;
	b=c2cEGs7bfSm8TbqTlXkWT9NStfoT4ww0bAeUXYECznDaRk0jli8i2hFQ4mUSLurBNv
	yuK0QB0R5AarOLkgtknEI2QfB3LuAbr08QMfRdPzD+21pDq74KD333mS6ZcdSuz59xao
	nDQjAltsG5GlK8lMVG3S//MH/DlulxEVhFhNZMHj4317DAvT+iNDA01v1W4BUUOhwG26
	ai9MSSX5uCsvo0HYDf7QIQHJT9WhNsFL93oIvk7RPc8RLRg9IZ/V6jl3bhvJ3Qrw/cHy
	MAyixBYgRrjm+HKEzmsOdgMsr3+5aK5G5fgm+SpSuXut681Ql/LsCOulMKNT8gBJwhhM
	NXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=jwZAIWrLsdaF22Xq8kepdM1ipOlPhD9uhZ1kYj5m9+o=;
	b=OrCKmSSnb97auHEMKFXaOjmvkZp00mzD/+vhAJEDmMa0zqBM8wjjKTIB1pQViUd404
	FAba8RjW3Tp7MTscJ2oepGnXFlarUhnGYBRzigtnb2HykfOeh7UAsECDS+cgOZinUaRK
	+i+OiK2ADrMvIPsfKWlUnvgH662qTID5zPFINY6vGLvTOOnHCx5FnuVfyC9Xu6Tmt3/x
	yhQXmZsNvVIWREHYSrpjZiv0PQ/mqFPdYstcHSKbF7y59C3tLc9eoGEbp/xAKemhAKBW
	nqdMFwK3J70wuKdSq9lX6evmSbOFMet0ePTdnfAVQ+MUMuSnrF2R45fpVf6IcZwujVJC
	UXgQ==
X-Gm-Message-State: APjAAAXvRa2d9/3SONaCpzOgIij7PG61+/8aI5cJglj8GgPhMXzmcfAJ
	hvsL1z4GTk3lPFC5Wcy3teNM9sLSOpQ=
X-Google-Smtp-Source: APXvYqymXP6LB6OYFrXEnbbwoelfXkS0DEb4wNaXoqeMgktd/kr2DLTvJcQXgAkTAQTnfOZ5Z3a5HA==
X-Received: by 2002:a62:bd0e:: with SMTP id a14mr4118152pff.44.1557602015549; 
	Sat, 11 May 2019 12:13:35 -0700 (PDT)
Received: from [192.168.1.11] (97-113-13-231.tukw.qwest.net. [97.113.13.231])
	by smtp.gmail.com with ESMTPSA id
	i75sm14270132pfj.80.2019.05.11.12.13.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 11 May 2019 12:13:34 -0700 (PDT)
To: Alistair Francis <alistair23@gmail.com>
References: <20190508000641.19090-1-richard.henderson@linaro.org>
	<20190508000641.19090-39-richard.henderson@linaro.org>
	<CAKmqyKN5BmdUwv92UzCVZzNQsykeFSq_TwTvb7h5Ld9UWBuyyw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <9e60945f-5d27-c90b-79af-8e57a9dce78b@linaro.org>
Date: Sat, 11 May 2019 12:13:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAKmqyKN5BmdUwv92UzCVZzNQsykeFSq_TwTvb7h5Ld9UWBuyyw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: Re: [Qemu-devel] [PATCH v3 38/39] tcg/arm: Use LDRD to load tlb
 mask+table
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/10/19 2:08 PM, Alistair Francis wrote:
>> +        if (use_armv6_instructions && TARGET_LONG_BITS == 64) {
>> +            tcg_out_ldrd_8(s, COND_AL, TCG_REG_R2, TCG_REG_R1, cmp_off);
...
> 
> This is complex and I'm probably misunderstanding something but isn't
> it possible for TCG_REG_R3 to not be set if use_armv6_instructions is
> true and TARGET_LONG_BITS is 64?

No, the LDRD instruction loads data into both R2 and R2+1 = R3.


r~

