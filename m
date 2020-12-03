Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC67A2CCEF8
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 07:04:58 +0100 (CET)
Received: from localhost ([::1]:48958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkhjd-0006RQ-HQ
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 01:04:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1kkhho-0005yA-IZ
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 01:03:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1kkhhk-0001EU-M3
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 01:03:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606975378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QpINCT4mgMAC9w7Tv1U04X1ZiDTm7+clT6JDjn2rrcQ=;
 b=JSSs05iSE+laHHOyoBWyqcXCK3Ht29XIoL+8ACZN48gX6KtqzJR5ucmo6hAvqTKpk2+DC5
 uY5XhDY/+ncYkpxR3e01lMrIvGulvX6961P/KANYBwSZyBMWzW1yzrGLj/DI7LiiM2EcJ/
 hMauZUGhW5a7y2YBp1jASj7qATE5CXI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-MjlIfSdPM1O2rky4XEMPnw-1; Thu, 03 Dec 2020 01:02:56 -0500
X-MC-Unique: MjlIfSdPM1O2rky4XEMPnw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 681AB185E48B;
 Thu,  3 Dec 2020 06:02:55 +0000 (UTC)
Received: from kaapi (unknown [10.74.9.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C96585D6AC;
 Thu,  3 Dec 2020 06:02:47 +0000 (UTC)
Date: Thu, 3 Dec 2020 11:32:44 +0530 (IST)
From: P J P <ppandit@redhat.com>
To: =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v1 1/1] security-process: update process information
In-Reply-To: <20201202123418.GH2360260@redhat.com>
Message-ID: <15934ps9-4so0-p464-s473-3sps7s652021@erqung.pbz>
References: <20201130134907.348505-1-ppandit@redhat.com>
 <20201130134907.348505-2-ppandit@redhat.com>
 <20201202123418.GH2360260@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed;
 boundary="-1463810047-602030364-1606975374=:373362"
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
---1463810047-602030364-1606975374=:373362
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

+-- On Wed, 2 Dec 2020, Daniel P. Berrangé wrote --+
| > +    - If issue is found to be less severe, an upstream public bug (or an
| > +      issue) will be created immediately.
| 
| No need to repeat "or an issue". I think it would read more clearly as
| 
|    - If the severity of the issue is sufficiently low, an upstream public bug
|      may be created immediately.

* Let's settle on public GitLab issues, shall we? 

* Tomorrow after an issue triage if someone asks where should they create a 
  public tracker, it's better to have one definite answer, instead of choose 
  either LaunchPad or GitLab issues.

* OR is it better to have both? ie. file a public tracker anywhere as per ones 
  convenience?

* One GitLab is good I think.


Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D
---1463810047-602030364-1606975374=:373362--


