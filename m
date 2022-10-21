Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD2E607767
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 14:58:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olrbI-00055S-3e
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 08:58:12 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olrSB-00065K-U9
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 08:48:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1olrRy-000648-W9; Fri, 21 Oct 2022 08:48:36 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1olrRx-0003vI-7p; Fri, 21 Oct 2022 08:48:34 -0400
Received: by mail-lf1-x12e.google.com with SMTP id a29so4973272lfo.1;
 Fri, 21 Oct 2022 05:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7bCCSG5bTGC/wk38/NWBuXhfu6/eiIlyma+4izuZJBg=;
 b=jxoMv2F6TV1Yw21siXRjk3wzJb6yzI9WlsuAwGSwHtp+WyOjV+2yI9EqhO+6cjLtJ0
 ekR9Ton44Rn2rHKajYL2S176QDZjAx7ozTpZ1fGViw0OWS/yXFXQUdYfWlli1ZO9LGBF
 DkZlc6NSM55k5iF3FxjA28qm9PdhwowuDaRt+UPSHX1rX12eqQsKlSSCjAUp7PCKLpBT
 gzK4f6W3KydfYHioA8NUpkxWjLz+pJXiFCCSYQULr/vzH9QlcDXuKyKfgSnxjn8PHcLl
 qNjZk0AAZsAoImOWdBj136NKmSKU2beOMKLH3c+ihFcwbN8rv+aANgMgib56wVFkbKPe
 zXHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7bCCSG5bTGC/wk38/NWBuXhfu6/eiIlyma+4izuZJBg=;
 b=Otv4sr1xrbO3qwJ3BmdVuOcn7dhLa5xEwJ+M/Nrzq1MNN/z1E202RJOpdJyy8j3NFe
 L37oVE0/ZfdOk1jv/84MFEMMZTwVWmuwa1cceJSiBkeLfDZlIJKESmbFhyA3jrcgEaeq
 K5zw0P5zXSBIgNN7yrAhlqASN27IlL3HdVxN4VnXwBGIF9S+Vb9iHDkgrL0ErFCRzvtR
 j8qJ7HP2O7MjSthTYIfqR1iU08a7dQEL+5zGo5PkT/NTvvCT6bG5kEs0cxKADutznyTI
 yl5CeQot6Shjs54DlCfGrKNBL8Ws82ZuIOcULp9wW4FbmRvtXiIxl2zjG2YH4Mg9jv9n
 ZAWw==
X-Gm-Message-State: ACrzQf1xm+btzAMQsA7jDU+xt3YpMEdAv73650TpBTlozPWxbz05JJW6
 IZ1gnp7d0mHFVzsDV1WRQzIKhV4obIT95usxf5E=
X-Google-Smtp-Source: AMsMyM4m7zJVs9L7tRvYQ0ulwwzXgdwx1YDLpA6F30Ao++NFGHf6XMwjfj6d4Jg19CHRuhxR1LxGWMrQTJ+z0LAgCjE=
X-Received: by 2002:ac2:59d9:0:b0:4a2:bdbf:c20a with SMTP id
 x25-20020ac259d9000000b004a2bdbfc20amr6319822lfn.362.1666356510272; Fri, 21
 Oct 2022 05:48:30 -0700 (PDT)
MIME-Version: 1.0
References: <20221017083822.43118-1-frankja@linux.ibm.com>
 <3b8f8249-e8ed-b129-18d8-f132c4e23e44@redhat.com>
In-Reply-To: <3b8f8249-e8ed-b129-18d8-f132c4e23e44@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 21 Oct 2022 16:48:18 +0400
Message-ID: <CAJ+F1CK=kbDO29CUfoZ_2_yPO6XNQEmJ=DhX5A-MABmwd0QPww@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] dump: Add arch section and s390x PV dump
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com, 
 cohuck@redhat.com, qemu-s390x@nongnu.org, seiden@linux.ibm.com, 
 scgl@linux.ibm.com, Janosch Frank <frankja@linux.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000dd338f05eb8adb8b"
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000dd338f05eb8adb8b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Oct 21, 2022 at 4:38 PM Thomas Huth <thuth@redhat.com> wrote:

> On 17/10/2022 10.38, Janosch Frank wrote:
> > Previously this series was two separate series:
> >   * Arch section support
> >     Adds the possibility for arch code to add custom section data.
> >
> >   * s390 PV dump support
> >     Adds PV dump data to the custom arch sections.
> >
> > I've chosen to merge them so it's easier to understand why the arch
> > section support has been implement the way it is.
> >
> > Additionally I've added cleanup patches beforehand which clean up the
> > GuestPhysBlock usage.
>
> As far as I can see, all patches have been reviewed now ... Marc-Andr=C3=
=A9, do
> you want to pick this up for your "dump" branch, or shall I take it
> through
> the s390x tree?
>
>
ack, I'll take them

thanks

--=20
Marc-Andr=C3=A9 Lureau

--000000000000dd338f05eb8adb8b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 21, 2022 at 4:38 PM Tho=
mas Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 17/10/2=
022 10.38, Janosch Frank wrote:<br>
&gt; Previously this series was two separate series:<br>
&gt;=C2=A0 =C2=A0* Arch section support<br>
&gt;=C2=A0 =C2=A0 =C2=A0Adds the possibility for arch code to add custom se=
ction data.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0* s390 PV dump support<br>
&gt;=C2=A0 =C2=A0 =C2=A0Adds PV dump data to the custom arch sections.<br>
&gt; <br>
&gt; I&#39;ve chosen to merge them so it&#39;s easier to understand why the=
 arch<br>
&gt; section support has been implement the way it is.<br>
&gt; <br>
&gt; Additionally I&#39;ve added cleanup patches beforehand which clean up =
the<br>
&gt; GuestPhysBlock usage.<br>
<br>
As far as I can see, all patches have been reviewed now ... Marc-Andr=C3=A9=
, do <br>
you want to pick this up for your &quot;dump&quot; branch, or shall I take =
it through <br>
the s390x tree?<br><br></blockquote><div><br></div><div>ack, I&#39;ll take =
them</div><div><br></div><div>thanks</div><div>=C2=A0<br></div></div>-- <br=
><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div=
></div>

--000000000000dd338f05eb8adb8b--

