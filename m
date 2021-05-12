Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1042437BBC4
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 13:29:04 +0200 (CEST)
Received: from localhost ([::1]:55102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgn31-0000YJ-5Y
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 07:29:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgmyN-0002ai-Bo
 for qemu-devel@nongnu.org; Wed, 12 May 2021 07:24:16 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:38829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgmyJ-0006gQ-OQ
 for qemu-devel@nongnu.org; Wed, 12 May 2021 07:24:15 -0400
Received: by mail-wr1-x432.google.com with SMTP id l14so23236519wrx.5
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 04:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=d91UVT8e2lpv1RO9NXm5p9UG+kt3SyWB8IV1o6EwO3o=;
 b=fPtVMOrVVN8kWioQig2u6QSvcPVs2ZIT+y0w5oeZPLrKZZch/hoW0FfTHu7DhgZ8eL
 cAMRqw56QscTRrdCq56AYGmXcKgWn4JdCIS4OTlvMYTPi/WmF2zEZeAuQEoatC4TGaEp
 XCgVW8UkV5iymbqMLqg6faJbmGU/pjpOorYZNJG6MyaUv6M3PwPicJg54HEtAPMsSh+B
 6NOCo7LC30N2+BuBJwUvFr0BUMfT0Tvi6SSJ58IZHlORDxi0Cm0pxm6BsxAuLpQKZHZo
 X/8KLuOA3GlAeb4/ZOVVEL5JB3kRxSs1hDr0Gv4oRICJy4RsGLtkWsYkL5GcVIjTDdAs
 eFcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=d91UVT8e2lpv1RO9NXm5p9UG+kt3SyWB8IV1o6EwO3o=;
 b=X1aOTTWph1f4RaCG8VvwjGI/mFfeSrXMIzjOz082FGemTxsYf1G+HVkVtkchddZpJJ
 qdkyUxJDVRhooCuPv145cobiFGdq1JIJ5zm6Cf/WJVF1jInHip+dJQHZ+rD/fGqH8DeR
 lnKX6C3zJawy7NiwuBKDdfnTdS67tGHYS2ciem3ywyX//VL+GBHcDULNcprFYdhKUkCP
 6f4FUthK44iwjW0Invzpi+lYL55cVpWGJzDi0roS7PqwnVpkA4DYfRl/kzTC8PyjdjjI
 gz0NSv76D6yI7VoYLptie9OqIPOGsW+ockRnRI2PsSXF0CC+sKwbELHNGM4e+VFVed45
 dtDA==
X-Gm-Message-State: AOAM531UYn7mxMDB7OgRTfG+hv2Jv0AOBmVDae768MC3sc0kLS6w/QTe
 PXVZFHuaWdsdu1WjfFliGPFoVQ==
X-Google-Smtp-Source: ABdhPJxj4XsQvz1ffqcUB3++JhRdzGTk96fbOy2Hc1NM6hWwswoibOLjVNkzFeX6VmK5nmCE5zJogw==
X-Received: by 2002:adf:9cc1:: with SMTP id h1mr43139699wre.135.1620818650025; 
 Wed, 12 May 2021 04:24:10 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j7sm26110272wmi.21.2021.05.12.04.24.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 04:24:08 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8F1BA1FF7E;
 Wed, 12 May 2021 12:24:07 +0100 (BST)
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <87bl9iyahr.fsf@linaro.org>
 <354c8418-9700-e98d-47b1-10e564fbeeaa@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 00/72] Convert floatx80 and float128 to FloatParts
Date: Wed, 12 May 2021 12:22:14 +0100
In-reply-to: <354c8418-9700-e98d-47b1-10e564fbeeaa@linaro.org>
Message-ID: <87pmxwfb54.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 5/10/21 8:36 AM, Alex Benn=C3=A9e wrote:
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>=20
>>> Reorg everything using QEMU_GENERIC and multiple inclusion to
>>> reduce the amount of code duplication between the formats.
>>>
>>> The use of QEMU_GENERIC means that we need to use pointers instead
>>> of structures, which means that even the smaller float formats
>>> need rearranging.
>>>
>>> I've carried it through to completion within fpu/, so that we don't
>>> have (much) of the legacy code remaining.  There is some floatx80
>>> stuff in target/m68k and target/i386 that's still hanging around.
>> FWIW I could enable a few more tests...
>
> Ah, thanks for the reminder that these were disabled.
> I'll add this to my patch set for v2.
>
>
>> ...although extF80_lt_quiet still has some failures on equality tests:
>
> This turns out to be a trivial typo in the tester itself:
>
> diff --git a/tests/fp/wrap.c.inc b/tests/fp/wrap.c.inc
> index cb1bb77e4c..9ff884c140 100644
> --- a/tests/fp/wrap.c.inc
> +++ b/tests/fp/wrap.c.inc
> @@ -643,7 +643,7 @@ WRAP_CMP80(qemu_extF80M_eq, floatx80_eq_quiet)
>  WRAP_CMP80(qemu_extF80M_le, floatx80_le)
>  WRAP_CMP80(qemu_extF80M_lt, floatx80_lt)
>  WRAP_CMP80(qemu_extF80M_le_quiet, floatx80_le_quiet)
> -WRAP_CMP80(qemu_extF80M_lt_quiet, floatx80_le_quiet)
> +WRAP_CMP80(qemu_extF80M_lt_quiet, floatx80_lt_quiet)
>  #undef WRAP_CMP80
>
>  #define WRAP_CMP128(name, func)

\o/

I did note we are missing mulAdd tests but they seem to be missing from
the underlying testfloat code as well. I guess we don't care that much
for the 80bit code? Is it even used by any architectures?

--=20
Alex Benn=C3=A9e

