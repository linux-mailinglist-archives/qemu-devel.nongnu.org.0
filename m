Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 013D030420C
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 16:17:01 +0100 (CET)
Received: from localhost ([::1]:53150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Q5U-0001eN-2p
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 10:17:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l4Pwp-0008QD-0O
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 10:08:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l4Pwl-000512-1w
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 10:08:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611673678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pvuDpxRxOHIzwXmxh6ZT9UTX/wUK91t13fn7O/KwMqw=;
 b=UEboV3+f3wfXWXFkW/wZ50YeEw5Hl+ppbggwNUMY5an0GU0fNW7ATnFWzrr8yrVzj8F0HH
 xVdrOgIOIYZJRm/k0yyVeZjC4xVEYrPwIuoBmIFTr1G1tHwlR0/yI6WMuBY4CbPQb+1m8D
 YJGyqX1YBFgD2mGYq3S1m+YKarPH0ZM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-D3aN5YiBO12S8KN1Zlg3Qg-1; Tue, 26 Jan 2021 10:07:54 -0500
X-MC-Unique: D3aN5YiBO12S8KN1Zlg3Qg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE1F5AFA81;
 Tue, 26 Jan 2021 15:07:52 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-202.ams2.redhat.com [10.36.114.202])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 70D3B5C276;
 Tue, 26 Jan 2021 15:07:51 +0000 (UTC)
Date: Tue, 26 Jan 2021 16:07:50 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v9 0/6] Rework iotests/check
Message-ID: <20210126150750.GH4385@merkur.fritz.box>
References: <20210125185056.129513-1-vsementsov@virtuozzo.com>
 <20210126125301.GE4385@merkur.fritz.box>
 <2628b158-cc41-908e-550f-ec4fe726a31f@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <2628b158-cc41-908e-550f-ec4fe726a31f@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-block@nongnu.org, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 26.01.2021 um 14:19 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 26.01.2021 15:53, Kevin Wolf wrote:
> > Am 25.01.2021 um 19:50 hat Vladimir Sementsov-Ogievskiy geschrieben:
> > > v9:
> > > 01: new, one more whitespace-fixing patch
> > > testenv: allow case when we don't have system-arch emulator, but have several for another architectures
> > >           change direct os.access(..., os.X_OK) calls to new helper function which also check that path is a file
> > > testrunner: s/fail/not run/ for 'No qualified output'
> > >              drop elapsed time arg for one of 'not run' results (now no elapsed time for any 'not run' result)
> > 
> > More CI fun:
> > 
> > Traceback (most recent call last):
> >    File "./check", line 117, in <module>
> >      testfinder = TestFinder(test_dir=env.source_iotests)
> >    File "/builds/.../qemu/tests/qemu-iotests/findtests.py", line 53, in __init__
> >      for line in f:
> >    File "/usr/lib64/python3.6/encodings/ascii.py", line 26, in decode
> >      return codecs.ascii_decode(input, self.errors)[0]
> > UnicodeDecodeError: 'ascii' codec can't decode byte 0xe2 in position 1591: ordinal not in range(128)
> 
> Can be solved by adding encoding='utf8' to the open().. But.. Adding it everywhere is not fun.
> 
> So, what about just define PYTHONUTF8=1 for running check in check-block.sh?
> 
> https://docs.python.org/3/using/cmdline.html#envvar-PYTHONUTF8

That looked nice, but we both missed the important line:

"New in version 3.7: See PEP 540 for more details."

So I'm back to explicitly requesting utf-8 encoding everywhere and that
seems to finally make it pass in the CI.

Kevin


diff --git a/tests/qemu-iotests/findtests.py b/tests/qemu-iotests/findtests.py
index d0c72efd6a..dd77b453b8 100644
--- a/tests/qemu-iotests/findtests.py
+++ b/tests/qemu-iotests/findtests.py
@@ -49,7 +49,7 @@ class TestFinder:
                                os.path.isfile(f + '.out')]
 
             for t in self.all_tests:
-                with open(t) as f:
+                with open(t, encoding="utf-8") as f:
                     for line in f:
                         if line.startswith('# group: '):
                             for g in line.split()[2:]:
@@ -57,7 +57,7 @@ class TestFinder:
                             break
 
     def add_group_file(self, fname: str) -> None:
-        with open(fname) as f:
+        with open(fname, encoding="utf-8") as f:
             for line in f:
                 line = line.strip()
 
diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
index 046f9ce38f..a581be6a29 100644
--- a/tests/qemu-iotests/testrunner.py
+++ b/tests/qemu-iotests/testrunner.py
@@ -41,7 +41,8 @@ def silent_unlink(path: Path) -> None:
 
 
 def file_diff(file1: str, file2: str) -> List[str]:
-    with open(file1) as f1, open(file2) as f2:
+    with open(file1, encoding="utf-8") as f1, \
+         open(file2, encoding="utf-8") as f2:
         # We want to ignore spaces at line ends. There are a lot of mess about
         # it in iotests.
         # TODO: fix all tests to not produce extra spaces, fix all .out files
@@ -81,7 +82,7 @@ class LastElapsedTime(ContextManager['LastElapsedTime']):
         self.cache: Dict[str, Dict[str, Dict[str, float]]]
 
         try:
-            with open(cache_file) as f:
+            with open(cache_file, encoding="utf-8") as f:
                 self.cache = json.load(f)
         except (OSError, ValueError):
             self.cache = {}
@@ -102,7 +103,7 @@ class LastElapsedTime(ContextManager['LastElapsedTime']):
         d.setdefault(self.env.imgproto, {})[self.env.imgfmt] = elapsed
 
     def save(self) -> None:
-        with open(self.cache_file, 'w') as f:
+        with open(self.cache_file, 'w', encoding="utf-8") as f:
             json.dump(self.cache, f)
 
     def __enter__(self) -> 'LastElapsedTime':
@@ -245,7 +246,7 @@ class TestRunner(ContextManager['TestRunner']):
         if self.env.debug:
             args.append('-d')
 
-        with f_test.open() as f:
+        with f_test.open(encoding="utf-8") as f:
             try:
                 if f.readline() == '#!/usr/bin/env python3':
                     args.insert(0, self.env.python)
@@ -256,7 +257,7 @@ class TestRunner(ContextManager['TestRunner']):
         env.update(self.test_run_env)
 
         t0 = time.time()
-        with f_bad.open('w') as f:
+        with f_bad.open('w', encoding="utf-8") as f:
             proc = subprocess.Popen(args, cwd=str(f_test.parent), env=env,
                                     stdout=f, stderr=subprocess.STDOUT)
             try:


