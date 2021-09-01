Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 714CF3FD2C6
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 07:17:02 +0200 (CEST)
Received: from localhost ([::1]:54394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLIcP-0001r5-0d
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 01:17:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mLIat-00016I-2g
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 01:15:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mLIao-0000Tv-R9
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 01:15:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630473320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=F8e/lwYGkolnNTtDE9Gt9HzkdUBGQVT+ztgL1mz6w2c=;
 b=By2PRVXrvIS7danwTj1v/58F3FqRbVWOys8yErdhgg6+YN7ii828KTxYWn1DSQ1P/AoDWm
 /+hAvm3Tnf1CKaMeYuylX2TqIeJva5EV+HmZGcjUlDhM/OWWxq/T1qzAqv/qgyFGYrNh57
 d9WFtDN+Ww8ifCoAI4HMT5oYmQ00Mfo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-YBYNfXE4NF2G-myWbzDnYA-1; Wed, 01 Sep 2021 01:15:18 -0400
X-MC-Unique: YBYNfXE4NF2G-myWbzDnYA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1E7E107ACC7;
 Wed,  1 Sep 2021 05:15:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 381285D6D5;
 Wed,  1 Sep 2021 05:15:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 92662180038E; Wed,  1 Sep 2021 07:15:15 +0200 (CEST)
Date: Wed, 1 Sep 2021 07:15:15 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: ui/cocoa: reviewers wanted
Message-ID: <20210901051515.jxclncduqrfrtfre@sirius.home.kraxel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: John Arbuckle <programmingkidx@gmail.com>, Zhang Chen <tgfbeta@me.com>,
 gustavo@noronha.dev.br, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi folks,

I have a bunch of unreviewed patches for cocoa sitting in my patch
mailbox.  If you are Cc'ed you are one of the patch authors.

I simply don't have the macos expertise to do a proper review for most
patches, specifically the macos interface parts.  So, if you want help
improve cocoa support in qemu, please consider stepping up as reviewer.
Simply send a patch adding a 'R: name <email>" line for yourself to the
"Cocoa graphics" section of the MAINTAINERS file to to so.  The
scripts/get_maintainer.pl script will Cc any cocoa patches to you then.

Ideally we'll have a group of two or three people reviewing and testing
each others patches, so I can queue them up with more confidence than
"nothing obviously wrong in there".

thanks & take care,
  Gerd


