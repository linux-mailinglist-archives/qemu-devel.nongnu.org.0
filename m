Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9057C2C2973
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 15:27:09 +0100 (CET)
Received: from localhost ([::1]:47310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khZHf-0002HT-PU
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 09:27:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1khZFj-0000W1-4Y
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 09:25:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1khZFf-0004kK-SF
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 09:25:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606227899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oPZI9+rUQSocXdsQbgYb1zE60Id1L88PFgYmW1+zHI0=;
 b=jV9nU76115+RI9dfHUH9bIeAev+y2LkyeAtgUXSbp6U0ILqRUR41IvghjYVjtwscrwk/SI
 nAmN9e53b9ApuVt1a9mt2WwTqlUPehZMRaM+xMt0vffhO6ARk4qio85FRsbN7YlUkY0Ll3
 q+7P5orJfLD9lOE2XU7vLayP/2g9NKQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-755TgLtvOASxItoFg5_kGg-1; Tue, 24 Nov 2020 09:24:55 -0500
X-MC-Unique: 755TgLtvOASxItoFg5_kGg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8CA21084C80;
 Tue, 24 Nov 2020 14:24:53 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.74.8.206])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AB6763BA7;
 Tue, 24 Nov 2020 14:24:41 +0000 (UTC)
From: P J P <ppandit@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Subject: [RFC 0/1] security-process: update with mailing list details
Date: Tue, 24 Nov 2020 19:52:37 +0530
Message-Id: <20201124142238.225417-1-ppandit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: peter.maydell@linaro.org, Stefano Stabellini <sstabellini@kernel.org>,
 Petr Matousek <pmatouse@redhat.com>, Prasad J Pandit <pjp@fedoraproject.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, secalert@redhat.com,
 Michael Roth <michael.roth@amd.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Darren Kenny <darren.kenny@oracle.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Prasad J Pandit <pjp@fedoraproject.org>

Hello,

* After upstream discussions and considering various options like
  LaunchPad bugs, GitLab issues etc.

  -> https://lists.nongnu.org/archive/html/qemu-devel/2020-09/msg04266.html
  -> https://lists.nongnu.org/archive/html/qemu-devel/2020-10/msg00059.html

  We are about to introduce a 'qemu-security' mailing list to receive and
  triage upstream QEMU security issues.

* Intention is to allow more community participation in handling and
  triaging of the QEMU security issues.

* This change relieves current set of individual contacts from the
  responsibility of handling upstream QEMU issues. Of course they are
  welcome to the new 'qemu-security' mailing list.

* To simplify the encrypted communication process, we keep only a single
  contact of <secalert@redhat.com> from our previous list of contacts.

  This way reporters need not look for and manage GPG keys of multiple
  contacts.

* This patch updates the QEMU security-process web page with these
  details.

I'd appreciate if you have any inputs and/or suggestions for this change.

Thank you.
--
Prasad J Pandit (1):
  security-process: update process information

 contribute/security-process.md | 105 +++++++++++++++++----------------
 1 file changed, 55 insertions(+), 50 deletions(-)

--
2.28.0


