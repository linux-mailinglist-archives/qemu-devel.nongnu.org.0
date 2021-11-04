Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31535445586
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 15:41:41 +0100 (CET)
Received: from localhost ([::1]:59936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1midvw-0002zB-C0
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 10:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1miduZ-0002D3-Rs
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:40:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1miduU-0002XY-SM
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:40:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636036809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uyKyjlVBrxiObe1eGgFYNDUNRgTvlHtC/UamQsMG9k8=;
 b=K3a/Qrg+s5CCa5MLMBOOKNzYbssWBXgU1LdbQGCXjjMm1XNLW/mV3c6QzNtJrJA6wE4rsm
 8ipSQHFqUC62lwZvz61ANrO9xd4+rpmsRV6ExoKHgi3ojWvT2ZsCrDzvv06zpvSdtXIca4
 +ONj2mqO1H8/wd83Ay4eHQEgvssiPoc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-R-b15ZMvOS-saMqHSsXEAQ-1; Thu, 04 Nov 2021 10:40:06 -0400
X-MC-Unique: R-b15ZMvOS-saMqHSsXEAQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01C30A0BD7;
 Thu,  4 Nov 2021 14:40:05 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CAD1167842;
 Thu,  4 Nov 2021 14:39:31 +0000 (UTC)
Date: Thu, 4 Nov 2021 15:39:30 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v3 03/12] vfio-user: define vfio-user-server object
Message-ID: <YYPwogn87tMf0p7s@redhat.com>
References: <cover.1633929457.git.jag.raman@oracle.com>
 <13dba991f1de91711e5c3cad9a332d6e7c5eee7b.1633929457.git.jag.raman@oracle.com>
 <YXly2vSh/bhgr0i/@stefanha-x1.localdomain>
 <6346833B-469B-487B-8382-62EA03BA56C2@oracle.com>
 <YX/Cx7g0D5o8dVtp@stefanha-x1.localdomain>
 <87wnloce5t.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87wnloce5t.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "thuth@redhat.com" <thuth@redhat.com>, Jag Raman <jag.raman@oracle.com>,
 "swapnil.ingle@nutanix.com" <swapnil.ingle@nutanix.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 04.11.2021 um 13:13 hat Markus Armbruster geschrieben:
> The old syntax almost always has its quirks.  Ideally, we'd somehow get
> from quirky old to boring new in an orderly manner.  Sadly, we still
> don't have good solutions for that.  To make progress, we commonly
> combine JSON new with quirky old.
> 
> qemu-system-FOO -object works that way.  object_option_parse() parses
> either JSON or QemuOpts.  It wraps the former in a QObject visitor, and
> the latter in an opts visitor.
> 
> QemuOpts is flat by design[*], so the opts visitor parses flat QemuOpts
> from a (possibly non-flat) QAPI type.  How exactly it flattens, and how
> it handles clashes I don't remember.
> 
> Sadly, this means that we get quirky old even for new object types.

For -object in the system emulator (the tools all use the keyval
visitor, so there it would work as expected), the only reason that we
need to keep the quirky old code path around is the list handling in
memory-backend.host-nodes.

The main difficulty there is that the old QemuOpts based code path
allows specifying the option twice and both of them would effectively be
combined. Do we have any idea how to replicate this in a keyval parser
based world?

If not, do we want to use the remaining time until 6.2 to deprecate
this? The nasty part is that the only syntax that works both now and in
the future is JSON. We can't easily accept the new keyval syntax while
still using the QemuOpts based code.

Kevin


