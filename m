Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 579663C8645
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 16:42:52 +0200 (CEST)
Received: from localhost ([::1]:54210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3g67-0001f1-EP
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 10:42:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1m3g4n-0008U9-8x
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 10:41:29 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:47022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1m3g4l-0002R1-Bl
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 10:41:28 -0400
Received: by mail-qt1-x82a.google.com with SMTP id d15so1975527qte.13
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 07:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1OGt1a/YKMRiEQHVTRqbh1tACW7R9PEKpxBXAk/mJ/0=;
 b=xNu3o10kfuk+Hjl4O/efOB0AFwj8Tmm/DSBUVY53buDu+zsfbq16E7Bu1m1Ja4MSm5
 0MPkIQBer6aruuwwj6uZB1g9y6iEDHEaEFzB/dMOBHMiQdZ3fQAjqH/X3YtqcY5uUGmu
 6TY6ha4z0X7yiBMH/+6chKbJWFziKKtk1LaVkmJ7Pa7Io6zt7saFFaksUoG7Ms3L7+NM
 IxV5aY55likeWXhYN0E4vxeCCg80gU1liRX7Ldbz1OjqvCVXteC82IWxs29mkx0G2FPU
 C+Nc/GfAitu5v+zj/64ec+PU7TmEq6N/i/heLaHcTqae3XRVDyc1R5q/qHOQBuR5dqkI
 aNdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1OGt1a/YKMRiEQHVTRqbh1tACW7R9PEKpxBXAk/mJ/0=;
 b=R9subQS+X76EMxQOCNu6EPRyQ43cgrtgAiNDH7wUdTryltt6hVIXShIEuzoNch7o8r
 N8mcZxpeaYmLgimc+sYaGXZqb8tfQpNsb1xROIXEAyodFfFgy4HUD1WpgDCnlX94xBlp
 e9SR4PTWyVjHpqBLHlNTwKvhS/WBaFNb1TfZr9vmsVI2WSaxv6jS2eX5zGsgrbMxxA0I
 ZGFkhYZyrUmXkRk1cbnJeO4gVhXOP+PbsF2e3kMuTyz6ME3IZu9CbDV78iqHtxhrrvkx
 vNyWPzgbyo+N4DPOx4gfhsY16fAvSmeuLNyIADX3rKsTWsHVCXJfu1IOcGxMTV9RfDDK
 8bDA==
X-Gm-Message-State: AOAM530AQf9rZmyYQ6q68QW0yNCGjUhzNSEvHsXKa7EiMxrovfbTXhg9
 6r0HFnKVIbcIujoYRxtn2CLolKJg6UIcqldBWJywwg==
X-Google-Smtp-Source: ABdhPJyH/NG62DIZP9gAGuWoFwJVFJ0+VTpoL9pFIUdA2UIO4IVCa8fPwSV6/A+LnOuu0iB+N2YCuY012apcakGTMS8=
X-Received: by 2002:ac8:5a13:: with SMTP id n19mr6425169qta.49.1626273683289; 
 Wed, 14 Jul 2021 07:41:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210714093719.21429-1-alex.bennee@linaro.org>
 <20210714093719.21429-19-alex.bennee@linaro.org>
In-Reply-To: <20210714093719.21429-19-alex.bennee@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 14 Jul 2021 08:41:12 -0600
Message-ID: <CANCZdfrDRKDHA6h=vhUuEmdWy4H8vHTU+bd9Xcj6wZJYs8Bbvg@mail.gmail.com>
Subject: Re: [PATCH v1 18/21] contrib/gitdm: add group-map for Netflix
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000334f4d05c7165957"
Received-SPF: none client-ip=2607:f8b0:4864:20::82a;
 envelope-from=wlosh@bsdimp.com; helo=mail-qt1-x82a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000334f4d05c7165957
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 14, 2021 at 3:43 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:

> Warner confirmed he works for Netflix on IRC.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Warner Losh <imp@bsdimp.com>
> ---
>  contrib/gitdm/group-map-netflix | 5 +++++
>  gitdm.config                    | 1 +
>  2 files changed, 6 insertions(+)
>  create mode 100644 contrib/gitdm/group-map-netflix
>

Reviewed-by: Warner Losh <imp@bsdimp.com>


> diff --git a/contrib/gitdm/group-map-netflix
> b/contrib/gitdm/group-map-netflix
> new file mode 100644
> index 0000000000..468f95dcb2
> --- /dev/null
> +++ b/contrib/gitdm/group-map-netflix
> @@ -0,0 +1,5 @@
> +#
> +# Netflix contributors using their personal emails
> +#
> +
> +imp@bsdimp.com
> diff --git a/gitdm.config b/gitdm.config
> index c60ebc6e47..47317bcee7 100644
> --- a/gitdm.config
> +++ b/gitdm.config
> @@ -35,6 +35,7 @@ GroupMap contrib/gitdm/group-map-cadence Cadence Design
> Systems
>  GroupMap contrib/gitdm/group-map-codeweavers CodeWeavers
>  GroupMap contrib/gitdm/group-map-ibm IBM
>  GroupMap contrib/gitdm/group-map-janustech Janus Technologies
> +GroupMap contrib/gitdm/group-map-netflix Netflix
>  GroupMap contrib/gitdm/group-map-redhat Red Hat
>  GroupMap contrib/gitdm/group-map-samsung Samsung
>  GroupMap contrib/gitdm/group-map-wavecomp Wave Computing
> --
> 2.20.1
>
>

--000000000000334f4d05c7165957
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 14, 2021 at 3:43 AM Alex =
Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linar=
o.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Warner confirmed he works for Netflix on IRC.<br>
<br>
Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.or=
g" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
Cc: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" target=3D"_blank">imp=
@bsdimp.com</a>&gt;<br>
---<br>
=C2=A0contrib/gitdm/group-map-netflix | 5 +++++<br>
=C2=A0gitdm.config=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 1 +<br>
=C2=A02 files changed, 6 insertions(+)<br>
=C2=A0create mode 100644 contrib/gitdm/group-map-netflix<br></blockquote><d=
iv><br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp=
.com">imp@bsdimp.com</a>&gt;</div><div>=C2=A0<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
diff --git a/contrib/gitdm/group-map-netflix b/contrib/gitdm/group-map-netf=
lix<br>
new file mode 100644<br>
index 0000000000..468f95dcb2<br>
--- /dev/null<br>
+++ b/contrib/gitdm/group-map-netflix<br>
@@ -0,0 +1,5 @@<br>
+#<br>
+# Netflix contributors using their personal emails<br>
+#<br>
+<br>
+<a href=3D"mailto:imp@bsdimp.com" target=3D"_blank">imp@bsdimp.com</a><br>
diff --git a/gitdm.config b/gitdm.config<br>
index c60ebc6e47..47317bcee7 100644<br>
--- a/gitdm.config<br>
+++ b/gitdm.config<br>
@@ -35,6 +35,7 @@ GroupMap contrib/gitdm/group-map-cadence Cadence Design S=
ystems<br>
=C2=A0GroupMap contrib/gitdm/group-map-codeweavers CodeWeavers<br>
=C2=A0GroupMap contrib/gitdm/group-map-ibm IBM<br>
=C2=A0GroupMap contrib/gitdm/group-map-janustech Janus Technologies<br>
+GroupMap contrib/gitdm/group-map-netflix Netflix<br>
=C2=A0GroupMap contrib/gitdm/group-map-redhat Red Hat<br>
=C2=A0GroupMap contrib/gitdm/group-map-samsung Samsung<br>
=C2=A0GroupMap contrib/gitdm/group-map-wavecomp Wave Computing<br>
-- <br>
2.20.1<br>
<br>
</blockquote></div></div>

--000000000000334f4d05c7165957--

