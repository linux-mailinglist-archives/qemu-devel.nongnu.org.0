Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 074392C14C2
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 20:51:49 +0100 (CET)
Received: from localhost ([::1]:52302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khHsH-0006zk-Oi
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 14:51:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1khHm4-0003eZ-TG
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 14:45:20 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:55879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1khHm2-0006YU-D7
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 14:45:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=JPO9GXPxBDUi13J5j8fUsgk9OeEbN+XzVE1EDrRf2N4=; b=LVHU3hrgSC3mmbOlJ9zIyFmgmL
 Wt4rQORtEcLTVmp9PKyU44k2dhlPCvz8mP0rhaVwO1wbFr0bCPnHrLXHz0WOh9X9FHrINNIx112ii
 4208gjWOca3OnS7vekqlMT2Z8yeHUCzzSr1B52FaDshsLBHmovrVq+KTM33DRJ9Rzv8V92qWf2aSx
 rNTPHhaYxl+P2pnoq5xlJ5UYCgxGju7stekyLjQYTLUW17xfpv7FJf77QoZWB9ju5lt+Emyz78EdC
 srTxKc/zQhVqWLh/hLyKjK2fdgHzaMesofEDW3sszEfeheASVfNRVvvDzwfnA3DoeFKXXWw2Ue/1V
 IZ3HabCA==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Cole Robinson <crobinso@redhat.com>
Subject: Re: virtio-9p-test.c:300:v9fs_req_recv: assertion failed (hdr.id ==
 id): (7 == 73)
Date: Mon, 23 Nov 2020 20:45:12 +0100
Message-ID: <13275468.fAp1jBoSgB@silver>
In-Reply-To: <7836238.thhSn8XZEd@silver>
References: <fad8a69d-9c21-ac25-028d-646a64ccecc5@redhat.com>
 <20201123141734.0c03f21a@bahia.lan> <7836238.thhSn8XZEd@silver>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=91.194.90.13; envelope-from=qemu_oss@crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Montag, 23. November 2020 14:48:15 CET Christian Schoenebeck wrote:
> On Montag, 23. November 2020 14:17:34 CET Greg Kurz wrote:
> > Fixed maintainer's address: s/oss@crudebyte.com/qemu_oss@crudebyte.com
> > 
> > On Sat, 21 Nov 2020 17:03:14 -0500
> > 
> > Cole Robinson <crobinso@redhat.com> wrote:
> > > Hi, I'm consistently seeing this assertion running the qemu-5.2.0  test
> > > suite. rc0, rc1, rc2 have been consistently affected, it reproduces
> > > consistently in parts of Fedora's build system. Here's an example build
> > > log for rc2 x86 against Fedora 32
> > > 
> > > https://download.copr.fedorainfracloud.org/results/@kubevirt/qemu-5.2.0-> > > 0.
> > > 6.rc2/fedora-32-x86_64/01781514-qemu/builder-live.log.gz
> > > 
> > > The full test error:
> > > 
> > > ...
> > > PASS 26 qtest-arm/qos-test
> > > /arm/virt/virtio-mmio/virtio-bus/virtio-9p-device/virtio-9p/virtio-9p-te
> > > st
> > > s/synth/readdir/split_128 PASS 27 qtest-arm/qos-test
> > > /arm/virt/virtio-mmio/virtio-bus/virtio-9p-device/virtio-9p/virtio-9p-te
> > > st
> > > s/local/config
> > 
> > Ok so the next test is supposed to be:
> > 
> > /arm/virt/virtio-mmio/virtio-bus/virtio-9p-device/virtio-9p/virtio-9p-test
> > s/ local/create_dir
> > 
> > This was added recently. This configures the virtio-9p device in QEMU
> > to serve a real test directory from the host. This test directory is
> > created under the current directory of the test process. The purpose
> > of the test is then to ask the 9p server to create a directory within
> > the test directory.
> > 
> > > Received response 7 (RLERROR) instead of 73 (RMKDIR)
> > > ERROR qtest-arm/qos-test - Bail out!
> > > ERROR:../tests/qtest/virtio-9p-test.c:300:v9fs_req_recv: assertion
> > > failed (hdr.id == id): (7 == 73)
> > > Rlerror has errno 95 (Operation not supported)
> > 
> > So this basically means that QEMU got ENOTSUP/EOPNOTSUPP when calling
> > mkdir() into the test directory... not sure what could cause that. I'd
> > need more details on the filesystem setup for the build.
> > 
> > Anyway, we already experienced some breakage in upstream CI because of
> > the same family of tests that do real access to the host filesystem.
> > Since they're being introduced in QEMU 5.2, I'll try to see if I can
> > disable them to be run by default for RC3.
> > 
> > Cheers,
> > 
> > --
> > Greg
> > 
> > > **
> > > ERROR:../tests/qtest/virtio-9p-test.c:300:v9fs_req_recv: assertion
> > > failed (hdr.id == id): (7 == 73)
> > > make: *** [Makefile.mtest:1257: run-test-155] Error 1
> > > error: Bad exit status from /var/tmp/rpm-tmp.EG4Dav (%check)
> > > 
> > > 
> > > Thanks,
> > > Cole
> 
> Yeah, looks like the mkdir() call which is supposed to create the 9p test
> directory, is failing there for some reason. The question is how to find
> that out (effectively) without having access to an affected system.
> 
> It's now too late for 5.2, but I think for 6.0 it would make sense
> introducing a dedicated 9p option loglevel=..., so we can tell people to
> enable this to capture the precise source location where an error ocurred.
> That would mean spreading a huge bunch of macros all over the 9p code base,
> but it would definitely help a lot understanding the root cause of reported
> issues in an efficient way.
> 
> Best regards,
> Christian Schoenebeck

Cole, does the affected host system probably not have xattrs enabled on its 
file system?

Best regards,
Christian Schoenebeck



