Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB67A31A110
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 16:06:15 +0100 (CET)
Received: from localhost ([::1]:58742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAa1O-0007J3-QK
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 10:06:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=670db70c9=fandree@amazon.com>)
 id 1lAYPT-000657-NC
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 08:22:59 -0500
Received: from smtp-fw-4101.amazon.com ([72.21.198.25]:60039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=670db70c9=fandree@amazon.com>)
 id 1lAYPQ-0000lr-US
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 08:22:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1613136177; x=1644672177;
 h=from:to:date:message-id:references:in-reply-to:
 mime-version:subject;
 bh=fAGpIZH8T71i7x9UDWnzecjA70Gv+z3S2b2CJCQbVzw=;
 b=Q26jwjUD3q3slJ0FIf2W3KEj4ngPAglAUKBhxVdaSq/omyrD0n0UDIgV
 mcGYNX8nePJDMmEFZqkDzSpHO3v7Q8iWHchTGTDcB4H/bkuHlkkqsKy0R
 btk+IGRgUrK9p6d0Zrwy5dw7WtwZxOy7p7vZboFlCcseSHOpDydZYyFRo c=;
X-IronPort-AV: E=Sophos;i="5.81,173,1610409600"; d="scan'208,217";a="82520388"
Subject: Re: [Rust-VMM] Call for Google Summer of Code 2021 project ideas
Thread-Topic: [Rust-VMM] Call for Google Summer of Code 2021 project ideas
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 12 Feb 2021 13:22:47 +0000
Received: from EX13D10EUB004.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com (Postfix) with ESMTPS
 id C48E528243A; Fri, 12 Feb 2021 13:22:44 +0000 (UTC)
Received: from EX13D10EUB003.ant.amazon.com (10.43.166.160) by
 EX13D10EUB004.ant.amazon.com (10.43.166.155) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 12 Feb 2021 13:22:44 +0000
Received: from EX13D10EUB003.ant.amazon.com ([10.43.166.160]) by
 EX13D10EUB003.ant.amazon.com ([10.43.166.160]) with mapi id 15.00.1497.010;
 Fri, 12 Feb 2021 13:22:43 +0000
From: "Florescu, Andreea" <fandree@amazon.com>
To: Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel <qemu-devel@nongnu.org>, 
 kvm <kvm@vger.kernel.org>, "rust-vmm@lists.opendev.org"
 <rust-vmm@lists.opendev.org>, =?iso-8859-1?Q?Alex_Benn=E9e?=
 <alex.bennee@linaro.org>, Alexander Graf <agraf@csgraf.de>, Alberto Garcia
 <berto@igalia.com>, David Hildenbrand <david@redhat.com>, Eduardo Habkost
 <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>, John Snow
 <jsnow@redhat.com>, Julia Suvorova <jusual@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, =?iso-8859-1?Q?Marc-Andr=E9_Lureau?=
 <marcandre.lureau@redhat.com>, Aleksandar Markovic
 <Aleksandar.Markovic@rt-rk.com>, Sergio Lopez <slp@redhat.com>, "Stefano
 Garzarella" <sgarzare@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Thread-Index: AQHXAJSYCx+aFksFvkyyTAg+au+UL6pUgQTo
Date: Fri, 12 Feb 2021 13:22:43 +0000
Message-ID: <1613136163375.99584@amazon.com>
References: <CAJSP0QWWg__21otbMXAXWGD1FaHYLzZP7axZ47Unq6jtMvdfsA@mail.gmail.com>
In-Reply-To: <CAJSP0QWWg__21otbMXAXWGD1FaHYLzZP7axZ47Unq6jtMvdfsA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.162.228]
Content-Type: multipart/alternative;
 boundary="_000_161313616337599584amazoncom_"
MIME-Version: 1.0
Precedence: Bulk
Received-SPF: pass client-ip=72.21.198.25;
 envelope-from=prvs=670db70c9=fandree@amazon.com; helo=smtp-fw-4101.amazon.com
X-Spam_score_int: -151
X-Spam_score: -15.2
X-Spam_bar: ---------------
X-Spam_report: (-15.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 12 Feb 2021 10:03:51 -0500
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

--_000_161313616337599584amazoncom_
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hey Stefan,


Thanks for taking care of organizing GSoC, and for allowing rust-vmm to als=
o participate under the QEMU umbrella!

I am a bit unsure of how can we propose projects related to rust-vmm.

We did a bit of brainstorming in our team, and we came up with 3 project id=
eas.

I'll just paste them below, but please let me know if we were supposed to p=
ropose them some other way.


=3D=3D=3D Implement the Virtio Console device in Rust =3D=3D=3D

'''Summary:''' Implement the basic emulation for the Virtio Console device =
in Rust

Implement the basic functionality (excluding the optional features:
VIRTIO_CONSOLE_F_SIZE, VIRTIO_CONSOLE_F_MULTIPORT, or VIRTIO_CONSOLE_F_EMER=
G_WRITE)
of the Virtio Console Device, using the Virtio building blocks (queue imple=
mentations,
VirtioDevice traits) defined in rust-vmm/vm-virtio. The virtio console devi=
ce uses
one virtio queue for transmitting data, and one virtio queue for receiving =
data.
The implementation can be extended to also support a subset of the previous=
ly
mentioned optional features.

'''Links:'''
* About rust-vmm: https://github.com/rust-vmm/community
* rust-vmm/vm-virtio: https://github.com/rust-vmm/vm-virtio
* virtio-console spec: https://docs.oasis-open.org/virtio/virtio/v1.1/csprd=
01/virtio-v1.1-csprd01.html#x1-2550003

'''Details:'''
* Skill level: intermediate
* Language: Rust
* Mentor: iul@amazon.com
* Suggested by: fandree@amazon.com<mailto:fandree@amazon.com>


=3D=3D=3D Mocking framework for Virtio Queues =3D=3D=3D

'''Summary:''' Implement a mocking framework for virtio queues

Paravirtualized devices (such as those defined by the Virtio standard) are =
used
to provide high performance device emulation. Virtio drivers from a guest VM
communicate with the device model using an efficient mechanism based on que=
ues
stored in a shared memory area that operate based on a protocol and message=
 format
defined by the standard. Various implementations of devices and other
virtualization building blocks require mocking the contents that a driver w=
ould
place into a Virtio queue for validation, testing, and evaluation purposes.

This project aims to lay the foundations of a reusable framework for mockin=
g the
driver side of Virtio queue operation, that can be consumed by rust-vmm cra=
tes and
other projects. At the basic level, this means providing a flexible and eas=
y to
use interface for users to set up the underlying memory areas and populate =
contents
(as the driver would do) for the basic split queue format in a generic mann=
er. This
can further be extended for the packed format and with device-specific mock=
ing
capabilities.

'''Links:'''
* About rust-vmm: https://github.com/rust-vmm/community
* Virtio queue spec: https://docs.oasis-open.org/virtio/virtio/v1.1/csprd01=
/virtio-v1.1-csprd01.html#x1-230005
Issue in rust-vmm about reusing the mocking logic: rust-vmm/vm-virtio: http=
s://github.com/rust-vmm/vm-virtio

'''Details:'''
* Skill level: intermediate
* Language: Rust
* Mentor: aagch@amazon.com
* Suggested by: aagch@amazon.com


=3D=3D=3D Local running rust-vmm-ci =3D=3D=3D

'''Summary:''' Run the rust-vmm-ci locally

The rust-vmm-ci provides automation for uniformely running the tests on
all rust-vmm repositories. It is built on top of Buildkite, and only allows
running the tests in the Buildkite context. To run the same tests as in the=
 CI
locally, users need to manually copy the Buildkite pipeline steps.

The scope of this project is to make it possible for the same tests to easi=
ly run
locally. This project makes it easier to contribute to all rust-vmm reposit=
ories.

In order for that to be possible, the following steps are required:
- the Buildlkite pipeline is autogenerated from code instead of being a sta=
tic
list of tests to run. This also allows us to uniformely use the same contai=
ner
version for running all the tests (instead of manually modifying each step =
in
the pipeline)
- the code for autogenerating the Buildkite pipeline is reused for generati=
ng
a Python script which can be run locally


'''Links:'''
* rust-vmm-ci: https://github.com/rust-vmm/rust-vmm-ci
* Buildkite pipeline that currently runs the tests: https://github.com/rust=
-vmm/rust-vmm-ci/blob/master/.buildkite/pipeline.yml
* About rust-vmm: https://github.com/rust-vmm/community
* Buildkite documentation: https://buildkite.com/docs/tutorials/getting-sta=
rted

'''Details:'''
* Skill level: intermediate
* Language: Python
* Mentor: fandree@amazon.com
* Suggested by: fandree@amazon.com


?Thanks again!

Andreea

________________________________
From: Stefan Hajnoczi <stefanha@gmail.com>
Sent: Monday, January 11, 2021 1:47 PM
To: qemu-devel; kvm; rust-vmm@lists.opendev.org; Alex Benn=E9e; Alexander G=
raf; Alberto Garcia; David Hildenbrand; Eduardo Habkost; Igor Mammedov; Joh=
n Snow; Julia Suvorova; Gerd Hoffmann; Kevin Wolf; Laurent Vivier; Marc-And=
r=E9 Lureau; Aleksandar Markovic; Sergio Lopez; Stefano Garzarella; Paolo B=
onzini; Philippe Mathieu-Daud=E9
Subject: [EXTERNAL] [Rust-VMM] Call for Google Summer of Code 2021 project =
ideas

CAUTION: This email originated from outside of the organization. Do not cli=
ck links or open attachments unless you can confirm the sender and know the=
 content is safe.



Dear QEMU, KVM, and rust-vmm community,
QEMU will apply for Google Summer of Code
(https://summerofcode.withgoogle.com/) again this year.  This internship
program offers paid, 10-week, remote work internships for
contributing to open source.  QEMU can act as an umbrella organization
for KVM kernel and rust-vmm projects too.

Please post project ideas on the QEMU wiki before February 14th:
https://wiki.qemu.org/Google_Summer_of_Code_2021

What's new this year:
 * The number of internship hours has been halved to 175 hours over
   10 weeks. Project ideas must be smaller to fit and students will have
   more flexibility with their working hours.
 * Eligibility has been expanded to include "licensed coding school or
   similar type of program".

Good project ideas are suitable for 175 hours (10 weeks half-day) work by a
competent programmer who is not yet familiar with the codebase.  In
addition, they are:
 * Well-defined - the scope is clear
 * Self-contained - there are few dependencies
 * Uncontroversial - they are acceptable to the community
 * Incremental - they produce deliverables along the way

Feel free to post ideas even if you are unable to mentor the project.
It doesn't hurt to share the idea!

I will review project ideas and keep you up-to-date on QEMU's
acceptance into GSoC.

For more background on QEMU internships, check out this video:
https://www.youtube.com/watch?v=3DxNVCX7YMUL8

Stefan

_______________________________________________
Rust-vmm mailing list
Rust-vmm@lists.opendev.org
http://lists.opendev.org/cgi-bin/mailman/listinfo/rust-vmm



Amazon Development Center (Romania) S.R.L. registered office: 27A Sf. Lazar=
 Street, UBC5, floor 2, Iasi, Iasi County, 700045, Romania. Registered in R=
omania. Registration number J22/2621/2005.

--_000_161313616337599584amazoncom_
Content-Type: text/html; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none"><!-- p { margin-top: 0px; m=
argin-bottom: 0px; } .EmailQuote { margin-left: 1pt; padding-left: 4pt; bor=
der-left: 2px solid rgb(128, 0, 0); }--></style>
</head>
<body dir=3D"ltr" style=3D"font-size:12pt;color:#000000;background-color:#F=
FFFFF;font-family:Calibri,Arial,Helvetica,sans-serif;">
<p>Hey Stefan,<br>
</p>
<p><br>
</p>
<p>Thanks for taking care of organizing GSoC, and for allowing rust-vmm to =
also participate under the QEMU umbrella!<br>
</p>
<p>I am a bit unsure of how can we propose projects related to rust-vmm.</p>
<p><span style=3D"font-size: 12pt;">We did a bit of brainstorming in our te=
am, and we came up with 3 proj</span><span style=3D"font-size: 12pt;">ect i=
deas.</span></p>
<p><span style=3D"font-size: 12pt;"></span><span style=3D"font-size: 12pt;"=
>I</span><span style=3D"font-size: 12pt;">'ll</span><span style=3D"font-siz=
e: 12pt;"> just p</span><span style=3D"font-size: 12pt;">aste them below, b=
ut please let me know if we were
</span><span style=3D"font-size: 12pt;">supposed to propose them some other=
 way.</span></p>
<p><span style=3D"font-size: 12pt;"><br>
</span></p>
<p><span style=3D"font-size: 12pt;">=3D=3D=3D Implement the Virtio Console =
device in Rust =3D=3D=3D<br>
<br>
'''Summary:''' Implement the basic emulation for the Virtio Console device =
in Rust<br>
<br>
Implement the basic functionality (excluding the optional features:<br>
VIRTIO_CONSOLE_F_SIZE, VIRTIO_CONSOLE_F_MULTIPORT, or VIRTIO_CONSOLE_F_EMER=
G_WRITE)<br>
of the Virtio Console Device, using the Virtio building blocks (queue imple=
mentations,<br>
VirtioDevice traits) defined in rust-vmm/vm-virtio. The virtio console devi=
ce uses<br>
one virtio queue for transmitting data, and one virtio queue for receiving =
data.<br>
The implementation can be extended to also support a subset of the previous=
ly<br>
mentioned optional features.<br>
<br>
'''Links:'''<br>
* About rust-vmm: https://github.com/rust-vmm/community<br>
* rust-vmm/vm-virtio: https://github.com/rust-vmm/vm-virtio<br>
* virtio-console spec: https://docs.oasis-open.org/virtio/virtio/v1.1/csprd=
01/virtio-v1.1-csprd01.html#x1-2550003<br>
<br>
'''Details:'''<br>
* Skill level: intermediate<br>
* Language: Rust<br>
* Mentor: iul@amazon.com<br>
* Suggested by: <a href=3D"mailto:fandree@amazon.com">fandree@amazon.com</a=
><br>
</span></p>
<p><span style=3D"font-size: 12pt;"><br>
</span></p>
<p><span style=3D"font-size: 12pt;">=3D=3D=3D Mocking framework for Virtio =
Queues =3D=3D=3D<br>
<br>
'''Summary:''' Implement a mocking framework for virtio queues<br>
<br>
Paravirtualized devices (such as those defined by the Virtio standard) are =
used<br>
to provide high performance device emulation. Virtio drivers from a guest V=
M<br>
communicate with the device model using an efficient mechanism based on que=
ues<br>
stored in a shared memory area that operate based on a protocol and message=
 format<br>
defined by the standard. Various implementations of devices and other<br>
virtualization building blocks require mocking the contents that a driver w=
ould<br>
place into a Virtio queue for validation, testing, and evaluation purposes.=
<br>
<br>
This project aims to lay the foundations of a reusable framework for mockin=
g the<br>
driver side of Virtio queue operation, that can be consumed by rust-vmm cra=
tes and<br>
other projects. At the basic level, this means providing a flexible and eas=
y to<br>
use interface for users to set up the underlying memory areas and populate =
contents<br>
(as the driver would do) for the basic split queue format in a generic mann=
er. This<br>
can further be extended for the packed format and with device-specific mock=
ing<br>
capabilities. <br>
<br>
'''Links:''' <br>
* About rust-vmm: https://github.com/rust-vmm/community<br>
* Virtio queue spec: https://docs.oasis-open.org/virtio/virtio/v1.1/csprd01=
/virtio-v1.1-csprd01.html#x1-230005<br>
Issue in rust-vmm about reusing the mocking logic: rust-vmm/vm-virtio: http=
s://github.com/rust-vmm/vm-virtio
<br>
<br>
'''Details:'''<br>
* Skill level: intermediate<br>
* Language: Rust<br>
* Mentor: aagch@amazon.com<br>
* Suggested by: aagch@amazon.com</span></p>
<p><span style=3D"font-size: 12pt;"><br>
</span></p>
<p><span style=3D"font-size: 12pt;">=3D=3D=3D Local running rust-vmm-ci =3D=
=3D=3D<br>
<br>
'''Summary:''' Run the rust-vmm-ci locally<br>
<br>
The rust-vmm-ci provides automation for uniformely running the tests on<br>
all rust-vmm repositories. It is built on top of Buildkite, and only allows=
<br>
running the tests in the Buildkite context. To run the same tests as in the=
 CI<br>
locally, users need to manually copy the Buildkite pipeline steps.<br>
<br>
The scope of this project is to make it possible for the same tests to easi=
ly run<br>
locally. This project makes it easier to contribute to all rust-vmm reposit=
ories.<br>
<br>
In order for that to be possible, the following steps are required:<br>
- the Buildlkite pipeline is autogenerated from code instead of being a sta=
tic<br>
list of tests to run. This also allows us to uniformely use the same contai=
ner<br>
version for running all the tests (instead of manually modifying each step =
in<br>
the pipeline)<br>
- the code for autogenerating the Buildkite pipeline is reused for generati=
ng<br>
a Python script which can be run locally<br>
<br>
<br>
'''Links:'''<br>
* rust-vmm-ci: https://github.com/rust-vmm/rust-vmm-ci<br>
* Buildkite pipeline that currently runs the tests: https://github.com/rust=
-vmm/rust-vmm-ci/blob/master/.buildkite/pipeline.yml<br>
* About rust-vmm: https://github.com/rust-vmm/community<br>
* Buildkite documentation: https://buildkite.com/docs/tutorials/getting-sta=
rted<br>
<br>
'''Details:'''<br>
* Skill level: intermediate<br>
* Language: Python<br>
* Mentor: fandree@amazon.com<br>
* Suggested by: fandree@amazon.com<br>
</span></p>
<p><span style=3D"font-size: 12pt;"><br>
</span></p>
<p><span style=3D"font-size: 12pt;"><br>
&#8203;Thanks again!</span></p>
<p><span style=3D"font-size: 12pt;">Andreea</span></p>
<div style=3D"color: rgb(33, 33, 33);">
<div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Stefan Hajnoczi &lt=
;stefanha@gmail.com&gt;<br>
<b>Sent:</b> Monday, January 11, 2021 1:47 PM<br>
<b>To:</b> qemu-devel; kvm; rust-vmm@lists.opendev.org; Alex Benn=E9e; Alex=
ander Graf; Alberto Garcia; David Hildenbrand; Eduardo Habkost; Igor Mammed=
ov; John Snow; Julia Suvorova; Gerd Hoffmann; Kevin Wolf; Laurent Vivier; M=
arc-Andr=E9 Lureau; Aleksandar Markovic;
 Sergio Lopez; Stefano Garzarella; Paolo Bonzini; Philippe Mathieu-Daud=E9<=
br>
<b>Subject:</b> [EXTERNAL] [Rust-VMM] Call for Google Summer of Code 2021 p=
roject ideas</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">CAUTION: This email originated from outside of the=
 organization. Do not click links or open attachments unless you can confir=
m the sender and know the content is safe.<br>
<br>
<br>
<br>
Dear QEMU, KVM, and rust-vmm community,<br>
QEMU will apply for Google Summer of Code<br>
(<a href=3D"https://summerofcode.withgoogle.com/">https://summerofcode.with=
google.com/</a>) again this year.&nbsp; This internship<br>
program offers paid, 10-week, remote work internships for<br>
contributing to open source.&nbsp; QEMU can act as an umbrella organization=
<br>
for KVM kernel and rust-vmm projects too.<br>
<br>
Please post project ideas on the QEMU wiki before February 14th:<br>
<a href=3D"https://wiki.qemu.org/Google_Summer_of_Code_2021">https://wiki.q=
emu.org/Google_Summer_of_Code_2021</a><br>
<br>
What's new this year:<br>
&nbsp;* The number of internship hours has been halved to 175 hours over<br>
&nbsp;&nbsp; 10 weeks. Project ideas must be smaller to fit and students wi=
ll have<br>
&nbsp;&nbsp; more flexibility with their working hours.<br>
&nbsp;* Eligibility has been expanded to include &quot;licensed coding scho=
ol or<br>
&nbsp;&nbsp; similar type of program&quot;.<br>
<br>
Good project ideas are suitable for 175 hours (10 weeks half-day) work by a=
<br>
competent programmer who is not yet familiar with the codebase.&nbsp; In<br>
addition, they are:<br>
&nbsp;* Well-defined - the scope is clear<br>
&nbsp;* Self-contained - there are few dependencies<br>
&nbsp;* Uncontroversial - they are acceptable to the community<br>
&nbsp;* Incremental - they produce deliverables along the way<br>
<br>
Feel free to post ideas even if you are unable to mentor the project.<br>
It doesn't hurt to share the idea!<br>
<br>
I will review project ideas and keep you up-to-date on QEMU's<br>
acceptance into GSoC.<br>
<br>
For more background on QEMU internships, check out this video:<br>
<a href=3D"https://www.youtube.com/watch?v=3DxNVCX7YMUL8">https://www.youtu=
be.com/watch?v=3DxNVCX7YMUL8</a><br>
<br>
Stefan<br>
<br>
_______________________________________________<br>
Rust-vmm mailing list<br>
Rust-vmm@lists.opendev.org<br>
<a href=3D"http://lists.opendev.org/cgi-bin/mailman/listinfo/rust-vmm">http=
://lists.opendev.org/cgi-bin/mailman/listinfo/rust-vmm</a><br>
</div>
</span></font></div>
<p></p>

<p><br>
Amazon Development Center (Romania) S.R.L. registered office: 27A Sf. Lazar=
 Street, UBC5, floor 2, Iasi, Iasi County, 700045, Romania. Registered in R=
omania. Registration number J22/2621/2005.</p>
</body>
</html>

--_000_161313616337599584amazoncom_--


