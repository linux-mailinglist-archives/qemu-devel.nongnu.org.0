Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1561975F9
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Mar 2020 09:49:10 +0200 (CEST)
Received: from localhost ([::1]:46006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jIpAS-0001tu-PT
	for lists+qemu-devel@lfdr.de; Mon, 30 Mar 2020 03:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55244)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jIp9Q-0001Qn-QK
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 03:48:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jIp9O-0005Qm-Bl
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 03:48:03 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:35527)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jIp9O-0005Pw-66
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 03:48:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585554481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7HEDpGZ5majIM+hzxD+isba/LokrsDUXtNCzMHlgknU=;
 b=QL+gmB76b6NJMGPNcE9O2SJdGHb0RQWojSt+o1JZRyP4JwwJdvAznCyef9LFegcYxW+8En
 Z8gG+gQIHZQmlKBnBW0idgbYGoE8Zqv9ba1ZjBGNIycKeVQ+GQtR5YyvjVjO5y7/3HiGHq
 k73OVs0Be7oZwDeJe9+lMi8a9zW9uYc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-R_Q9k03gNMyfqnviKw9KZQ-1; Mon, 30 Mar 2020 03:47:57 -0400
X-MC-Unique: R_Q9k03gNMyfqnviKw9KZQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68F39107ACC7;
 Mon, 30 Mar 2020 07:47:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-69.ams2.redhat.com
 [10.36.112.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8722619925;
 Mon, 30 Mar 2020 07:47:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0718E11385E2; Mon, 30 Mar 2020 09:47:53 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Oleksiy Obitotskyy <oobitots@cisco.com>
Subject: Re: [PATCH] qemu: Do not include file if not exists
References: <eda4c24f-2805-67b9-4fa0-931d7b03090c@redhat.com>
 <20200325085246.21118-1-oobitots@cisco.com>
Date: Mon, 30 Mar 2020 09:47:53 +0200
In-Reply-To: <20200325085246.21118-1-oobitots@cisco.com> (Oleksiy Obitotskyy's
 message of "Wed, 25 Mar 2020 01:52:46 -0700")
Message-ID: <87wo72xp06.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: Riku Voipio <riku.voipio@iki.fi>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing maintainers.

Oleksiy, this looks like a respin of your patch.  Since it is buried in
the original thread, our patch processing automation won't pick it up,
and humans may well miss it, too.  Next time, start a new thread, with
proper [PATCH v2] versioning in the subject, and cc: the maintainers
(use scripts/get_maintainer.pl to find them).  Also collect the
Reviewed-by tags, if any, and explain what changed since the previous
version.

https://wiki.qemu.org/Contribute/SubmitAPatch

I know getting everything just right seems overwhelming at first.  Don't
worry about making innocent mistakes, just learn from them :)

Thanks for your fix!


