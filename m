Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3442BFC4AB
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Nov 2019 11:51:00 +0100 (CET)
Received: from localhost ([::1]:55790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVCiJ-0007c0-8h
	for lists+qemu-devel@lfdr.de; Thu, 14 Nov 2019 05:50:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53192)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@gmail.com>) id 1iVCgR-0006J2-Ud
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 05:49:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@gmail.com>) id 1iVCgQ-0000lZ-27
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 05:49:03 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:40440)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
 id 1iVCgO-0000k9-Ji
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 05:49:02 -0500
Received: by mail-wm1-x343.google.com with SMTP id f3so5327300wmc.5
 for <qemu-devel@nongnu.org>; Thu, 14 Nov 2019 02:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sCNrM0KUewjPnIJTZYAPWChoUyattevKxkICTRD/0Wk=;
 b=q7rvV9UjLJeojW3F04vVz1/anaag64AQBrquxctFf/s4ng5z1jSUuEk+c6pKwW9rpX
 4MG03S70fRCrICrQ1IsKxJp/ioXSDW37IA7gYTEIyo7QXH7VdZ++vpHaLjQw0vL1g0kB
 GqpiukpdtL1HvTDSZiMgSlbRqaad2t5t9eIpKqwsJjxQSV7LkjnM2wk3+jLr5kIplBG9
 gNiN6ZJj30nV2mQra6zKByL6NxLhIHJzR4fuhyFPSS2Xm831Hh8Ql7yU0pyYgs39Ol2S
 3iadj+pLZoYgly9xPC88GbMbRtCwFdk5aeer6yFzez24qoCFq0ZX0UZMC5zZlc5o8IIb
 D48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sCNrM0KUewjPnIJTZYAPWChoUyattevKxkICTRD/0Wk=;
 b=mELB/6yOMRCnjj+6YIT+LW4+BbDsc+LaNNAIFleHo52nBXa1rgXnTZy8My3SfYZotx
 /Lg3KdZ2Jv7UttIRnOdCIyrhP3k+ujAVNmUyP4MFcpQAWjvXgwa4A+tUpJHLvtSFqCle
 2ff1bY4tRZikP8tswMhIImMtlKQMJ/cecXOKiMt7GGbynExdIOped6et3yxhFBWqXHK5
 E29LoX3slUImXuW3VRX3oMIbWpmG3YjnaXoyV43mwalwViwuNLvFNEa2VFi7dtQPkPbL
 jKey1xsfCiEIrmkg1daIcuB/5UMlj5S7g+oIq2GkRf/g2Fas5MXLUV4nVwDy8lYwVTFn
 1jNA==
X-Gm-Message-State: APjAAAXEJ87sTxedAfSACRbruK7mOgkYw5Tg4xgYBl1PWgvPdk3JpJio
 jTsrgnjMGFdvhdLnyhE2dP7swfuZXgIgPR8hOPFLdWfXGHE=
X-Google-Smtp-Source: APXvYqw6U7xntobzh8dig00GW71aIg3KDucAn82xt8qZvNecynTh1Tx3wRTapiF8CwJzF/vCAnvTg2GfcKAuN76VxMM=
X-Received: by 2002:a1c:9e10:: with SMTP id h16mr7089306wme.91.1573728537872; 
 Thu, 14 Nov 2019 02:48:57 -0800 (PST)
MIME-Version: 1.0
References: <1573655945-14912-1-git-send-email-pbonzini@redhat.com>
 <1573655945-14912-11-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1573655945-14912-11-git-send-email-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 14 Nov 2019 14:48:45 +0400
Message-ID: <CAJ+F1CJf_uu0g2T+OYbdv=Yme6Ca_ZGPMM365rp_i2rrk51cuw@mail.gmail.com>
Subject: Re: [PATCH 10/16] accel: pass object to accel_init_machine
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
Cc: Thomas Huth <thuth@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 13, 2019 at 6:45 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> We will have to set QOM properties before accel_init_machine, based on th=
e
> options provided to -accel.  Construct the object outside it so that it
> will be possible to insert the iteration between object_new_with_class
> and accel_init_machine.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>


Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  accel/accel.c          | 6 ++----
>  include/sysemu/accel.h | 2 +-
>  vl.c                   | 4 +++-
>  3 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/accel/accel.c b/accel/accel.c
> index 74eda68..822e945 100644
> --- a/accel/accel.c
> +++ b/accel/accel.c
> @@ -52,11 +52,9 @@ AccelClass *accel_find(const char *opt_name)
>      return ac;
>  }
>
> -int accel_init_machine(AccelClass *acc, MachineState *ms)
> +int accel_init_machine(AccelState *accel, MachineState *ms)
>  {
> -    ObjectClass *oc =3D OBJECT_CLASS(acc);
> -    const char *cname =3D object_class_get_name(oc);
> -    AccelState *accel =3D ACCEL(object_new(cname));
> +    AccelClass *acc =3D ACCEL_GET_CLASS(accel);
>      int ret;
>      ms->accelerator =3D accel;
>      *(acc->allowed) =3D true;
> diff --git a/include/sysemu/accel.h b/include/sysemu/accel.h
> index 90b6213..22cac0f 100644
> --- a/include/sysemu/accel.h
> +++ b/include/sysemu/accel.h
> @@ -67,7 +67,7 @@ typedef struct AccelClass {
>  extern unsigned long tcg_tb_size;
>
>  AccelClass *accel_find(const char *opt_name);
> -int accel_init_machine(AccelClass *acc, MachineState *ms);
> +int accel_init_machine(AccelState *accel, MachineState *ms);
>
>  /* Called just before os_setup_post (ie just before drop OS privs) */
>  void accel_setup_post(MachineState *ms);
> diff --git a/vl.c b/vl.c
> index 6e406d4..c8ec906 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -2846,6 +2846,7 @@ static int do_configure_accelerator(void *opaque, Q=
emuOpts *opts, Error **errp)
>      bool *p_init_failed =3D opaque;
>      const char *acc =3D qemu_opt_get(opts, "accel");
>      AccelClass *ac =3D accel_find(acc);
> +    AccelState *accel;
>      int ret;
>
>      if (!ac) {
> @@ -2853,7 +2854,8 @@ static int do_configure_accelerator(void *opaque, Q=
emuOpts *opts, Error **errp)
>          error_report("invalid accelerator %s", acc);
>          return 0;
>      }
> -    ret =3D accel_init_machine(ac, current_machine);
> +    accel =3D ACCEL(object_new_with_class(OBJECT_CLASS(ac)));
> +    ret =3D accel_init_machine(accel, current_machine);
>      if (ret < 0) {
>          *p_init_failed =3D true;
>          error_report("failed to initialize %s: %s",
> --
> 1.8.3.1
>
>
>


--=20
Marc-Andr=C3=A9 Lureau

