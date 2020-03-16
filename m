Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D056E187144
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 18:35:39 +0100 (CET)
Received: from localhost ([::1]:44416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDteM-0005YI-RP
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 13:35:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56388)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@gmail.com>) id 1jDtEG-0001Vt-AX
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 13:08:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@gmail.com>) id 1jDtEE-0000HV-QJ
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 13:08:40 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:54718)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
 id 1jDtEE-0000B0-GQ
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 13:08:38 -0400
Received: by mail-wm1-x341.google.com with SMTP id n8so18522627wmc.4
 for <qemu-devel@nongnu.org>; Mon, 16 Mar 2020 10:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WF5EkbYNrK50ZUv0rul3pkmk1DJT91ei2DKro5UeniI=;
 b=ji/btXq3p63RiusKky3rtEw93yVK4OO2DmbkvU5myb9VOE8Q+wn8yp/zLt3Z6Ni+is
 GvMsmBdVHdpPbMFLvI5Be+Csrqs9voyo7vxlkx66G9dfOGlmkjn7xlmQpuG09B9X0k2b
 2J9IKYY+sd/7e+VArYUTT5YBO5B+QKdtHAvg0C1RtqMAvhUt4/XdhW8xJ4fVxtLnsFme
 /VRht+GZnD2kCZTq9LL398aJ3W2URfHdVch/RyUXxZad8GncBhUzYcLDVA8872GXZPy4
 b+McV8IRFru+dG0rQ3ydiZnHBnB7GMiKx+9UR7K5Xfy1h4VidHELxV6eMR15AIbF2ZWM
 6oMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WF5EkbYNrK50ZUv0rul3pkmk1DJT91ei2DKro5UeniI=;
 b=She6d3KRKSOjeU1yYhv3tRvwgc9IGT/djZ7PK1YATG5d2iyR3CkgdB4VEU/nid8ZsD
 C9Oi1shpP6t7GkeIvJHgaLAO4eNjNUcP9zLyvJkukpHtvpL0960xiFtKqXycMwwh1ZBU
 9yLrjhXxsbjAecriLRsuNDkIdVDQwJVFjYDWuukHvBEiuaC5lw8uOgsLBMCt3+9S4TL3
 7VlqxSpEU0yDj2MO2C6LgfYVhX1JshmV5pXobJGGIcdQpQMiVkbUjMPDlbMD8zwXlKhy
 RjGEE8lYSrWB3I988K9TlJLAj/GEtFDrPWXfutTLu6UF+OaoLE+6fSV27t08qfyLkOdg
 RcxA==
X-Gm-Message-State: ANhLgQ04UxAtkw8v37trjTAL2MHoMyFCegxYt9qdTFz3TPTS+PjX0Rr8
 OoOEDV5ayBgwhahRJcwPbiMBV2C+Jfa+7vcAwWQ=
X-Google-Smtp-Source: ADFU+vuMsxdAeI/J6DPkkKXwk9stwFVwhH1sXpUr/2KFLIy1RDMPSP4OkTWKjqzOEPNhXGqzTTAgJ2hn/3E/K3DGoSQ=
X-Received: by 2002:a05:600c:2c4a:: with SMTP id
 r10mr144452wmg.32.1584378517259; 
 Mon, 16 Mar 2020 10:08:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200315144653.22660-1-armbru@redhat.com>
 <20200315144653.22660-20-armbru@redhat.com>
In-Reply-To: <20200315144653.22660-20-armbru@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 16 Mar 2020 18:08:24 +0100
Message-ID: <CAJ+F1CJaj6ax1ePECiqW9FL9qMmubisDdrmdVmVi8_mAMp1h9Q@mail.gmail.com>
Subject: Re: [PATCH v3 19/34] qapi/schema: Call QAPIDoc.connect_member() in
 just one place
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
Cc: QEMU <qemu-devel@nongnu.org>, Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Mar 15, 2020 at 4:00 PM Markus Armbruster <armbru@redhat.com> wrote=
:
>
> The .connect_doc() of classes that have QAPISchemaMember connect them
> to their documentation.  Change them to delegate the actual work to
> new QAPISchemaMember.connect_doc().  Matches the .connect_doc() that
> already exist.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

> ---
>  scripts/qapi/schema.py | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
>
> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> index 033c84c4a0..59e1f5a395 100644
> --- a/scripts/qapi/schema.py
> +++ b/scripts/qapi/schema.py
> @@ -252,9 +252,8 @@ class QAPISchemaEnumType(QAPISchemaType):
>      def connect_doc(self, doc=3DNone):
>          super().connect_doc(doc)
>          doc =3D doc or self.doc
> -        if doc:
> -            for m in self.members:
> -                doc.connect_member(m)
> +        for m in self.members:
> +            m.connect_doc(doc)
>
>      def is_implicit(self):
>          # See QAPISchema._make_implicit_enum_type() and ._def_predefined=
s()
> @@ -396,11 +395,10 @@ class QAPISchemaObjectType(QAPISchemaType):
>      def connect_doc(self, doc=3DNone):
>          super().connect_doc(doc)
>          doc =3D doc or self.doc
> -        if doc:
> -            if self.base and self.base.is_implicit():
> -                self.base.connect_doc(doc)
> -            for m in self.local_members:
> -                doc.connect_member(m)
> +        if self.base and self.base.is_implicit():
> +            self.base.connect_doc(doc)
> +        for m in self.local_members:
> +            m.connect_doc(doc)
>
>      @property
>      def ifcond(self):
> @@ -496,9 +494,8 @@ class QAPISchemaAlternateType(QAPISchemaType):
>      def connect_doc(self, doc=3DNone):
>          super().connect_doc(doc)
>          doc =3D doc or self.doc
> -        if doc:
> -            for v in self.variants.variants:
> -                doc.connect_member(v)
> +        for v in self.variants.variants:
> +            v.connect_doc(doc)
>
>      def c_type(self):
>          return c_name(self.name) + pointer_suffix
> @@ -627,6 +624,10 @@ class QAPISchemaMember:
>                  % (self.describe(info), seen[cname].describe(info)))
>          seen[cname] =3D self
>
> +    def connect_doc(self, doc):
> +        if doc:
> +            doc.connect_member(self)
> +
>      def describe(self, info):
>          role =3D self.role
>          defined_in =3D self.defined_in
> --
> 2.21.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

