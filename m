Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF40197B90
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Mar 2020 14:09:18 +0200 (CEST)
Received: from localhost ([::1]:48748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jItED-00056f-Lr
	for lists+qemu-devel@lfdr.de; Mon, 30 Mar 2020 08:09:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36451)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1jItDR-0004Vp-LS
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 08:08:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1jItDQ-0006N7-Oi
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 08:08:29 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:54936)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1jItDQ-0006Mp-LM
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 08:08:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585570108;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+cYysLKXEHYPM4ljDGFR43HiPi1hL7mebVVN08a7ac0=;
 b=QYj/xJi3wrDqIHoNvdfpeqJ0qQ8nW2WkI8/f9Wae9rXEBN8u3p1od64I36UsnGYXNo8xS4
 R4sN8wnr8Mpy0srXne8I+kd2tXiJi2Y9fqevWyi+D6yrPC+iy/Uww9Ag0tkyGalDJUtquG
 s1hVg1m9MJwztw4/JnfqGj9YzHA0Mtw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-za2wt1wCM2Kl7m4J_fiSCw-1; Mon, 30 Mar 2020 08:08:24 -0400
X-MC-Unique: za2wt1wCM2Kl7m4J_fiSCw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71BA31005516;
 Mon, 30 Mar 2020 12:08:23 +0000 (UTC)
Received: from redhat.com (ovpn-112-10.ams2.redhat.com [10.36.112.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 36A6F5E009;
 Mon, 30 Mar 2020 12:08:23 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Subject: Re: [PATCH 3/3] migration: move the units of migrate parameters from
 milliseconds to ms.
In-Reply-To: <20200329050131.26864-4-maozhongyi@cmss.chinamobile.com> (Mao
 Zhongyi's message of "Sun, 29 Mar 2020 13:01:31 +0800")
References: <20200329050131.26864-1-maozhongyi@cmss.chinamobile.com>
 <20200329050131.26864-4-maozhongyi@cmss.chinamobile.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Mon, 30 Mar 2020 14:08:21 +0200
Message-ID: <871rpakpu2.fsf@secure.laptop>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Reply-To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mao Zhongyi <maozhongyi@cmss.chinamobile.com> wrote:
> Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
> Suggested-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

I don't really care one way or another.  But I agree that consistence is go=
od.


