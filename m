Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5A510FA63
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Dec 2019 10:05:22 +0100 (CET)
Received: from localhost ([::1]:50294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ic47U-00082P-GU
	for lists+qemu-devel@lfdr.de; Tue, 03 Dec 2019 04:05:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38700)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1ic44G-00073u-8D
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 04:02:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1ic44C-0006Pk-JS
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 04:01:58 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:39272
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1ic44B-0006NT-Fc
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 04:01:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575363712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m398+EqlcHS8YY+QOlMQSum4Q/97S7m1Rhe4pyQVGPE=;
 b=G50pAlJ4E/1x8rs1QCQ8Ft62tibI+KPF4gbzer8g+oo26OHJBmzNNPcZ65vENIY+zesXT4
 udK4tgH0F4wRAo1hS4TzZqQiLuJ2ZFC13npS4Q5WLdefNuv2g7M9fVNYtlkdQO5k0mCcxN
 W44NklWAMTdvy8NMH0Z4siEHnGemuNY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-k2xHGChbMn-JizAtamKPZw-1; Tue, 03 Dec 2019 04:01:51 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EC862F2F;
 Tue,  3 Dec 2019 09:01:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-134.ams2.redhat.com
 [10.36.116.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 052305DA32;
 Tue,  3 Dec 2019 09:01:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8908C1138606; Tue,  3 Dec 2019 10:01:48 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 0/6] qapi: Module fixes and cleanups
References: <20191120182551.23795-1-armbru@redhat.com>
Date: Tue, 03 Dec 2019 10:01:48 +0100
In-Reply-To: <20191120182551.23795-1-armbru@redhat.com> (Markus Armbruster's
 message of "Wed, 20 Nov 2019 19:25:45 +0100")
Message-ID: <87d0d5ok8z.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: k2xHGChbMn-JizAtamKPZw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

> Kevin recently posted a minimally invasive fix for empty QAPI
> modules[*].  This is my attempt at a fix that also addresses the
> design weakness that led to the bug.

Queued for 5.0.


