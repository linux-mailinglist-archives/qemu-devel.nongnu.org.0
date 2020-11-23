Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 797502C0A68
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 14:27:03 +0100 (CET)
Received: from localhost ([::1]:54240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khBry-000444-Ii
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 08:27:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1khBiv-0007L5-8i
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 08:17:42 -0500
Received: from 7.mo51.mail-out.ovh.net ([46.105.33.25]:39868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1khBit-0003rx-4t
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 08:17:41 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.33])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id DE782238837;
 Mon, 23 Nov 2020 14:17:35 +0100 (CET)
Received: from kaod.org (37.59.142.97) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 23 Nov
 2020 14:17:35 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002e05d8eb6-fdb6-4e3f-837c-9df420d1d3c6,
 7563B3C8582C4E5C569F12427BEE2CF3FAD9DE82) smtp.auth=groug@kaod.org
Date: Mon, 23 Nov 2020 14:17:34 +0100
From: Greg Kurz <groug@kaod.org>
To: Cole Robinson <crobinso@redhat.com>
Subject: Re: virtio-9p-test.c:300:v9fs_req_recv: assertion failed (hdr.id ==
 id): (7 == 73)
Message-ID: <20201123141734.0c03f21a@bahia.lan>
In-Reply-To: <fad8a69d-9c21-ac25-028d-646a64ccecc5@redhat.com>
References: <fad8a69d-9c21-ac25-028d-646a64ccecc5@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: a6d423d3-9930-4db5-8c05-55a8d8f1fa5a
X-Ovh-Tracer-Id: 13145725841483733469
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudegiedgheduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhieejfeffheejgfeljedvvdejvddutdetgfekffdvleeijeeutefgjeeghefgffenucffohhmrghinhepfhgvughorhgrihhnfhhrrggtlhhouhgurdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhupghoshhssegtrhhuuggvsgihthgvrdgtohhm
Received-SPF: pass client-ip=46.105.33.25; envelope-from=groug@kaod.org;
 helo=7.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu_oss@crudebyte.com, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixed maintainer's address: s/oss@crudebyte.com/qemu_oss@crudebyte.com

On Sat, 21 Nov 2020 17:03:14 -0500
Cole Robinson <crobinso@redhat.com> wrote:

> Hi, I'm consistently seeing this assertion running the qemu-5.2.0  test
> suite. rc0, rc1, rc2 have been consistently affected, it reproduces
> consistently in parts of Fedora's build system. Here's an example build
> log for rc2 x86 against Fedora 32
> 
> https://download.copr.fedorainfracloud.org/results/@kubevirt/qemu-5.2.0-0.6.rc2/fedora-32-x86_64/01781514-qemu/builder-live.log.gz
> 
> The full test error:
> 
> ...
> PASS 26 qtest-arm/qos-test
> /arm/virt/virtio-mmio/virtio-bus/virtio-9p-device/virtio-9p/virtio-9p-tests/synth/readdir/split_128
> PASS 27 qtest-arm/qos-test
> /arm/virt/virtio-mmio/virtio-bus/virtio-9p-device/virtio-9p/virtio-9p-tests/local/config

Ok so the next test is supposed to be:

/arm/virt/virtio-mmio/virtio-bus/virtio-9p-device/virtio-9p/virtio-9p-tests/local/create_dir

This was added recently. This configures the virtio-9p device in QEMU
to serve a real test directory from the host. This test directory is
created under the current directory of the test process. The purpose
of the test is then to ask the 9p server to create a directory within
the test directory.

> Received response 7 (RLERROR) instead of 73 (RMKDIR)
> ERROR qtest-arm/qos-test - Bail out!
> ERROR:../tests/qtest/virtio-9p-test.c:300:v9fs_req_recv: assertion
> failed (hdr.id == id): (7 == 73)
> Rlerror has errno 95 (Operation not supported)

So this basically means that QEMU got ENOTSUP/EOPNOTSUPP when calling
mkdir() into the test directory... not sure what could cause that. I'd
need more details on the filesystem setup for the build.

Anyway, we already experienced some breakage in upstream CI because of
the same family of tests that do real access to the host filesystem.
Since they're being introduced in QEMU 5.2, I'll try to see if I can
disable them to be run by default for RC3.

Cheers,

--
Greg

> **
> ERROR:../tests/qtest/virtio-9p-test.c:300:v9fs_req_recv: assertion
> failed (hdr.id == id): (7 == 73)
> make: *** [Makefile.mtest:1257: run-test-155] Error 1
> error: Bad exit status from /var/tmp/rpm-tmp.EG4Dav (%check)
> 
> 
> Thanks,
> Cole
> 


