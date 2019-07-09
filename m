Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA23A63404
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jul 2019 12:12:41 +0200 (CEST)
Received: from localhost ([::1]:48408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkn73-0006FV-6R
	for lists+qemu-devel@lfdr.de; Tue, 09 Jul 2019 06:12:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54934)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hkn6J-0005mS-F5
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 06:11:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hkn6H-0007YW-Gt
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 06:11:55 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:52015)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hkn6F-0007Wh-Ln
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 06:11:53 -0400
Received: by mail-wm1-x341.google.com with SMTP id 207so2460859wma.1
 for <qemu-devel@nongnu.org>; Tue, 09 Jul 2019 03:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=gsnEH2Ikr/PNB/5dsNMCqOIBjLjDK31GztG0TUA7nzA=;
 b=W4vKkdQWTZuO+ucJk2qhjAVVuUXJwqAFC6/vbAwRzAAa/voeRobE1Fu0l8VhgXTubz
 z4o81VtAZMcJI7V/1acl2NS0eB8Pzb/Y8ldpqcUbylGBJ6SHSb9mv4ALAQHejiQwNr2o
 mxnPlZ8+PW546CbMud+mBV+tlm2YEPssjJBHR767LfAN4bHVmSPY2MgcPRs8gHmLzXyC
 u+yeqrrTkTd9deUBpvCYpELICHSKVqksLvt8dNT8e7/jAPkTsEW6IortLmL3I3J8ZWzm
 f71hPm9ukM9CQXp2dmkpN7iku3ySVdJhhVsAf8DKgE1W6YMcJiRVfZ9kuLGosPF+hgu5
 oTJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=gsnEH2Ikr/PNB/5dsNMCqOIBjLjDK31GztG0TUA7nzA=;
 b=kyaHHgvsVUcw/4J+tOA9Xflp3491eXcH8x2EoRXyATaIw7gc5DkCjK/h678IzUt8Vm
 mlvIfIPV2BNnpvMBnnQWVhfs++JLiE3Mm+HTfkH1ke5Q5MvibupJkmoIJb0ngG6c/twQ
 5XfDGTksBog1fGmV7OWr6xKsGdpNVW11jaK0cHcX3vDYCpGJGRoxSmY1jkQ9QsCNaRfV
 wft0WWh75qSB3jKN8FYGUc6hj+QRtp7OxMHEKTQMg1HbB/SpEijnD5f7y27GHJJCtAHH
 85nlPCkRtTfBpDXQ0MAIZ2xmvK8udNJXEnXmyvM9iNRpu6Vs5+L0F9/TSzEW92vNR7W5
 TZQw==
X-Gm-Message-State: APjAAAVyVbk7W1Qrb7rZk0jzacXpzB2jcupEgx22htfuC0eQz190MMIM
 Z+fPtREOsErpT7Y2T8vN9r1tLA==
X-Google-Smtp-Source: APXvYqwlXGhjSd/xxY0aQogOdoOUlICMlXm8PkzzgbE20ivsG0QwLqvTHBI+LilmEJUiaZMB9xK8cw==
X-Received: by 2002:a1c:b604:: with SMTP id g4mr22116022wmf.111.1562667110361; 
 Tue, 09 Jul 2019 03:11:50 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id z5sm1931587wmf.48.2019.07.09.03.11.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 03:11:49 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4A4F21FF87;
 Tue,  9 Jul 2019 11:11:49 +0100 (BST)
References: <20190709092049.13771-1-richard.henderson@linaro.org>
 <20190709092049.13771-5-richard.henderson@linaro.org>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
In-reply-to: <20190709092049.13771-5-richard.henderson@linaro.org>
Date: Tue, 09 Jul 2019 11:11:49 +0100
Message-ID: <87wogrecuy.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: Re: [Qemu-devel] [PATCH 4/5] tcg: Remove duplicate #if
 !defined(CODE_ACCESS)
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
Cc: lvivier@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> This code block is already surrounded by #ifndef CODE_ACCESS.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  include/exec/cpu_ldst_useronly_template.h | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/include/exec/cpu_ldst_useronly_template.h b/include/exec/cpu=
_ldst_useronly_template.h
> index 8c7a2c6cd7..d663826ac2 100644
> --- a/include/exec/cpu_ldst_useronly_template.h
> +++ b/include/exec/cpu_ldst_useronly_template.h
> @@ -118,11 +118,9 @@ static inline void
>  glue(glue(cpu_st, SUFFIX), MEMSUFFIX)(CPUArchState *env, abi_ptr ptr,
>                                        RES_TYPE v)
>  {
> -#if !defined(CODE_ACCESS)
>      trace_guest_mem_before_exec(
>          env_cpu(env), ptr,
>          trace_mem_build_info(SHIFT, false, MO_TE, true));
> -#endif
>      glue(glue(st, SUFFIX), _p)(g2h(ptr), v);
>  }


--
Alex Benn=C3=A9e

