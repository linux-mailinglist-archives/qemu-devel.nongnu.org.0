Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFAB2B7B73
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 11:36:31 +0100 (CET)
Received: from localhost ([::1]:46048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfKpC-0004Ir-IA
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 05:36:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1kfKlz-0000nC-O0
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 05:33:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1kfKlw-0005jK-QV
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 05:33:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605695587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8EXtJsF8ZgQJeG97govrWeD2oEbcdYUMUfvU4CLQ73g=;
 b=dKX9+safjNIFYA6AORFURtb+ZaffwaKQ3Xlf1Ff/BPvZ6Md7kVI8Qh8lyhwyHYSVzZYzju
 mAySwgtDbj8cc7DMBHJk/5t0vHufVoFXhw/p43AG/G6EB/K7JvNSsV/ExQR1D0MwQj0f1h
 eIubPx21FdPCgHlDvjE/kDUHdfoNJIU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-0w7koYMcMRu_UPYCg2XNhQ-1; Wed, 18 Nov 2020 05:33:04 -0500
X-MC-Unique: 0w7koYMcMRu_UPYCg2XNhQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0CF4188C12A;
 Wed, 18 Nov 2020 10:33:02 +0000 (UTC)
Received: from kaapi (unknown [10.33.36.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B1B75B4BC;
 Wed, 18 Nov 2020 10:32:55 +0000 (UTC)
Date: Wed, 18 Nov 2020 16:02:52 +0530 (IST)
From: P J P <ppandit@redhat.com>
To: =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: About 'qemu-security' mailing list
In-Reply-To: <20201117163514.GG135624@redhat.com>
Message-ID: <50o576n9-9p18-66qs-4qs3-7s7488r18sr0@erqung.pbz>
References: <nycvar.YSQ.7.78.906.2009151536090.10832@xnncv>
 <20200916111025.GA756728@stefanha-x1.localdomain>
 <nycvar.YSQ.7.78.906.2009181031500.10832@xnncv> <m2362z8dvx.fsf@oracle.com>
 <nycvar.YSQ.7.78.906.2010011502290.830962@xnncv> <m2mu166uyg.fsf@oracle.com>
 <nycvar.YSQ.7.78.906.2010012320290.830962@xnncv>
 <nycvar.YSQ.7.78.906.2010161910530.1246156@xnncv>
 <20201117144612.GA140001@stefanha-x1.localdomain>
 <20201117161942.GA147428@stefanha-x1.localdomain>
 <20201117163514.GG135624@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed;
 BOUNDARY="-1463811718-2123019466-1605693429=:10469"
Content-ID: <prso18r2-47r2-r16-287o-28sq4q703qnn@erqung.pbz>
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: peter.maydell@linaro.org, sstabellini@kernel.org,
 Petr Matousek <pmatouse@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, mst@redhat.com,
 QEMU Developers <qemu-devel@nongnu.org>,
 Darren Kenny <darren.kenny@oracle.com>, michael.roth@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
---1463811718-2123019466-1605693429=:10469
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <5spqopp4-66o-41n6-s9p-3874o53s619@erqung.pbz>

  Hello Dan, Stefan,

+-- On Tue, 17 Nov 2020, Daniel P. Berrangé wrote --+
| On Tue, Nov 17, 2020 at 04:19:42PM +0000, Stefan Hajnoczi wrote:
| > Dan and I tried out confidential issues and unfortunately it is
| > currently too limited for our workflow.
| > 
| > It is not possible to add non-members to a confidential issue. Members
| > need at least the 'Reporter' role to view confidential issues, and then
| > they can view all of them (!).
| > 
| > This means there is no way of working on a need-to-know basis. We would
| > have to give anyone who ever needs to comment on an issue access to all
| > other issues :(.
| > 
| > Dan found this open feature request from 2 years ago:
| > https://gitlab.com/gitlab-org/gitlab/-/issues/20252
| > 
| > For now I think we should stick to email.

  I think email is best and easiest for all.

| > I'm still concerned about the prospect of writing custom mailing list 
| > software and hosting it somewhere. Can we run an encrypted mailing list 
| > without developing the software ourselves?
| 
| We certainly should NOT get into the business of writing or hosting
| custom solutions ourselves IMHO. Even if someone volunteers to do the
| work upfront, that'll inevitably turn into abandonware a few years
| hence when the interested party moves onto other things.

* I don't know of any list provider which supports encryption.

* For custom software, there is this 'schleuder' project

   -> https://0xacab.org/schleuder/schleuder
   -> https://schleuder.org/schleuder/docs/concept.html
      A gpg-enabled mailing list manager with resending-capabilities.  

* I have not used it or played with it.


| I still question whether we genuinely need encrypted mailing lists in
| the first place.
| 
| Our of all the security reports QEMU has received how many reporters
| actually used GPG to encrypt their reporters, and how often did the
| security team actually keep using GPG when triaging and resolving it
| thereafter.
| 
| Out of countless security issues I've dealt with across many software
| projects for 10 years, there have been less than 5 occassions where
| encryption was used with email by a bug reporter notifying me, and out
| of those only 1 of them actually justified the use of GPG.
| 
| For projects that did use confidential issues, they still all emailed
| notifications in clear text behind the scenes regardless.
|
| Is it not sufficient to just use a regular mailing list by default,
| and continue publish security team pgp email addrs + keys for the
| few cases where pgp might be desired.

* True, need & usage of encryption is debatable and difficult.

* Above points and possible solution of keeping the current handful PGP keys 
  available did come up earlier

  -> https://lists.nongnu.org/archive/html/qemu-devel/2020-09/msg05213.html


* At this point I think, let's get started with a regular list for now. We can 
  still continue to explore encryption support options.


@Stefanha: do we need to file a request ticket to create 'qemu-security' list?


Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D
---1463811718-2123019466-1605693429=:10469--


