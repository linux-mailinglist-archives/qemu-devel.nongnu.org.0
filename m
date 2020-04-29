Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1851BD69C
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Apr 2020 09:53:41 +0200 (CEST)
Received: from localhost ([::1]:43812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jThXI-0005e9-CI
	for lists+qemu-devel@lfdr.de; Wed, 29 Apr 2020 03:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49080)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jThRu-0006zo-PT
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 03:52:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jThQH-0008T2-J9
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 03:48:06 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:32150
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jThQH-0008Sm-6S
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 03:46:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588146384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dVNsNEcw8TGjgHwfI+qgun3dMWws0fEf5O1ZWqWd+rI=;
 b=fxmxHg9BPV3etlqbfzASYv8DTLwLiB3Gsju8RwP4+o60CTQq7niaent3+jJiNG7LfAJJPB
 JW1jgz1e/dUiCPV3lj9bCAyCXF9OUS7TMsfRREJYYhuUsLoC7oKz34TerAQjnrk9zE1k8w
 mplHd8vH/7QKvFUI/KQdYTmqIacxKxE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-QxAwJvJaNWKnuQiyYvV3yQ-1; Wed, 29 Apr 2020 03:46:22 -0400
X-MC-Unique: QxAwJvJaNWKnuQiyYvV3yQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF0CE2D5A;
 Wed, 29 Apr 2020 07:46:21 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 906EA5D71E;
 Wed, 29 Apr 2020 07:46:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1780F11358BC; Wed, 29 Apr 2020 09:46:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH for-5.1 0/5] qobject: Minor spring cleaning
References: <20200415083048.14339-1-armbru@redhat.com>
Date: Wed, 29 Apr 2020 09:46:20 +0200
In-Reply-To: <20200415083048.14339-1-armbru@redhat.com> (Markus Armbruster's
 message of "Wed, 15 Apr 2020 10:30:43 +0200")
Message-ID: <87a72urayb.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/29 01:42:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued.


