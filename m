Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3AD2FA130
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 14:19:48 +0100 (CET)
Received: from localhost ([::1]:35886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1URf-0003HX-T4
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 08:19:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1UP2-0002B5-6r
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 08:17:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1UOu-0005AR-Qj
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 08:17:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610975814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2cdow12u0bqQLNatwwbL9dbE0MklN/d37zKsKUjNmW0=;
 b=hN4AzDgBqnoIKr/QRqBeEbo84EnESvpdc99n4Ju9SFStlsa8zCzOYtVKoO5xvIW7Bg6dfK
 a7MDoxHr2r8ZHgddgguEz4Nib+opNCtUwhP9wWhf+lZ6vlb0HOP1VZznjOocOi01hV6ZI5
 mjw+W3q7ApaBcWaWxGKQx3cgOjPj+LY=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-vwNy_Tq7NuKngQNv0sEAWg-1; Mon, 18 Jan 2021 08:16:53 -0500
X-MC-Unique: vwNy_Tq7NuKngQNv0sEAWg-1
Received: by mail-oi1-f199.google.com with SMTP id c7so1919649oig.17
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 05:16:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2cdow12u0bqQLNatwwbL9dbE0MklN/d37zKsKUjNmW0=;
 b=LCTXUc1q1/Kfh5RoDvA3pYm8bbHwqcedX6Jj8ishyT/QC+ZU/HDNoLO7vE9WgghqN5
 fsDiupBJbqmTPYTH49sxbkggBhVxdP+JfNlY6JSZQu7RpL2A591/5tp7SQnThtaKwBkd
 5gheOXqq4ABwTXEXUbaH5sL8jDYl9bOejq5Etb4htw4KJnbkX5unf4CMv5X4mivSlc1q
 P5Jgrt1gxfvRc+J5UJPj622t0dGtMI9zMIIavs5t5Q7wo6VXd5D8DQhuNVo9yaqd6WxZ
 H+i2+4zvLXRzXOezcqrj/QSIV7UPfwcpcHemFLeR5qZi4ISr/esVuryjy/jma0iThMZk
 X7hg==
X-Gm-Message-State: AOAM530BgsKW63f6oE3i4mXs1XxyF8q0LMOCXz5HEQ1eYziYKVPc/Nkt
 Zh1WW9C3fqIns407aVNLJY27sfnQRbSToiDbUnOKBwBQcGLn866HTuXet/spNYsCsO8npYNCCZw
 vhzqnwYvljxARCMIMBdAr2S8s6wOM3Us=
X-Received: by 2002:a05:6830:1306:: with SMTP id
 p6mr17052225otq.244.1610975812339; 
 Mon, 18 Jan 2021 05:16:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxTGhoW2mgtYwm1AdQSLtWP/IJaNxVCki/VNmvGhA5JPMkmSlASBBAlnGtFnLaM9IaIOx7kT5xJvsX/Px2BV74=
X-Received: by 2002:a05:6830:1306:: with SMTP id
 p6mr17052209otq.244.1610975812123; 
 Mon, 18 Jan 2021 05:16:52 -0800 (PST)
MIME-Version: 1.0
References: <20201125083300.861206-1-philmd@redhat.com>
 <ad4cf02d-e5d3-b97a-6254-6d495fb39c04@redhat.com>
In-Reply-To: <ad4cf02d-e5d3-b97a-6254-6d495fb39c04@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Mon, 18 Jan 2021 14:16:41 +0100
Message-ID: <CAP+75-XnmZ0Foo0zDyV5dOs9_fmTuWowspgDaLJ1yzg7Yzt6pA@mail.gmail.com>
Subject: Re: [PATCH v3] hw/core/qdev-properties-system: Rewrite
 set_pci_host_devaddr using GLib
To: QEMU Developers <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping^2

On Fri, Jan 8, 2021 at 5:02 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> Ping?
>
> On 11/25/20 9:33 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> > set_pci_host_devaddr() is hard to follow, thus bug-prone.
> >
> > For example, a bug was introduced in commit bccb20c49df, as
> > the same line might be used to parse a bus (up to 0xff) or
> > a slot (up to 0x1f).
> >
> > Instead of making things worst, rewrite using g_strsplit().
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > ---
> > v3: Rebased
> > v2: Free g_strsplit() with g_auto(GStrv) (Daniel)
> > ---
> >  hw/core/qdev-properties-system.c | 62 ++++++++++++++------------------
> >  1 file changed, 27 insertions(+), 35 deletions(-)
> >
> > diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties=
-system.c
> > index 9d80a07d26f..79408e32289 100644
> > --- a/hw/core/qdev-properties-system.c
> > +++ b/hw/core/qdev-properties-system.c
> > @@ -857,11 +857,11 @@ static void set_pci_host_devaddr(Object *obj, Vis=
itor *v, const char *name,
> >      DeviceState *dev =3D DEVICE(obj);
> >      Property *prop =3D opaque;
> >      PCIHostDeviceAddress *addr =3D qdev_get_prop_ptr(dev, prop);
> > -    char *str, *p;
> > -    char *e;
> > +    g_autofree char *str =3D NULL;
> > +    g_auto(GStrv) col_s0 =3D NULL;
> > +    g_auto(GStrv) dot_s =3D NULL;
> > +    char **col_s;
> >      unsigned long val;
> > -    unsigned long dom =3D 0, bus =3D 0;
> > -    unsigned int slot =3D 0, func =3D 0;
> >
> >      if (dev->realized) {
> >          qdev_prop_set_after_realize(dev, name, errp);
> > @@ -872,58 +872,50 @@ static void set_pci_host_devaddr(Object *obj, Vis=
itor *v, const char *name,
> >          return;
> >      }
> >
> > -    p =3D str;
> > -    val =3D strtoul(p, &e, 16);
> > -    if (e =3D=3D p || *e !=3D ':') {
> > +    col_s =3D col_s0 =3D g_strsplit(str, ":", 3);
> > +    if (!col_s || !col_s[0] || !col_s[1]) {
> >          goto inval;
> >      }
> > -    bus =3D val;
> >
> > -    p =3D e + 1;
> > -    val =3D strtoul(p, &e, 16);
> > -    if (e =3D=3D p) {
> > -        goto inval;
> > -    }
> > -    if (*e =3D=3D ':') {
> > -        dom =3D bus;
> > -        bus =3D val;
> > -        p =3D e + 1;
> > -        val =3D strtoul(p, &e, 16);
> > -        if (e =3D=3D p) {
> > +    /* domain */
> > +    if (col_s[2]) {
> > +        if (qemu_strtoul(col_s[0], NULL, 16, &val) < 0 || val > 0xffff=
) {
> >              goto inval;
> >          }
> > +        addr->domain =3D val;
> > +        col_s++;
> > +    } else {
> > +        addr->domain =3D 0;
> >      }
> > -    slot =3D val;
> >
> > -    if (*e !=3D '.') {
> > +    /* bus */
> > +    if (qemu_strtoul(col_s[0], NULL, 16, &val) < 0 || val > 0xff) {
> >          goto inval;
> >      }
> > -    p =3D e + 1;
> > -    val =3D strtoul(p, &e, 10);
> > -    if (e =3D=3D p) {
> > -        goto inval;
> > -    }
> > -    func =3D val;
> > +    addr->bus =3D val;
> >
> > -    if (dom > 0xffff || bus > 0xff || slot > 0x1f || func > 7) {
> > +    /* <slot>.<func> */
> > +    dot_s =3D g_strsplit(col_s[1], ".", 2);
> > +    if (!dot_s || !dot_s[0] || !dot_s[1]) {
> >          goto inval;
> >      }
> >
> > -    if (*e) {
> > +    /* slot */
> > +    if (qemu_strtoul(dot_s[0], NULL, 16, &val) < 0 || val > 0x1f) {
> >          goto inval;
> >      }
> > +    addr->slot =3D val;
> >
> > -    addr->domain =3D dom;
> > -    addr->bus =3D bus;
> > -    addr->slot =3D slot;
> > -    addr->function =3D func;
> > +    /* func */
> > +    if (qemu_strtoul(dot_s[1], NULL, 10, &val) < 0 || val > 7) {
> > +        goto inval;
> > +    }
> > +    addr->function =3D val;
> >
> > -    g_free(str);
> >      return;
> >
> >  inval:
> >      error_set_from_qdev_prop_error(errp, EINVAL, dev, prop, str);
> > -    g_free(str);
> >  }
> >
> >  const PropertyInfo qdev_prop_pci_host_devaddr =3D {
> >
>


