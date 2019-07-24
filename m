Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D663672F5A
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jul 2019 14:59:59 +0200 (CEST)
Received: from localhost ([::1]:51430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqGsB-0007pr-4n
	for lists+qemu-devel@lfdr.de; Wed, 24 Jul 2019 08:59:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58886)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hqGry-0007RQ-76
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 08:59:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hqGrw-0001UK-Tv
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 08:59:46 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:54737)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hqGrw-0001Tn-MU
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 08:59:44 -0400
Received: by mail-wm1-x343.google.com with SMTP id p74so41728902wme.4
 for <qemu-devel@nongnu.org>; Wed, 24 Jul 2019 05:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=iuZaAsQOxjcuUa6Bn6MbITHtjzdqg/bcT++1ngx/5Qg=;
 b=T3VntKMjbL+PzJ/mqiwGvIB02hvuUwjg00vTD2DT8MeLOzIk/+bjJIe8Xx3vPkE7Wy
 ZP2y8FshMrWTdQOYsk+OLmtLHpcnhXj96p+W/QZRpRdHY7MRyBvqSzd5v6zsPboyXKl3
 gQ5IsBMA9NbsM/6Ae6aODFlfE2azHqqUI4ZehUO4U6fk+qn9HHiGnhqBc1u7Kwza73+X
 UtYe+HvkVTzRjuWSrtUBhtMN38xHA5PoPWXa3W9C7imcvenHviVUFSEyA2E01TTZFjpZ
 BtaCWQopTwifebIWjUTDjuvGcigetS5BJEqh1/WBBLL3D8RwoQ3XThYpMwJqNqTSmFVA
 afrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=iuZaAsQOxjcuUa6Bn6MbITHtjzdqg/bcT++1ngx/5Qg=;
 b=kcDTJpIGbyBd0zuCv1JWXFWOjLg/nqNTlvPSUM9/dyYjIU6B2DewP7J2HGQgv/Cb8Y
 LerTRiXRP6thyAvzDt4m8Ktb09jrBdn36CthZgMngdJEv8xgjqhkuv4n+T03ScR8XgFZ
 6oPP8RFgTxrunHix6ZKyf65M6p1kaJMKyIMoXPeXDHPAKdG4Y1SOrozsvmh/0BIY+Ye+
 dbpgGnbVmajdxAMkPDzEMlFZ89Y3+jjOSCAQedBooS5dobKuyfn2IvA1RXEx4wqBLtRk
 r47ANJCNYA61Il6jfPgrM6NBp+SeK1a3JRDoyMv4u5AoEA6RDeK2HZIseOPvVCj//6wx
 i4sw==
X-Gm-Message-State: APjAAAV8c/TeR5GBXIvNkBnX7c0nEb0FkKJsFdB9urG6XEwFVI1Bi2R/
 UN9l06TgkQL8lbtsXPYCl7T6UviM3zs=
X-Google-Smtp-Source: APXvYqwBYZ/pwyQA44R9RnLh0EdHggvix+xAWEr7shySNzzs0DiLKtXgtkZEjDPa75vpQ0aF2up3YA==
X-Received: by 2002:a1c:3:: with SMTP id 3mr75302987wma.6.1563973183165;
 Wed, 24 Jul 2019 05:59:43 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id 17sm41392434wmx.47.2019.07.24.05.59.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 05:59:42 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9819B1FF87;
 Wed, 24 Jul 2019 13:59:41 +0100 (BST)
References: <20190719210326.15466-1-richard.henderson@linaro.org>
 <20190719210326.15466-7-richard.henderson@linaro.org>
User-agent: mu4e 1.3.3; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
In-reply-to: <20190719210326.15466-7-richard.henderson@linaro.org>
Date: Wed, 24 Jul 2019 13:59:41 +0100
Message-ID: <87a7d31tc2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: Re: [Qemu-devel] [PATCH for-4.2 06/24] target/arm: Define
 isar_feature_aa64_vh
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
Cc: peter.maydell@linaro.org, beata.michalska@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/cpu.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 94c990cddb..e6a76d14c6 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -3573,6 +3573,11 @@ static inline bool isar_feature_aa64_sve(const ARM=
ISARegisters *id)
>      return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, SVE) !=3D 0;
>  }
>
> +static inline bool isar_feature_aa64_vh(const ARMISARegisters *id)
> +{
> +    return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, VH) !=3D 0;
> +}
> +
>  static inline bool isar_feature_aa64_lor(const ARMISARegisters *id)
>  {
>      return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, LO) !=3D 0;


--
Alex Benn=C3=A9e

