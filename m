Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DF333F9D6
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 21:17:15 +0100 (CET)
Received: from localhost ([::1]:39884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMcbS-0007SU-2d
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 16:17:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lMcYw-0006bx-GK
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 16:14:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lMcYt-0002c4-1i
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 16:14:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616012073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=QeNOXWub6xsTpwhc3je7ESSfpeJbvFQrkiINf6PGlyM=;
 b=HTUGij5kO6upNs1UgXqM97+7S4kux6N7sakbVN/jUN5CLwd7hDj8x+EnlHvzq9ZPWDlV58
 fm4UcUcb6ExpyREzJhI7fPqXnQcqUzCjbU3cC44S36+knrIOiKOH3g+ARj3YqoLD92/j7q
 Pd/RzgXGDhCg3DkTAZXjP/W2SVRn1Zs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-EiNxyG0aM8qeQVyWE3uzGA-1; Wed, 17 Mar 2021 16:14:32 -0400
X-MC-Unique: EiNxyG0aM8qeQVyWE3uzGA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48484801817;
 Wed, 17 Mar 2021 20:14:31 +0000 (UTC)
Received: from work-vm (ovpn-114-138.ams2.redhat.com [10.36.114.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 257E25D9C0;
 Wed, 17 Mar 2021 20:14:28 +0000 (UTC)
Date: Wed, 17 Mar 2021 20:14:26 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: mrolnik@gmail.com
Subject: of AVR target page size
Message-ID: <YFJjIq45ggSZz0CX@work-vm>
MIME-Version: 1.0
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: philmd@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Michael,
  I noticed your AVR code defines:

  #define TARGET_PAGE_BITS 8

and has an explanation of why.

Note however that's not going to work with the current live
migration/snapshotting code, since you're a couple of bits smaller
than the smallest page size we had so far, and for many years
the RAM migration code has stolen the bottom few bits of the address
as a flag field, and has already used 0x100 up; see migration/ram.c
RAM_SAVE_FLAG_*    - and it's actually tricky to change it, because if
you change it then it'll break migration compatibility with existing
qemu's.

Hmm.

Dave

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


