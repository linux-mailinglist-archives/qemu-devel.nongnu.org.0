Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3AE1E9E62
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jun 2020 08:42:32 +0200 (CEST)
Received: from localhost ([::1]:57498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jfe9X-0000B8-9H
	for lists+qemu-devel@lfdr.de; Mon, 01 Jun 2020 02:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1jfe8V-000846-HQ
 for qemu-devel@nongnu.org; Mon, 01 Jun 2020 02:41:27 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53438
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1jfe8U-0004i3-3X
 for qemu-devel@nongnu.org; Mon, 01 Jun 2020 02:41:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590993660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=41eQ7L9hqWwrnm7aHSGn7/s+QYvBPldg1IdhvRfTNKk=;
 b=UsgNfqlQFjuS/HOu2Tt7TWFPqrjZnp+yIozR+YPdXsBIJiiRsEOq4+S8QTJ2W5Z424qiWt
 A36vGOTm73RWT/JNJ081wEHgFFtfWUd7hXsTyLQOOJHrsOfnBmqrugN9CTuSXC/yvTQKBQ
 smnIZxbjKFFXuBkmm2zVSmc4YVJxvFs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-eR-K0Do_NMe1_wTDLPIKAQ-1; Mon, 01 Jun 2020 02:40:56 -0400
X-MC-Unique: eR-K0Do_NMe1_wTDLPIKAQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 606A58015CF;
 Mon,  1 Jun 2020 06:40:55 +0000 (UTC)
Received: from kaapi (ovpn-116-190.sin2.redhat.com [10.67.116.190])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CDDE560BE1;
 Mon,  1 Jun 2020 06:40:46 +0000 (UTC)
Date: Mon, 1 Jun 2020 12:10:43 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@kaapi
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] msix: add valid.accepts methods to check address
In-Reply-To: <20200601020410-mutt-send-email-mst@kernel.org>
Message-ID: <nycvar.YSQ.7.77.849.2006011209280.62159@xnncv>
References: <20200601051454.826415-1-ppandit@redhat.com>
 <20200601020410-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.120; envelope-from=ppandit@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/01 02:19:57
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Alexander Bulekov <alxndr@bu.edu>,
 Anatoly Trosinenko <anatoly.trosinenko@gmail.com>, Ren Ding <rding@gatech.edu>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>,
 Hanqing Zhao <hanqing@gatech.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+-- On Mon, 1 Jun 2020, Michael S. Tsirkin wrote --+
| IMHO this is just messed up, memory core needs to guarantee this.
| I'm working on a patch to do that.

Okay. Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D


