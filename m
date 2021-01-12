Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF792F379C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:50:35 +0100 (CET)
Received: from localhost ([::1]:50106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzNoQ-0001Tr-CL
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:50:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzNj0-0006CW-Mo
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:44:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzNiw-00070I-4l
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:44:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610473492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=g4ay2eO/KvsGgA8e8lJtHFMaGDOJB7Z+8ECphl0vE18=;
 b=C25YDkD0txNejJ5lmRh6BR4fSjF785/FLA3WpvtpAfM+9CRewAQOo5vPzIVc08kP4OuNTX
 DLjsMsn6igM4121IM+WDvu5DqE4RCOGG4Zbyf8PSv9xvxo2eUG4XEFEsiUVaf7RMR5Y072
 TsP5AiprsO5ujbnrA0+RAOB87vkNb94=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-pszy1kBjN9i6fRfc3_F8Iw-1; Tue, 12 Jan 2021 12:44:50 -0500
X-MC-Unique: pszy1kBjN9i6fRfc3_F8Iw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB9C0190D340;
 Tue, 12 Jan 2021 17:44:48 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-115-161.ams2.redhat.com
 [10.36.115.161])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B556D5B69C;
 Tue, 12 Jan 2021 17:44:47 +0000 (UTC)
To: Qemu-block <qemu-block@nongnu.org>
From: Max Reitz <mreitz@redhat.com>
Subject: iotest 129
Message-ID: <6e00b90e-5c95-8b02-23c2-0acfe9862f6a@redhat.com>
Date: Tue, 12 Jan 2021 18:44:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="------------79803E1225C10281098C7CFA"
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------79803E1225C10281098C7CFA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

tl;dr: I have some troubles debugging what’s wrong with iotest 129.  It 
wants to check that 'stop' does not drain a block job, but to me it 
seems like that’s exactly what’s happening with the mirror job.


For quite some time, I’ve had 129 disabled in my test branch because it 
fails all the time for me.  Now it came up again in Vladimir’s async 
backup series, and so I tried my hands at debugging it once again.

Recap: 129 writes 128M to some image, then runs a block job from there 
(while the source drive is supposedly throttled), then issues a stop 
command, and checks that the job is not drained.  I.e., still running.

(It checks the “running” state via @busy, which is probably wrong; it 
should verify that @state == 'running' (which wasn’t available back in 
2015), but that’s not really why I’m writing this mail.)

Like the last time I tried
(https://lists.nongnu.org/archive/html/qemu-block/2019-06/msg00499.html) 
I can see that block jobs completely ignore BB throttling: If you apply 
the attachment show-progress.patch, you’ll probably see some progress 
made while the test waits for five seconds.  (Here, on tmpfs, mirror and 
commit get to READY, and backup completes.)

OK, so now that block jobs don’t completely break with filters, you can 
instead use a filter node on the source (as I tried in the patch 
referenced above).  And to fully fix the test, we’d also replace the 
@busy == True check by @status == 'running'.  That’s the attachment 
filter-node-show-progress.patch.

If I apply that, I can see that now there actually is some throttling. 
After the time.sleep(5), mirror and commit get to exactly 1 MB, and 
backup gets to 1.0625 MB.  Good.

However, after the stop is issued, backup stays at 1.2 MB (good), but 
mirror and commit progress obviously without throttling to 30, 40, 50 
MB, whatever.  So it appears to me they are drained by the stop.  I.e., 
precisely what the iotest is trying to prove not to happen.


I plan to continue investigating, but I just wanted to send this mail to 
see whether perhaps someone has an idea on what’s going on.

(My main problem is that bisecting this is hard.  AFAIK the throttling 
applied in master:129 has been broken ever since blockdev throttling was 
moved to the BB.  Even without the “Deal with filters” series, you can 
use at least mirror sync=full from filter nodes, so I tried to use 
filter-node-show-progress.patch for just test_drive_mirror(), but that 
only works back until fe4f0614ef9e361d (or rather 0f12264e7a4145 if you 
prefer not to get a SIGABRT).  Before that commit, it hangs.)

Max

--------------79803E1225C10281098C7CFA
Content-Type: text/x-patch; charset=UTF-8;
 name="show-progress.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="show-progress.patch"

commit 9697ee270fc59a7a9e5b6b4a56373e38f2e50327
Author: Max Reitz <mreitz@redhat.com>
Date:   Tue Jan 12 17:33:08 2021 +0100

    iotests/129: Show job progress

diff --git a/tests/qemu-iotests/129 b/tests/qemu-iotests/129
index 0e13244d85..30a9612d97 100755
--- a/tests/qemu-iotests/129
+++ b/tests/qemu-iotests/129
@@ -64,9 +64,24 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
         self.assert_qmp(result, 'return', {})
         result = self.vm.qmp(cmd, **args)
         self.assert_qmp(result, 'return', {})
+
+        print('---')
+        print('Right after the job was started:')
+        print(self.vm.qmp("query-block-jobs"))
+        time.sleep(5)
+        print('Five seconds later:')
+        print(self.vm.qmp("query-block-jobs"))
+
         result = self.vm.qmp("stop")
         self.assert_qmp(result, 'return', {})
         result = self.vm.qmp("query-block-jobs")
+
+        result = self.vm.qmp("stop")
+        self.assert_qmp(result, 'return', {})
+        result = self.vm.qmp("query-block-jobs")
+
+        print('After stop:')
+        print(result)
         self.assert_qmp(result, 'return[0]/busy', True)
         self.assert_qmp(result, 'return[0]/ready', False)
 

--------------79803E1225C10281098C7CFA
Content-Type: text/x-patch; charset=UTF-8;
 name="filter-node-show-progress.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="filter-node-show-progress.patch"

commit 5b09bd175481925cd60dfa959b3f1f7b7ba4a19c
Author: Max Reitz <mreitz@redhat.com>
Date:   Mon Jan 28 20:41:16 2019 +0100

    iotests/129: Use filter node, and show progress

diff --git a/tests/qemu-iotests/129 b/tests/qemu-iotests/129
index 0e13244d85..eae77b9da9 100755
--- a/tests/qemu-iotests/129
+++ b/tests/qemu-iotests/129
@@ -32,52 +32,46 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
         iotests.qemu_img('create', '-f', iotests.imgfmt, self.test_img,
                          "-b", self.base_img, '-F', iotests.imgfmt)
         iotests.qemu_io('-f', iotests.imgfmt, '-c', 'write -P0x5d 1M 128M', self.test_img)
-        self.vm = iotests.VM().add_drive(self.test_img)
+        self.vm = iotests.VM()
+        self.vm.add_object('throttle-group,id=tg0,x-bps-total=1024')
+        self.vm.add_drive(None, 'driver=throttle,throttle-group=tg0,file.driver=%s,file.file.filename=%s' % (iotests.imgfmt, self.test_img))
         self.vm.launch()
 
     def tearDown(self):
-        params = {"device": "drive0",
-                  "bps": 0,
-                  "bps_rd": 0,
-                  "bps_wr": 0,
-                  "iops": 0,
-                  "iops_rd": 0,
-                  "iops_wr": 0,
-                 }
-        result = self.vm.qmp("block_set_io_throttle", conv_keys=False,
-                             **params)
         self.vm.shutdown()
 
     def do_test_stop(self, cmd, **args):
         """Test 'stop' while block job is running on a throttled drive.
         The 'stop' command shouldn't drain the job"""
-        params = {"device": "drive0",
-                  "bps": 1024,
-                  "bps_rd": 0,
-                  "bps_wr": 0,
-                  "iops": 0,
-                  "iops_rd": 0,
-                  "iops_wr": 0,
-                 }
-        result = self.vm.qmp("block_set_io_throttle", conv_keys=False,
-                             **params)
-        self.assert_qmp(result, 'return', {})
         result = self.vm.qmp(cmd, **args)
         self.assert_qmp(result, 'return', {})
+
+        print('---')
+        print('Right after the job was started:')
+        print(self.vm.qmp("query-block-jobs"))
+        time.sleep(5)
+        print('Five seconds later:')
+        print(self.vm.qmp("query-block-jobs"))
+
         result = self.vm.qmp("stop")
         self.assert_qmp(result, 'return', {})
         result = self.vm.qmp("query-block-jobs")
-        self.assert_qmp(result, 'return[0]/busy', True)
+
+        print('After stop:')
+        print(result)
+        self.assert_qmp(result, 'return[0]/status', 'running')
         self.assert_qmp(result, 'return[0]/ready', False)
 
+        self.vm.qmp("block-job-cancel", device="drive0", force=True)
+
     def test_drive_mirror(self):
         self.do_test_stop("drive-mirror", device="drive0",
-                          target=self.target_img,
+                          target=self.target_img, format=iotests.imgfmt,
                           sync="full")
 
     def test_drive_backup(self):
         self.do_test_stop("drive-backup", device="drive0",
-                          target=self.target_img,
+                          target=self.target_img, format=iotests.imgfmt,
                           sync="full")
 
     def test_block_commit(self):

--------------79803E1225C10281098C7CFA--


