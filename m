Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B67B656A4DC
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 16:03:29 +0200 (CEST)
Received: from localhost ([::1]:57860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9S6K-0003yH-GN
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 10:03:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yu.zhang@ionos.com>)
 id 1o9S49-0001ik-PY
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 10:01:17 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:46907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yu.zhang@ionos.com>)
 id 1o9S45-00055k-LI
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 10:01:11 -0400
Received: by mail-lf1-x12f.google.com with SMTP id bf9so8053769lfb.13
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 07:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=4aloDyRjtfH1M6bJbTw+7zc8C0PaBN64N7NA7usO8pg=;
 b=iSMhqhdxXHhZW8ArcC2TE/9B42OXnRuubJhfOoUHLVnkNvQ+Vp22NqFB+i7ZXyuC2X
 1fljU/Vu0Lcw6OY9Fv3DfTmbEHGOsWYgPuyRPAuAdfzu72IlbirzIretggJGW5oBEdle
 HTOTm9cTM0WvsQ/C7PVGl2eY24vWkCkpgu/lkiF4cjF//ovjkPIJbuPtYELXzyN6A4zO
 0hun6Oib/9FwtrsB2sJkmbttA6k1WMvE2LRMT/qJvtCktGIgw/rhclKCsAwEu/nHjfWG
 z+0/aC5mW7uE9t5HzYkyI7uLowtr71i4uobtv4OkaQFpXfrGzz+BVVg6a+Yb+fT0XL9o
 GvOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=4aloDyRjtfH1M6bJbTw+7zc8C0PaBN64N7NA7usO8pg=;
 b=omVomVPxL812t6+y61D7dFpjh1Jd+khEjTw6FVZv06Vjjbtz5dA7mamd+KRDuQLHaw
 alPs1ucQOwZpkWrsAUYkKmeq3rbX83DrcWM9CIjQM5f6KGl/o9723FHfrbWGMHadrok8
 0uxT6t8Io8NeGlrSVuzSicFeCgrhhEbmLsxJhXNxQtlRf1HYfyVjg2Q04fZXF9EUipuQ
 +sZ33gz1MzIL3+XprkxfM700ZTY6KgW8TnTJ/XNzoyKIQjHZZgmUsrsdKBCUWDdE4q/O
 HFCexSWaQPZ0FMBmeaqn+9PmDTnx87sCgcbmUdZ2ffv4PuO3MeA5gjrKfNiMeHZo4oOJ
 sSsw==
X-Gm-Message-State: AJIora+cFJZd6abYENFEmRw1eeD+vPU3Tjzz6p8R6ukM6B9YFnA+7xdr
 YRT3DLefSG34QGdj8OYYoEY9VPjZcUtnWjSw7PhA2Q==
X-Google-Smtp-Source: AGRyM1s88uwYl5j/wTDxjLDl0aikOkHrPexQ+GDeRyMqdkFLeK3Bdy3/lWIw/2PNczSv8X+bDJMOCOqheCa5VrOcgqs=
X-Received: by 2002:a19:670d:0:b0:482:b8ce:a51c with SMTP id
 b13-20020a19670d000000b00482b8cea51cmr13249975lfc.85.1657202464662; Thu, 07
 Jul 2022 07:01:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAHEcVy7gC_h4Nei3m6KMvFkjTAFR6XkJcw+AMoxJ3r9CMXp=-Q@mail.gmail.com>
 <06136c6a-1cef-cfd4-a749-6d1c99987cf7@redhat.com>
In-Reply-To: <06136c6a-1cef-cfd4-a749-6d1c99987cf7@redhat.com>
From: Yu Zhang <yu.zhang@ionos.com>
Date: Thu, 7 Jul 2022 16:00:54 +0200
Message-ID: <CAHEcVy7QqV4_C7dc4HMn6U3kxvTXXqQmyUSWarfUZK6K9fZ7=A@mail.gmail.com>
Subject: Re: questions about QMP commands - "block-export-add" and
 "nbd-server-add"
To: Hanna Reitz <hreitz@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 Alexei Pastuchov <alexei.pastuchov@ionos.com>, Gioh Kim <gi-oh.kim@ionos.com>, 
 Jinpu Wang <jinpu.wang@ionos.com>, Fuad Faron <fuad.faron@ionos.com>
Content-Type: multipart/alternative; boundary="0000000000003a477f05e337841b"
Received-SPF: permerror client-ip=2a00:1450:4864:20::12f;
 envelope-from=yu.zhang@ionos.com; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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

--0000000000003a477f05e337841b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Hanna,

We added @node-name in -drive line and tested the live migration between
QEMU-6.1 and QEMU-7.0 in different directions.
Block devices can be identified correctly on both source and target
servers. Thank you so much for your quick and helpful reply.

I think it makes sense to update the QEMU man page and help page by a small
fix like this:

diff --git a/qemu-options.hx b/qemu-options.hx
index 377d22fbd8..8a8f92739c 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1367,7 +1367,7 @@ DEF("drive", HAS_ARG, QEMU_OPTION_drive,
     "-drive [file=3Dfile][,if=3Dtype][,bus=3Dn][,unit=3Dm][,media=3Dd][,in=
dex=3Di]\n"
     "
[,cache=3Dwritethrough|writeback|none|directsync|unsafe][,format=3Df]\n"
     "       [,snapshot=3Don|off][,rerror=3Dignore|stop|report]\n"
-    "       [,werror=3Dignore|stop|report|enospc][,id=3Dname]\n"
+    "
[,werror=3Dignore|stop|report|enospc][,id=3Dname][,node-name=3Dnode-name]\n=
"
     "       [,aio=3Dthreads|native|io_uring]\n"
     "       [,readonly=3Don|off][,copy-on-read=3Don|off]\n"
     "       [,discard=3Dignore|unmap][,detect-zeroes=3Don|off|unmap]\n"
@@ -1411,6 +1411,16 @@ SRST
         index in the list of available connectors of a given interface
         type.

+   ``node-name``
+        This option defines the name of the block driver node by which it
+        will be referenced later. The name must be unique, i.e. it
+        must not match the name of a different block driver node.
+
+        If no node name is specified, it is automatically generated.
+        The generated node name is not intended to be predictable
+        and changes between QEMU invocations. For the top level, an
+        explicit node name must be specified.
+
     ``media=3Dmedia``
         This option defines the type of the media: disk or cdrom.

Yu Zhang


On Tue, Jul 5, 2022 at 1:32 PM Hanna Reitz <hreitz@redhat.com> wrote:

> On 05.07.22 11:57, Yu Zhang wrote:
> > Hi All,
> >
> > since QEMU-5.2, the QMP command "nbd-server-add" was deprecated and
> > replaced with "block-export-add" [1].
> >
> > Arguments for the two are different. For using "block-export-add",
> > "id" and "node-name" are needed, of which "id" is "device" for
> > "nbd-server-add"
>
> No, @id is the ID for the export, which is used to identify it it in
> other block-export-* commands like block-export-del. nbd-server-add=E2=80=
=99s
> @device parameter corresponds to block-export-add=E2=80=99s @node-name pa=
rameter.
>
> > and "node-name" can be obtained from the querying result of
> "query-block".
>
> Ideally, management tools would set every block node=E2=80=99s @node-name
> manually so it doesn=E2=80=99t need to be queried.
>
> > As shown by an example below:
> >
> > { "execute": "query-block" }
> > {"return": [..., {..., "device": "drive-virtio-disk5", ...: {...:
> > {"virtual-size": 53687091200, "filename": "/dev/md0", "format": "raw",
> > ...}
> > , ..., "node-name": "#block349", ...}, "qdev":
> > "/machine/peripheral/virtio-disk5/virtio-backend", "type": "unknown"}]}
> >
> > { "execute": "nbd-server-add", "arguments": { "device":
> > "drive-virtio-disk5", "writable": true }}
>
> Note that you could pass =E2=80=9C#block349=E2=80=9D for @device here, in=
stead of
> =E2=80=9Cdrive-virtio-disk5=E2=80=9D.
>
> > {"error": {"class": "GenericError", "desc": "Permission conflict on
> > node '#block349': permissions 'write' are both required by an unnamed
> > block device (uses node '#block349' as 'root' child) and unshared by
> > block device 'drive-virtio-disk5' (uses node '#block349' as 'root'
> > child)."}}
> >
> > { "execute": "block-export-add", "arguments": { "type": "nbd", "id":
> > "drive-virtio-disk5", "node-name": "#block349", "writable": true }}
>
> You can pass anything for @id that you=E2=80=99d like, for example
> =E2=80=9Cnbd-export-349=E2=80=9D.  It should identify the export, not the=
 block device
> underneath.
>
> > {"error": {"class": "GenericError", "desc": "Permission conflict on
> > node '#block349': permissions 'write' are both required by an unnamed
> > block device (uses node '#block349' as 'root' child) and unshared by
> > block device 'drive-virtio-disk5' (uses node '#block349' as 'root'
> > child)."}}
> >
> >
> > An issue we encountered with "block-export-add" for VM live migration:
> >
> > on the target server
> > - exported device name: drive-virtio-disk5
> > - node name of the exported device: #node123
> >
> > on the source server
> > - gets the device name from target via network: driver-virtio-disk5
> > - gets the node name from the target via network: #node123
> >
> > However, on the source server, the node name #node123 can't be
> identified.
> >
> > Assumption: the same "device" may have different "node-name" on the
> > source and target servers.
>
> Yes.  You should configure the node name to match or at least to be
> something that you can work with.
>
> I don=E2=80=99t know how you command line to configure block devices look=
s, but
> if you=E2=80=99re using -drive (which I assume you do, because with -bloc=
kdev,
> the @node-name parameter would be mandatory for you to set), then you
> can simply use something like
>
> -drive id=3Ddrive-virtio-disk5,node-name=3Ddrive-virtio-disk5-node,...
>
> And then you can address the drive-virtio-disk5 block device with the
> node name =E2=80=9Cdrive-virtio-disk5-node=E2=80=9D.
>
> Hanna
>
>

--0000000000003a477f05e337841b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Hanna,<br><br>We added @node-name in -drive line and=
 tested the live migration between QEMU-6.1 and QEMU-7.0 in different direc=
tions.<br>Block devices can be identified correctly on both source and targ=
et servers.=C2=A0Thank you so much for your quick and helpful reply.<br><br=
>I think it makes sense to update the QEMU man page and help page by a smal=
l fix like this:<br><br>diff --git a/qemu-options.hx b/qemu-options.hx<br>i=
ndex 377d22fbd8..8a8f92739c 100644<br>--- a/qemu-options.hx<br>+++ b/qemu-o=
ptions.hx<br>@@ -1367,7 +1367,7 @@ DEF(&quot;drive&quot;, HAS_ARG, QEMU_OPT=
ION_drive,<br>=C2=A0 =C2=A0 =C2=A0&quot;-drive [file=3Dfile][,if=3Dtype][,b=
us=3Dn][,unit=3Dm][,media=3Dd][,index=3Di]\n&quot;<br>=C2=A0 =C2=A0 =C2=A0&=
quot; =C2=A0 =C2=A0 =C2=A0 [,cache=3Dwritethrough|writeback|none|directsync=
|unsafe][,format=3Df]\n&quot;<br>=C2=A0 =C2=A0 =C2=A0&quot; =C2=A0 =C2=A0 =
=C2=A0 [,snapshot=3Don|off][,rerror=3Dignore|stop|report]\n&quot;<br>- =C2=
=A0 =C2=A0&quot; =C2=A0 =C2=A0 =C2=A0 [,werror=3Dignore|stop|report|enospc]=
[,id=3Dname]\n&quot;<br>+ =C2=A0 =C2=A0&quot; =C2=A0 =C2=A0 =C2=A0 [,werror=
=3Dignore|stop|report|enospc][,id=3Dname][,node-name=3Dnode-name]\n&quot;<b=
r>=C2=A0 =C2=A0 =C2=A0&quot; =C2=A0 =C2=A0 =C2=A0 [,aio=3Dthreads|native|io=
_uring]\n&quot;<br>=C2=A0 =C2=A0 =C2=A0&quot; =C2=A0 =C2=A0 =C2=A0 [,readon=
ly=3Don|off][,copy-on-read=3Don|off]\n&quot;<br>=C2=A0 =C2=A0 =C2=A0&quot; =
=C2=A0 =C2=A0 =C2=A0 [,discard=3Dignore|unmap][,detect-zeroes=3Don|off|unma=
p]\n&quot;<br>@@ -1411,6 +1411,16 @@ SRST<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0index in the list of available connectors of a given interface<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0type.<br>=C2=A0<br>+ =C2=A0 ``node-name``<br=
>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0This option defines the name of the block dri=
ver node by which it<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0will be referenced lat=
er. The name must be unique, i.e. it<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0must n=
ot match the name of a different block driver node.<br>+<br>+ =C2=A0 =C2=A0=
 =C2=A0 =C2=A0If no node name is specified, it is automatically generated.<=
br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0The generated node name is not intended to =
be predictable<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0and changes between QEMU inv=
ocations. For the top level, an<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0explicit no=
de name must be specified.<br>+<br>=C2=A0 =C2=A0 =C2=A0``media=3Dmedia``<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This option defines the type of the medi=
a: disk or cdrom.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>Yu Zhang<br></di=
v><div dir=3D"ltr"><div><br></div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 5, 2022 at 1:32 PM Hanna Reit=
z &lt;<a href=3D"mailto:hreitz@redhat.com" target=3D"_blank">hreitz@redhat.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On 05.07.22 11:57, Yu Zhang wrote:<br>
&gt; Hi All,<br>
&gt;<br>
&gt; since QEMU-5.2, the QMP command &quot;nbd-server-add&quot; was depreca=
ted and <br>
&gt; replaced with &quot;block-export-add&quot; [1].<br>
&gt;<br>
&gt; Arguments for the two are different. For using &quot;block-export-add&=
quot;, <br>
&gt; &quot;id&quot; and &quot;node-name&quot; are needed, of which &quot;id=
&quot; is &quot;device&quot; for <br>
&gt; &quot;nbd-server-add&quot;<br>
<br>
No, @id is the ID for the export, which is used to identify it it in <br>
other block-export-* commands like block-export-del. nbd-server-add=E2=80=
=99s <br>
@device parameter corresponds to block-export-add=E2=80=99s @node-name para=
meter.<br>
<br>
&gt; and &quot;node-name&quot; can be obtained from the querying result of =
&quot;query-block&quot;.<br>
<br>
Ideally, management tools would set every block node=E2=80=99s @node-name <=
br>
manually so it doesn=E2=80=99t need to be queried.<br>
<br>
&gt; As shown by an example below:<br>
&gt;<br>
&gt; { &quot;execute&quot;: &quot;query-block&quot; }<br>
&gt; {&quot;return&quot;: [..., {..., &quot;device&quot;: &quot;drive-virti=
o-disk5&quot;, ...: {...:<br>
&gt; {&quot;virtual-size&quot;: 53687091200, &quot;filename&quot;: &quot;/d=
ev/md0&quot;, &quot;format&quot;: &quot;raw&quot;, <br>
&gt; ...}<br>
&gt; , ..., &quot;node-name&quot;: &quot;#block349&quot;, ...}, &quot;qdev&=
quot;: <br>
&gt; &quot;/machine/peripheral/virtio-disk5/virtio-backend&quot;, &quot;typ=
e&quot;: &quot;unknown&quot;}]}<br>
&gt;<br>
&gt; { &quot;execute&quot;: &quot;nbd-server-add&quot;, &quot;arguments&quo=
t;: { &quot;device&quot;: <br>
&gt; &quot;drive-virtio-disk5&quot;, &quot;writable&quot;: true }}<br>
<br>
Note that you could pass =E2=80=9C#block349=E2=80=9D for @device here, inst=
ead of <br>
=E2=80=9Cdrive-virtio-disk5=E2=80=9D.<br>
<br>
&gt; {&quot;error&quot;: {&quot;class&quot;: &quot;GenericError&quot;, &quo=
t;desc&quot;: &quot;Permission conflict on <br>
&gt; node &#39;#block349&#39;: permissions &#39;write&#39; are both require=
d by an unnamed <br>
&gt; block device (uses node &#39;#block349&#39; as &#39;root&#39; child) a=
nd unshared by <br>
&gt; block device &#39;drive-virtio-disk5&#39; (uses node &#39;#block349&#3=
9; as &#39;root&#39; <br>
&gt; child).&quot;}}<br>
&gt;<br>
&gt; { &quot;execute&quot;: &quot;block-export-add&quot;, &quot;arguments&q=
uot;: { &quot;type&quot;: &quot;nbd&quot;, &quot;id&quot;: <br>
&gt; &quot;drive-virtio-disk5&quot;, &quot;node-name&quot;: &quot;#block349=
&quot;, &quot;writable&quot;: true }}<br>
<br>
You can pass anything for @id that you=E2=80=99d like, for example <br>
=E2=80=9Cnbd-export-349=E2=80=9D.=C2=A0 It should identify the export, not =
the block device <br>
underneath.<br>
<br>
&gt; {&quot;error&quot;: {&quot;class&quot;: &quot;GenericError&quot;, &quo=
t;desc&quot;: &quot;Permission conflict on <br>
&gt; node &#39;#block349&#39;: permissions &#39;write&#39; are both require=
d by an unnamed <br>
&gt; block device (uses node &#39;#block349&#39; as &#39;root&#39; child) a=
nd unshared by <br>
&gt; block device &#39;drive-virtio-disk5&#39; (uses node &#39;#block349&#3=
9; as &#39;root&#39; <br>
&gt; child).&quot;}}<br>
&gt;<br>
&gt;<br>
&gt; An issue we encountered with &quot;block-export-add&quot; for VM live =
migration:<br>
&gt;<br>
&gt; on the target server<br>
&gt; - exported device name: drive-virtio-disk5<br>
&gt; - node name of the exported device: #node123<br>
&gt;<br>
&gt; on the source server<br>
&gt; - gets the device name from target via network: driver-virtio-disk5<br=
>
&gt; - gets the node name from the target via network: #node123<br>
&gt;<br>
&gt; However, on the source server, the node name #node123 can&#39;t be ide=
ntified.<br>
&gt;<br>
&gt; Assumption: the same &quot;device&quot; may have different &quot;node-=
name&quot; on the <br>
&gt; source and target servers.<br>
<br>
Yes.=C2=A0 You should configure the node name to match or at least to be <b=
r>
something that you can work with.<br>
<br>
I don=E2=80=99t know how you command line to configure block devices looks,=
 but <br>
if you=E2=80=99re using -drive (which I assume you do, because with -blockd=
ev, <br>
the @node-name parameter would be mandatory for you to set), then you <br>
can simply use something like<br>
<br>
-drive id=3Ddrive-virtio-disk5,node-name=3Ddrive-virtio-disk5-node,...<br>
<br>
And then you can address the drive-virtio-disk5 block device with the <br>
node name =E2=80=9Cdrive-virtio-disk5-node=E2=80=9D.<br>
<br>
Hanna<br>
<br>
</blockquote></div>

--0000000000003a477f05e337841b--

