Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0B733D5DE
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 15:37:43 +0100 (CET)
Received: from localhost ([::1]:53048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMApK-0002gw-Kh
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 10:37:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lMAnn-0001gl-7t
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 10:36:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lMAnl-0000px-4G
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 10:36:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615905363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=am0Ozf0xo32WSNlwTpJW6h1auIXSRtjZQR9FW3OFMJQ=;
 b=HQfiCb0qJpZAYpra9OWGaYBuc+ZlonA+mfgnKF1r4KZXJwfWZ4Vsibkx3g5j0GBH+Jeo+4
 ruqJ+3LLzerANSYGhTfELR4ljkKQBwgATVYFwykfyfjpowLuvhS1TbdM84AJIoHbKRSct0
 rWsk+srIP98bHNnmAY8uRla/EG1Ad1g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-vGB2qkUAOJivk9vpK2qSSg-1; Tue, 16 Mar 2021 10:35:59 -0400
X-MC-Unique: vGB2qkUAOJivk9vpK2qSSg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5349192D78B;
 Tue, 16 Mar 2021 14:35:57 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-216.ams2.redhat.com [10.36.112.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9060918AD6;
 Tue, 16 Mar 2021 14:35:53 +0000 (UTC)
Date: Tue, 16 Mar 2021 15:35:52 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL v2 00/42] Block layer patches and object-add QAPIfication
Message-ID: <YFDCSMHXeP/qbeUZ@merkur.fritz.box>
References: <20210315123520.118752-1-kwolf@redhat.com>
 <CAFEAcA8ckSBYcONgQKXeWnSwL9inGAchUAAwy9=xcb2HEP=qVQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8ckSBYcONgQKXeWnSwL9inGAchUAAwy9=xcb2HEP=qVQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: stefanha@redhat.com, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 16.03.2021 um 14:17 hat Peter Maydell geschrieben:
> On Mon, 15 Mar 2021 at 12:35, Kevin Wolf <kwolf@redhat.com> wrote:
> >
> > The following changes since commit 6157b0e19721aadb4c7fdcfe57b2924af6144b14:
> >
> >   Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.0-pull-request' into staging (2021-03-14 17:47:49 +0000)
> >
> > are available in the Git repository at:
> >
> >   git://repo.or.cz/qemu/kevin.git tags/for-upstream
> >
> > for you to fetch changes up to 078ee48ef7d172df1b3ad020255d1eb6beda2daf:
> >
> >   qom: Support JSON in HMP object_add and tools --object (2021-03-15 13:04:27 +0100)
> >
> > ----------------------------------------------------------------
> > Block layer patches and object-add QAPIfication
> >
> > - QAPIfy object-add and --object for tools (keyval and JSON support)
> > - Add vhost-user-blk-test
> > - stream: Fail gracefully if permission is denied
> > - storage-daemon: Fix crash on quit when job is still running
> > - curl: Fix use after free
> > - char: Deprecate backend aliases, fix QMP query-chardev-backends
> > - Fix image creation option defaults that exist in both the format and
> >   the protocol layer (e.g. 'cluster_size' in qcow2 and rbd; the qcow2
> >   default was incorrectly applied to the rbd layer)
> >
> > ----------------------------------------------------------------
> 
> Fails 'make check' on x86-64 linux:
> 
> PASS 61 qtest-x86_64/qos-test
> /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-blk-pci/virtio-blk/virtio-blk-tests/config
> PASS 62 qtest-x86_64/qos-test
> /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-blk-pci/virtio-blk/virtio-blk-tests/basic
> PASS 63 qtest-x86_64/qos-test
> /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-blk-pci/virtio-blk/virtio-blk-tests/resize
> **
> ERROR:../../tests/qtest/libqos/virtio.c:194:qvirtio_wait_status_byte_no_isr:
> assertion failed: (!d->bus->get_queue_isr_status(d, vq))
> ERROR qtest-x86_64/qos-test - Bail out!
> ERROR:../../tests/qtest/libqos/virtio.c:194:qvirtio_wait_status_byte_no_isr:
> assertion failed: (!d->bus->get_queue_isr_status(d, vq))
> Makefile.mtest:1008: recipe for target 'run-test-124' failed
> make: *** [run-test-124] Error 1

It didn't fail to me, so the condition must be a little more specific
than just x86_64 Linux.

Stefan, can you have a look? I may have to drop these patches again.

Kevin


