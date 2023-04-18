Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB136E5F4A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 13:05:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poj8V-0002NE-DB; Tue, 18 Apr 2023 07:04:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <digit@google.com>) id 1poj8T-0002Mf-6J
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 07:04:33 -0400
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <digit@google.com>) id 1poj8R-00031r-D2
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 07:04:32 -0400
Received: by mail-ua1-x933.google.com with SMTP id w19so10321131uad.7
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 04:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1681815869; x=1684407869;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=z/gExevU4hCCmJHYzYobyRyejm2PtTdy1VvBVBLG3iI=;
 b=WZ7dWX8wLmKi8HtitM2KSy6weE1CAMrlg/0cuC0ZHHHfsUdUPxtmkptGRr0JQ8+Idk
 gCfSlfMagzDFOFrh+6RjauNHAhK4N0+jYVIY/06JFSfO7+SiQZ1m8GdabOIJU9NoHexi
 0FQCQeIzg4LE3HxnfGbvWPNgo5G8EF4ZhxJ3jwqBTu1pW28xeH2oXlBprpCNPsCyhelj
 HdO+7j7tdES2YFElpBAx4u2KGY+skMT5oJSykDwe/mKNRo2MAkLmkIG5uEa88bzN7lnc
 3rmakZBVXZ5NEOzg5qV1wjlHFLAARSs9MdHNGlyvuQLuQWfHi0hNq51FCXMXmxOS+7OM
 Xcuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681815869; x=1684407869;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z/gExevU4hCCmJHYzYobyRyejm2PtTdy1VvBVBLG3iI=;
 b=gAEsiVJ6ts35edWF0vG5mGjiIRfnyVq3mol0F7VoamaYfQhSNJDZEN5IXs0UYIHlVq
 JVpURqVFb/y5IeZ/50FFGzqDZFGlL/fFmt50oo+jV+W1jdoehdFFYjUbwB5ccyRglxPa
 O1c+rTNux+J7ECGE5Xyg/PQZP+SjrmLeEhS8wO+0KgY6KFGkeaRAT4LyCKbOMEFonjXM
 98vHru92lXacWgh4ATCz3+ayMsTueHB/0J3IpQ8LiC+dI6t5zmjWX37f8cOrI9EXWtVa
 mdrBL2oKogqWI0LTnWbzZP5SdmqC108pi5UDWRt/33efymJQavKHv3z4It3B9nyBi/tl
 BQuw==
X-Gm-Message-State: AAQBX9fgpOymOhbtiEc3KVe5eRxhlO9OD8Pb728LAwRgsA5Qn/zIYkHs
 or8tKQUeta/+QNDLfC1AbobgpVFtZ7imd3bjhgEsHA==
X-Google-Smtp-Source: AKy350Z8sj7OYsPDnlQl9QTc7OKejpYgaHsikR+gbO7n2p0qB1sLT46A7rpIGoapOifq05gtrX/jMCVJYIKqk6d9dB8=
X-Received: by 2002:ab0:5ad5:0:b0:68b:90f4:1d8c with SMTP id
 x21-20020ab05ad5000000b0068b90f41d8cmr1397999uae.1.1681815869354; Tue, 18 Apr
 2023 04:04:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230405172109.3081788-1-digit@google.com>
 <20230405172109.3081788-2-digit@google.com>
 <20230407035709-mutt-send-email-mst@kernel.org>
 <CACnJMqpF9FPwtZz3Uj_amCbrRtQo7WWPm0bY_qy=80+ihb8Uhw@mail.gmail.com>
 <CACnJMqoS3L6=zTCL4__EwOk8pR0kR4P2Kbrv5U_xB8Lm2e=vXQ@mail.gmail.com>
 <ZD5ZN4qKxMEcJ3Z6@redhat.com>
In-Reply-To: <ZD5ZN4qKxMEcJ3Z6@redhat.com>
From: David Turner <digit@google.com>
Date: Tue, 18 Apr 2023 13:04:18 +0200
Message-ID: <CACnJMqpfejE2ZVg3NseGqdc24qDzXbdc4rWi63n853sm8g2deQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] Fix libvhost-user.c compilation.
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000078f44505f99a45c0"
Received-SPF: pass client-ip=2607:f8b0:4864:20::933;
 envelope-from=digit@google.com; helo=mail-ua1-x933.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--00000000000078f44505f99a45c0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 18, 2023 at 10:47=E2=80=AFAM Daniel P. Berrang=C3=A9 <berrange@=
redhat.com>
wrote:

> On Fri, Apr 07, 2023 at 11:25:14AM +0200, David Turner wrote:
> > I meant glibc-2.17, I am using a sysroot to ensure the generated binari=
es
> > run on older Linux distributions.
>
> I think that would be considered an unsupported buld configuration
> from QEMU's POV. Our platform policy is declared here:
>
>   https://www.qemu.org/docs/master/about/build-platforms.html
>
> and from this policy we decide the minimum versions of libraries
> we intend to build against.
>
> Our two oldest build targets are Debian 10 / RHEL 8, both of
> which ship with GLibC 2.28.
>
> IOW, trying to build with a sysroot contanining ancient glibc
> 2.17 is well outside what QEMU intends to support. 2.17 is
> from circa 2012.
>
> Thank you for the clarification. My use of 2.17 is purely accidental at
that point (just reusing this Android prebuilt sysroot
<https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/host/x86=
_64-linux-glibc2.17-4.8/>
which is quite dated).
I will try with a Debian 10 based sysroot first and will let you know.
Maybe these patches are not needed after all.

>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :|
>
>

--00000000000078f44505f99a45c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 18, 2023 at 10:47=E2=80=
=AFAM Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">be=
rrange@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On Fri, Apr 07, 2023 at 11:25:14AM +0200, David Turner wro=
te:<br>
&gt; I meant glibc-2.17, I am using a sysroot to ensure the generated binar=
ies<br>
&gt; run on older Linux distributions.<br>
<br>
I think that would be considered an unsupported buld configuration<br>
from QEMU&#39;s POV. Our platform policy is declared here:<br>
<br>
=C2=A0 <a href=3D"https://www.qemu.org/docs/master/about/build-platforms.ht=
ml" rel=3D"noreferrer" target=3D"_blank">https://www.qemu.org/docs/master/a=
bout/build-platforms.html</a><br>
<br>
and from this policy we decide the minimum versions of libraries<br>
we intend to build against.<br>
<br>
Our two oldest build targets are Debian 10 / RHEL 8, both of<br>
which ship with GLibC 2.28.<br>
<br>
IOW, trying to build with a sysroot contanining ancient glibc<br>
2.17 is well outside what QEMU intends to support. 2.17 is<br>
from circa 2012.<br>
<br></blockquote><div>Thank you for the clarification. My use of 2.17 is pu=
rely accidental at that point (just reusing this=C2=A0<a href=3D"https://an=
droid.googlesource.com/platform/prebuilts/gcc/linux-x86/host/x86_64-linux-g=
libc2.17-4.8/">Android prebuilt sysroot</a> which is quite dated).<br>I wil=
l try with a Debian 10 based sysroot first=C2=A0and will let you know. Mayb=
e these patches are not needed after all.</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
<br>
With regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer" target=3D"_blank">ht=
tps://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D"http=
s://www.flickr.com/photos/dberrange" rel=3D"noreferrer" target=3D"_blank">h=
ttps://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer" target=3D"_blank">htt=
ps://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com" rel=3D"n=
oreferrer" target=3D"_blank">https://fstop138.berrange.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer" target=3D"_bla=
nk">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D=
"https://www.instagram.com/dberrange" rel=3D"noreferrer" target=3D"_blank">=
https://www.instagram.com/dberrange</a> :|<br>
<br>
</blockquote></div></div>

--00000000000078f44505f99a45c0--

