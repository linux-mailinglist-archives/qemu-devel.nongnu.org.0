Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9CC15061A
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Feb 2020 13:25:36 +0100 (CET)
Received: from localhost ([::1]:39004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iyanH-0000jr-Sk
	for lists+qemu-devel@lfdr.de; Mon, 03 Feb 2020 07:25:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51198)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iyamW-0000DB-CM
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 07:24:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iyamV-0006b3-0L
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 07:24:48 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:44519)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iyamU-0006Xn-OL
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 07:24:46 -0500
Received: by mail-wr1-x441.google.com with SMTP id m16so17787166wrx.11
 for <qemu-devel@nongnu.org>; Mon, 03 Feb 2020 04:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=zF00IWsQOIhXh0sacCBT/5Tctr9FKyyiq0PRBJZX5G4=;
 b=K/CB9QHPl9WGTHwynhuPgPdVmnBYXUZIwILXTIXHV9N+TU1JpelIJubgKsfqTwzP14
 lDWgYGS1taZZx4pKgwZ5m9FExfLGjMn6SWrLplODy0EVpznAwq3HP8OVM+gnjHmK0Z4e
 MIvLhk7+nTsVpSj3SnFRnFlB9EEU8Qe1D1lzD14spkyRhifuQrhh7eqp97Q70Tdrl84M
 a4hytiGdAFko6tK0JwSLXkePN0+ZJc8PzUnnBePVmHFWAKULkR0QR7pGeeXoOS9X49c5
 Vrz5PwKQMwbgJa74fYSKgkxrlLBMmqfdFQ0RZhqxX9aZ+d1nE5dPbo9LzdAJBNfS7tM5
 MlnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=zF00IWsQOIhXh0sacCBT/5Tctr9FKyyiq0PRBJZX5G4=;
 b=Y2xjE0cIHi6AmEQYvnCpRHebc9BXzs8IzXsMJfIAg3ndduWurnFAZ34MElWrky9+eC
 lbmj7Ibe1MwMDsVJA6D9kPbI0Fj02B8eN6Kqzvs/W19H3HUIEgshh8Evw+x5MU466ulz
 PogNtEDKfQgzfac18+QaNJl18HAsYv/Kg0ssTUgpp77Mv5SV0ZJcxM21sgZLaAC4E42J
 VJZLXZYPWtSmoaY/O/RCTDM6VsOO5jQa6zzX6Yguq5t17/Ixwc6dqPUs8KEzOkLBlp3O
 VE1IDdrbqJVm4vS5jWlXppO+PewVnO99dthExjU64fWvtlLqmSj39kvkonF8phJgsD4I
 s/wQ==
X-Gm-Message-State: APjAAAX2MljE+OkZ8X0xs+1tXOE/hzlsZa405RiaTCwLT4lGDullzQgA
 fununDb/ZdQwgX8+oJm2r64woEOw9lI=
X-Google-Smtp-Source: APXvYqxYGhvv+M3XRuxEvKi3Zdkv0IvQoKrtXFlT50VRN0/B+dymAxECwspou2mdo/IX3ZGhEicr6A==
X-Received: by 2002:a5d:6191:: with SMTP id j17mr14494891wru.427.1580732685459; 
 Mon, 03 Feb 2020 04:24:45 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t131sm23599678wmb.13.2020.02.03.04.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 04:24:43 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C365E1FF87;
 Mon,  3 Feb 2020 12:24:42 +0000 (GMT)
References: <20200202010439.6410-1-richard.henderson@linaro.org>
 <20200202010439.6410-4-richard.henderson@linaro.org>
User-agent: mu4e 1.3.7; emacs 27.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 03/14] target/arm: Add isar_feature tests for PAN +
 ATS1E1
In-reply-to: <20200202010439.6410-4-richard.henderson@linaro.org>
Date: Mon, 03 Feb 2020 12:24:42 +0000
Message-ID: <87pnevamet.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Include definitions for all of the bits in ID_MMFR3.
> We already have a definition for ID_AA64MMFR1.PAN.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/cpu.h | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index c63bceaaa5..08b2f5d73e 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1727,6 +1727,15 @@ FIELD(ID_ISAR6, FHM, 8, 4)
>  FIELD(ID_ISAR6, SB, 12, 4)
>  FIELD(ID_ISAR6, SPECRES, 16, 4)
>=20=20
> +FIELD(ID_MMFR3, CMAINTVA, 0, 4)
> +FIELD(ID_MMFR3, CMAINTSW, 4, 4)
> +FIELD(ID_MMFR3, BPMAINT, 8, 4)
> +FIELD(ID_MMFR3, MAINTBCST, 12, 4)
> +FIELD(ID_MMFR3, PAN, 16, 4)
> +FIELD(ID_MMFR3, COHWALK, 20, 4)
> +FIELD(ID_MMFR3, CMEMSZ, 24, 4)
> +FIELD(ID_MMFR3, SUPERSEC, 28, 4)
> +
>  FIELD(ID_MMFR4, SPECSEI, 0, 4)
>  FIELD(ID_MMFR4, AC2, 4, 4)
>  FIELD(ID_MMFR4, XNX, 8, 4)
> @@ -3443,6 +3452,16 @@ static inline bool isar_feature_aa32_vminmaxnm(con=
st ARMISARegisters *id)
>      return FIELD_EX64(id->mvfr2, MVFR2, FPMISC) >=3D 4;
>  }
>=20=20
> +static inline bool isar_feature_aa32_pan(const ARMISARegisters *id)
> +{
> +    return FIELD_EX64(id->mvfr0, ID_MMFR3, PAN) !=3D 0;
> +}
> +
> +static inline bool isar_feature_aa32_ats1e1(const ARMISARegisters *id)
> +{
> +    return FIELD_EX64(id->mvfr0, ID_MMFR3, PAN) >=3D 2;
> +}
> +
>  /*
>   * 64-bit feature tests via id registers.
>   */
> @@ -3602,6 +3621,16 @@ static inline bool isar_feature_aa64_lor(const ARM=
ISARegisters *id)
>      return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, LO) !=3D 0;
>  }
>=20=20
> +static inline bool isar_feature_aa64_pan(const ARMISARegisters *id)
> +{
> +    return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, PAN) !=3D 0;
> +}
> +
> +static inline bool isar_feature_aa64_ats1e1(const ARMISARegisters *id)
> +{
> +    return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, PAN) >=3D 2;
> +}
> +
>  static inline bool isar_feature_aa64_bti(const ARMISARegisters *id)
>  {
>      return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, BT) !=3D 0;


--=20
Alex Benn=C3=A9e

