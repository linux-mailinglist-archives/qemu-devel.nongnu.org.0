Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1170B142906
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 12:15:25 +0100 (CET)
Received: from localhost ([::1]:34426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itV1f-0000rQ-FU
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 06:15:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42331)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1itUqN-0001v2-W0
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 06:03:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1itUqM-0001vt-Qg
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 06:03:43 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:46499)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1itUqM-0001sU-IS
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 06:03:42 -0500
Received: by mail-wr1-x442.google.com with SMTP id z7so29011173wrl.13
 for <qemu-devel@nongnu.org>; Mon, 20 Jan 2020 03:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=U2ypx6EGV4CJFAz0dPyXNnXHC3GGeEyzEZ6lcFtUsYQ=;
 b=c/fwDet6VKX4ZbYYNvq5a6aNWL3mZ+RescZKS5N18X3rpk331CN1nwXue1DclsdgZv
 xra/FFkYsLXR346y1FxmcGgyebg7f+VAuqluFgnCZ/ga7uKP/u+RCo3t1vDjU+Zpaa3e
 WHl+e0rylkft0ThGMG+9CNPSF10+VlEDfX4rYt+dUKcE+Hc3R+jQkXjUlwRLMf6CSSkU
 +Usz1Dr2AR+ND0zWqiwmjyYTpR4sAxQOJXc1ylg94Fa1ZreHtNw/2YR5+S8MFWRayGRL
 /j3MRGg0poyu+IbMG1I1yRxXtdur3f8IoIOe5Xjevxk/57BK3UAp5GRmJKjG8Dejn5ZA
 EgQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=U2ypx6EGV4CJFAz0dPyXNnXHC3GGeEyzEZ6lcFtUsYQ=;
 b=Md3yVGEob28xUE5iy+wf3fWxWz2J0Jf+u7LauFMKPYzH9oi509z63l+pzAv6+P/3ip
 OxhRCSoinUBQdiOMIk4leze+lkvNm6Iz4u2lPhvFd1dq/l/ofhhH2DVn4r3mBtVtURFv
 yoBVfkpcuokYJBskQPL+4joVAJpti9UtNnQuNAvYTUkLd12o7LVqIUlZFu0hN/TlFv9F
 Dwdorj8/5rcFN8uLbncq3ajnYwOcCVYg5ke+eRrHlfXaldzgxl69asqRr1WRV8R1Sxny
 t4o0WZWC0+xVXzuij2DoqARF/impICyz7mOrdFDlOfnQ+QvX7ETVpPJ5BACr77Aem4dw
 3Qsg==
X-Gm-Message-State: APjAAAWn9MDh6Mz0L0eUMLUjpJwhUcHZcy1alGKPERWhJFfWwJ8IX10W
 67jAw9bT713OgyqvowT5uGak3w==
X-Google-Smtp-Source: APXvYqxfcabU3fVbg30s2GfGIeoplhRJHs0/lCjgx1ldDUTmXvfVSRLqXXDHhegpna1McUeb/uRc0A==
X-Received: by 2002:a5d:6a88:: with SMTP id s8mr17480290wru.173.1579518221173; 
 Mon, 20 Jan 2020 03:03:41 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b16sm48934198wrj.23.2020.01.20.03.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2020 03:03:39 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 32AE91FF87;
 Mon, 20 Jan 2020 11:03:39 +0000 (GMT)
References: <20200118140619.26333-1-philmd@redhat.com>
 <20200118140619.26333-4-philmd@redhat.com>
User-agent: mu4e 1.3.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 3/6] Makefile: Restrict system emulation and tools
 objects
In-reply-to: <20200118140619.26333-4-philmd@redhat.com>
Date: Mon, 20 Jan 2020 11:03:39 +0000
Message-ID: <87d0be4cfo.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Riku Voipio <riku.voipio@iki.fi>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Restrict all the system emulation and tools objects with a
> Makefile IF (CONFIG_SOFTMMU OR CONFIG_TOOLS) check.
>
> Using the same description over and over is not very helpful.
> Use it once, just before the if() block.
>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  Makefile.objs | 19 +++++++------------
>  1 file changed, 7 insertions(+), 12 deletions(-)
>
> diff --git a/Makefile.objs b/Makefile.objs
> index 5aae561984..395dd1e670 100644
> --- a/Makefile.objs
> +++ b/Makefile.objs
> @@ -4,16 +4,15 @@ stub-obj-y =3D stubs/
>  util-obj-y =3D crypto/ util/ qobject/ qapi/
>  qom-obj-y =3D qom/
>=20=20
> +#######################################################################
> +# code used by both qemu system emulation and qemu-img
> +
> +ifeq ($(call lor,$(CONFIG_SOFTMMU),$(CONFIG_TOOLS)),y)
> +
>  chardev-obj-y =3D chardev/
>=20=20
> -#######################################################################
> -# authz-obj-y is code used by both qemu system emulation and qemu-img
> -
>  authz-obj-y =3D authz/
>=20=20
> -#######################################################################
> -# block-obj-y is code used by both qemu system emulation and qemu-img
> -
>  block-obj-y =3D nbd/
>  block-obj-y +=3D block.o blockjob.o job.o
>  block-obj-y +=3D block/ scsi/
> @@ -22,16 +21,12 @@ block-obj-$(CONFIG_REPLICATION) +=3D replication.o
>=20=20
>  block-obj-m =3D block/
>=20=20
> -#######################################################################
> -# crypto-obj-y is code used by both qemu system emulation and qemu-img
> -
>  crypto-obj-y =3D crypto/
>=20=20
> -#######################################################################
> -# io-obj-y is code used by both qemu system emulation and qemu-img
> -
>  io-obj-y =3D io/
>=20=20
> +endif # CONFIG_SOFTMMU or CONFIG_TOOLS
> +
>  ######################################################################
>  # Target independent part of system emulation. The long term path is to
>  # suppress *all* target specific code in case of system emulation, i.e. a


--=20
Alex Benn=C3=A9e

