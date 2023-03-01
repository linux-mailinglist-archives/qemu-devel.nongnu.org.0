Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8ACB6A6B18
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 11:52:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXK4Q-0002IG-PL; Wed, 01 Mar 2023 05:52:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1pXK4L-0002Hl-Ms
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:52:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1pXK4J-0005Dr-Sr
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:52:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677667939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S+mrEWDL8Tgz0XiEgIjDcf17xP/BGIvfT4Zchz5/qoE=;
 b=iRxNntgT+avyXeQQy8OmUNeEKhDgfPfPOtJnBBen38kAQt8AhZvJ835DO8AsvR1qq12P38
 6wrQAvsDBcukcvYqA/YXgLtIw75HzwFERijzrLe4yRWaivTvX//nVE03JA6QAz503IB8CU
 a6kq6S9HvEBuXRyh/kmZ1yDEh+ACuVw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-Vm7DufplPs-BhI7KY4_PzA-1; Wed, 01 Mar 2023 05:52:16 -0500
X-MC-Unique: Vm7DufplPs-BhI7KY4_PzA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D9AE101A52E;
 Wed,  1 Mar 2023 10:52:15 +0000 (UTC)
Received: from localhost (unknown [10.39.192.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A0BE2026D4B;
 Wed,  1 Mar 2023 10:52:15 +0000 (UTC)
Date: Wed, 1 Mar 2023 10:52:14 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, alxndr@bu.edu, pbonzini@redhat.com,
 bsd@redhat.com, stefanha@redhat.com, darren.kenny@oracle.com,
 Qiuhao.Li@outlook.com, fam@euphon.net, lvivier@redhat.com,
 berrange@redhat.com
Subject: Re: [PATCH] tests: Ensure TAP version is printed before other messages
Message-ID: <20230301105214.GZ7636@redhat.com>
References: <20230227174019.1164205-1-rjones@redhat.com>
 <6e28af8e-3e71-9888-8832-786550b81983@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e28af8e-3e71-9888-8832-786550b81983@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Feb 28, 2023 at 09:30:56PM +0100, Thomas Huth wrote:
> On 27/02/2023 18.40, Richard W.M. Jones wrote:
> >These two tests were failing with this error:
> >
> >   stderr:
> >   TAP parsing error: version number must be on the first line
> >   [...]
> >   Unknown TAP version. The first line MUST be `TAP version <int>`. Assuming version 12.
> >
> >This can be fixed by ensuring we always call g_test_init first in the
> >body of main.
> >
> >Thanks: Daniel Berrange, for diagnosing the problem
> >Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> >---
> >  tests/qtest/fuzz-lsi53c895a-test.c | 4 ++--
> >  tests/qtest/rtl8139-test.c         | 5 +++--
> >  2 files changed, 5 insertions(+), 4 deletions(-)
> >
> >diff --git a/tests/qtest/fuzz-lsi53c895a-test.c b/tests/qtest/fuzz-lsi53c895a-test.c
> >index a9254b455d..2012bd54b7 100644
> >--- a/tests/qtest/fuzz-lsi53c895a-test.c
> >+++ b/tests/qtest/fuzz-lsi53c895a-test.c
> >@@ -112,12 +112,12 @@ static void test_lsi_do_dma_empty_queue(void)
> >  int main(int argc, char **argv)
> >  {
> >+    g_test_init(&argc, &argv, NULL);
> >+
> >      if (!qtest_has_device("lsi53c895a")) {
> >          return 0;
> 
> Could you please double-check that the !lsi53c895a case works fine,
> too? (just temporarily change it into a "if (1) { ..." statement)
> ... I'm a little bit afraid that the TAP protocol might be
> incomplete without the g_test_run() at the end otherwise. If so, you
> might now need a "goto out" instead of the "return 0" here...

Applying ...

diff --git a/tests/qtest/fuzz-lsi53c895a-test.c b/tests/qtest/fuzz-lsi53c895a-test.c
index 2012bd54b7..e0c902aac4 100644
--- a/tests/qtest/fuzz-lsi53c895a-test.c
+++ b/tests/qtest/fuzz-lsi53c895a-test.c
@@ -114,7 +114,7 @@ int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
 
-    if (!qtest_has_device("lsi53c895a")) {
+    if (1) {
         return 0;
     }
 
... and rerunning the tests, everything still passes.

The stdout of the test after this change is:

TAP version 13
# random seed: R02S1c1f371a09fbfdf0dd747f898d55fe97

but apparently this version of TAP doesn't care (perhaps because the
number of tests "1..2" is never printed?)

Anyway it doesn't appear to be a problem.

glib2-2.75.3-4.fc39.x86_64

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
libguestfs lets you edit virtual machines.  Supports shell scripting,
bindings from many languages.  http://libguestfs.org


