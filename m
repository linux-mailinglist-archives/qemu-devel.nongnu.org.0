Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE946576C40
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jul 2022 08:37:56 +0200 (CEST)
Received: from localhost ([::1]:36454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCbR5-0001sk-Mx
	for lists+qemu-devel@lfdr.de; Sat, 16 Jul 2022 02:37:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oCbPl-000098-1R
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 02:36:33 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:41630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oCbPi-0008Pq-VS
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 02:36:32 -0400
Received: by mail-ed1-x52a.google.com with SMTP id k30so8742966edk.8
 for <qemu-devel@nongnu.org>; Fri, 15 Jul 2022 23:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xE7UeZNu5iRDBu9gGriASll/gFK/im7hT1eU4uXn4wY=;
 b=7ZlqWvdBh5SIev16DcLpv52CSIWeXxMm5RUq5wthG+4osGQwAVQO34ERztagjp5NGg
 acG58GRS/uZXNSTImRQ7Vg/ahbNb88nehFSaMH+Yn5w+lUin+e3tlndasvOwwCDU4zO8
 yJFZEgBov5raP1CIUtSlVAfdt85FjfPuMAGKX63wCMNWmoVUgr7tU6dQvo3cGvms6t+j
 HMrwrP/2ARUGtowM/ZSmBdoBxPCPmE7/D+wan8olQb9Q1wZsNC8ScbK8KNgUqv4jaDGa
 w6LhOw1aLJpvBenf35zh9FupU/Ny7q8YgX9LY8iqGhpMaxstzkPUppXJuB2KBcwQILWk
 n9xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xE7UeZNu5iRDBu9gGriASll/gFK/im7hT1eU4uXn4wY=;
 b=L3DWt7Ea6atwvk7tjmGdvD7w1dqZwjnoNV2TwiJouUVcVBkgnYM0FiwLlYZKVjUQTu
 ZdfrTrfi4BnxtW55maqywtq+QR1lYQFcJkHjWpey+hANpnP1cCOw+mF2pq+UA8SWnlWZ
 8WWZ2r6uQ4H9Zghb8Fj6fJiJ3jj3BEolPu/FBR1qJcaP2OT7UiDitz6gCnWdQfHImcIn
 WnbAnECI2ljePQGnZnvNHBAX3L9dI7SZd/5mPMW9yxUw1ecLM7O6KxukZxZBXP/S9O8I
 /IfjnQUduhXGluZiTjfEY02Y2qVi6uctHxSCuygyhJwiuccKBCRfJkdKEAgTMKYXEcyR
 3q+Q==
X-Gm-Message-State: AJIora8ThZrnrIx6gT/ucmPFxB13Zvo+fjuKMjcwrK169V1Fgcj3BS/X
 MfisF71OheVVhgRyDpT0E7zXNgoBmWEQ7L40l/59Gw==
X-Google-Smtp-Source: AGRyM1tRk5HuGie4CooYPOL9f4Fjy+RWwju78QQfv1SgouO31yGN/9R535OKbkELDB6N8a+1yWYm0oLBRAVjVujbWxg=
X-Received: by 2002:a05:6402:3201:b0:43a:b203:219c with SMTP id
 g1-20020a056402320100b0043ab203219cmr23437269eda.371.1657953388789; Fri, 15
 Jul 2022 23:36:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220710170014.1673480-1-ani@anisinha.ca>
 <20220710170014.1673480-8-ani@anisinha.ca>
 <20220714163611-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.22.394.2207150929020.2162493@anisinha-lenovo>
 <20220715015941-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220715015941-mutt-send-email-mst@kernel.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Sat, 16 Jul 2022 12:06:00 +0530
Message-ID: <CAARzgwwjXMmbRQ-ETPPqHP5eq5jtrGMSh2GeBh5fLS9Pcsut+A@mail.gmail.com>
Subject: Re: [PATCH v2 07/11] acpi/tests/bits: add python test that exercizes
 QEMU bios tables using biosbits
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: berrange@redhat.com, imammedo@redhat.com, jsnow@redhat.com, 
 pbonzini@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org, 
 thuth@redhat.com
Content-Type: multipart/alternative; boundary="000000000000cb136005e3e65aa4"
Received-SPF: none client-ip=2a00:1450:4864:20::52a;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--000000000000cb136005e3e65aa4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 15, 2022 at 11:20 Michael S. Tsirkin <mst@redhat.com> wrote:

> On Fri, Jul 15, 2022 at 09:47:27AM +0530, Ani Sinha wrote:
> > > Instead of all this mess, can't we just spawn e.g. "git clone --depth
> 1"?
> > > And if the directory exists I would fetch and checkout.
> >
> > There are two reasons I can think of why I do not like this idea:
> >
> > (a) a git clone of a whole directory would download all versions of the
> > binary whereas we want only a specific version.
>
> You mention shallow clone yourself, and I used --depth 1 above.
>
> > Downloading a single file
> > by shallow cloning or creating a git archive is overkill IMHO when a wg=
et
> > style retrieval works just fine.
>
> However, it does not provide for versioning, tagging etc so you have
> to implement your own schema.


Hmm I=E2=80=99m not sure if we need all that. Bits has its own versioning m=
echanism
and I think all we need to do is maintain the same versioning logic and
maintain binaries of different  versions. Do we really need the power of
git/version control here? Dunno.


>
>
> > (b) we may later move the binary archives to a ftp server or a google
> > drive. git/version control mechanisms are not the best place to store
> > binary blobs IMHO. In this case also, wget also works.
>
> surely neither ftp nor google drive are reasonable dependencies
> for a free software project. But qemu does maintain an http server
> already so that't a plus.
>
>
>
> I am not insisting on git, but I do not like it that security,
> mirroring, caching, versioning all have to be hand rolled and then
> figured out by users and maintainers. Who frankly have other things to
> do besides learning yet another boutique configuration language.


Yeah we do not want to reinvent the wheel all over again.


>
> And I worry that after a while we come up with a new organization schema
> for the files, old ones are moved around and nothing relying on the URL
> works.  git is kind of good in that it enforces the idea that history is
> immutable.


Ah I see your point here.


>
> If not vanilla git can we find another utility we can reuse?
>
> git lfs? It seems to be supported by both github and gitlab though
> bizarrely github has bandwidth limits on git lfs but apparently not on
> vanilla git. Hosting on qemu.org will require maintaining a server
> there though.
>
>
>
> All that said maybe we should just run with it as it is, just so we get
> *something* in the door, and then worry about getting the storage side
> straight before making this test a requirement for all acpi developers.




>

--000000000000cb136005e3e65aa4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Jul 15, 2022 at 11:20 Michael S. Tsirkin &lt;<a hre=
f=3D"mailto:mst@redhat.com">mst@redhat.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">On Fri, Jul 15, 2022 at 09:47:27AM +0530, Ani Sinha =
wrote:<br>
&gt; &gt; Instead of all this mess, can&#39;t we just spawn e.g. &quot;git =
clone --depth 1&quot;?<br>
&gt; &gt; And if the directory exists I would fetch and checkout.<br>
&gt; <br>
&gt; There are two reasons I can think of why I do not like this idea:<br>
&gt; <br>
&gt; (a) a git clone of a whole directory would download all versions of th=
e<br>
&gt; binary whereas we want only a specific version.<br>
<br>
You mention shallow clone yourself, and I used --depth 1 above.<br>
<br>
&gt; Downloading a single file<br>
&gt; by shallow cloning or creating a git archive is overkill IMHO when a w=
get<br>
&gt; style retrieval works just fine.<br>
<br>
However, it does not provide for versioning, tagging etc so you have<br>
to implement your own schema.</blockquote><div dir=3D"auto"><br></div><div =
dir=3D"auto">Hmm I=E2=80=99m not sure if we need all that. Bits has its own=
 versioning mechanism and I think all we need to do is maintain the same ve=
rsioning logic and maintain binaries of different =C2=A0versions. Do we rea=
lly need the power of git/version control here? Dunno.</div><div dir=3D"aut=
o"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
<br>
&gt; (b) we may later move the binary archives to a ftp server or a google<=
br>
&gt; drive. git/version control mechanisms are not the best place to store<=
br>
&gt; binary blobs IMHO. In this case also, wget also works.<br>
<br>
surely neither ftp nor google drive are reasonable dependencies<br>
for a free software project. But qemu does maintain an http server<br>
already so that&#39;t a plus.<br>
<br>
<br>
<br>
I am not insisting on git, but I do not like it that security,<br>
mirroring, caching, versioning all have to be hand rolled and then<br>
figured out by users and maintainers. Who frankly have other things to<br>
do besides learning yet another boutique configuration language.</blockquot=
e><div dir=3D"auto"><br></div><div dir=3D"auto">Yeah we do not want to rein=
vent the wheel all over again.=C2=A0</div><div dir=3D"auto"><br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex" dir=3D"auto"><br>
<br>
And I worry that after a while we come up with a new organization schema<br=
>
for the files, old ones are moved around and nothing relying on the URL<br>
works.=C2=A0 git is kind of good in that it enforces the idea that history =
is<br>
immutable.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Ah I s=
ee your point here.</div><div dir=3D"auto"><br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex" dir=3D"auto"><br>
<br>
If not vanilla git can we find another utility we can reuse?<br>
<br>
git lfs? It seems to be supported by both github and gitlab though<br>
bizarrely github has bandwidth limits on git lfs but apparently not on<br>
vanilla git. Hosting on <a href=3D"http://qemu.org" rel=3D"noreferrer" targ=
et=3D"_blank">qemu.org</a> will require maintaining a server<br>
there though.<br>
<br>
<br>
<br>
All that said maybe we should just run with it as it is, just so we get<br>
*something* in the door, and then worry about getting the storage side<br>
straight before making this test a requirement for all acpi developers.</bl=
ockquote><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex" dir=3D"auto">
<br>
</blockquote></div></div>

--000000000000cb136005e3e65aa4--

