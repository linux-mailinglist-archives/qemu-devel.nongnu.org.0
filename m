Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD8B2F62ED
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 15:20:00 +0100 (CET)
Received: from localhost ([::1]:53942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l03Tj-0004Qk-Ig
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 09:19:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1l03E6-0005Hq-S2
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 09:03:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1l03E1-0000DM-Iw
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 09:03:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610633022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=Bk53ZRMndbKjYoOAHJiwOp1kWc+NeUqqVNMQr3yOJMk=;
 b=ePX+yjGDLjCRiXD1N0mjejO7a4eADMkVvF9nEVgh/iWJ+wav25h062gytB0E3IE7gKuXZZ
 EMWGKAbHeKQMVjGFPHdXIShyuB9h143Z+MSdM++5LYkTUNVzTBXqXG8loBV0Du6Ht93aVQ
 h9RV5tMvUSp8FITXyTDvlRHbuCiOwM0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-RNCPzRyNMBmHzplafWNrkg-1; Thu, 14 Jan 2021 09:03:40 -0500
X-MC-Unique: RNCPzRyNMBmHzplafWNrkg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D6C084E240
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 14:03:40 +0000 (UTC)
Received: from kaapi (unknown [10.33.36.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F286918A50;
 Thu, 14 Jan 2021 14:03:37 +0000 (UTC)
Date: Thu, 14 Jan 2021 19:33:32 +0530 (IST)
From: P J P <ppandit@redhat.com>
To: qemu-devel@nongnu.org
Subject: About 'qemu-security' list subscription process
Message-ID: <r95p856o-o5r3-1r88-p675-2111r17p7794@erqung.pbz>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; format=flowed; charset=US-ASCII
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Michael Tsirkin <mtsirkin@redhat.com>,
 Daniel Berrange <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

   Hello,

* We have received quite a few subscription requests for the 'qemu-security'
   list in the last few weeks. Majority of them are rejected because we could
   not identify the user from merely their email-id.

* I have requested them to send a subscription request email with a 'Self
   Introduction' to the list.

* However, some of the subscribers are familiar from the
   qemu-devel/oss-security mailing lists. And some are corporate emails like
   <secalert@rh.c>

* One of the request is pending (3+) votes/acks for OR against member
   subscription.

How do we handle these requests?

Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D


