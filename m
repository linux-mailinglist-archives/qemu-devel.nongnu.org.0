Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A72CA32B634
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 10:32:03 +0100 (CET)
Received: from localhost ([::1]:36904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHNrO-0008Rm-MW
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 04:32:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lHNie-0006Qi-24
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 04:23:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lHNic-0001RB-4N
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 04:22:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614763376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8Dqe+O0PKX2J5Ki5JJEThM9HGVqjCf6zKO8IOr4iDZk=;
 b=iHN6+b3NeYepeu4nOYb8o1mp8AYUTzsRSkYmz7gRRn0etLWVZgLCF9wn9nDOw74YTCaqv4
 bG4xwbLWaeWGDrlYyErmzNg1Mpt4J+oh45fMaguKQ5RsYj0PP7ZvYFkR+S7Luw8mZ35fid
 zL/np6H8uS8QvnJLtcU7F0wZ9L65kNs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-5gXcGLc-NxWHoia8G1kzeQ-1; Wed, 03 Mar 2021 04:22:53 -0500
X-MC-Unique: 5gXcGLc-NxWHoia8G1kzeQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61FE6107ACC7;
 Wed,  3 Mar 2021 09:22:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-154.ams2.redhat.com
 [10.36.112.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 008C65D768;
 Wed,  3 Mar 2021 09:22:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0A4D31800D4D; Wed,  3 Mar 2021 10:22:50 +0100 (CET)
Date: Wed, 3 Mar 2021 10:22:50 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH 1/2] coreaudio: Drop support for macOS older than 10.6
Message-ID: <20210303092250.x7j6kcyrv3qjghrl@sirius.home.kraxel.org>
References: <20210301114554.9430-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210301114554.9430-1-akihiko.odaki@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 01, 2021 at 08:45:53PM +0900, Akihiko Odaki wrote:
> Mac OS X 10.6 was released in 2009.

Also minimum version required my qemu is 10.13 (I think),
so any code for older macos versions is dead anyway.

take care,
  Gerd


