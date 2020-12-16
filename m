Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAA62DC2C9
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 16:11:09 +0100 (CET)
Received: from localhost ([::1]:58116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpYSI-000604-5R
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 10:11:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1kpYQ2-0004Ss-CH
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:08:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1kpYPz-00013w-0V
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:08:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608131318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=NMNfusSdXdqfywyih8ygmVnTve97vxNBtIiHvbOTWqQ=;
 b=JKljiQ9DV5Y8qzmb3i3BtW5nrFH3Cd5Rjin6Ocz/JkVFWkMenGjmZOM1RV7CZQO5HAeCGA
 XCltm64NJlfad23En3JBAY7fuXUKL/VEjNbith9rbJbu0XAD6TsqlBlJfNTLYBOK6BN5M9
 MFJI6/27Zflxo5IBUWfrZeiWEnhDiJc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-93SnedfXNSK0t9bU_Q3cOQ-1; Wed, 16 Dec 2020 10:08:35 -0500
X-MC-Unique: 93SnedfXNSK0t9bU_Q3cOQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94F50100C608;
 Wed, 16 Dec 2020 15:08:33 +0000 (UTC)
Received: from kaapi (ovpn-113-255.ams2.redhat.com [10.36.113.255])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 64E7D62A24;
 Wed, 16 Dec 2020 15:08:30 +0000 (UTC)
Date: Wed, 16 Dec 2020 20:38:25 +0530 (IST)
From: P J P <ppandit@redhat.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [ANNOUNCE] qemu-security mailing list
Message-ID: <9o47rr38-30r2-8r7-8rp8-6p7634sss92@erqung.pbz>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; format=flowed; charset=US-ASCII
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Michael Tsirkin <mtsirkin@redhat.com>, Petr Matousek <pmatouse@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Daniel Berrange <berrange@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 oss security list <oss-security@lists.openwall.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

   Hello,

* QEMU project has set-up a dedicated mailing list to receive and triage all
   its security issues.

   Please see:
     -> https://www.qemu.org/contribute/security-process/
     -> https://lists.nongnu.org/mailman/listinfo/qemu-security

* If you are a security researcher OR think you've found a potential security
   issue in QEMU, please kindly follow the new process to report your issues.

* This is a moderated mailing list. It is meant for systematic handling of
   QEMU security issues and coordinate their public disclosure.

* Membership of this list is limited to people involved in the analysis and
   triage of QEMU security issues.

* To report QEMU security issues you need/should not subscribe to this list.

* We'd like to invite representatives of security teams who are downstream
   consumers of QEMU to contact the list, if they wish to participate in the
   triage process.

* All members will be required to agree and adhere to the embargo rules and
   restrictions.


Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D


