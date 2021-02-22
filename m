Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1930E3218E1
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 14:33:26 +0100 (CET)
Received: from localhost ([::1]:40210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEBL3-0005wn-4n
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 08:33:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lEB9l-0004dC-84
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 08:21:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lEB9g-0003Y3-1Z
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 08:21:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614000097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dXFafgzSXDoLDgp4G/g8vJb0RstLrvj9LcwRrAtP23Y=;
 b=GzXT20IsG1CQSyFVXbf7TMyaxMpcXbdWlUpa1ZTZV1XD0kV2wSgecFCnc0HrdnDFDq0OGg
 Hyl9rvD1Ht0cNJJtXvLhFPFxQFMGjsLMmhGYRDK1sKxCQf78Q5DLmZdHSyWSXFp7KLRmLQ
 pkTKhvcmHtKqMWwm77+99DVSdCkYIOk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-pnDkVDiBPaS6Je_egfDkGA-1; Mon, 22 Feb 2021 08:21:34 -0500
X-MC-Unique: pnDkVDiBPaS6Je_egfDkGA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74E0280196C;
 Mon, 22 Feb 2021 13:21:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3758219C45;
 Mon, 22 Feb 2021 13:21:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 802361800399; Mon, 22 Feb 2021 14:21:31 +0100 (CET)
Date: Mon, 22 Feb 2021 14:21:31 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Warner Losh <imp@freefall.freebsd.org>
Subject: Re: [PATCH] FreeBSD: Upgrade to 12.2 release
Message-ID: <20210222132131.cnxc7a3c6fkbmkvj@sirius.home.kraxel.org>
References: <20210219212352.74172-1-imp@freefall.freebsd.org>
MIME-Version: 1.0
In-Reply-To: <20210219212352.74172-1-imp@freefall.freebsd.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kevans@freebsd.org, emaste@freebsd.org, Warner Losh <imp@freebsd.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 19, 2021 at 02:23:52PM -0700, Warner Losh wrote:
> From: Warner Losh <imp@FreeBSD.org>
> 
> FreeBSD 12.1 has reached end of life. Use 12.2 instead so that FreeBSD's
> project's packages will work.

Not working.  There is a little change in the time zone selection
dialog and we need adjust the install script ...

-        self.console_wait_send("Time Zone Selector",    "a\n")
+        self.console_wait_send("Time Zone Selector",    "0\n")

Try "make vm-build-freebsd" to test changes, add "V=1" for
trouble-shooting.

With that change it seems to work fine (my test install is still busy
fetching packages over my slow internet link ...).

take care,
  Gerd


