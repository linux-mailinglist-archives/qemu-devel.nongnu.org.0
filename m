Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E0233C1AE
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 17:26:18 +0100 (CET)
Received: from localhost ([::1]:37914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLq2r-0007v5-Qm
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 12:26:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lLpy2-000345-8U
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:21:18 -0400
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233]:33398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lLpxz-0003zR-Fz
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:21:17 -0400
Received: by mail-lj1-x233.google.com with SMTP id 15so16949279ljj.0
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 09:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=eGVVAtUulgrSHzBXBUqjlaHx4vaoE+zY9RXxEfkPa0M=;
 b=ToHxUeiWR2S6oAcb2X3kLiagUevjmrmiGzqvrsJlAvo1E09n/vWVH3n+GrcYxPOWMl
 HENv+KWuZAHvV9UPbJZtjUwpV0rCXj5irx1GxsMj5usxySsT+kGzKEq2GrmBZJfM9E7E
 13HESui2VmV+hJ9mvCS3UX6eGvpO8e61uqgsh7QXr18aQH2myhrH01Ak4TsfJAg2Ebq/
 j+yoU6pKlvuNzLSHuD5p6zOWuMsJYroTk52XQhaDbqoegXzVXL/DPRoQe7e2pIaeTi+G
 X9ZdzJt0RyxOHjcgEWHvh88Bxp52OULqi4XBPMjW/t7ViTuuZHLg0kjbXI3wgxtEUNAN
 IBmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=eGVVAtUulgrSHzBXBUqjlaHx4vaoE+zY9RXxEfkPa0M=;
 b=G4cRJJQVotFZzgqEzSe6UGPNri0oa2OmtdHseN2e/xDQ4xwfYnNKGt+v0nIDClziHp
 AYumydaXN/IrpuD98jS64jvUjgb85ct4FxzUSfAreH0yMz+RAyMAhLg94rxltN/xNzi1
 b+qjujwdbXDde/TbUL15KK4x/k7yeRqega2DglRjqf3iOCw8BsYG6cNbsekAXo4FWWXy
 80NPCxALf8kSb/od1wJzmGWEvnSlPyBDdCG6NzChB3QfNO0xY/dU18RkHmBAspYUXaXQ
 0PEKa95oD+iktk8Cmjsd0KRzawq4UoYW6ZrEzq73+JwEO8wydtqSNoqYqlzRtJvLk0oP
 Bc4g==
X-Gm-Message-State: AOAM53081BUksP+ld+x646OJW0/WcM1IJqIuBPmzA7a6OlR5WXX8Z12+
 MimRWCDu/dUxkkdmKDuP9kDzuK/wiuchBFes
X-Google-Smtp-Source: ABdhPJyxvP7wdkvq0IGgbD3kBZqKXOk1nPTWeMtcl7MLMdSMnsdwgyDCKfSNsuLP4d1VeA4kmUm+eg==
X-Received: by 2002:a05:6402:1d1a:: with SMTP id
 dg26mr30407807edb.266.1615824872289; 
 Mon, 15 Mar 2021 09:14:32 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s6sm7511817ejx.83.2021.03.15.09.14.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 09:14:31 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E3A991FF7E;
 Mon, 15 Mar 2021 16:14:30 +0000 (GMT)
References: <20210314032324.45142-1-ma.mandourr@gmail.com>
 <20210314032324.45142-4-ma.mandourr@gmail.com>
User-agent: mu4e 1.5.10; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 3/8] hw/audio/fmopl.c: Replaced calls to malloc with
 GLib's variants
Date: Mon, 15 Mar 2021 16:12:33 +0000
In-reply-to: <20210314032324.45142-4-ma.mandourr@gmail.com>
Message-ID: <87y2eo8kd5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=alex.bennee@linaro.org; helo=mail-lj1-x233.google.com
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mahmoud Mandour <ma.mandourr@gmail.com> writes:

> Replaced calls to malloc(), and free() to their equivalent
> allocation functions from GLib.
>
> Also added checking for null after ENV_CURVE allocation
> following the same pattern of checking on preceeding
> table allocations.
>
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> ---
>  hw/audio/fmopl.c | 42 +++++++++++++++++++++++++-----------------
>  1 file changed, 25 insertions(+), 17 deletions(-)
>
> diff --git a/hw/audio/fmopl.c b/hw/audio/fmopl.c
> index 51b773695a..795c7a23dc 100644
> --- a/hw/audio/fmopl.c
> +++ b/hw/audio/fmopl.c
> @@ -607,33 +607,41 @@ static int OPLOpenTable( void )
>  	double pom;
>=20=20
>  	/* allocate dynamic tables */
> -    TL_TABLE =3D malloc(TL_MAX * 2 * sizeof(int32_t));
> +    TL_TABLE =3D g_try_new(int32_t, TL_MAX * 2);
>      if (TL_TABLE =3D=3D NULL) {
>          return 0;
>      }

This is initialisation code I think so you should be able to use
g_malloc() and drop the NULL checks.

>=20=20
> -    SIN_TABLE =3D malloc(SIN_ENT * 4 * sizeof(int32_t *));
> +    SIN_TABLE =3D g_try_new(int32_t *, SIN_ENT * 4);
>      if (SIN_TABLE =3D=3D NULL) {
> -        free(TL_TABLE);
> +        g_free(TL_TABLE);
>          return 0;
>      }
>=20=20
> -    AMS_TABLE =3D malloc(AMS_ENT * 2 * sizeof(int32_t));
> +    AMS_TABLE =3D g_try_new(int32_t, AMS_ENT * 2);
>      if (AMS_TABLE =3D=3D NULL) {
> -        free(TL_TABLE);
> -        free(SIN_TABLE);
> +        g_free(TL_TABLE);
> +        g_free(SIN_TABLE);
>          return 0;
>      }
>=20=20
> -    VIB_TABLE =3D malloc(VIB_ENT * 2 * sizeof(int32_t));
> +    VIB_TABLE =3D g_try_new(int32_t, VIB_ENT * 2);
>      if (VIB_TABLE =3D=3D NULL) {
> -        free(TL_TABLE);
> -        free(SIN_TABLE);
> -        free(AMS_TABLE);
> +        g_free(TL_TABLE);
> +        g_free(SIN_TABLE);
> +        g_free(AMS_TABLE);
> +        return 0;
> +    }
> +
> +    ENV_CURVE =3D g_try_new(int32_t, 2 * EG_ENT + 1);
> +    if (ENV_CURVE =3D=3D NULL) {
> +        g_free(TL_TABLE);
> +        g_free(SIN_TABLE);
> +        g_free(AMS_TABLE);
> +        g_free(VIB_TABLE);
>          return 0;
>      }

Again g_autofree could be used, but if any of your static
initialisation fails won't the system fail to boot anyway?


>=20=20
> -    ENV_CURVE =3D g_new(int32_t, 2 * EG_ENT + 1);
>  	/* make total level table */
>  	for (t =3D 0;t < EG_ENT-1 ;t++){
>  		rate =3D ((1<<TL_BITS)-1)/pow(10,EG_STEP*t/20);	/* dB -> voltage */
> @@ -702,10 +710,10 @@ static int OPLOpenTable( void )
>  static void OPLCloseTable( void )
>  {
>      g_free(ENV_CURVE);
> -    free(TL_TABLE);
> -    free(SIN_TABLE);
> -    free(AMS_TABLE);
> -    free(VIB_TABLE);
> +    g_free(TL_TABLE);
> +    g_free(SIN_TABLE);
> +    g_free(AMS_TABLE);
> +    g_free(VIB_TABLE);
>  }
>=20=20
>  /* CSM Key Control */
> @@ -1088,7 +1096,7 @@ FM_OPL *OPLCreate(int clock, int rate)
>  	state_size  =3D sizeof(FM_OPL);
>  	state_size +=3D sizeof(OPL_CH)*max_ch;
>  	/* allocate memory block */
> -    ptr =3D malloc(state_size);
> +    ptr =3D g_try_malloc(state_size);
>  	if(ptr=3D=3DNULL) return NULL;
>  	/* clear */
>  	memset(ptr,0,state_size);
> @@ -1134,7 +1142,7 @@ void OPLDestroy(FM_OPL *OPL)
>  	}
>  #endif
>  	OPL_UnLockTable();
> -    free(OPL);
> +    g_free(OPL);
>  }
>=20=20
>  /* ----------  Option handlers ----------       */


--=20
Alex Benn=C3=A9e

