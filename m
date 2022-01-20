Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A700E495536
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 21:05:45 +0100 (CET)
Received: from localhost ([::1]:47720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAdgm-00078v-ON
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 15:05:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierre.libeau@ovhcloud.com>)
 id 1nAYlb-0001HW-SG
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 09:50:23 -0500
Received: from 1.mo302.mail-out.ovh.net ([137.74.110.74]:40969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierre.libeau@ovhcloud.com>)
 id 1nAYlY-0007DL-NS
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 09:50:23 -0500
Received: from DAGFR10EX1.OVH.local (unknown [51.255.55.251])
 by mo302.mail-out.ovh.net (Postfix) with ESMTPS id 53A3E6A3F7;
 Thu, 20 Jan 2022 15:50:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ovhcloud.com;
 s=mailout; t=1642690218;
 bh=iceaYmrL0i3PvyaxtQMwk8VdgCD2euGjWgBm32k0daE=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=eSefvy5pHERSMEeSi2yS8fT9GiqxmQBrE1XkqPqV+j4jXbjJZ7IiWGE1obpqUvgyo
 5KZ+iXX+Qvhoq6HNn/YtdJ6UL13p34OmBFsk/8zhk0AM4ywlTHZ8G5CQ1WueCYYE3G
 rgKCL6LkXTlqWmarxzZTf9SKRAAqHf8IcPd1HYeM=
Received: from DAGFR10EX1.OVH.local (172.16.2.30) by DAGFR10EX1.OVH.local
 (172.16.2.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.15; Thu, 20 Jan
 2022 15:50:17 +0100
Received: from DAGFR10EX1.OVH.local ([fe80::55ae:9c6c:b5a5:457e]) by
 DAGFR10EX1.OVH.local ([fe80::55ae:9c6c:b5a5:457e%11]) with mapi id
 15.02.0986.015; Thu, 20 Jan 2022 15:50:17 +0100
From: Pierre Libeau <pierre.libeau@ovhcloud.com>
To: "kwolf@redhat.com" <kwolf@redhat.com>
Subject: RE: TR: Openstack NOVA - Improve the time of file system freeze
 during live-snapshot
Thread-Topic: TR: Openstack NOVA - Improve the time of file system freeze
 during live-snapshot
Thread-Index: AQHYC3Xsbvq9zEqNxUya2S6VGoqwq6xrkLDBgAAt8gCAACZ2kw==
Date: Thu, 20 Jan 2022 14:50:17 +0000
Message-ID: <2e76b0ee9db04c988719b7de220c92a0@ovhcloud.com>
References: <f3e284b53a6e46f9a18c9117fd841cf7@ovhcloud.com>
 <aca7e9de0935423ba1d59b5472ab64a7@ovhcloud.com>, <YelLPjw7Qliknhhb@redhat.com>
In-Reply-To: <YelLPjw7Qliknhhb@redhat.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [109.190.254.58]
x-ovh-corplimit-skip: true
Content-Type: multipart/alternative;
 boundary="_000_2e76b0ee9db04c988719b7de220c92a0ovhcloudcom_"
MIME-Version: 1.0
X-Ovh-Tracer-Id: 8550646845889825772
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudekgdeijecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvufhtfffkfhgjihgtggesrgdtjhertddtudenucfhrhhomheprfhivghrrhgvucfnihgsvggruhcuoehpihgvrhhrvgdrlhhisggvrghusehovhhhtghlohhuugdrtghomheqnecuggftrfgrthhtvghrnhepudekgfehueegtdehvdegteehheefgeettefhleettdeuueeitedvhedvueekieevnecukfhppedtrddtrddtrddtpddutdelrdduledtrddvheegrdehkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepffetiffhtfdutdfgigdurdfqggfjrdhlohgtrghlpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehpihgvrhhrvgdrlhhisggvrghusehovhhhtghlohhuugdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopehkfiholhhfsehrvgguhhgrthdrtghomh
Received-SPF: pass client-ip=137.74.110.74;
 envelope-from=pierre.libeau@ovhcloud.com; helo=1.mo302.mail-out.ovh.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 20 Jan 2022 10:11:39 -0500
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
Cc: "pkrempa@redhat.com" <pkrempa@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "kchamart@redhat.com" <kchamart@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_2e76b0ee9db04c988719b7de220c92a0ovhcloudcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

About the context:

In my case the file format is raw but it's can be also qcow2.


You have right in your explanation in nova it's not a "snapshot" but it's a=
n image of the instance.

The goal of this image is to put it in glance after to store this image and=
 create a new instance or rebuild an instance with this new image.


You have right, the result of "dev.rebase" is a mirror of the disk.


So my question is I break nothing when I'm moving the "Freeze guest filesys=
tems" (step 2 in your process) just before "Cancel the mirror job" (step 3c=
 in your process). I have tested it and it's working but I prefer to have y=
our opinion.


About your question on the reason to do it like that related to QEMU 1.3 I =
will see with NOVA community. I'm a beginner at this part and your question=
 is very good from my point of view.


Pierre

Public Cloud - VPS


________________________________
De : Kevin Wolf <kwolf@redhat.com>
Envoy=E9 : jeudi 20 janvier 2022 12:45
=C0 : Pierre Libeau
Cc : qemu-block@nongnu.org; qemu-devel@nongnu.org; kchamart@redhat.com; pkr=
empa@redhat.com; eblake@redhat.com
Objet : Re: TR: Openstack NOVA - Improve the time of file system freeze dur=
ing live-snapshot

Am 20.01.2022 um 09:02 hat Pierre Libeau geschrieben:
> Hello
>
> I'm forwarding to you my question because I have pushed on the wrong
> mailing list at the beginning. Can you give me your opinion or forward
> me to the right people who can help me.
>
> Thx.
>
> Pierre
>
>
> ________________________________
> De : Qemu-discuss <qemu-discuss-bounces+pierre.libeau=3Dcorp.ovh.com@nong=
nu.org> de la part de Pierre Libeau <pierre.libeau@ovhcloud.com>
> Envoy=E9 : lundi 17 janvier 2022 08:43
> =C0 : qemu-discuss@nongnu.org
> Objet : Openstack NOVA - Improve the time of file system freeze during li=
ve-snapshot
>
>
> Hello,
>
> I'm working on a patch in nova to improve the time of file system
> freeze during live-snapshot on an instance with a local disk and I
> need your opinion about the solution I would propose.
>
> My issue during the live migration is the duration of file system
> freeze on an instance with a big local disk. [1]
>
> In my case instance have locally a disk (400Go) and the
> qemu-guest-agent is installed.
>
> Nova process like that: [2]
> dev =3D guest.get_block_device(disk_path)
>
> 1. guest.freeze_filesystems()
> 2. dev.rebase(disk_delta, copy=3DTrue, reuse_ext=3DTrue, shallow=3DTrue)
> 3. while not dev.is_job_complete() #wait for the end of mirroring (the
>    issue is here, the waiting time depend on the size of the disk and
>    the IOPS)
> 4. dev.abort_job()
> 5. guest.thaw_filesystems()

So first of all, I have to do some translation of terminology which
seems to be different from what I am used to.

dev.rebase with copy=3DTrue seems to result in a mirror block job in QEMU?

So what you're calling a snapshot here doesn't seem to be a differential
snapshot (e.g. by adding a COW overlay), but a full copy that results in
two fully independent, standalone images. Is this right?

Adding a bit more context, the whole process seems to be:

1. Create a qcow2 for the copy of the top layer that shares the backing
   file with the active image.

2. Freeze guest filesystems

3. Create a full copy of the active layer (into the new qcow2 file)
    a. Start a mirror job
    b. Wait for the mirror job to move to the READY state
    c. Cancel the mirror job with force=3Dfalse, i.e. complete the mirror
       job without changing the active image of the VM

4. Thaw the guest filesystems

5. qemu-img convert the copied top layer with its full backing chain
   to a standalone raw image

6. Delete the temporary qcow2 copy

> My proposition is to move the freeze after the end of mirroring and
> before the stop of mirroring. [3] I have tried on an instance and the
> last written file on the fs corresponds to the end of the mirror.

Yes, you only need the freeze around the mirror job completion, that is,
step 3c above.

However, the whole process seems very complicated for a rather simple
operation. A comment mentions that the dance with the temporary qcow2
file is because of a (not further specified) bug in QEMU 1.3. I believe,
libvirt hasn't supported a QEMU version that old for a while, so is this
really still a valid reason?

But what I would actually have used is a backup block job, which makes
sure that the copy will contain the disk content at the point of time
when the block job was started rather than when it happened to complete.

I'm adding a few more people to CC who may have additional comments on
this.

Kevin


--_000_2e76b0ee9db04c988719b7de220c92a0ovhcloudcom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; color=
:rgb(0,0,0); font-family:Calibri,Helvetica,sans-serif,&quot;EmojiFont&quot;=
,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&q=
uot;Segoe UI Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols">
<p>About the context: <br>
</p>
<p>In my case the file format is raw but it's can be also qcow2. <br>
</p>
<p><br>
</p>
<p>You have right in your explanation in nova it's not a &quot;snapshot&quo=
t; but it's an image of the instance.</p>
<p>The goal of this image is to put it in glance after to store this image =
and create a new instance or rebuild an instance with this new image.</p>
<p><br>
</p>
<p><span>You have right, the result of &quot;dev.rebase&quot; is a mirror o=
f the disk.</span></p>
<p><br>
</p>
<p>So my question is I break nothing when I'm moving the &quot;<span>Freeze=
 guest filesystems</span>&quot; (step 2 in your process) just before
<span>&quot;Cancel the mirror job&quot; <span>(step 3c in your process). I =
have tested it and it's working but I prefer to have your opinion.</span></=
span></p>
<p><br>
</p>
<p>About your question on the reason to do it like that related to QEMU 1.3=
 I will see with NOVA community. I'm a beginner at this part and your quest=
ion is very good from my point of view.<br>
</p>
<p><br>
</p>
<div id=3D"Signature">
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; color=
:rgb(0,0,0); background-color:rgb(255,255,255); font-family:Calibri,Arial,H=
elvetica,sans-serif,&quot;EmojiFont&quot;,&quot;Apple Color Emoji&quot;,&qu=
ot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe UI Symbol&quot;,&quot;An=
droid Emoji&quot;,EmojiSymbols">
<p>Pierre</p>
Public Cloud - VPS</div>
</div>
<br>
<br>
<div style=3D"color:rgb(0,0,0)">
<div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>De :</b> Kevin Wolf &lt;kwolf=
@redhat.com&gt;<br>
<b>Envoy=E9 :</b> jeudi 20 janvier 2022 12:45<br>
<b>=C0 :</b> Pierre Libeau<br>
<b>Cc&nbsp;:</b> qemu-block@nongnu.org; qemu-devel@nongnu.org; kchamart@red=
hat.com; pkrempa@redhat.com; eblake@redhat.com<br>
<b>Objet :</b> Re: TR: Openstack NOVA - Improve the time of file system fre=
eze during live-snapshot</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt">
<div class=3D"PlainText">Am 20.01.2022 um 09:02 hat Pierre Libeau geschrieb=
en:<br>
&gt; Hello<br>
&gt; <br>
&gt; I'm forwarding to you my question because I have pushed on the wrong<b=
r>
&gt; mailing list at the beginning. Can you give me your opinion or forward=
<br>
&gt; me to the right people who can help me.<br>
&gt; <br>
&gt; Thx.<br>
&gt; <br>
&gt; Pierre<br>
&gt; <br>
&gt; <br>
&gt; ________________________________<br>
&gt; De : Qemu-discuss &lt;qemu-discuss-bounces&#43;pierre.libeau=3Dcorp.ov=
h.com@nongnu.org&gt; de la part de Pierre Libeau &lt;pierre.libeau@ovhcloud=
.com&gt;<br>
&gt; Envoy=E9 : lundi 17 janvier 2022 08:43<br>
&gt; =C0 : qemu-discuss@nongnu.org<br>
&gt; Objet : Openstack NOVA - Improve the time of file system freeze during=
 live-snapshot<br>
&gt; <br>
&gt; <br>
&gt; Hello,<br>
&gt; <br>
&gt; I'm working on a patch in nova to improve the time of file system<br>
&gt; freeze during live-snapshot on an instance with a local disk and I<br>
&gt; need your opinion about the solution I would propose.<br>
&gt; <br>
&gt; My issue during the live migration is the duration of file system<br>
&gt; freeze on an instance with a big local disk. [1]<br>
&gt;<br>
&gt; In my case instance have locally a disk (400Go) and the<br>
&gt; qemu-guest-agent is installed.<br>
&gt;<br>
&gt; Nova process like that: [2]<br>
&gt; dev =3D guest.get_block_device(disk_path)<br>
&gt; <br>
&gt; 1. guest.freeze_filesystems()<br>
&gt; 2. dev.rebase(disk_delta, copy=3DTrue, reuse_ext=3DTrue, shallow=3DTru=
e)<br>
&gt; 3. while not dev.is_job_complete() #wait for the end of mirroring (the=
<br>
&gt;&nbsp;&nbsp;&nbsp; issue is here, the waiting time depend on the size o=
f the disk and<br>
&gt;&nbsp;&nbsp;&nbsp; the IOPS)<br>
&gt; 4. dev.abort_job()<br>
&gt; 5. guest.thaw_filesystems()<br>
<br>
So first of all, I have to do some translation of terminology which<br>
seems to be different from what I am used to.<br>
<br>
dev.rebase with copy=3DTrue seems to result in a mirror block job in QEMU?<=
br>
<br>
So what you're calling a snapshot here doesn't seem to be a differential<br=
>
snapshot (e.g. by adding a COW overlay), but a full copy that results in<br=
>
two fully independent, standalone images. Is this right?<br>
<br>
Adding a bit more context, the whole process seems to be:<br>
<br>
1. Create a qcow2 for the copy of the top layer that shares the backing<br>
&nbsp;&nbsp; file with the active image.<br>
<br>
2. Freeze guest filesystems<br>
<br>
3. Create a full copy of the active layer (into the new qcow2 file)<br>
&nbsp;&nbsp;&nbsp; a. Start a mirror job<br>
&nbsp;&nbsp;&nbsp; b. Wait for the mirror job to move to the READY state<br=
>
&nbsp;&nbsp;&nbsp; c. Cancel the mirror job with force=3Dfalse, i.e. comple=
te the mirror<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; job without changing the active image =
of the VM<br>
<br>
4. Thaw the guest filesystems<br>
<br>
5. qemu-img convert the copied top layer with its full backing chain<br>
&nbsp;&nbsp; to a standalone raw image<br>
<br>
6. Delete the temporary qcow2 copy<br>
<br>
&gt; My proposition is to move the freeze after the end of mirroring and<br=
>
&gt; before the stop of mirroring. [3] I have tried on an instance and the<=
br>
&gt; last written file on the fs corresponds to the end of the mirror.<br>
<br>
Yes, you only need the freeze around the mirror job completion, that is,<br=
>
step 3c above.<br>
<br>
However, the whole process seems very complicated for a rather simple<br>
operation. A comment mentions that the dance with the temporary qcow2<br>
file is because of a (not further specified) bug in QEMU 1.3. I believe,<br=
>
libvirt hasn't supported a QEMU version that old for a while, so is this<br=
>
really still a valid reason?<br>
<br>
But what I would actually have used is a backup block job, which makes<br>
sure that the copy will contain the disk content at the point of time<br>
when the block job was started rather than when it happened to complete.<br=
>
<br>
I'm adding a few more people to CC who may have additional comments on<br>
this.<br>
<br>
Kevin<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_2e76b0ee9db04c988719b7de220c92a0ovhcloudcom_--

