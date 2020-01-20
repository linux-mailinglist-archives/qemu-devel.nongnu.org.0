Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4C0142C6E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 14:43:21 +0100 (CET)
Received: from localhost ([::1]:36740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itXKq-0001Sp-Bd
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 08:43:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35220)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1itXJa-0008Ec-HY
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 08:42:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1itXJZ-00027T-Gg
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 08:42:02 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:36800)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1itXJZ-00026v-AL
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 08:42:01 -0500
Received: by mail-wm1-x342.google.com with SMTP id p17so14781619wma.1
 for <qemu-devel@nongnu.org>; Mon, 20 Jan 2020 05:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=gQZrsvfOe7SGWxE11ZazAiZ6sRxF+B8oEBk84dl3phA=;
 b=AEET4ddbfMgtclpgPylI0JFCWwso6FlOEzNQG5s0CKm4tz6kAGDs7iIBhkKZgmbIO+
 AyWVl6RW0PSrmZJnHYk+VSGVkoBwTrhqvBBn7YUTBdntkyJ/kf8BaQ+lMw+8nu19LwYn
 irX5FkzzsLxky/9SSiG1SCTURjcPVPYN2i2/DwAAYjeQ4mfu9761KmlyTevLeZflRh5T
 Juj+wavEydbTJsPLSXhaAZ2e6rS+jxaigq39oIGr4S2dXbXMOwxmUEWf1FrmQ9oDjowq
 UyPFw7w23iF8KNPoqIGs8C1hsMIzd37An8aWLux8Jf2XEpWGhDtMJNW159MOkn9exaxR
 kl2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=gQZrsvfOe7SGWxE11ZazAiZ6sRxF+B8oEBk84dl3phA=;
 b=pUHNEeXPhaVFWC+oWs+MFdhVT52PnJSydkAT5sUI/teMmmcztcuyr4Wl3n23GcckTz
 j3DRWAaXHu2HxeVM596ufY71bZ9N7SaVhPWCgqEMNzUOKhlG244EBYawcafq6E92M7vz
 d2oKBb85kAq4de8w2L2s/64j8tr2S9PbF4FMIxTMZar4/RG57GqeT3SY2uDTC4n95OjC
 Ie+NIK7lhwr1j8wktAGmMnVXbcj7KCGTPXISpDvTF0Nxbs1qVKUZZqRqhp5Yi+XKuj6r
 uHhAOHoFZmzT9do5wmtcVhHjlZfIo3vcM+2pqb43eEhmi9vXPaEm2sQGg6Y8icNBYXvE
 3cDw==
X-Gm-Message-State: APjAAAVTrFwiASNmahCVl9u/DpWv3pXMY4RioiPuJ5MXXFoV1pC05XQr
 v6XB4lcySqx/DGlj5+DsCqJwad8vESA=
X-Google-Smtp-Source: APXvYqxNU0VILBTiop+oZ8aHRQPQfPkB3G7dxebGR0Yjakq8DI4OmW76BKSaftlqW5hf0/+BtH4Npg==
X-Received: by 2002:a1c:6605:: with SMTP id a5mr18201796wmc.112.1579527720305; 
 Mon, 20 Jan 2020 05:42:00 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 60sm48740988wrn.86.2020.01.20.05.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2020 05:41:59 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 85E9C1FF87;
 Mon, 20 Jan 2020 13:41:58 +0000 (GMT)
References: <20200109024907.2730-1-richard.henderson@linaro.org>
 <20200109024907.2730-7-richard.henderson@linaro.org>
User-agent: mu4e 1.3.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 6/9] cputlb: Split out tlb_mmu_flush_locked
In-reply-to: <20200109024907.2730-7-richard.henderson@linaro.org>
Date: Mon, 20 Jan 2020 13:41:58 +0000
Message-ID: <878sm22qjd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
Cc: alistair.francis@wdc.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> We will want to be able to flush a tlb without resizing.

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/cputlb.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index eff427f137..e60e501334 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -228,12 +228,8 @@ static void tlb_mmu_resize_locked(CPUTLBDesc *desc, =
CPUTLBDescFast *fast)
>      }
>  }
>=20=20
> -static void tlb_flush_one_mmuidx_locked(CPUArchState *env, int mmu_idx)
> +static void tlb_mmu_flush_locked(CPUTLBDesc *desc, CPUTLBDescFast *fast)
>  {
> -    CPUTLBDesc *desc =3D &env_tlb(env)->d[mmu_idx];
> -    CPUTLBDescFast *fast =3D &env_tlb(env)->f[mmu_idx];
> -
> -    tlb_mmu_resize_locked(desc, fast);
>      desc->n_used_entries =3D 0;
>      desc->large_page_addr =3D -1;
>      desc->large_page_mask =3D -1;
> @@ -242,6 +238,15 @@ static void tlb_flush_one_mmuidx_locked(CPUArchState=
 *env, int mmu_idx)
>      memset(desc->vtable, -1, sizeof(desc->vtable));
>  }
>=20=20
> +static void tlb_flush_one_mmuidx_locked(CPUArchState *env, int mmu_idx)
> +{
> +    CPUTLBDesc *desc =3D &env_tlb(env)->d[mmu_idx];
> +    CPUTLBDescFast *fast =3D &env_tlb(env)->f[mmu_idx];
> +
> +    tlb_mmu_resize_locked(desc, fast);
> +    tlb_mmu_flush_locked(desc, fast);
> +}
> +
>  static inline void tlb_n_used_entries_inc(CPUArchState *env, uintptr_t m=
mu_idx)
>  {
>      env_tlb(env)->d[mmu_idx].n_used_entries++;


--=20
Alex Benn=C3=A9e

