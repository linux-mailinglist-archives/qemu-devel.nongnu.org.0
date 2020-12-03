Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A659C2CCE72
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 06:24:39 +0100 (CET)
Received: from localhost ([::1]:59984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkh6c-0005LF-Ok
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 00:24:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1kkh4r-0004SC-Km
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 00:22:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1kkh4o-0004rb-Hl
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 00:22:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606972965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hSGhlTd50QfUwQV81Li/Lg+DREYqOis0aqaSQtpH+og=;
 b=C795dcpfL4xLM9hU1C0ick1hr1IvlkFEUw4vA6+XevIPRA4mXIxS6yJwCZLZFS+GOnLAGE
 Ych6TVgy24NItjEqcy1F/5t7qJY01QQueNskjjV/POkblQ6RS96x82BvQP1O0HwnK0EXS2
 sp5fTjPaWhm7j39V8ta1bfCHuYrIYIY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-civkyISRMIqC6vfDYCMFgw-1; Thu, 03 Dec 2020 00:22:42 -0500
X-MC-Unique: civkyISRMIqC6vfDYCMFgw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FCF7817B9A;
 Thu,  3 Dec 2020 05:22:41 +0000 (UTC)
Received: from kaapi (unknown [10.74.9.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 972C85C1BD;
 Thu,  3 Dec 2020 05:22:33 +0000 (UTC)
Date: Thu, 3 Dec 2020 10:52:29 +0530 (IST)
From: P J P <ppandit@redhat.com>
To: =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v1 1/1] security-process: update process information
In-Reply-To: <20201202123418.GH2360260@redhat.com>
Message-ID: <5p631n7r-1526-osoq-8p0-895n702r6352@erqung.pbz>
References: <20201130134907.348505-1-ppandit@redhat.com>
 <20201130134907.348505-2-ppandit@redhat.com>
 <20201202123418.GH2360260@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed;
 BOUNDARY="-1463810047-1424827038-1606972752=:373362"
Content-ID: <po986p58-oosn-8s48-4q41-r858qsr3p797@erqung.pbz>
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
 Stefan Hajnoczi <stefanha@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Darren Kenny <darren.kenny@oracle.com>, Michael Roth <michael.roth@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
---1463810047-1424827038-1606972752=:373362
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <5q4n7695-8or1-pr55-n676-4qps714783p@erqung.pbz>

  Hello Dan,

+-- On Wed, 2 Dec 2020, Daniel P. Berrangé wrote --+
| > +    - If issue is found to be less severe, an upstream public bug (or an
| > +      issue) will be created immediately.
| 
| No need to repeat "or an issue". I think it would read more clearly as
| 
|    - If the severity of the issue is sufficiently low, an upstream public bug
|      may be created immediately.

  Okay.
    
| > +    - If issue is found to be severe, an embargo process below is followed,
| > +      and public bug (or an issue) will be opened at the end of the set
| > +      embargo period.
| 
|    - If the severity of the issue requires co-ordinated disclosure at a future
|      date, then the embargo process below is followed, and public bug will be
|      opened at the end of the set embargo period.

  Okay.
  
| Somewhere around here is probably a good place to link to:
| 
|   https://www.qemu.org/docs/master/system/security.html
| 
| which describes why we'll consider some things to be not security issues

  Towards the end, there's a section about 'How impact & severity of an issue 
is decided', above link will fit in there good I think.

 
| > -If a security issue is reported that is not already publicly disclosed, an
| > -embargo date may be assigned and communicated to the reporter. Embargo
| > -periods will be negotiated by mutual agreement between members of the security
| > -team and other relevant parties to the problem. Members of the security contact
| > -list agree not to publicly disclose any details of the security issue until
| > -the embargo date expires.
| > +* If a security issue is reported that is not already public and is severe
| > +  enough, an embargo date may be assigned and communicated to the
| > +  reporter(s).
| 
| 
|   * If a security issue is reported that is not already public and its
|     severity requires coordinated disclosure, an embargo date may be
|     assigned and communicated to the reporter(s).
...
|   "The preferred embargo period will be upto 2 weeks, however, longer
|    embargoes can be negotiated if the severity of the issues requires it."

Okay, will add above changes.

Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D
---1463810047-1424827038-1606972752=:373362--


