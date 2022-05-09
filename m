Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3905204B1
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 20:46:57 +0200 (CEST)
Received: from localhost ([::1]:40156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no8PI-0007GN-Eo
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 14:46:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paul.knight@oasis-open.org>)
 id 1no8OI-0006X6-Fo
 for qemu-devel@nongnu.org; Mon, 09 May 2022 14:45:54 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d]:43788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paul.knight@oasis-open.org>)
 id 1no8OF-0003DZ-Nb
 for qemu-devel@nongnu.org; Mon, 09 May 2022 14:45:54 -0400
Received: by mail-lj1-x22d.google.com with SMTP id v4so18134432ljd.10
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 11:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oasis-open-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=EFSoTBMHJ//z+R1TcI96k8vumzOiZXGHqrBLWlLYySk=;
 b=sXqoNK0rnuHi2ziwuhJrLc3lwBvM4C7bsw0Cw2+iSaEXy2p6QPdg3HFNazgXezK7Wd
 83tMnr+hGD5FdgwxZSqfaSJbsuKpbGbitAW8tp9XIXE+K1P+M0NavakUrNVrGhhoRsnw
 fkMcs52xBrlA7pXBtY2J7W//2w79knew+i3Rl7G+suzLiszIwf/B2sdIZ7Vr2s6CqtZc
 7k9/8Pe8Dfl7qtnAbRIh1pexg5Jz9wtHhhB4LgCTjR/oNa6XMXEYKVkpJt8HPEqzy6nF
 4QRbPkpbDhKz+hsMWy9SO6B0sf+UCxWdqZdlpHaA8sw9pJBC3CZrPtwmkz0ZhdmD1yiH
 snyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=EFSoTBMHJ//z+R1TcI96k8vumzOiZXGHqrBLWlLYySk=;
 b=NsVcZ+PLEbTgrDuFJV8V9jlCDUIFrSiRn+Z5qvnXrSMMChyw5AhzcR+porLupzfcxU
 AqgIY/+oBrDE1blDc/4CMwcg07cq1llgDYGWsN+k/aDw8lE19DzHz+pfcJ+sJcjqElgS
 TAx+VwGnjxXqcSu/Ijci6SQhxXEg4atLovMJrYijvv4P5fBjgb5e08kYY6uosrXbWC1z
 FzZWn9gXV9nO7QIeEUlowSh4ZFFR9ln0QKYGebMER5zF+qi+dXUQ4NXJQjuVcRTvxdnO
 etAseLopj5F+BU//Ux12q6wI2Y+wmVv3XjMWnW90QqeHxpPPm2kRk/hmk2GUlXnXL9W2
 QgQQ==
X-Gm-Message-State: AOAM532wodpwMlaUb/LI2rO/e8VFtWyj7GIah6kmHPYd31PQPJCzTN8A
 zrODrnqQyF7v3Qc6bCZsVkqKGEqopQ/pjrZy6qwCHw==
X-Google-Smtp-Source: ABdhPJz6/XrhNg0gb1YQiDSFPjSOcFnmD5976MI/2Hf6iNii8441wQAONbZxUuXp+CMKPwXu4tPBEITIWGMGvqzsqvA=
X-Received: by 2002:a2e:351a:0:b0:24f:c3b:c2d5 with SMTP id
 z26-20020a2e351a000000b0024f0c3bc2d5mr10842501ljz.505.1652121949126; Mon, 09
 May 2022 11:45:49 -0700 (PDT)
MIME-Version: 1.0
From: Paul Knight <paul.knight@oasis-open.org>
Date: Mon, 9 May 2022 14:45:39 -0400
Message-ID: <CADgeAH9Vk7akPBA5srW9D8bB=W=jTeb1Zg0AnnZTi76nZNo+Kg@mail.gmail.com>
Subject: Invitation to comment on Virtual I/O Device (VIRTIO) Version 1.2 -
 ends June 8th
To: project-announce@lists.oasis-open.org, members@lists.oasis-open.org, 
 virtio@lists.oasis-open.org, virtio-comment@lists.oasis-open.org
Content-Type: multipart/alternative; boundary="000000000000e7557105de989de9"
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=paul.knight@oasis-open.org; helo=mail-lj1-x22d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

--000000000000e7557105de989de9
Content-Type: text/plain; charset="UTF-8"

OASIS members and other interested parties,

OASIS and the OASIS Virtual I/O Device (VIRTIO) TC are pleased to announce
that Virtual I/O Device (VIRTIO) Version 1.2 is now available for public
review and comment.

Specification Overview:

This document describes the specifications of the 'virtio' family of
devices. These devices are found in virtual environments, yet by design
they look like physical devices to the guest within the virtual machine -
and this document treats them as such. This similarity allows the guest to
use standard drivers and discovery mechanisms. The purpose of virtio and
this specification is that virtual environments and guests should have a
straightforward, efficient, standard and extensible mechanism for virtual
devices, rather than boutique per-environment or per-OS mechanisms.

The documents and related files are available here:

Virtual I/O Device (VIRTIO) Version 1.2
Committee Specification Draft 01
09 May 2022

Editable source (Authoritative):
https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/tex/
HTML:
https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/virtio-v1.2-csd01.html
PDF:
https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/virtio-v1.2-csd01.pdf
Example driver listing:
https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/listings/
PDF file marked to indicate changes from Version 1.1 Committee
Specification 01:
https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/virtio-v1.2-csd01-diff-from-v1.1-cs01.pdf

For your convenience, OASIS provides a complete package of the
specification document and any related files in ZIP distribution files. You
can download the ZIP file at:
https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/virtio-v1.2-csd01.zip

A public review metadata record documenting this and any previous public
reviews is available at:
https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/virtio-v1.2-csd01-public-review-metadata.html

How to Provide Feedback

OASIS and the OASIS Virtual I/O Device (VIRTIO) TC value your feedback. We
solicit input from developers, users and others, whether OASIS members or
not, for the sake of improving the interoperability and quality of its
technical work.

The public review starts 10 May 2022 at 00:00 UTC and ends 08 June 2022 at
23:59 UTC.

Comments may be submitted to the TC by any person through the use of the
OASIS TC Comment Facility which can be used by following the instructions
on the TC's "Send A Comment" page (
https://www.oasis-open.org/committees/comments/index.php?wg_abbrev=virtio).

Comments submitted by TC non-members for this work and for other work of
this TC are publicly archived and can be viewed at:

https://lists.oasis-open.org/archives/virtio-comment/

All comments submitted to OASIS are subject to the OASIS Feedback License,
which ensures that the feedback you provide carries the same obligations at
least as the obligations of the TC members. In connection with this public
review, we call your attention to the OASIS IPR Policy [1] applicable
especially [2] to the work of this technical committee. All members of the
TC should be familiar with this document, which may create obligations
regarding the disclosure and availability of a member's patent, copyright,
trademark and license rights that read on an approved OASIS specification.

OASIS invites any persons who know of any such claims to disclose these if
they may be essential to the implementation of the above specification, so
that notice of them may be posted to the notice page for this TC's work.

Additional information about the specification and the VIRTIO TC can be
found at the TC's public home page:
https://www.oasis-open.org/committees/virtio/

========== Additional references:

[1] https://www.oasis-open.org/policies-guidelines/ipr

[2] https://github.com/oasis-tcs/virtio-admin/blob/master/IPR.md
https://www.oasis-open.org/policies-guidelines/ipr#Non-Assertion-Mode
Non-Assertion Mode
-- 
Paul Knight <paul.knight@oasis-open.org>....Document Process Analyst
<https://www.oasis-open.org/people/staff/paul-knight>
OASIS <https://www.oasis-open.org/> - Setting the standard for open
collaboration

--000000000000e7557105de989de9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>OASIS members and other interested parties,<br><br>OA=
SIS and the OASIS Virtual I/O Device (VIRTIO) TC are pleased to announce th=
at Virtual I/O Device (VIRTIO) Version 1.2 is now available for public revi=
ew and comment.<br><br>Specification Overview:<br><br>This document describ=
es the specifications of the &#39;virtio&#39; family of devices. These devi=
ces are found in virtual environments, yet by design they look like physica=
l devices to the guest within the virtual machine - and this document treat=
s them as such. This similarity allows the guest to use standard drivers an=
d discovery mechanisms. The purpose of virtio and this specification is tha=
t virtual environments and guests should have a straightforward, efficient,=
 standard and extensible mechanism for virtual devices, rather than boutiqu=
e per-environment or per-OS mechanisms.<br><br>The documents and related fi=
les are available here:<br><br>Virtual I/O Device (VIRTIO) Version 1.2<br>C=
ommittee Specification Draft 01<br>09 May 2022<br><br>Editable source (Auth=
oritative):<br><a href=3D"https://docs.oasis-open.org/virtio/virtio/v1.2/cs=
d01/tex/">https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/tex/</a><br>=
HTML:<br><a href=3D"https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/vi=
rtio-v1.2-csd01.html">https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/=
virtio-v1.2-csd01.html</a><br>PDF:<br><a href=3D"https://docs.oasis-open.or=
g/virtio/virtio/v1.2/csd01/virtio-v1.2-csd01.pdf">https://docs.oasis-open.o=
rg/virtio/virtio/v1.2/csd01/virtio-v1.2-csd01.pdf</a><br>Example driver lis=
ting:<br><a href=3D"https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/li=
stings/">https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/listings/</a>=
<br>PDF file marked to indicate changes from Version 1.1 Committee Specific=
ation 01:<br><a href=3D"https://docs.oasis-open.org/virtio/virtio/v1.2/csd0=
1/virtio-v1.2-csd01-diff-from-v1.1-cs01.pdf">https://docs.oasis-open.org/vi=
rtio/virtio/v1.2/csd01/virtio-v1.2-csd01-diff-from-v1.1-cs01.pdf</a><br><br=
>For your convenience, OASIS provides a complete package of the specificati=
on document and any related files in ZIP distribution files. You can downlo=
ad the ZIP file at:<br><a href=3D"https://docs.oasis-open.org/virtio/virtio=
/v1.2/csd01/virtio-v1.2-csd01.zip">https://docs.oasis-open.org/virtio/virti=
o/v1.2/csd01/virtio-v1.2-csd01.zip</a><br><br>A public review metadata reco=
rd documenting this and any previous public reviews is available at:<br><a =
href=3D"https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/virtio-v1.2-cs=
d01-public-review-metadata.html">https://docs.oasis-open.org/virtio/virtio/=
v1.2/csd01/virtio-v1.2-csd01-public-review-metadata.html</a><br><br>How to =
Provide Feedback<br><br>OASIS and the OASIS Virtual I/O Device (VIRTIO) TC =
value your feedback. We solicit input from developers, users and others, wh=
ether OASIS members or not, for the sake of improving the interoperability =
and quality of its technical work.<br><br>The public review starts 10 May 2=
022 at 00:00 UTC and ends 08 June 2022 at 23:59 UTC.<br><br>Comments may be=
 submitted to the TC by any person through the use of the OASIS TC Comment =
Facility which can be used by following the instructions on the TC&#39;s &q=
uot;Send A Comment&quot; page (<a href=3D"https://www.oasis-open.org/commit=
tees/comments/index.php?wg_abbrev=3Dvirtio">https://www.oasis-open.org/comm=
ittees/comments/index.php?wg_abbrev=3Dvirtio</a>).<br><br>Comments submitte=
d by TC non-members for this work and for other work of this TC are publicl=
y archived and can be viewed at:<br><br><a href=3D"https://lists.oasis-open=
.org/archives/virtio-comment/">https://lists.oasis-open.org/archives/virtio=
-comment/</a><br><br>All comments submitted to OASIS are subject to the OAS=
IS Feedback License, which ensures that the feedback you provide carries th=
e same obligations at least as the obligations of the TC members. In connec=
tion with this public review, we call your attention to the OASIS IPR Polic=
y [1] applicable especially [2] to the work of this technical committee. Al=
l members of the TC should be familiar with this document, which may create=
 obligations regarding the disclosure and availability of a member&#39;s pa=
tent, copyright, trademark and license rights that read on an approved OASI=
S specification.<br><br>OASIS invites any persons who know of any such clai=
ms to disclose these if they may be essential to the implementation of the =
above specification, so that notice of them may be posted to the notice pag=
e for this TC&#39;s work.<br><br>Additional information about the specifica=
tion and the VIRTIO TC can be found at the TC&#39;s public home page:<br><a=
 href=3D"https://www.oasis-open.org/committees/virtio/">https://www.oasis-o=
pen.org/committees/virtio/</a><br><br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Additi=
onal references:<br><br>[1] <a href=3D"https://www.oasis-open.org/policies-=
guidelines/ipr">https://www.oasis-open.org/policies-guidelines/ipr</a><br><=
br>[2] <a href=3D"https://github.com/oasis-tcs/virtio-admin/blob/master/IPR=
.md">https://github.com/oasis-tcs/virtio-admin/blob/master/IPR.md</a><br><a=
 href=3D"https://www.oasis-open.org/policies-guidelines/ipr#Non-Assertion-M=
ode">https://www.oasis-open.org/policies-guidelines/ipr#Non-Assertion-Mode<=
/a><br>Non-Assertion Mode<br></div>-- <br><div dir=3D"ltr" class=3D"gmail_s=
ignature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=
=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr">=
<div><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><font style=3D"colo=
r:rgb(0,0,0);background-color:rgb(255,255,255)" color=3D"#888888"><a href=
=3D"mailto:paul.knight@oasis-open.org" target=3D"_blank">Paul Knight</a>...=
</font><span style=3D"color:rgb(0,0,0)">.</span><a href=3D"https://www.oasi=
s-open.org/people/staff/paul-knight" target=3D"_blank">Document Process Ana=
lyst</a></div><div dir=3D"ltr"><font style=3D"color:rgb(0,0,0);background-c=
olor:rgb(255,255,255)" color=3D"#888888"><a href=3D"https://www.oasis-open.=
org/" target=3D"_blank">OASIS</a> -=C2=A0</font><font color=3D"#000000">Set=
ting the standard for open collaboration</font></div></div></div></div></di=
v></div></div></div></div></div></div></div></div></div></div>

--000000000000e7557105de989de9--

