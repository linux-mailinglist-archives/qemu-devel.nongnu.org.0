Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7FC2CBCCB
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 13:20:48 +0100 (CET)
Received: from localhost ([::1]:58026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkR7n-0000Le-ST
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 07:20:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1kkR6V-0007lw-BV
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 07:19:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1kkR6T-000496-J7
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 07:19:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606911564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rr5+tAZC743ep8ViQj7oWKgxVWvzBpM8aWv90Q8bmPs=;
 b=DbLnZDgGshIPpbJ1Jn3sNdhgdGw2yYpVxz/jIvDpRFNWtwGDVt6fEEIYh2OW6rExu2St7G
 CZ5805rgK7TPp3Hrlgj+SGIedZTj5vG8OVBzH4aX7CAjJFbE6LugSM8YFlzC7t5qze6FwQ
 LqleuQRYn50FBsGVi862zdRjLB9JNc4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-4RGRZmAuP4-dt36LrC5U2Q-1; Wed, 02 Dec 2020 07:19:20 -0500
X-MC-Unique: 4RGRZmAuP4-dt36LrC5U2Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3D511007477;
 Wed,  2 Dec 2020 12:19:18 +0000 (UTC)
Received: from kaapi (unknown [10.33.36.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BADD60BFA;
 Wed,  2 Dec 2020 12:19:10 +0000 (UTC)
Date: Wed, 2 Dec 2020 17:49:04 +0530 (IST)
From: P J P <ppandit@redhat.com>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH v1 1/1] security-process: update process information
In-Reply-To: <20201201194944.GC2246@char.us.oracle.com>
Message-ID: <53s58rn-8np7-28so-81sr-q3sp6no0po26@erqung.pbz>
References: <20201130134907.348505-1-ppandit@redhat.com>
 <20201130134907.348505-2-ppandit@redhat.com>
 <20201201194944.GC2246@char.us.oracle.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, Stefano Stabellini <sstabellini@kernel.org>,
 Petr Matousek <pmatouse@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Darren Kenny <darren.kenny@oracle.com>, Michael Roth <michael.roth@amd.com>,
 =?ISO-8859-15?Q?Daniel_P_=2E_Berrang=E9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hello Konrad, all

+-- On Tue, 1 Dec 2020, Konrad Rzeszutek Wilk wrote --+
| On Mon, Nov 30, 2020 at 07:19:07PM +0530, P J P wrote:
| > We are about to introduce a qemu-security mailing list to report
| > and triage QEMU security issues.
| > Update the QEMU security process web page with new mailing list
| > and triage details.
| 
| Thank you for doing it!
| Reviewed-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>

Thank you.
 
| with one change below.
| 
| > +    - Request a CVE and open an upstream
| > +      [bug](https://bugs.launchpad.net/qemu/+bug/)
| > +      or a [GitLab](https://gitlab.com/groups/qemu-project/-/issues) issue
| 
| You may want to clarify that this step in the process will not disclose the 
| details of the issue to the public.

  Yes, this is covered in the following process text and under publication 
embargo section:

===
+ * We aim to process ... 60 days ... After the triaging step above
+
+    - If issue is found to be less severe, an upstream public bug (or an
+      issue) will be created immediately.
+    - If issue is found to be severe, an embargo process below is followed,
+      and public bug (or an issue) will be opened at the end of the set
+      embargo period.
...
+* Embargo periods will be negotiated by mutual agreement between reporter(s),
+  members of the security list and other relevant parties to the problem.
+  Such embargo period is generally upto [2 weeks]
+
+* Members of the security list agree not to publicly disclose any details of
+  an embargoed security issue until its embargo date expires.
===


Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D


