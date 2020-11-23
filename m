Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F001F2C025A
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 10:38:56 +0100 (CET)
Received: from localhost ([::1]:59566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh8JD-0004cx-FU
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 04:38:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quentin.grolleau@ovhcloud.com>)
 id 1kh8HV-0003zE-3j
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 04:37:09 -0500
Received: from 1.mo301.mail-out.ovh.net ([137.74.110.64]:53723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quentin.grolleau@ovhcloud.com>)
 id 1kh8HR-0005xQ-JT
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 04:37:08 -0500
Received: from EX2.OVH.local (gw2.corp.ovh.com [51.255.55.227])
 by mo301.mail-out.ovh.net (Postfix) with ESMTPS id 4C0247FDEE
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 10:36:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ovhcloud.com;
 s=mailout; t=1606124216;
 bh=DyM1vlwzyEOPY6R/PFEufKgDfXd17opKzh6vXoAnPxc=;
 h=From:To:Subject:Date:From;
 b=CQeHFOpgdapUUxyR7mmeQyIFPMNBer+mxuBZLii3poZBg5X8bAxtfblKDWcdkhC7J
 1BKLc4NX+LFnsdbrHIRIuRAwy0GRdddQ4ZJr0O0Zx2r44naaAT8uU36BSpIl/uzolI
 k6tsobrVSElhTxtGvgwmDJvuFjMzKeSE0/9ZUatg=
Received: from DAGFR7EX3.OVH.local (172.16.2.22) by EX2.OVH.local (172.16.2.2)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2106.2; Mon, 23
 Nov 2020 10:36:55 +0100
Received: from DAGFR7EX2.OVH.local (172.16.2.21) by DAGFR7EX3.OVH.local
 (172.16.2.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.721.2; Mon, 23 Nov 2020
 10:36:55 +0100
Received: from DAGFR7EX2.OVH.local ([fe80::81c3:c718:13b4:fd11]) by
 DAGFR7EX2.OVH.local ([fe80::81c3:c718:13b4:fd11%3]) with mapi id
 15.02.0721.003; Mon, 23 Nov 2020 10:36:55 +0100
From: Quentin Grolleau <quentin.grolleau@ovhcloud.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: [raw] Guest stuck during live live-migration
Thread-Topic: [raw] Guest stuck during live live-migration
Thread-Index: AQHWwXs6AGfiafuLa06oUseJIin6Sw==
Date: Mon, 23 Nov 2020 09:36:55 +0000
Message-ID: <e6f25c7e67ce4cfea5e01e4e46f0a3d8@ovhcloud.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [109.190.254.58]
x-ovh-corplimit-skip: true
Content-Type: multipart/alternative;
 boundary="_000_e6f25c7e67ce4cfea5e01e4e46f0a3d8ovhcloudcom_"
MIME-Version: 1.0
X-Ovh-Tracer-Id: 9419278622906236480
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudegiedgtdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvffuthffkfhitgggsegrtdhjredttddunecuhfhrohhmpefsuhgvnhhtihhnucfirhholhhlvggruhcuoehquhgvnhhtihhnrdhgrhholhhlvggruhesohhvhhgtlhhouhgurdgtohhmqeenucggtffrrghtthgvrhhnpeekheehhffhveetheetudefffetgeehgfeggeeugfevveevtdffueduffdvvdevjeenucffohhmrghinhepghhnuhdrohhrghdpghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpddutdelrdduledtrddvheegrdehkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopefgigdvrdfqggfjrdhlohgtrghlpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehquhgvnhhtihhnrdhgrhholhhlvggruhesohhvhhgtlhhouhgurdgtohhmpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=137.74.110.64;
 envelope-from=quentin.grolleau@ovhcloud.com; helo=1.mo301.mail-out.ovh.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_e6f25c7e67ce4cfea5e01e4e46f0a3d8ovhcloudcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

In our company, we are hosting a large number of Vm, hosted behind Openstac=
k (so libvirt/qemu).
A large majority of our Vms are runnign with local data only, stored on NVM=
E, and most of them are RAW disks.

With Qemu 4.0 (can be even with older version) we see strange  live-migrati=
on comportement:
    - some Vms live migrate at very high speed without issue (> 6 Gbps)
    - some Vms are running correctly, but migrating at a strange low speed =
(3Gbps)
    - some Vms are migrating at a very low speed (1Gbps, sometime less) and=
 during the migration the guest is completely I/O stuck

When this issue happen the VM is completly block, iostat in the Vm show us =
a latency of 30 secs

First we thought it was related to an hardware issue we check it, we compar=
ing different hardware, but no issue where found there

So one of my colleague had the idea to limit with "tc" the bandwidth on the=
 interface the migration was done, and it worked the VM didn't lose any pin=
g nor being  I/O  stuck
Important point : Once the Vm have been migrate (with the limitation ) one =
time, if we migrate it again right after, the migration will be done at ful=
l speed (8-9Gb/s) without freezing the Vm

It only happen on existing VM, we tried to replicate with a fresh instance =
with exactly the same spec and nothing was happening

We tried to replicate the workload inside the VM but there was no way to re=
plicate the case. So it was not related to the workload nor to the server t=
hat hosts the Vm

So we thought about the disk of the instance : the raw file.

We also tried to strace -c the process during the live-migration and it was=
 doing a lot of "lseek"

and we found this :
https://lists.gnu.org/archive/html/qemu-devel/2017-02/msg00462.html


So i rebuilt Qemu with this patch and the live-migration went well, at high=
 speed and with no VM freeze
( https://github.com/qemu/qemu/blob/master/block/file-posix.c#L2601 )

Do you have a way to avoid the "lseek" mechanism as it consumes more resour=
ces to find the holes in the disk and don't let any for the VM ?


Server hosting the VM :
    - Bi-Xeon hosts With NVME storage and 10 Go Network card
    - Qemu 4.0 And Libvirt 5.4
    - Kernel 4.18.0.25

Guest having the issue :
    - raw image with Debian 8

Here the qemu img on the disk :
> qemu-img info disk
image: disk
file format: raw
virtual size: 400G (429496729600 bytes)
disk size: 400G


Quentin GROLLEAU


--_000_e6f25c7e67ce4cfea5e01e4e46f0a3d8ovhcloudcom_
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
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p></p>
<div id=3D"magicdomid2" class=3D"">
<div id=3D"magicdomid4" class=3D""><span class=3D"author-a-z87zz78zf6enp3z6=
7ziz84zqz90zo3z70z">Hello,</span></div>
<div class=3D""><span class=3D"author-a-z87zz78zf6enp3z67ziz84zqz90zo3z70z"=
><br>
</span></div>
<div class=3D""><span class=3D"author-a-z87zz78zf6enp3z67ziz84zqz90zo3z70z"=
>In our company, we are hosting a large number of Vm, hosted behind Opensta=
ck (so libvirt/qemu).&nbsp;</span></div>
<div id=3D"magicdomid5" class=3D""><span class=3D"author-a-z87zz78zf6enp3z6=
7ziz84zqz90zo3z70z">A large majority of our Vms are runnign with local data=
 only, stored on NVME, and most of them are RAW disks.</span></div>
<div id=3D"magicdomid6" class=3D""><br>
</div>
<div id=3D"magicdomid7" class=3D""><span class=3D"author-a-9z74zz70zyz84z9z=
89zz84zz73zhz80z8rz73zp5">With Qemu 4.0</span><span class=3D"author-a-z87zz=
78zf6enp3z67ziz84zqz90zo3z70z"> (can be even with older version)</span><spa=
n class=3D"author-a-9z74zz70zyz84z9z89zz84zz73zhz80z8rz73zp5">
 we see </span><span class=3D"author-a-z87zz78zf6enp3z67ziz84zqz90zo3z70z">=
strange&nbsp;</span><span class=3D"author-a-9z74zz70zyz84z9z89zz84zz73zhz80=
z8rz73zp5"> live-migration</span><span class=3D"author-a-z87zz78zf6enp3z67z=
iz84zqz90zo3z70z"> comportement:</span></div>
<div id=3D"magicdomid8" class=3D""><span class=3D"author-a-z87zz78zf6enp3z6=
7ziz84zqz90zo3z70z">&nbsp;&nbsp;&nbsp; - some Vms live migrate at very high=
 speed without issue (&gt; 6 Gbps)</span></div>
<div id=3D"magicdomid9" class=3D""><span class=3D"author-a-z87zz78zf6enp3z6=
7ziz84zqz90zo3z70z">&nbsp;&nbsp;&nbsp; - some Vms are running correctly, bu=
t migrating at a strange low speed (3Gbps)</span></div>
<div id=3D"magicdomid10" class=3D""><span class=3D"author-a-z87zz78zf6enp3z=
67ziz84zqz90zo3z70z">&nbsp;&nbsp;&nbsp; - some Vms are migrating at a very =
low speed (1Gbps, sometime less) and during the migration the guest is comp=
letely I/O stuck</span></div>
<div id=3D"magicdomid11" class=3D""><span class=3D"author-a-z87zz78zf6enp3z=
67ziz84zqz90zo3z70z">&nbsp;&nbsp;&nbsp;&nbsp;</span></div>
<div id=3D"magicdomid12" class=3D""><span class=3D"author-a-9z74zz70zyz84z9=
z89zz84zz73zhz80z8rz73zp5">When
</span><span class=3D"author-a-z87zz78zf6enp3z67ziz84zqz90zo3z70z">this iss=
ue </span>
<span class=3D"author-a-9z74zz70zyz84z9z89zz84zz73zhz80z8rz73zp5">happen th=
e VM </span>
<span class=3D"author-a-z87zz78zf6enp3z67ziz84zqz90zo3z70z">is completly bl=
ock, iostat in the Vm show us a la</span><span class=3D"author-a-9z74zz70zy=
z84z9z89zz84zz73zhz80z8rz73zp5">t</span><span class=3D"author-a-z87zz78zf6e=
np3z67ziz84zqz90zo3z70z">ency of 30 secs</span></div>
<div id=3D"magicdomid13" class=3D""><br>
</div>
<div id=3D"magicdomid14" class=3D""><span class=3D"author-a-9z74zz70zyz84z9=
z89zz84zz73zhz80z8rz73zp5">First we thought it was related to
</span><span class=3D"author-a-z87zz78zf6enp3z67ziz84zqz90zo3z70z">an hardw=
are issue</span><span class=3D"author-a-9z74zz70zyz84z9z89zz84zz73zhz80z8rz=
73zp5"> we check it, we comparing different hardware</span><span class=3D"a=
uthor-a-z87zz78zf6enp3z67ziz84zqz90zo3z70z">,
 but no issue where found there</span></div>
<div id=3D"magicdomid15" class=3D""><br>
</div>
<div id=3D"magicdomid16" class=3D""><span class=3D"author-a-9z74zz70zyz84z9=
z89zz84zz73zhz80z8rz73zp5">So one of my colleague had the idea to limit wit=
h &quot;tc&quot; the bandwidth on the interface the migration was done, and=
 it worked the VM didn't lose any ping&nbsp;<span>nor
 being&nbsp; I/O&nbsp; stuck</span></span></div>
<div id=3D"magicdomid17" class=3D""><span class=3D"author-a-z87zz78zf6enp3z=
67ziz84zqz90zo3z70z">Important point :
</span><span class=3D"author-a-9z74zz70zyz84z9z89zz84zz73zhz80z8rz73zp5">On=
ce the Vm have been migrate
</span><span class=3D"author-a-z87zz78zf6enp3z67ziz84zqz90zo3z70z">(</span>=
<span class=3D"author-a-9z74zz70zyz84z9z89zz84zz73zhz80z8rz73zp5">with the =
limitation )
</span><span class=3D"author-a-z87zz78zf6enp3z67ziz84zqz90zo3z70z">one time=
, if we migrate it again right after, the migration will be done at full sp=
eed (8-9Gb/s)
</span><span class=3D"author-a-9z74zz70zyz84z9z89zz84zz73zhz80z8rz73zp5">wi=
thout freezing
</span><span class=3D"author-a-z87zz78zf6enp3z67ziz84zqz90zo3z70z">the Vm</=
span></div>
<div id=3D"magicdomid18" class=3D""><br>
</div>
<div id=3D"magicdomid19" class=3D""><span class=3D"author-a-9z74zz70zyz84z9=
z89zz84zz73zhz80z8rz73zp5">It only happen on existing VM, we tried to repli=
cate with a fresh instance with exactly the same spec and nothing was happe=
ning</span></div>
<div id=3D"magicdomid20" class=3D""><br>
</div>
<div id=3D"magicdomid21" class=3D""><span class=3D"author-a-9z74zz70zyz84z9=
z89zz84zz73zhz80z8rz73zp5">We tried to replicate the workload inside the VM=
 but there was no way to replicate the case. So it was not related to the w=
orkload nor to the server that hosts the
 Vm</span></div>
<div id=3D"magicdomid22" class=3D""><br>
</div>
<div id=3D"magicdomid23" class=3D""><span class=3D"author-a-9z74zz70zyz84z9=
z89zz84zz73zhz80z8rz73zp5">So we thought about the disk of the instance : t=
he raw file.</span></div>
<div id=3D"magicdomid24" class=3D""><br>
</div>
<div id=3D"magicdomid25" class=3D""><span class=3D"author-a-9z74zz70zyz84z9=
z89zz84zz73zhz80z8rz73zp5">We also tried to strace -c the process during th=
e live-migration and it was doing a lot of &quot;lseek&quot;</span></div>
<div id=3D"magicdomid26" class=3D""><br>
</div>
<div id=3D"magicdomid27" class=3D""><span class=3D"author-a-9z74zz70zyz84z9=
z89zz84zz73zhz80z8rz73zp5">and we found this :&nbsp;</span></div>
<div id=3D"magicdomid28" class=3D""><span class=3D"author-a-9z74zz70zyz84z9=
z89zz84zz73zhz80z8rz73zp5 url"><a href=3D"https://lists.gnu.org/archive/htm=
l/qemu-devel/2017-02/msg00462.html" id=3D"LPlnk604664" previewremoved=3D"tr=
ue">https://lists.gnu.org/archive/html/qemu-devel/2017-02/msg00462.html</a>=
</span></div>
<div id=3D"magicdomid29" class=3D""><br>
</div>
<div id=3D"magicdomid30" class=3D""><br>
</div>
<div id=3D"magicdomid31" class=3D""><span class=3D"author-a-9z74zz70zyz84z9=
z89zz84zz73zhz80z8rz73zp5">So i rebuilt Qemu with this patch and the live-m=
igration went well</span><span class=3D"author-a-z87zz78zf6enp3z67ziz84zqz9=
0zo3z70z">, at high speed</span><span class=3D"author-a-9z74zz70zyz84z9z89z=
z84zz73zhz80z8rz73zp5">
 and with no VM freeze</span></div>
<div id=3D"magicdomid32" class=3D""><span class=3D"author-a-9z74zz70zyz84z9=
z89zz84zz73zhz80z8rz73zp5">(
</span><span class=3D"author-a-9z74zz70zyz84z9z89zz84zz73zhz80z8rz73zp5 url=
"><a href=3D"https://github.com/qemu/qemu/blob/master/block/file-posix.c#L2=
601" id=3D"LPlnk419862" previewremoved=3D"true">https://github.com/qemu/qem=
u/blob/master/block/file-posix.c#L2601</a></span><span class=3D"author-a-9z=
74zz70zyz84z9z89zz84zz73zhz80z8rz73zp5">
 )</span></div>
<div id=3D"magicdomid33" class=3D""><br>
</div>
<div id=3D"magicdomid34" class=3D""><span class=3D"author-a-z87zz78zf6enp3z=
67ziz84zqz90zo3z70z">Do you have a way
</span><span class=3D"author-a-9z74zz70zyz84z9z89zz84zz73zhz80z8rz73zp5">to=
 avoid the &quot;lseek&quot; mechanism as it consumes more resources to fin=
d the holes in the disk and don't let any for the VM ?</span></div>
<div id=3D"magicdomid35" class=3D""><br>
</div>
<div id=3D"magicdomid36" class=3D""><span class=3D"author-a-9z74zz70zyz84z9=
z89zz84zz73zhz80z8rz73zp5"><br>
</span></div>
<div id=3D"magicdomid37" class=3D""><span class=3D"author-a-9z74zz70zyz84z9=
z89zz84zz73zhz80z8rz73zp5">Server hosting the VM :&nbsp;</span></div>
<div id=3D"magicdomid38" class=3D""><span class=3D"author-a-9z74zz70zyz84z9=
z89zz84zz73zhz80z8rz73zp5">&nbsp;&nbsp;&nbsp; -
</span><span class=3D"author-a-z87zz78zf6enp3z67ziz84zqz90zo3z70z">Bi-Xeon =
hosts With
</span><span class=3D"author-a-9z74zz70zyz84z9z89zz84zz73zhz80z8rz73zp5">NV=
ME storage and 10 Go Network card</span></div>
<div id=3D"magicdomid39" class=3D""><span class=3D"author-a-9z74zz70zyz84z9=
z89zz84zz73zhz80z8rz73zp5">&nbsp;&nbsp;&nbsp; - Qemu 4.0 And Libvirt 5.4</s=
pan></div>
<div id=3D"magicdomid40" class=3D""><span class=3D"author-a-9z74zz70zyz84z9=
z89zz84zz73zhz80z8rz73zp5">&nbsp;&nbsp;&nbsp; - Kernel 4.18.0.25</span></di=
v>
<div id=3D"magicdomid41" class=3D""><span class=3D"author-a-9z74zz70zyz84z9=
z89zz84zz73zhz80z8rz73zp5"><br>
</span></div>
<div class=3D""><span class=3D"author-a-9z74zz70zyz84z9z89zz84zz73zhz80z8rz=
73zp5">Guest having the issue :&nbsp;</span></div>
<div id=3D"magicdomid42" class=3D""><span class=3D"author-a-9z74zz70zyz84z9=
z89zz84zz73zhz80z8rz73zp5">&nbsp;&nbsp;&nbsp; - raw image with Debian 8</sp=
an></div>
<div id=3D"magicdomid43" class=3D""><br>
</div>
<div id=3D"magicdomid44" class=3D""><span class=3D"author-a-9z74zz70zyz84z9=
z89zz84zz73zhz80z8rz73zp5">Here the qemu img on the disk :&nbsp;</span></di=
v>
<div id=3D"magicdomid45" class=3D""><span class=3D"author-a-9z74zz70zyz84z9=
z89zz84zz73zhz80z8rz73zp5">&gt; qemu-img info disk</span></div>
<div id=3D"magicdomid46" class=3D""><span class=3D"author-a-9z74zz70zyz84z9=
z89zz84zz73zhz80z8rz73zp5">image: disk</span></div>
<div id=3D"magicdomid47" class=3D""><span class=3D"author-a-9z74zz70zyz84z9=
z89zz84zz73zhz80z8rz73zp5">file format: raw</span></div>
<div id=3D"magicdomid48" class=3D""><span class=3D"author-a-9z74zz70zyz84z9=
z89zz84zz73zhz80z8rz73zp5">virtual size: 400G (429496729600 bytes)</span></=
div>
<div id=3D"magicdomid49" class=3D""><span class=3D"author-a-9z74zz70zyz84z9=
z89zz84zz73zhz80z8rz73zp5">disk size: 400G</span></div>
<div id=3D"magicdomid50" class=3D""><br>
<br>
</div>
Quentin GROLLEAU</div>
<div class=3D""><br>
</div>
<p></p>
</div>
</body>
</html>

--_000_e6f25c7e67ce4cfea5e01e4e46f0a3d8ovhcloudcom_--

