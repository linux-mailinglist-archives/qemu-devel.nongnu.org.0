Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6EC30F77F
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 17:20:16 +0100 (CET)
Received: from localhost ([::1]:43516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7hMb-0002kR-Fj
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 11:20:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7hBr-0000HD-H2
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:09:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7hBe-000793-5s
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:09:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612454930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dVnc9uBWVhMZ1BerLVD3jcsFb246vNgQ6U3MaUGeJjw=;
 b=Qm/+9uPfWIdNuBzKexItuebRQ6wLv3WU1Vqoy9ut7MPyVxK1iU/mk1NnYZFuKg3iLnnoR9
 MK/8EmnMFylRGgnR0X21UdWBo3cp53rb+OJefPAZKcXUFOws0uH1Ny5zjmdM51EZQL5d2h
 w764jx4FdRPkYYCiv/Z5Tp6rBrGoGHE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-olUpujmyNN23pKR-_XWrvQ-1; Thu, 04 Feb 2021 11:08:46 -0500
X-MC-Unique: olUpujmyNN23pKR-_XWrvQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CAE65801964;
 Thu,  4 Feb 2021 16:08:44 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-90.ams2.redhat.com [10.36.112.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A48517D85;
 Thu,  4 Feb 2021 16:08:43 +0000 (UTC)
Subject: Re: getting the console output for s390 cdrom-test?
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAFEAcA8=vG-2Vzrdark8VC5NANe5Fb3qGTpSFk8X94KvXszTbA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <c98d4f43-5a29-afcc-fe7d-a3d92063df3a@redhat.com>
Date: Thu, 4 Feb 2021 17:08:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8=vG-2Vzrdark8VC5NANe5Fb3qGTpSFk8X94KvXszTbA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Eric Farman <farman@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-s390x <qemu-s390x@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/01/2021 21.32, Peter Maydell wrote:
> Hi; I've been looking at why the s390 cdrom test has an intermittent
> failure on my aarch64 box. Looking at some TCG debug log output
> I think what is happening is that sometimes execution diverges from
> a successful run inside virtio_scsi_setup() and we end up failing
> a vs_assert(), which triggers a "Guest crashed on cpu 0: disabled-wait"
> which then makes the qtest hang until its timeout.
> 
> I think that vs_assert() ought to be printing some information
> to the console about which assert fails when it happens, but
> how do I need to tweak the qtest to get it to capture this
> console log somewhere?

  Hi!

Sorry for the late reply ... did you get any further with this already? 
Anyway, in case I need to get the console of a test, I normally modify the 
test case like this:

diff --git a/tests/qtest/cdrom-test.c b/tests/qtest/cdrom-test.c
index 5af944a5fb..52f7ed050d 100644
--- a/tests/qtest/cdrom-test.c
+++ b/tests/qtest/cdrom-test.c
@@ -120,7 +120,7 @@ static void test_cdboot(gconstpointer data)
  {
      QTestState *qts;

-    qts = qtest_initf("-accel kvm -accel tcg -no-shutdown %s%s", (const 
char *)data,
+    qts = qtest_initf("-serial file:/tmp/stdio.txt -accel kvm -accel tcg 
-no-shutdown %s%s", (const char *)data,
                        isoimage);
      boot_sector_test(qts);
      qtest_quit(qts);

> PS: it would be nice if "guest BIOS asserts and puts the
> system into a detected-guest-crash state" resulted in the
> test failing rather than hanging :-)

We could maybe check for panic events in boot_sector_test() ... I can have a 
try when time permits...

> (Annoyingly, most of my attempts to get more information about
> where things go wrong seem to cause the bug to stop manifesting
> itself: eg building the s390-ccw.img without -O2; enabling
> TCG 'exec' logging; enabling 'trace:virtio*' tracepoints.
> The failure itself started with commit 7a3d37a3f233 updating
> the s390 bios blobs, but the changes that went into the new
> blobs don't really look like they would be responsible.
> I am starting to have gloomy thoughts about potential missing
> memory barrier insns between the CPU thread and the iothread
> doing the virtio device end of things...)

A Heisen-bug ... ugh ... but I wonder whether it's maybe rather an issue in 
the aarch64 TCG backend, since we've never seen this on other architectures 
before?

  Thomas


