Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AE92CCEBC
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 06:42:45 +0100 (CET)
Received: from localhost ([::1]:43054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkhO8-0002Yw-7F
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 00:42:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1kkhJ6-0001dr-I3
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 00:37:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1kkhJ3-0001h4-Sh
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 00:37:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606973848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gmNqrm9qQBrOyqus/MOup94P+2jUK5Qt0TaMwRg2juo=;
 b=cCJ7e5LWHyS/DHeI3BwjS5Zg0qwGrLFZi39JuWfd0Upn5SAQVzoJTyiWm+Ctfgunf4GiYI
 9P8YKChpzOhFRH3Ubh20fc8D86I1oAcEwKD7Ts4bEJQqKt8+oswRHUF3K7fcFR7NND2yPe
 CwpWRjXE12rkPF32U/ji6IX3iFbtNSQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-4rEq6CqyPM2lxxiskt1u8A-1; Thu, 03 Dec 2020 00:37:24 -0500
X-MC-Unique: 4rEq6CqyPM2lxxiskt1u8A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B8B256C35;
 Thu,  3 Dec 2020 05:37:22 +0000 (UTC)
Received: from kaapi (unknown [10.74.9.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E386960C5C;
 Thu,  3 Dec 2020 05:37:03 +0000 (UTC)
Date: Thu, 3 Dec 2020 11:06:59 +0530 (IST)
From: P J P <ppandit@redhat.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 1/1] security-process: update process information
In-Reply-To: <alpine.DEB.2.21.2012021924520.30425@sstabellini-ThinkPad-T480s>
Message-ID: <r3op64po-1443-nsqo-qop-2651n1o1326s@erqung.pbz>
References: <20201130134907.348505-1-ppandit@redhat.com>
 <20201130134907.348505-2-ppandit@redhat.com>
 <20201202123418.GH2360260@redhat.com>
 <alpine.DEB.2.21.2012021924520.30425@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed;
 boundary="-1463810047-818329000-1606973841=:373362"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
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
Cc: peter.maydell@linaro.org, Petr Matousek <pmatouse@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Darren Kenny <darren.kenny@oracle.com>, Michael Roth <michael.roth@amd.com>,
 =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
---1463810047-818329000-1606973841=:373362
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

  Hello Dan, Stefano,

+-- On Wed, 2 Dec 2020, Stefano Stabellini wrote --+
| On Wed, 2 Dec 2020, Daniel P. Berrangé wrote:
| > > +  any third parties, including Xen Security Project, without your prior
| > > +  permission.
| > 
| > Why this explicit note about the Xen project ?  What if we decide to want
| > a member of the Xen security team on the QEMU security mailing list so that
| > we can collaborate on triage ?

* While that's fair point, what I think it means is, even if members from 
  other communities are present on the qemu-security list, any explicit 
  communication and/or sharing of issue details/information/reproducers etc.  
  across communities, with non-members will not happen without prior 
  permission from the reporter(s).

* Besides, that is not new text, it is from the current process page

  -> https://www.qemu.org/contribute/security-process/


| this is not an issue because the individual (probably me) of course
| would not report anything to the Xen security team without prior
| permission.

 +1000..., appreciate it.:)

| >      Any non-public information you share about security issues, is kept
| >      confidential between members of the QEMU security team, and a minimal
| >      number of supporting staff in their affliated companies.  Information
| >      will not be disclosed to other third party organizations/individuals
| >      without prior permission from the reporter
| 
| Sounds good to me

Same here, will fix it.

Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D
---1463810047-818329000-1606973841=:373362--


