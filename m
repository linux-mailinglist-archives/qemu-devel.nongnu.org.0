Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F3A327493
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 22:30:32 +0100 (CET)
Received: from localhost ([::1]:60798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGTe1-0008Rh-LN
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 16:30:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vit9696@protonmail.com>)
 id 1lGTcF-0007zS-2S
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 16:28:39 -0500
Received: from mail-40134.protonmail.ch ([185.70.40.134]:35009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vit9696@protonmail.com>)
 id 1lGTcC-0006rN-66
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 16:28:38 -0500
Date: Sun, 28 Feb 2021 21:28:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1614547712;
 bh=vl0Lf+jp7tzd+jw0OdP+aabwQrmAELJ91ZbNId3ChpE=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=UFvs09ydubBxqScCFVCgAZLWFdXqV1iHTne5zPZObpLHj9cl03Jw81b5t9fvoyiF6
 4sqatIJn+p63Ggne58IGgR98nA9Y/Wig2OQrJybx7GQHsFM5/J7bSTrbxgJuqcaVZE
 r6hUeNCDOVso24CP+lfGMp+Ete4hOyOwv6AkdN+M=
To: Thomas Lamprecht <t.lamprecht@proxmox.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu devel list <qemu-devel@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Stefan Reiter <s.reiter@proxmox.com>
Subject: Re: [PATCH 1/2] i386/acpi: fix inconsistent QEMU/OVMF device paths
Message-ID: <x3i3TiibtrC1qTDQUKxuOA_9qvmInzVwv6RrvzzSCSj-S21gLypbbZgEbYvJSGMxC1r8RaDrnHGgRbDI7vfpA_XuDINdZej9yKCW3_Sc4YM=@protonmail.com>
In-Reply-To: <e36b3025-d709-1a6c-6b5a-a08bc6de819f@proxmox.com>
References: <20200730155755.188845-1-mst@redhat.com>
 <5b40e1ac-03ca-7954-4d50-f5f96c339772@proxmox.com>
 <1D984D1D-0DFB-49FC-BD7F-1AAF9B862A5D@protonmail.com>
 <e36b3025-d709-1a6c-6b5a-a08bc6de819f@proxmox.com>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg=pgp-sha256;
 boundary="---------------------f5de7c15ed3d2826baf5a0f5d0b1afd8";
 charset=utf-8
Received-SPF: pass client-ip=185.70.40.134;
 envelope-from=vit9696@protonmail.com; helo=mail-40134.protonmail.ch
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 FREEMAIL_REPLYTO_END_DIGIT=0.25, HTML_MESSAGE=0.001, MIME_HTML_ONLY=0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  vit9696 <vit9696@protonmail.com>
X-ACL-Warn: ,  vit9696 <vit9696@protonmail.com>
From:  vit9696 via <qemu-devel@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
-----------------------f5de7c15ed3d2826baf5a0f5d0b1afd8
Content-Type: multipart/related; boundary="a333947aa9be76101e91d4e6915d01e9b6ed93ea"

--a333947aa9be76101e91d4e6915d01e9b6ed93ea
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

<html><head></head><body>    <div>Thomas,&nbsp;macOS is not really "special=
" here, it is rather that you will not frequently use boot options in a VM.=
 One of the most popular uses for boot options is to switch between the ope=
rating systems, but for virtual machines it&nbsp;is rarely&nbsp;the case. H=
owever, macOS does indeed&nbsp;use boot options for itself. One example is =
to install updates. As long as the created boot option is not valid an auto=
mated reboot during the update installation may result in the wrong bootloa=
der being chosen or in&nbsp;a stall within<caret></caret> the firmware UI a=
waiting manual boot option selection.</div><div><br></div><div>Michael, doe=
s your suggestion mean that the default approach will be to keep the new be=
haviour, but if you manually specify an older q35 machine version it will p=
rovide the original behaviour. If so, it seems fair to me.</div><div><br></=
div><div>Best regards,</div><div>Vitaly<br><div><br></div>On Sun, Feb 28, 2=
021 at 13:43, Thomas Lamprecht &lt;<a href=3D"mailto:t.lamprecht@proxmox.co=
m" class=3D"">t.lamprecht@proxmox.com</a>&gt; wrote:<blockquote class=3D"pr=
otonmail_quote" type=3D"cite">  Hi Vitaly,<br><br>On 28.02.21 10:11, vit969=
6 wrote:<br>&gt; For us this breaks the ability to control the boot options=
 between the operating system and the OVMF. It happens because the operatin=
g system builds the DPs based on ACPI (in fact the only source available to=
 it), while OVMF uses another source. The previous behaviour also violates =
the specification, so I do not believe there is room for reverting it. I be=
lieve it is also not possible to update QEMU to internally use the 1 UID, s=
ince it may conflict with the case when there are multiple PCI bus.<br><br>=
I think you may have misunderstood me a little bit, I did not ask for this =
to<br>be reverted in upstream QEMU, it's quite clear to me that this should=
 be the<br>new default behaviour and should have been since ever.<br><br>Al=
beit, I must ask what makes macOS special to not be allowed doing things th=
at<br>Windows and Linux guest can do just fine?<br><br>I mainly asked for o=
ther drawbacks of such a revert as it is currently the<br>straight forward =
stop gap solution for us as downstream. What we probably will<br>do, is kee=
ping this as default to the new standard behavior and adding a switch<br>to=
 revert to the old one - our QEMU integration library in Proxmox VE can the=
n<br>set this for old VMs and use the new standard for new ones on VM start=
, that<br>way we keep backward compatible - as only Windows VMs seems to be=
 affected we<br>can even do this only for those (we have a OS type config p=
roperty from which<br>we can derive this).<br><br>&gt;<br>&gt; In my opinio=
n, the most logical workaround is to provide in-guest steps to update VM co=
nfiguration to account for this.<br><br>Often the Hypervisor admin and Gues=
t admin are not the same, so this is only<br>a small band-aid and for most =
helping only after the fact.<br><br>We also have quite easy to setup cluste=
ring so this means that such affected<br>VMs will seemingly break on migrat=
ion to an update node for lots of users - for<br>us an unacceptable situati=
on to expose our users with and honestly, I have a<br>hard time seeing me a=
nd colleagues to wish spending our nerves to direct<br>hundreds of reports =
to the documented solution (some will certainly find it on<br>their own, bu=
t whatever one does, lots won't) and dealing with their,<br>relatable, fit =
they'll throw and me having to hold back telling them off to<br>just use Li=
nux instead ;-)<br><br>And I think that other integrator will get some repo=
rts too, and FWICT there's<br>no outside way an user can use to revert to t=
he old behavior.<br>Note that QEMU 5.2 is not yet released in some major di=
stributions, e.g.,<br>Debian will ship it with Bullseye which release is st=
ill months away, latest<br>Fedora (33) is shipping QEMU 5.1, so RHEL/CentOS=
 are probably using something<br>even older and Ubuntu will only add it in =
21.04, also two months away.<br><br>Currently, QEMU 5.2 which introduces th=
is change, is only released in some is<br>released in faster moving targets=
, where Windows VMs are more often for<br>non-server workloads (educated gu=
ess) which again correlates with higher<br>probability to use of DHCP and n=
ot static address assignment (again, educated<br>guess) - which is the most=
 obvious and noticeable thing we and our users saw<br>break.<br><br>Which b=
rings me again to my other point, there may be lots of other things<br>brea=
king in a more subtle way, we do not know but can tell there's lots of<br>d=
evice reshuffling going on when checking out the Windows Device Manager I<b=
r>cannot immagine that the loss of network configuration is the only thing =
that<br>breaks is the only thing that breaks.<br><br>So why all this fuss a=
nd wall of text? Because I think that this will affect<br>lots of users, mo=
st of them in distros which will only ship the problematic<br>QEMU version =
later this year. How many affected there will be: no idea, but we<br>got qu=
ite some reports (compared to usual small stuff breakage) with only<br>roll=
ing this QEMU version out *partially*, to only some parts of our user base.=
<br><br>That's why I personally think it may be worth to think about adding=
 a switch to<br>QEMU directly to keep the backwards compatible, albeit stan=
dard incompatible<br>behavior either as opt-in or opt-out to new standard-c=
onform behavior. And<br>while I thought opt-out is the way to go when start=
ing out this message, I now<br>rather think opt-in to new is, at least if r=
ustling bells of users with<br>Windows + static IPs is thought to be worth =
to avoid. As said, if there's quorum<br>against this, we can live fine with=
 keeping that switch as downstream patch but<br>I'd like to avoid that and =
certainly won't just rush forward shipping it but<br>wait until next week, =
maybe there are some other opinions or better ideas.<br><br>cheers,<br>Thom=
as<br><br></blockquote><div><br></div><div><br></div></div></body></html>



--a333947aa9be76101e91d4e6915d01e9b6ed93ea--

-----------------------f5de7c15ed3d2826baf5a0f5d0b1afd8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wsCUBAEBCAAnBQJgPAr4CRBPsoxt7Hy0xRYhBERSlkTqW1Te3v1Bj0+yjG3s
fLTFACEJEE+yjG3sfLTFFiEERFKWROpbVN7e/UGPT7KMbex8tMV30wf/TiAl
i7ZzjfuL2XT6aSjR77+Yz6oECBXB7R7o74AtBeZLANd5pUd6/isTieV5AXcL
RCVSoBchRzXQjS/wOsEjeELpPuBh2MxPbg3so4oao3IsIpRS7AUS1oMPHnh4
sA8AsKdeaMRGhmVwrnicIfSL4SpDZjhTRpHrlAI26o8DUuokRn7AxjX2rVag
5ADkj8vbGLJX59z5dkAzpPra5hSz/wDVSAf+czWIbsNpxWAXWarReq/w8zuC
Q8OwRBQVRUbXd1KLJixxVYkzG3ObzOptLQSWS35qUzcg9c07NmxGnD9Pd+80
x8qmtT6xGnwMCTa8p2BjTWynrb4rzT9I5ToL0g==
=QT/r
-----END PGP SIGNATURE-----


-----------------------f5de7c15ed3d2826baf5a0f5d0b1afd8--


