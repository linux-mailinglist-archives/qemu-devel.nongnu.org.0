Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4916D1BD6E0
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Apr 2020 10:13:02 +0200 (CEST)
Received: from localhost ([::1]:37698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jThq1-0003Gi-9d
	for lists+qemu-devel@lfdr.de; Wed, 29 Apr 2020 04:13:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49130)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jThSu-00084e-Ru
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 03:52:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jThQR-0000Ix-35
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 03:49:08 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:41965
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jThQQ-0000D2-NA
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 03:46:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588146390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dVNsNEcw8TGjgHwfI+qgun3dMWws0fEf5O1ZWqWd+rI=;
 b=Jx8pUk19YU+9hiuMKMiGebrJyMeqf+ufyRACwURKSH1DdzSFLkKO3jYJvBP+iPYMR/QQ+d
 W6EtoNBeov1ikYOrnoi53Dz4y8BykdMxjMVi/Jc1Rr9tG+qksAZjQmMVy4IPcpM+feWaqb
 p0KwCA0NAIcch5Gkw6M3ulxvk1poWRA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-RTpito2aOX6vfAk2w-MnWw-1; Wed, 29 Apr 2020 03:46:28 -0400
X-MC-Unique: RTpito2aOX6vfAk2w-MnWw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01F888010F0;
 Wed, 29 Apr 2020 07:46:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B8AA95D9E5;
 Wed, 29 Apr 2020 07:46:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8303C11358BC; Wed, 29 Apr 2020 09:46:26 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 00/15] qapi: Spring cleaning
References: <20200424084338.26803-1-armbru@redhat.com>
Date: Wed, 29 Apr 2020 09:46:26 +0200
In-Reply-To: <20200424084338.26803-1-armbru@redhat.com> (Markus Armbruster's
 message of "Fri, 24 Apr 2020 10:43:23 +0200")
Message-ID: <878sieray5.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/29 01:28:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.81
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


