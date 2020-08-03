Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 594CC23ACD3
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Aug 2020 21:17:04 +0200 (CEST)
Received: from localhost ([::1]:54026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k2fxG-00036c-Me
	for lists+qemu-devel@lfdr.de; Mon, 03 Aug 2020 15:17:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1k2fvj-0001vB-JQ
 for qemu-devel@nongnu.org; Mon, 03 Aug 2020 15:15:27 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:26624
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1k2fvg-0001Hp-To
 for qemu-devel@nongnu.org; Mon, 03 Aug 2020 15:15:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596482121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yX9vkOIH/n2IP9wSVZdjx8Sqw+4B8Sqty1RRVbZDFJ4=;
 b=QWQREzUu/GXTIBFuFJKzZ5jWU80+ALRd/n6RzliMAuL+s/Dyba2AjQUAO4Iw7neOchi43/
 ph6c8D6GTlU/dnqQNjxoNWUNHFwn4K+5J+tPAn5zcKowB9LkPC/ChmZkIcogcpPqbmY4Em
 9wDj0Z07ADhrENXdnQP82b8m8qlNlP8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-b8TzirjpONO42rwp1r9k4Q-1; Mon, 03 Aug 2020 15:15:20 -0400
X-MC-Unique: b8TzirjpONO42rwp1r9k4Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46E6B59
 for <qemu-devel@nongnu.org>; Mon,  3 Aug 2020 19:15:19 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-35.ams2.redhat.com
 [10.36.114.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3638A69314;
 Mon,  3 Aug 2020 19:15:13 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, stefanha@redhat.com,
 virtio-fs@redhat.com
Subject: [PATCH 0/3] virtiofsd xattr name mappings
Date: Mon,  3 Aug 2020 20:15:08 +0100
Message-Id: <20200803191511.45261-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/03 14:11:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Hi,
  This is a first cut of a xattr name mapping option for virtiofsd.
It allows the user of virtiofsd to define a fairly flexible mapping
from the view of the xattr names the host fs has and the ones that the
guest sees.

  The hope is this allows things like:
    a) Different selinux attributes on host/guest
    b) separation of trusted. attributes that clash on overlayfs
    c) support for privileged xattr's in guests running with an
       unprivileged virtiofsd.

There's no apparent standard for this kind of mapping, so I made
it flexible by specifying  a mapping rule in the option.

Prefix's can be added (selectively or globally), xattr's can be
dropped in either direction or passed through.

One example is:
  -o xattrmap=" :ch:p::user.virtiofs.::ch:b:::"

which prepends user.virtiofs. to any xattr name generated by the guest
and blocks any non-prefix'd name.
This should be able to match existing filesystems with xattr's from
other implementations as well given the write map rules.

(TODO: My rst is a bit rusty, so I know I need to rework the docs in the first
patch).

Dave

Dr. David Alan Gilbert (3):
  tools/virtiofsd: xattr name mappings: Add option
  tools/virtiofsd: xattr name mappings: Map client xattr names
  tools/virtiofsd: xattr name mappings: Map host xattr names

 docs/tools/virtiofsd.rst         |  46 +++++
 tools/virtiofsd/passthrough_ll.c | 345 ++++++++++++++++++++++++++++++-
 2 files changed, 388 insertions(+), 3 deletions(-)

-- 
2.26.2


