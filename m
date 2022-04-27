Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9D8511C8A
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 19:17:33 +0200 (CEST)
Received: from localhost ([::1]:56648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njlIC-0000e4-35
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 13:17:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>)
 id 1njlDM-0000sl-KE; Wed, 27 Apr 2022 13:12:32 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:42502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>)
 id 1njlDK-0007po-8I; Wed, 27 Apr 2022 13:12:32 -0400
Received: by mail-lf1-x12e.google.com with SMTP id k12so4270213lfr.9;
 Wed, 27 Apr 2022 10:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=69T015qJlHpcUCY2KnusZowb4EnRy9afeu88w0YCLK0=;
 b=ZBLhiPO+pg4yr2SJSEnfwbFCZJkzUio6ReDGoGKt35DYchjoczGhtBhO0sc0RI9D8I
 WZAwTT7+xBouH76vVL/ocD1/DLe5Zm3LcObgivm7VazAKmpez4u6zbL8zR2XtvMAvFoA
 X7wbCFGXmO17bIEMRNObpxjjJIS3jmi+rGm64Fv68jANPcck+1XW1KWb4/V2JW7aRKR4
 zeJUGoJ+5FiU9LRqtqoHSSvxNYxOvConnPU2L8YbGi91+bmlEepeNljfxyn+dm7KyQfA
 NJFl+pkl+RyAfsipPsxkLsfqhg2S58JGD2DVcJ02tU6VEMyhghUS6ZcetIadYm5cfnnJ
 c0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=69T015qJlHpcUCY2KnusZowb4EnRy9afeu88w0YCLK0=;
 b=F6/zGfcMxH4H1+6LCTz/Hv8wfFanYkYKSHN99NQTwbE6vodfwFWWyIPqGJWydVReaD
 JzodTWLDu498ORrJb007t0KOQqzW/zU/s+O4aWjK/HIbBLfXZAH4AY1CIg+TeSV4jgoI
 1lrNvMCfkFglEVNhl2ID1MzztDth7J0kCLc37xZVIFB/RLILKx3UdA5glVvd6Nq0uzih
 SEhZWo5TO0rFerqj5fz5DCem40pFHD01lHUpCeCvWuszzg91kReToopc4+mwMACKr3ai
 qoGWK60eLkv5Gk90b9SOa5Czl/BPf/4ltuqxuk+frZJdDZ4cETdKHYN5ugeqTgbKGE8w
 FV2g==
X-Gm-Message-State: AOAM530QSrb3aatPpHyo87vkUWThb7qxVPK0S13E3GLBI2Ih9J3dvTXi
 8i+oCuvnm7oaTX1/4x9LptpaNGg15uNgH9D2nfU=
X-Google-Smtp-Source: ABdhPJy+TBvKAqawPP3XpcZQAMvL0V8NMMy8UMT0BLWtAidDa4frIdA4O5REYpiMDwbnePZrtzCoWsWQOoDf0GXl3bc=
X-Received: by 2002:a05:6512:3194:b0:472:ed8:3905 with SMTP id
 i20-20020a056512319400b004720ed83905mr9757011lfe.439.1651079547236; Wed, 27
 Apr 2022 10:12:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1650553693.git.qemu_oss@crudebyte.com>
 <9545176.94nLgIBNA9@silver>
 <20220427153142.071063f1@bahia> <2323649.gZi5zFeIBc@silver>
In-Reply-To: <2323649.gZi5zFeIBc@silver>
From: Will Cohen <wwcohen@gmail.com>
Date: Wed, 27 Apr 2022 13:12:15 -0400
Message-ID: <CAB26zV1Lpgp-LZ=EXcONHAVOnrPbB5ZYEucA4q5ftgrsXfuSmA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] 9pfs: fix qemu_mknodat(S_IFSOCK) on macOS
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="000000000000e8bd7a05dda5e957"
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=wwcohen@gmail.com; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu Developers <qemu-devel@nongnu.org>, qemu-stable@nongnu.org,
 Greg Kurz <groug@kaod.org>, Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e8bd7a05dda5e957
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 27, 2022 at 12:18 PM Christian Schoenebeck <
qemu_oss@crudebyte.com> wrote:

> On Mittwoch, 27. April 2022 15:31:42 CEST Greg Kurz wrote:
> > On Wed, 27 Apr 2022 14:32:53 +0200
> >
> > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > > On Mittwoch, 27. April 2022 12:18:10 CEST Greg Kurz wrote:
> > > > On Wed, 27 Apr 2022 11:27:28 +0900
> > > >
> > > > Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
> > > > > On 2022/04/26 21:38, Greg Kurz wrote:
> [...]
> > > > > Considering the transient states are tolerated in 9pfs, we need to
> > > > > design this function to be tolerant with transient states as well.
> The
> > > > > use of chmod() is not safe when we consider about transient
> states. A
> > > > > malicious actor may replace the file at the path with a symlink
> which
> > > > > may escape the shared directory and chmod() will naively follow it.
> > > >
> > > > You get a point here. Thanks for your tenacity ! :-)
> > >
> > > Yep, I send a v4 with fchmodat_nofollow() instead of chmod(), thanks!
> > >
> > > BTW, why is it actually allowed for client to create a symlink pointing
> > > outside exported directory tree with security_model=passthrough/none?
> Did
> > > anybody want that?
> >
> > The target argument to symlink() is merely a string that is stored in
> > the inode. It is only evaluated as a path at the time an action is
> > made on the link. Checking at symlink() time is thus useless.
> >
> > Anyway, we're safe on this side since it's the client's job to
> > resolve links and we explicitly don't follow them in the server.
>
> I wouldn't call it useless, because it is easier to keep exactly 1 hole
> stuffed instead of being forced to continuously stuff N holes as new ones
> may
> popup up over time, as this case shows (mea culpa).
>
> So you are trading (probably minor) performance for security.
>
> But my question was actually meant seriously: whether there was anybody in
> the
> past who probably actually wanted to create relative symlinks outside the
> exported tree. For instance for another service with wider host filesystem
> access.
>

For what it's worth, the inability to follow symlinks read-write outside of
the tree appears to be, at the moment, the primary pain point for new users
of 9pfs in containerization software (see the later comments in
https://github.com/lima-vm/lima/pull/726 and to a lesser extent
https://github.com/containers/podman/issues/13784).

To my knowledge, neither podman nor lima have come up with conclusive
preferred solutions for how to address this, much less had a robust
discussion with the QEMU team.
The lima discussion notes that it works read-only with passthrough/none, so
I'd suggest that if there weren't users of it before, there are now! As I
understand it, one partial solution for downstream software that allows for
read-write may just be to more proactively mount larger directories to
minimize the number of external paths that symlinks might get tripped up
on. That said, this will stop working when it comes to linking to
additional mounts, since /Volumes on darwin will never line up with /mnt.


> [...]
> > > > This brings up a new problem I hadn't realized before : the
> > > > fchmodat_nofollow() implementation in 9p-local.c is really
> > > > a linux only thing to cope with AT_SYMLINK_NOFOLLOW not being
> > > > supported with fchmodat(). It looks that this should move to
> > > > 9p-util-linux.c and a proper version should be added for macOS
> > > > in 9p-util-darwin.c
> > >
> > > Like already agreed on the other thread, yes, that makes sense. But I
> > > think
> > > this can be handled with a follow-up, separate from this series.
> >
> > Fair enough if you want to handle fchmodat_nofollow() later but you
> > must at least use fchmodat(AT_SYMLINK_NOFOLLOW) in this patch
> > instead of chmod().
>
> Sounds like a quick and easy workaround. However looking at 'man fchmodat'
> on
> macOS, this probably does not exactly do what you wanted it to, at least
> not
> in this particular case:
>
>      AT_SYMLINK_NOFOLLOW
>              If path names a symbolic link, then the mode of the symbolic
> link is changed.
>
>      AT_SYMLINK_NOFOLLOW_ANY
>              If path names a symbolic link, then the mode of the symbolic
> link is changed and
>              if if the path has any other symbolic links, an error is
> returned.
>
> So if somebody replaced the socket file by a 1st order symlink, you would
> adjust the symlink's permissions with both AT_SYMLINK_NOFOLLOW as well as
> with
> AT_SYMLINK_NOFOLLOW_ANY. I mean it's better than chmod(), but acceptable?
>
> Using our existing fchmodat_nofollow() instead is no viable alternative
> either, as it uses operations that are not supported on socket files on
> macOS
> (tested).
>
> Best regards,
> Christian Schoenebeck
>
>
>

--000000000000e8bd7a05dda5e957
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Apr 27, 2022 at 12:18 PM Christia=
n Schoenebeck &lt;<a href=3D"mailto:qemu_oss@crudebyte.com">qemu_oss@crudeb=
yte.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On Mittwoch, 27. April 2022 15:31:42 CEST=
 Greg Kurz wrote:<br>
&gt; On Wed, 27 Apr 2022 14:32:53 +0200<br>
&gt; <br>
&gt; Christian Schoenebeck &lt;<a href=3D"mailto:qemu_oss@crudebyte.com" ta=
rget=3D"_blank">qemu_oss@crudebyte.com</a>&gt; wrote:<br>
&gt; &gt; On Mittwoch, 27. April 2022 12:18:10 CEST Greg Kurz wrote:<br>
&gt; &gt; &gt; On Wed, 27 Apr 2022 11:27:28 +0900<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Akihiko Odaki &lt;<a href=3D"mailto:akihiko.odaki@gmail.com"=
 target=3D"_blank">akihiko.odaki@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; On 2022/04/26 21:38, Greg Kurz wrote:<br>
[...]<br>
&gt; &gt; &gt; &gt; Considering the transient states are tolerated in 9pfs,=
 we need to<br>
&gt; &gt; &gt; &gt; design this function to be tolerant with transient stat=
es as well. The<br>
&gt; &gt; &gt; &gt; use of chmod() is not safe when we consider about trans=
ient states. A<br>
&gt; &gt; &gt; &gt; malicious actor may replace the file at the path with a=
 symlink which<br>
&gt; &gt; &gt; &gt; may escape the shared directory and chmod() will naivel=
y follow it.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; You get a point here. Thanks for your tenacity ! :-)<br>
&gt; &gt; <br>
&gt; &gt; Yep, I send a v4 with fchmodat_nofollow() instead of chmod(), tha=
nks!<br>
&gt; &gt; <br>
&gt; &gt; BTW, why is it actually allowed for client to create a symlink po=
inting<br>
&gt; &gt; outside exported directory tree with security_model=3Dpassthrough=
/none? Did<br>
&gt; &gt; anybody want that?<br>
&gt; <br>
&gt; The target argument to symlink() is merely a string that is stored in<=
br>
&gt; the inode. It is only evaluated as a path at the time an action is<br>
&gt; made on the link. Checking at symlink() time is thus useless.<br>
&gt; <br>
&gt; Anyway, we&#39;re safe on this side since it&#39;s the client&#39;s jo=
b to<br>
&gt; resolve links and we explicitly don&#39;t follow them in the server.<b=
r>
<br>
I wouldn&#39;t call it useless, because it is easier to keep exactly 1 hole=
<br>
stuffed instead of being forced to continuously stuff N holes as new ones m=
ay<br>
popup up over time, as this case shows (mea culpa).<br>
<br>
So you are trading (probably minor) performance for security.<br>
<br>
But my question was actually meant seriously: whether there was anybody in =
the<br>
past who probably actually wanted to create relative symlinks outside the<b=
r>
exported tree. For instance for another service with wider host filesystem<=
br>
access.<br></blockquote><div><br></div><div>For what it&#39;s worth, the in=
ability to follow symlinks read-write outside of the tree appears to be, at=
 the moment, the primary pain point for new users of 9pfs in containerizati=
on software (see the later comments in <a href=3D"https://github.com/lima-v=
m/lima/pull/726">https://github.com/lima-vm/lima/pull/726</a> and to a less=
er extent <a href=3D"https://github.com/containers/podman/issues/13784">htt=
ps://github.com/containers/podman/issues/13784</a>).</div><div><br></div><d=
iv>To my knowledge, neither podman nor lima have come up with conclusive pr=
eferred solutions for how to address this, much less had a robust discussio=
n with the QEMU team. <br><div>The lima discussion notes that it works read=
-only with passthrough/none, so I&#39;d suggest that if there weren&#39;t u=
sers of it before, there are now! As I understand it, one partial solution =
for downstream software that allows for read-write may just be to more proa=
ctively mount larger directories to minimize the number of external paths t=
hat symlinks might get tripped up on. That said, this will stop working whe=
n it comes to linking to additional mounts, since /Volumes on darwin will n=
ever line up with /mnt.</div><div><br></div></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
<br>
[...]<br>
&gt; &gt; &gt; This brings up a new problem I hadn&#39;t realized before : =
the<br>
&gt; &gt; &gt; fchmodat_nofollow() implementation in 9p-local.c is really<b=
r>
&gt; &gt; &gt; a linux only thing to cope with AT_SYMLINK_NOFOLLOW not bein=
g<br>
&gt; &gt; &gt; supported with fchmodat(). It looks that this should move to=
<br>
&gt; &gt; &gt; 9p-util-linux.c and a proper version should be added for mac=
OS<br>
&gt; &gt; &gt; in 9p-util-darwin.c<br>
&gt; &gt; <br>
&gt; &gt; Like already agreed on the other thread, yes, that makes sense. B=
ut I<br>
&gt; &gt; think<br>
&gt; &gt; this can be handled with a follow-up, separate from this series.<=
br>
&gt; <br>
&gt; Fair enough if you want to handle fchmodat_nofollow() later but you<br=
>
&gt; must at least use fchmodat(AT_SYMLINK_NOFOLLOW) in this patch<br>
&gt; instead of chmod().<br>
<br>
Sounds like a quick and easy workaround. However looking at &#39;man fchmod=
at&#39; on<br>
macOS, this probably does not exactly do what you wanted it to, at least no=
t<br>
in this particular case:<br>
<br>
=C2=A0 =C2=A0 =C2=A0AT_SYMLINK_NOFOLLOW<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0If path names a symbolic li=
nk, then the mode of the symbolic link is changed.<br>
<br>
=C2=A0 =C2=A0 =C2=A0AT_SYMLINK_NOFOLLOW_ANY<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0If path names a symbolic li=
nk, then the mode of the symbolic link is changed and<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if if the path has any othe=
r symbolic links, an error is returned.<br>
<br>
So if somebody replaced the socket file by a 1st order symlink, you would<b=
r>
adjust the symlink&#39;s permissions with both AT_SYMLINK_NOFOLLOW as well =
as with <br>
AT_SYMLINK_NOFOLLOW_ANY. I mean it&#39;s better than chmod(), but acceptabl=
e?<br>
<br>
Using our existing fchmodat_nofollow() instead is no viable alternative<br>
either, as it uses operations that are not supported on socket files on mac=
OS<br>
(tested).<br>
<br>
Best regards,<br>
Christian Schoenebeck<br>
<br>
<br>
</blockquote></div></div>

--000000000000e8bd7a05dda5e957--

