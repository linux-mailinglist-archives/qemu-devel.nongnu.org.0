Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53ADD5EF8B0
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 17:28:19 +0200 (CEST)
Received: from localhost ([::1]:47110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odvSU-0005ZI-7X
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 11:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1odtHQ-0006Fi-BJ
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 09:08:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1odtHL-0000Mn-U9
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 09:08:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664456917;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=k6JifC321smGAO1vsobaiJ81FmKDfG9aLnY3pzYCsho=;
 b=CcKLIuStpmRN88V80MseuyQZm75OlRwz4N+/V7+j6jyBPqfQyfLQLJCaiNv7HR86zDPos5
 IXIRhoMI50xRlTzOb6uRmBSMlzVUmwuMHLr9E59ZmXZugpqDsG+D/GirHfkrsQf638+tr1
 JjMaOgyHIddKFKFCKD4etGCJn+1c4iM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-5RP_zvHHM0eVWVzGTha-6Q-1; Thu, 29 Sep 2022 09:08:34 -0400
X-MC-Unique: 5RP_zvHHM0eVWVzGTha-6Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE745101A528;
 Thu, 29 Sep 2022 13:08:33 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.75])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 38C96111F3D9;
 Thu, 29 Sep 2022 13:08:32 +0000 (UTC)
Date: Thu, 29 Sep 2022 14:08:29 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, thuth@redhat.com,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org
Subject: Re: Inscrutable CI jobs (avocado & Travis s390 check-tcg)
Message-ID: <YzWYzQtzrHGPxG8S@redhat.com>
References: <YyyxrNp+5XrmLi1Y@fedora> <Yy1gB1KB3YSIUcoC@redhat.com>
 <CAJSP0QUjT5nuiNnw-1AK4es3xjL57a5ZqopQ6YcqLkyYbtENDg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJSP0QUjT5nuiNnw-1AK4es3xjL57a5ZqopQ6YcqLkyYbtENDg@mail.gmail.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 29, 2022 at 09:01:21AM -0400, Stefan Hajnoczi wrote:
> I still don't know what the failures from the Avocado tests are:
> https://gitlab.com/qemu-project/qemu/-/jobs/3100466535
> https://gitlab.com/qemu-project/qemu/-/jobs/3100466546
> https://gitlab.com/qemu-project/qemu/-/jobs/3100466539
> https://gitlab.com/qemu-project/qemu/-/jobs/3100466548
> https://gitlab.com/qemu-project/qemu/-/jobs/3100466537
> 
> There are lots of logs and I don't know what to look for.

All of those show  'INTERRUPT: <non-zero-count>', and looking at
which tests report status INTERRUPT, shows that they are all
hitting the 2 minute timeout.

It is a different set of tests failing in each job, but that's
because in most of the other jobs  the failing tests are marked
CANCELLED due to not building the required QEMU binary.

The very few tests which do PASS are all very fast, not near
the 2 minute timeout.

Overall this looks pretty doomed.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


