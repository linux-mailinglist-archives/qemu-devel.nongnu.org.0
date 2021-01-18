Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E662FA36D
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 15:45:16 +0100 (CET)
Received: from localhost ([::1]:56750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1VmN-0006n1-Fv
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 09:45:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l1Vkv-0005zN-NB
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 09:43:46 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:54655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l1Vkt-0002yF-Fj
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 09:43:45 -0500
Received: by mail-wm1-x32e.google.com with SMTP id i63so13818944wma.4
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 06:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=a8sFsVyPEI9dB2iCeYKsODwWWvY0LIzGZgkCqaEnzyA=;
 b=XlgQ1Vno/di6OM/vykrYrym8yBbRcAn3VrTg2YPjcxXCDElV8rNn7PQUQl3ThLXXAY
 mHEZqeFvOYplZ0v01mhahijilUiD2HMWMRWCYLYLCTv2QXS7sOPTLTQyuvfpow1rJ8Le
 V7nZWKuctEIxpsTAUvNfLrk7cy8Zn1uWKd9qMQJYuhsZBHGdjSSUsYUv+3d7KwR7MBIf
 0Je31b0eal1Y2XWN4Y+VIKG7Oj9bZdyqRd36kO5H2PmBVCvIQYalNSTFJqSiyqrdpy9M
 Gx3Q7H5CxKeV+G5xrr5PEWXdZHNBf/aP4V0HaqpdjTTsAdbylCkxNsAsKivukYwf+pCq
 1/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=a8sFsVyPEI9dB2iCeYKsODwWWvY0LIzGZgkCqaEnzyA=;
 b=kEOaxICaPqxYJrmT/ILO+NuEakli3IK1LZQ/BFzQi4yWtR0JNoOhC+f9IwHwpUoPRV
 G8gdxCWLx6N0matUUHaLG8KDUkch2ByiqiRsoxhpqai/eP2tii0541htvJ2HkN7XXJR2
 NxG+jb19ltUKfE0QVPFioDnGftEuZ0FGFR6j1i7F7rjGAn/MkAjzQ51IiytBd01sRb9/
 4cOqpKQmQsbsZJf+VjZ6I1Qfzwi2sUbeLpCuWEN3DuS96AkAsgLLTLRLRQoWVRMXKu05
 jIWBnSedmXU3T6xMo2ExsaG0WsRI2BEZfYXy5k2zrAxcpf1rboKQeAfR2acqHeu2W/YD
 yZEw==
X-Gm-Message-State: AOAM530QVsszKOx4R477k6Ovtw56egpFAAVj28G7EdDAtmaRen53qEsn
 RbCI5hIuaaYw1Mnp4K8zpnJjBg==
X-Google-Smtp-Source: ABdhPJzkwsDW2RNTBNLtmrF4TE7xycsAyKSezPIAyXmjLu+LOCKNioWGsdEEG0CgwLxTDNSUaNL7sQ==
X-Received: by 2002:a7b:c5d2:: with SMTP id n18mr9544781wmk.56.1610981021469; 
 Mon, 18 Jan 2021 06:43:41 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f68sm16690096wmf.6.2021.01.18.06.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 06:43:40 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AF79A1FF7E;
 Mon, 18 Jan 2021 14:43:39 +0000 (GMT)
References: <20201125083300.861206-1-philmd@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v3] hw/core/qdev-properties-system: Rewrite
 set_pci_host_devaddr using GLib
Date: Mon, 18 Jan 2021 14:16:40 +0000
In-reply-to: <20201125083300.861206-1-philmd@redhat.com>
Message-ID: <87v9buuwys.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> set_pci_host_devaddr() is hard to follow, thus bug-prone.
>
> For example, a bug was introduced in commit bccb20c49df, as
> the same line might be used to parse a bus (up to 0xff) or
> a slot (up to 0x1f).
>
> Instead of making things worst, rewrite using g_strsplit().

This no longer applies to my tip of tree but in general I'm a fan. Do we
have any unit tests for the qdev parsing? I couldn't see any but I'm not
sure if the generic QOM tests would exercise this code.

Generally when re-writing a parser it's nice to have a unit test just so
you can check you've covered all the corner cases (witness the number of
iterations the dfilter logic took to get right :-/).

>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> v3: Rebased
> v2: Free g_strsplit() with g_auto(GStrv) (Daniel)
> ---
>  hw/core/qdev-properties-system.c | 62 ++++++++++++++------------------
>  1 file changed, 27 insertions(+), 35 deletions(-)
>
> diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-s=
ystem.c
> index 9d80a07d26f..79408e32289 100644
> --- a/hw/core/qdev-properties-system.c
> +++ b/hw/core/qdev-properties-system.c
> @@ -857,11 +857,11 @@ static void set_pci_host_devaddr(Object *obj, Visit=
or *v, const char *name,
>      DeviceState *dev =3D DEVICE(obj);
>      Property *prop =3D opaque;
>      PCIHostDeviceAddress *addr =3D qdev_get_prop_ptr(dev, prop);
> -    char *str, *p;
> -    char *e;
> +    g_autofree char *str =3D NULL;
> +    g_auto(GStrv) col_s0 =3D NULL;
> +    g_auto(GStrv) dot_s =3D NULL;
> +    char **col_s;
>      unsigned long val;
> -    unsigned long dom =3D 0, bus =3D 0;
> -    unsigned int slot =3D 0, func =3D 0;
>=20=20
>      if (dev->realized) {
>          qdev_prop_set_after_realize(dev, name, errp);
> @@ -872,58 +872,50 @@ static void set_pci_host_devaddr(Object *obj, Visit=
or *v, const char *name,
>          return;
>      }
>=20=20
> -    p =3D str;
> -    val =3D strtoul(p, &e, 16);
> -    if (e =3D=3D p || *e !=3D ':') {
> +    col_s =3D col_s0 =3D g_strsplit(str, ":", 3);
> +    if (!col_s || !col_s[0] || !col_s[1]) {

I'm not sure you want max_tokens 3 because 1:2:3:4 would end up with the
malformed ["1", "2", "3:4"]. You could just make your test:

  cols_s =3D g_strsplit(str, ":", -1);
  if (!cols_s || g_strv_length(cols_s) !=3D 3) {
    error_set_from_qdev_prop_error(errp, EINVAL, dev, prop, str);=20=20
    return;
  }

>          goto inval;
>      }
> -    bus =3D val;
>=20=20
> -    p =3D e + 1;
> -    val =3D strtoul(p, &e, 16);
> -    if (e =3D=3D p) {
> -        goto inval;
> -    }
> -    if (*e =3D=3D ':') {
> -        dom =3D bus;
> -        bus =3D val;
> -        p =3D e + 1;
> -        val =3D strtoul(p, &e, 16);
> -        if (e =3D=3D p) {
> +    /* domain */
> +    if (col_s[2]) {
> +        if (qemu_strtoul(col_s[0], NULL, 16, &val) < 0 || val > 0xffff) {
>              goto inval;
>          }
> +        addr->domain =3D val;
> +        col_s++;
> +    } else {
> +        addr->domain =3D 0;
>      }
> -    slot =3D val;

Hmm ok PCI ids are more complex than I knew. Maybe the test above needs
to be:

  cols_s =3D g_strsplit(str, ":", -1);
  cols_l =3D g_strv_length(cols_s);
  if (!cols_s || !(cols_l =3D=3D 2 || cols_l =3D=3D3)) {
    error_set_from_qdev_prop_error(errp, EINVAL, dev, prop, str);=20=20
    return;
  }
=20=20

>=20=20
> -    if (*e !=3D '.') {
> +    /* bus */
> +    if (qemu_strtoul(col_s[0], NULL, 16, &val) < 0 || val > 0xff) {
>          goto inval;
>      }
> -    p =3D e + 1;
> -    val =3D strtoul(p, &e, 10);
> -    if (e =3D=3D p) {
> -        goto inval;
> -    }
> -    func =3D val;
> +    addr->bus =3D val;
>=20=20
> -    if (dom > 0xffff || bus > 0xff || slot > 0x1f || func > 7) {
> +    /* <slot>.<func> */
> +    dot_s =3D g_strsplit(col_s[1], ".", 2);
> +    if (!dot_s || !dot_s[0] || !dot_s[1]) {
>          goto inval;
>      }

I think there is a similar length validation needed here.

>=20=20
> -    if (*e) {
> +    /* slot */
> +    if (qemu_strtoul(dot_s[0], NULL, 16, &val) < 0 || val > 0x1f) {
>          goto inval;
>      }
> +    addr->slot =3D val;
>=20=20
> -    addr->domain =3D dom;
> -    addr->bus =3D bus;
> -    addr->slot =3D slot;
> -    addr->function =3D func;
> +    /* func */
> +    if (qemu_strtoul(dot_s[1], NULL, 10, &val) < 0 || val > 7) {
> +        goto inval;
> +    }
> +    addr->function =3D val;
>=20=20
> -    g_free(str);
>      return;
>=20=20
>  inval:
>      error_set_from_qdev_prop_error(errp, EINVAL, dev, prop, str);
> -    g_free(str);
>  }
>=20=20
>  const PropertyInfo qdev_prop_pci_host_devaddr =3D {


--=20
Alex Benn=C3=A9e

