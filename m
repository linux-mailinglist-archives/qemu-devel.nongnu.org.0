Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FA348F9A1
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Jan 2022 23:14:56 +0100 (CET)
Received: from localhost ([::1]:50938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8rK3-0004Yd-Be
	for lists+qemu-devel@lfdr.de; Sat, 15 Jan 2022 17:14:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1n8rJ3-0003rb-G2
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 17:13:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1n8rIx-0007dP-4U
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 17:13:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642284825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J6anVdf5ZJQh9FIGM2hissuSxlqsFC1yglZZGESJ01c=;
 b=EytVOMwSf6r43wkPWC5sbdvsDrUdwk6wiHj30K3TE+xcwW+3ng+xe9VLcxeF8l2ezIBIXY
 v3VXd2R1r4ENSkuBlaDno0AXu+kZJ5iUMOPL4Yf5T4j3GrQoylQF11k+RM3F1okkI6vvcb
 wweZKqeX3TwBXDGkpeTMDhqpzRIXkbU=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-381-NrXdA9IYPJWAO_b4F68BLA-1; Sat, 15 Jan 2022 17:13:39 -0500
X-MC-Unique: NrXdA9IYPJWAO_b4F68BLA-1
Received: by mail-yb1-f200.google.com with SMTP id
 y10-20020a2586ca000000b006116aaeeee6so25161273ybm.21
 for <qemu-devel@nongnu.org>; Sat, 15 Jan 2022 14:13:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J6anVdf5ZJQh9FIGM2hissuSxlqsFC1yglZZGESJ01c=;
 b=FnDQuobfluzCG+wgVoKLCZz8AMQ9mtyxRz+ah6w3Oubu7YDOlbbfJCM4QCsJecggCB
 ZHwj5mGJRHFY1gQjciicyKsITZC7rzwlH2G/+oPltjMy3seAWwIRJ1++IBNMgPnCyVJr
 rxOHPRWRFDf3DYzxvAPO8UZo5zNnZRlRO/yBdImzwJqFSVu7lfLMuje13bI0OAfnQfu9
 DPmIYC6fsuauHGZeS4Rt1KmHsVzj7FFIzRtTHTQ0jD8dK8/rUhP8DKzHhdSfRohLsoAt
 5MvKMd2CE+32hGvCDXedyVM9jeT41lZ19X2KwKquTn6VwFZA+Wsw92EO9Qf8WBSKlE0j
 EOkA==
X-Gm-Message-State: AOAM530WnAwulBFSG3TNbaZbxkqNbbR7Mv43xno6Z0EJut0uDhiQKW2B
 tqIgHKvmjb0yl+uW1bvVluMYfi+Ijwxi0j9RZp7Gf0aMC9iqX9W/rSOQca6mUg7fTkoA1+z9+DF
 BiKufmLR9OeNBDgyCaaDmATaxqIvwEBU=
X-Received: by 2002:a25:28f:: with SMTP id 137mr16593009ybc.167.1642284819121; 
 Sat, 15 Jan 2022 14:13:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxSXTJFf6Pvft1cksBGs/U1Y2FbBJG8EzGY/NhV7KClBIc9FUby893Pf20I1cPfysEDxyDvSfBfbVQidWM3zpw=
X-Received: by 2002:a25:28f:: with SMTP id 137mr16592996ybc.167.1642284818918; 
 Sat, 15 Jan 2022 14:13:38 -0800 (PST)
MIME-Version: 1.0
References: <20220110134644.107375-1-kkostiuk@redhat.com>
 <CAFEAcA_fgs1JAjMDXjd76xFWfmTMba1BfhYHFPrXCQyUk6o-eg@mail.gmail.com>
In-Reply-To: <CAFEAcA_fgs1JAjMDXjd76xFWfmTMba1BfhYHFPrXCQyUk6o-eg@mail.gmail.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Sun, 16 Jan 2022 00:13:28 +0200
Message-ID: <CAPMcbCrCSct7AEPgmPJ2qC+VQQGJcAqsJGJh4G0aS8mj4dRzSw@mail.gmail.com>
Subject: Re: [PULL 0/9] qemu-ga-win patches
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kkostiuk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000040886a05d5a63b64"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000040886a05d5a63b64
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 15, 2022 at 2:40 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Mon, 10 Jan 2022 at 13:46, Konstantin Kostiuk <kkostiuk@redhat.com>
> wrote:
> >
> > The following changes since commit
> df722e33d5da26ea8604500ca8f509245a0ea524:
> >
> >   Merge tag 'bsd-user-arm-pull-request' of gitlab.com:bsdimp/qemu into
> staging (2022-01-08 09:37:59 -0800)
> >
> > are available in the Git repository at:
> >
> >   https://github.com/kostyanf14/qemu.git tags/qga-win32-pull-2022-01-10
> >
> > for you to fetch changes up to 206ce9699fae1f631ac74b7e1115db2affc759fd:
> >
> >   qga-win: Detect Windows 11 by build number (2022-01-10 13:05:25 +0000)
>
> Hi; this tag doesn't seem to be gpg-signed. QEMU only alloows pullreqs
> which are for gpg-signed tags, so you'll need to sign it. Please make
> sure you've uploaded your gpg key to a suitable keyserver (eg
> keyserver.ubuntu.com and/or keys.openpgp.org) and let me know which
> one so I can download it. If you can arrange to get your key signed by
> some of your RedHat colleagues (and upload the key with those signatures)
> that would also be helpful.
>
> thanks
> -- PMM
>

Hi. I uploaded my GPG key to keys.openpgp.org. You can find it by my RedHat
email.
Unfortunately, for now, this key can not be signed by other RedHat
developers.
I signed my tag and pushed it to GitHub. Should I resend this set of
patches?

For tag signing, I use the 'git tag -s' command.
I am sorry for the mistakes, this is my first PR.

Best Regards,
Konstantin Kostiuk.

--00000000000040886a05d5a63b64
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Sat, Jan 15, 2022 at 2:40 PM Peter Maydell &lt;<a href=3D"mai=
lto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, 10 Jan 2022 a=
t 13:46, Konstantin Kostiuk &lt;<a href=3D"mailto:kkostiuk@redhat.com" targ=
et=3D"_blank">kkostiuk@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; The following changes since commit df722e33d5da26ea8604500ca8f509245a0=
ea524:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0Merge tag &#39;bsd-user-arm-pull-request&#39; of gitlab.co=
m:bsdimp/qemu into staging (2022-01-08 09:37:59 -0800)<br>
&gt;<br>
&gt; are available in the Git repository at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://github.com/kostyanf14/qemu.git" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/kostyanf14/qemu.git</a> ta=
gs/qga-win32-pull-2022-01-10<br>
&gt;<br>
&gt; for you to fetch changes up to 206ce9699fae1f631ac74b7e1115db2affc759f=
d:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0qga-win: Detect Windows 11 by build number (2022-01-10 13:=
05:25 +0000)<br>
<br>
Hi; this tag doesn&#39;t seem to be gpg-signed. QEMU only alloows pullreqs<=
br>
which are for gpg-signed tags, so you&#39;ll need to sign it. Please make<b=
r>
sure you&#39;ve uploaded your gpg key to a suitable keyserver (eg<br>
<a href=3D"http://keyserver.ubuntu.com" rel=3D"noreferrer" target=3D"_blank=
">keyserver.ubuntu.com</a> and/or <a href=3D"http://keys.openpgp.org" rel=
=3D"noreferrer" target=3D"_blank">keys.openpgp.org</a>) and let me know whi=
ch<br>
one so I can download it. If you can arrange to get your key signed by<br>
some of your RedHat colleagues (and upload the key with those signatures)<b=
r>
that would also be helpful.<br>
<br>
thanks<br>
-- PMM<br></blockquote><div><br></div>Hi. I uploaded my GPG key to <a href=
=3D"http://keys.openpgp.org">keys.openpgp.org</a>. You can find it by my Re=
dHat email. <br></div><div class=3D"gmail_quote">Unfortunately, for now, th=
is key can not be signed by other RedHat developers.<br>I signed my tag and=
 pushed it to GitHub. Should I resend this set of patches?<br><br>For tag s=
igning, I use the &#39;git tag -s&#39; command.<br>I am sorry for the mista=
kes, this is my first PR.<br><br><div><div><div dir=3D"ltr" class=3D"gmail_=
signature"><div dir=3D"ltr"><div>Best Regards,</div><div>Konstantin Kostiuk=
.</div></div></div></div>=C2=A0</div></div></div>

--00000000000040886a05d5a63b64--


