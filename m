Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D4B3D01D5
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 20:41:35 +0200 (CEST)
Received: from localhost ([::1]:56386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ugQ-00075z-GV
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 14:41:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m5ufP-0006LM-7A
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 14:40:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m5ufL-0008CH-UN
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 14:40:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626806425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hNNrcMgZ1Awz4nhdW1FDeCJsLH7M5wFmy+OCewjrgiE=;
 b=bzqoxTI55ph29PocoSQuqBqypZZ4V04aJomAlDicVvW1cd3SAnEeni03ygLfgb1jQxfkk9
 UG/UMXspC+0qlLabU51xmT4KYSaLt7SaHF2lQNZY3pNYB/cE7amZ18NRSXm+Nh8sI0VxoP
 dv29YLrC28E8fNgIX/DjqCnUFeVTzrA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-pQSabpO7ONG-qjX38rYZAA-1; Tue, 20 Jul 2021 14:40:24 -0400
X-MC-Unique: pQSabpO7ONG-qjX38rYZAA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DBEF19057A1;
 Tue, 20 Jul 2021 18:40:23 +0000 (UTC)
Received: from p50.localhost.localdomain.some.host.somewhere.org
 (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD3A619CBA;
 Tue, 20 Jul 2021 18:39:55 +0000 (UTC)
References: <CA+bd_6+2zk0N=s-D2OG4FUZ-HirJ+8HkMUktF=Jqyf9_HhyH1w@mail.gmail.com>
 <287d8097-f865-6f89-6062-567a7994987c@redhat.com>
 <87wnpr4t0d.fsf@p50.localhost.localdomain>
 <418D3B29-010B-4B5B-A310-F3E3DA110DA9@oracle.com>
User-agent: mu4e 1.4.15; emacs 27.2
From: Cleber Rosa <crosa@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Subject: Re: tests/acceptance/multiprocess.py test failure
In-reply-to: <418D3B29-010B-4B5B-A310-F3E3DA110DA9@oracle.com>
Date: Tue, 20 Jul 2021 14:39:54 -0400
Message-ID: <87o8aw3k3p.fsf@p50.localhost.localdomain>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Willian Rampazzo <willianr@redhat.com>,
 David Hildenbrand <dhildenb@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Jag Raman writes:

>
> Hi Cleber,
>
> We presently don=E2=80=99t have permissions to send a PR to
> upstream (Peter Maydell).
>
> Presently, we are requesting someone else who has
> permissions to do PRs on our behalf. We will work
> on getting permissions to send PRs going forward.
>
> Thank you!

Hi Jag,

I'm going to include that patch in an upcoming PR.  Please let me know
if this is not what you intended.

PS: I'm not sure I follow what your specific permission problem is, if
it's technical or something else.  But, in either case, I'd recommend you
sync the MAINTAINERS file entries with your roles/abilities to maintain
those files listed.

Best Regards,
- Cleber.


