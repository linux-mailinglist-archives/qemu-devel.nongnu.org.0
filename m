Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E343821A2F4
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jul 2020 17:04:08 +0200 (CEST)
Received: from localhost ([::1]:39272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtY5n-000217-GU
	for lists+qemu-devel@lfdr.de; Thu, 09 Jul 2020 11:04:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jtY4X-0001QW-DS
 for qemu-devel@nongnu.org; Thu, 09 Jul 2020 11:02:49 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44765
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jtY4U-0006mZ-JN
 for qemu-devel@nongnu.org; Thu, 09 Jul 2020 11:02:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594306965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3KufozcTnJ14ca3JYMF05YfSz+ChGb4YgByXNod/MPo=;
 b=EEUKIZQW+6EoESJ3+GQkJ5O1a1w6coI7BNWCSJ91JlyETTYn9bVgTp3v0UzFMpjBzRaOW2
 Fri4O+0jkCFRTiRiu1WUYGgRGyu9SyhCXA48sd68BCc2Hl16c59gF+bE2J8dmlnMihaUIK
 2v+AeI++0ZYelfBUyzoVgihcSML0Aw0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-g1vETSLsPvyjWp3JWeie1w-1; Thu, 09 Jul 2020 11:02:16 -0400
X-MC-Unique: g1vETSLsPvyjWp3JWeie1w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AA0B5EB;
 Thu,  9 Jul 2020 15:02:13 +0000 (UTC)
Received: from linux.fritz.box (ovpn-114-122.ams2.redhat.com [10.36.114.122])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BEB386FED0;
 Thu,  9 Jul 2020 15:02:07 +0000 (UTC)
Date: Thu, 9 Jul 2020 17:02:06 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PULL 00/12] Block patches
Message-ID: <20200709150206.GC4096@linux.fritz.box>
References: <20200624100210.59975-1-stefanha@redhat.com>
 <CAFEAcA_K7MtnEjRMZCbmYrJCm6qD4N7ZMHvGuAzXL9gD2zQNuA@mail.gmail.com>
 <20200626102506.GD281902@stefanha-x1.localdomain>
 <cab22670-6804-9ddc-c3ee-b6dcf3a74ac4@redhat.com>
 <20200707220514.GY7276@habkost.net>
MIME-Version: 1.0
In-Reply-To: <20200707220514.GY7276@habkost.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/09 11:02:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Qemu-block <qemu-block@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 08.07.2020 um 00:05 hat Eduardo Habkost geschrieben:
> On Tue, Jul 07, 2020 at 05:28:21PM +0200, Philippe Mathieu-Daudé wrote:
> > On 6/26/20 12:25 PM, Stefan Hajnoczi wrote:
> > > On Thu, Jun 25, 2020 at 02:31:14PM +0100, Peter Maydell wrote:
> > >> On Wed, 24 Jun 2020 at 11:02, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > >>>
> > >>> The following changes since commit 171199f56f5f9bdf1e5d670d09ef1351d8f01bae:
> > >>>
> > >>>   Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20200619-3' into staging (2020-06-22 14:45:25 +0100)
> > >>>
> > >>> are available in the Git repository at:
> > >>>
> > >>>   https://github.com/stefanha/qemu.git tags/block-pull-request
> > >>>
> > >>> for you to fetch changes up to 7838c67f22a81fcf669785cd6c0876438422071a:
> > >>>
> > >>>   block/nvme: support nested aio_poll() (2020-06-23 15:46:08 +0100)
> > >>>
> > >>> ----------------------------------------------------------------
> > >>> Pull request
> > >>>
> > >>> ----------------------------------------------------------------
> > >>
> > >> Failure on iotest 030, x86-64 Linux:
> > >>
> > >>   TEST    iotest-qcow2: 030 [fail]
> > >> QEMU          --
> > >> "/home/petmay01/linaro/qemu-for-merges/build/alldbg/tests/qemu-iotests/../../x86_64-softmmu/qemu-system-x86_64"
> > >> -nodefaults -display none -accel qtest
> > >> QEMU_IMG      --
> > >> "/home/petmay01/linaro/qemu-for-merges/build/alldbg/tests/qemu-iotests/../../qemu-img"
> > >> QEMU_IO       --
> > >> "/home/petmay01/linaro/qemu-for-merges/build/alldbg/tests/qemu-iotests/../../qemu-io"
> > >>  --cache writeback --aio threads -f qcow2
> > >> QEMU_NBD      --
> > >> "/home/petmay01/linaro/qemu-for-merges/build/alldbg/tests/qemu-iotests/../../qemu-nbd"
> > >> IMGFMT        -- qcow2 (compat=1.1)
> > >> IMGPROTO      -- file
> > >> PLATFORM      -- Linux/x86_64 e104462 4.15.0-76-generic
> > >> TEST_DIR      --
> > >> /home/petmay01/linaro/qemu-for-merges/build/alldbg/tests/qemu-iotests/scratch
> > >> SOCK_DIR      -- /tmp/tmp.8tgdDjoZcO
> > >> SOCKET_SCM_HELPER --
> > >> /home/petmay01/linaro/qemu-for-merges/build/alldbg/tests/qemu-iotest/socket_scm_helper
> > >>
> > >> --- /home/petmay01/linaro/qemu-for-merges/tests/qemu-iotests/030.out
> > >>  2019-07-15 17:18:35.251364738 +0100
> > >> +++ /home/petmay01/linaro/qemu-for-merges/build/alldbg/tests/qemu-iotests/030.out.bad
> > >>   2020-06-25 14:04:28.500534007 +0100
> > >> @@ -1,5 +1,17 @@
> > >> -...........................
> > >> +.............F.............
> > >> +======================================================================
> > >> +FAIL: test_stream_parallel (__main__.TestParallelOps)
> > >> +----------------------------------------------------------------------
> > >> +Traceback (most recent call last):
> > >> +  File "030", line 246, in test_stream_parallel
> > >> +    self.assert_qmp(result, 'return', {})
> > >> +  File "/home/petmay01/linaro/qemu-for-merges/tests/qemu-iotests/iotests.py",
> > >> line 848, in assert_qmp
> > >> +    result = self.dictpath(d, path)
> > >> +  File "/home/petmay01/linaro/qemu-for-merges/tests/qemu-iotests/iotests.py",
> > >> line 822, in dictpath
> > >> +    self.fail(f'failed path traversal for "{path}" in "{d}"')
> > >> +AssertionError: failed path traversal for "return" in "{'error':
> > >> {'class': 'DeviceNotActive', 'desc': "Block job 'stream-node8' not
> > >> found"}}"
> > >> +
> > >>  ----------------------------------------------------------------------
> > >>  Ran 27 tests
> > >>
> > >> -OK
> > >> +FAILED (failures=1)
> > > 
> > > Strange, I can't reproduce this failure on my pull request branch or on
> > > qemu.git/master.
> > > 
> > > Is this failure deterministic? Are you sure it is introduced by this
> > > pull request?
> > 
> > Probably not introduced by this pullreq, but I also hit it on FreeBSD:
> > https://cirrus-ci.com/task/4620718312783872?command=main#L5803
> > 
> >   TEST    iotest-qcow2: 030 [fail]
> > QEMU          --
> > "/tmp/cirrus-ci-build/build/tests/qemu-iotests/../../aarch64-softmmu/qemu-system-aarch64"
> > -nodefaults -display none -machine virt -accel qtest
> > QEMU_IMG      --
> > "/tmp/cirrus-ci-build/build/tests/qemu-iotests/../../qemu-img"
> > QEMU_IO       --
> > "/tmp/cirrus-ci-build/build/tests/qemu-iotests/../../qemu-io"  --cache
> > writeback --aio threads -f qcow2
> > QEMU_NBD      --
> > "/tmp/cirrus-ci-build/build/tests/qemu-iotests/../../qemu-nbd"
> > IMGFMT        -- qcow2 (compat=1.1)
> > IMGPROTO      -- file
> > PLATFORM      -- FreeBSD/amd64 cirrus-task-4620718312783872 12.1-RELEASE
> > TEST_DIR      -- /tmp/cirrus-ci-build/build/tests/qemu-iotests/scratch
> > SOCK_DIR      -- /tmp/tmp.aZ5pxFLF
> > SOCKET_SCM_HELPER --
> > --- /tmp/cirrus-ci-build/tests/qemu-iotests/030.out	2020-07-07
> > 14:48:48.123804000 +0000
> > +++ /tmp/cirrus-ci-build/build/tests/qemu-iotests/030.out.bad	2020-07-07
> > 15:05:07.863685000 +0000
> > @@ -1,5 +1,17 @@
> > -...........................
> > +.............F.............
> > +======================================================================
> > +FAIL: test_stream_parallel (__main__.TestParallelOps)
> >  ----------------------------------------------------------------------
> > +Traceback (most recent call last):
> > +  File "030", line 246, in test_stream_parallel
> > +    self.assert_qmp(result, 'return', {})
> > +  File "/tmp/cirrus-ci-build/tests/qemu-iotests/iotests.py", line 848,
> > in assert_qmp
> > +    result = self.dictpath(d, path)
> > +  File "/tmp/cirrus-ci-build/tests/qemu-iotests/iotests.py", line 822,
> > in dictpath
> > +    self.fail(f'failed path traversal for "{path}" in "{d}"')
> > +AssertionError: failed path traversal for "return" in "{'error':
> > {'class': 'DeviceNotActive', 'desc': "Block job 'stream-node8' not found"}}"
> > +
> > +----------------------------------------------------------------------
> >  Ran 27 tests
> 
> Looks like a race condition that can be forced with a sleep call.
> With the following patch, I can reproduce it every time:
> 
>   diff --git a/tests/qemu-iotests/030 b/tests/qemu-iotests/030
>   index 1cdd7e2999..ee5374fc22 100755
>   --- a/tests/qemu-iotests/030
>   +++ b/tests/qemu-iotests/030
>   @@ -241,6 +241,7 @@ class TestParallelOps(iotests.QMPTestCase):
>                result = self.vm.qmp('block-stream', device=node_name, job_id=job_id, base=self.imgs[i-2], speed=512*1024)
>                self.assert_qmp(result, 'return', {})
>   
>   +        time.sleep(3)
>            for job in pending_jobs:
>                result = self.vm.qmp('block-job-set-speed', device=job, speed=0)
>                self.assert_qmp(result, 'return', {})

We can "fix" it for probably all realistic cases by lowering the speed
of the block job significantly. It's still not fully fixed for all
theoretical cases, but the pattern of starting a block job that is
throttled to a low speed so it will keep running for the next part of
the test is very common.

Kevin

diff --git a/tests/qemu-iotests/030 b/tests/qemu-iotests/030
index 256b2bfbc6..31c028306b 100755
--- a/tests/qemu-iotests/030
+++ b/tests/qemu-iotests/030
@@ -243,7 +243,7 @@ class TestParallelOps(iotests.QMPTestCase):
             node_name = 'node%d' % i
             job_id = 'stream-%s' % node_name
             pending_jobs.append(job_id)
-            result = self.vm.qmp('block-stream', device=node_name, job_id=job_id, base=self.imgs[i-2], speed=512*1024)
+            result = self.vm.qmp('block-stream', device=node_name, job_id=job_id, base=self.imgs[i-2], speed=1024)
             self.assert_qmp(result, 'return', {})

         for job in pending_jobs:


