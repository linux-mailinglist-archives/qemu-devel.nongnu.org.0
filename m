Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2F82A0BCA
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Oct 2020 17:51:32 +0100 (CET)
Received: from localhost ([::1]:58998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYXch-0007fA-IV
	for lists+qemu-devel@lfdr.de; Fri, 30 Oct 2020 12:51:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kYXUj-0007B9-Ic
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 12:43:17 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:36740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kYXUh-00037u-Vq
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 12:43:17 -0400
Received: by mail-ej1-x62e.google.com with SMTP id o21so2447098ejb.3
 for <qemu-devel@nongnu.org>; Fri, 30 Oct 2020 09:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TM7ds3YnTYBd2K20+jX6soYSBaWKCfK6YeYztQChouA=;
 b=oBxnQCB0xw46erHD4yetpYLCDSifmPeWZcuKn2H+G202RtjT6RXW/exCa2dG6bRaF3
 HT7C/X2+sTKzUgrojYTjqHmGbiR/TpbBPcTkYVQUk7BEhRH3F8EJreRTZDTdD5sZmm+E
 dDv7jfqWQf29UyfI/ocLogW6gTw9ko2/Ioq7V/uCwHDfk6k10r3Ngt29sizIp/MdRqbB
 h0kjLspGI7ioks6EuoVajLyoRBXZmuUODnaAisQj98wPTh/faSiJGbQpzf9Z3wnV+9qR
 AL3wVdKWh/x4HzAtVSEHfMBUyhqqeBoW/j72CzXfksZ0Qb8jn77JoDgrRilGpBguYZ8a
 BNYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TM7ds3YnTYBd2K20+jX6soYSBaWKCfK6YeYztQChouA=;
 b=gDgrdzXyeGLP3ty9Luyvsh6VMyjLXPYF6e/R2+eIrlyjqLiDANdeGD99rNexHlutt+
 +KltJ7+fLsUmBTbh9C2g3slk3C/RQgYXNCL0XZXN8C/t01zhzXKX620YoCHCu1Fp/qI2
 PMWRgZL1q/NbxdbrIUKdUknWWZvXXkf8gmLiri3jjjC1ewGyWx+eiOIu6BFFIHyyf0hj
 jiXruR8Fqo82HGdRYDPKQhr2ek/kOKuJLEgthlWyu2zBmbt32YvZkRzhPVohJg2QuU90
 mQfX/inQQNCLAa469QvRO4AVofafGaLRzCga2vXzEKrN2eOGp9sh+VVyQCSCRQlCDoMv
 DaCg==
X-Gm-Message-State: AOAM530Hh115zLR/qFJLeP4l9M6xOXPTZod1CaBGJzKiRNjE4c1H2ksK
 AcBVaoA5hCXgcBlu7M0MhOmFW2a+oIONXjFQ85w=
X-Google-Smtp-Source: ABdhPJz1NMvWDF3YHWIUT3AlGcwyZiR1kIIH0AF1JR8QG3mDYHijbVXGzt6Dd869hEFAtCraZW52WZPYqQabeG+p5n8=
X-Received: by 2002:a17:906:af47:: with SMTP id
 ly7mr3558809ejb.532.1604076194084; 
 Fri, 30 Oct 2020 09:43:14 -0700 (PDT)
MIME-Version: 1.0
References: <20201029220246.472693-1-ehabkost@redhat.com>
 <20201029220246.472693-22-ehabkost@redhat.com>
In-Reply-To: <20201029220246.472693-22-ehabkost@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 30 Oct 2020 20:43:02 +0400
Message-ID: <CAJ+F1C+vNtUpVkMDeYoqk0=ZNxXVeN8NHjqFM4U6-BHLLNoJhQ@mail.gmail.com>
Subject: Re: [PATCH 21/36] qom: Add allow_set callback to ObjectProperty
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000bdbd3105b2e617fa"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000bdbd3105b2e617fa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2020 at 2:12 AM Eduardo Habkost <ehabkost@redhat.com> wrote=
:

> Note that this doesn't replace the check callback at
> object*_property_add_link() (yet), because currently the link
> property check callback needs to get the property value as
> argument (despite this not being necessary in most cases).
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



--=20
Marc-Andr=C3=A9 Lureau

--000000000000bdbd3105b2e617fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 30, 2020 at 2:12 AM Eduar=
do Habkost &lt;<a href=3D"mailto:ehabkost@redhat.com" target=3D"_blank">eha=
bkost@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Note that this doesn&#39;t replace the check callback at<br=
>
object*_property_add_link() (yet), because currently the link<br>
property check callback needs to get the property value as<br>
argument (despite this not being necessary in most cases).<br>
<br>
Signed-off-by: Eduardo Habkost &lt;<a href=3D"mailto:ehabkost@redhat.com" t=
arget=3D"_blank">ehabkost@redhat.com</a>&gt;<br></blockquote><div><br></div=
><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.l=
ureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;</di=
v><div> <br></div><br clear=3D"all"></div><br>-- <br><div dir=3D"ltr">Marc-=
Andr=C3=A9 Lureau<br></div></div>

--000000000000bdbd3105b2e617fa--

