Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B422E1AB7B0
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Apr 2020 08:06:14 +0200 (CEST)
Received: from localhost ([::1]:58318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOxfB-0002dV-QH
	for lists+qemu-devel@lfdr.de; Thu, 16 Apr 2020 02:06:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58756)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jOxeU-0002Cx-R2
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 02:05:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jOxeU-00089l-1E
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 02:05:30 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:27196
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jOxeT-000898-UE
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 02:05:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587017129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6aqW7DuExL1CSxHmuQ5jqDeevezq6R7KcHcybYrkVL8=;
 b=aPRrFt7lv0hDxht4P24jBeA9IJH+w0Hwe8GmJbrOLtwoCP4xWCR9jo/+zAW1ZqBQ1U0Oi7
 cqhm4iF+541nQmhGnZJ5kmwg73oF3C9ssKxs4yaI6FCZ/y+OmoVUZxO4pne+3MHuTKspXC
 dPz7BO5tKPLpX1D4smk0HNE4JfITUPs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-o71_OhbHMBy2i9E09Lz6vQ-1; Thu, 16 Apr 2020 02:05:24 -0400
X-MC-Unique: o71_OhbHMBy2i9E09Lz6vQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F14F18B5F98;
 Thu, 16 Apr 2020 06:05:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-20.ams2.redhat.com
 [10.36.113.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 40423396;
 Thu, 16 Apr 2020 06:05:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D693A11385C8; Thu, 16 Apr 2020 08:05:21 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Alexey Krasikov <alex-krasikov@yandex-team.ru>
Subject: Re: [RFC PATCH v2 1/5] crypto/secret: rename to secret_interface.
References: <20200415222525.4022-1-alex-krasikov@yandex-team.ru>
Date: Thu, 16 Apr 2020 08:05:21 +0200
In-Reply-To: <20200415222525.4022-1-alex-krasikov@yandex-team.ru> (Alexey
 Krasikov's message of "Thu, 16 Apr 2020 01:25:21 +0300")
Message-ID: <87d088c6e6.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: berrange@redhat.com, qemu-devel@nongnu.org, yc-core@yandex-team.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Consider including a cover letter in the future, and use it to explain
what you're proposing and why.  The why is even more important for an
RFC.


