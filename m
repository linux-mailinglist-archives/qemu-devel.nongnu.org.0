Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5647E2D2BB7
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 14:14:40 +0100 (CET)
Received: from localhost ([::1]:39738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmcpC-0001cg-Cx
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 08:14:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kmcls-0000VT-G2
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 08:11:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kmcll-0005Si-BT
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 08:11:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607433062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5AGsXA1CLNmrVG79OeYbOtlWZJ5I8kOk2OZgDThsdAA=;
 b=Wxxiq+ZEeUtlD6KtSUoabEskT2Ag8YzHBA0tuXR8WzdqMmxfZd3RnV7oTOdG5wkmdNE5on
 7bQtFA01UorlBLYfMn9cUVdRKVkGOQCcEZDiDHA4ipi7cy84HzKO9Cx7aDjH71ZExnFV7X
 m6NRhErlbo3NXlimCkr6ReGhK6QLSiQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-0zmGvwSDOi2oGVCrKgbbOQ-1; Tue, 08 Dec 2020 08:11:00 -0500
X-MC-Unique: 0zmGvwSDOi2oGVCrKgbbOQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA0C71922963;
 Tue,  8 Dec 2020 13:10:58 +0000 (UTC)
Received: from localhost (ovpn-113-214.ams2.redhat.com [10.36.113.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 48C6919D9B;
 Tue,  8 Dec 2020 13:10:58 +0000 (UTC)
Date: Tue, 8 Dec 2020 13:10:57 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH v1 0/2] Add timeout mechanism to qmp actions
Message-ID: <20201208131057.GB272246@stefanha-x1.localdomain>
References: <20200917160054.GA2453251@dev>
 <5a5822ec-f3bc-a247-2b5a-f764b941c820@huawei.com>
 <20200918140628.GA2509473@dev>
 <1ba06b0d-3fcf-3676-f9e0-52875851ff19@huawei.com>
 <20200921111435.GA2524022@dev>
 <20201013100033.GB164611@stefanha-x1.localdomain>
 <f70dc6ce-385b-a4f9-04a0-244018f3ddbb@huawei.com>
 <6fd02e2b-50fa-b667-efc6-47d1765bdd8c@redhat.com>
 <4eb92c5e-fa2f-50a5-a0f7-5cabe6e15bb4@huawei.com>
 <ab245c4580cd5aecc8c5d338fd0e2802cac029d5.camel@euphon.net>
MIME-Version: 1.0
In-Reply-To: <ab245c4580cd5aecc8c5d338fd0e2802cac029d5.camel@euphon.net>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="v9Ux+11Zm5mwPlX6"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>, qemu-block@nongnu.org,
 Zhenyu Ye <yezhenyu2@huawei.com>, qemu-devel@nongnu.org,
 xiexiangyou@huawei.com, armbru@redhat.com,
 Glauber Costa <glauber@datadoghq.com>, Paolo Bonzini <pbonzini@redhat.com>,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--v9Ux+11Zm5mwPlX6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2020 at 05:29:16PM +0100, Fam Zheng wrote:
> On Tue, 2020-10-20 at 09:34 +0800, Zhenyu Ye wrote:
> > On 2020/10/19 21:25, Paolo Bonzini wrote:
> > > On 19/10/20 14:40, Zhenyu Ye wrote:
> > > > The kernel backtrace for io_submit in GUEST is:
> > > >=20
> > > > =09guest# ./offcputime -K -p `pgrep -nx fio`
> > > > =09    b'finish_task_switch'
> > > > =09    b'__schedule'
> > > > =09    b'schedule'
> > > > =09    b'io_schedule'
> > > > =09    b'blk_mq_get_tag'
> > > > =09    b'blk_mq_get_request'
> > > > =09    b'blk_mq_make_request'
> > > > =09    b'generic_make_request'
> > > > =09    b'submit_bio'
> > > > =09    b'blkdev_direct_IO'
> > > > =09    b'generic_file_read_iter'
> > > > =09    b'aio_read'
> > > > =09    b'io_submit_one'
> > > > =09    b'__x64_sys_io_submit'
> > > > =09    b'do_syscall_64'
> > > > =09    b'entry_SYSCALL_64_after_hwframe'
> > > > =09    -                fio (1464)
> > > > =09=0940031912
> > > >=20
> > > > And Linux io_uring can avoid the latency problem.
>=20
> Thanks for the info. What this tells us is basically the inflight
> requests are high. It's sad that the linux-aio is in practice
> implemented as a blocking API.
>=20
> Host side backtrace will be of more help. Can you get that too?

I guess Linux AIO didn't set the BLK_MQ_REQ_NOWAIT flag so the task went
to sleep when it ran out of blk-mq tags. The easiest solution is to move
to io_uring. Linux AIO is broken - it's not AIO :).

If we know that no other process is writing to the host block device
then maybe we can determine the blk-mq tags limit (the queue depth) and
avoid sending more requests. That way QEMU doesn't block, but I don't
think this approach works when other processes are submitting I/O to the
same host block device :(.

Fam's original suggestion of invoking io_submit(2) from a worker thread
is an option, but I'm afraid it will slow down the uncontended case.

I'm CCing Glauber in case he battled this in the past in ScyllaDB.

Stefan

--v9Ux+11Zm5mwPlX6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/Pe2EACgkQnKSrs4Gr
c8gDjgf+MSnMAFv4ZVxnQYvZxv03y7bP3I3cAO9VcQhid7vvpjZMEhfCTPdQKP2k
pQPBl892HVe2IFPmYbiyuRFjgQhqtBl8Qa6xGfg+Yle+X348DZWaHKTWil7LgoSp
amMsSBK8qcSXXrtSaHZu2eSn1fZJ4qWKYOs880KI2q5t1bns+7L6kYTtsSOqoMeG
zhMsQNUG09v/57K8WK6OXL1lViP23X4a1qiRenWFQEMKavqN7Lh4eupKkck4oVcX
IWfUNoMhZIN5qCi20Kqf5MGoI1Gr1goyo+7mvkTQ3oFLMfmvu70DkNoEzjeteYfH
lS172yrIDYFPYHIe1KBsmO1Ing/uTw==
=9t6V
-----END PGP SIGNATURE-----

--v9Ux+11Zm5mwPlX6--


