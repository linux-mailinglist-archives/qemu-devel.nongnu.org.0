Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D653D131C7E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 00:41:13 +0100 (CET)
Received: from localhost ([::1]:50820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iobzk-0007MW-O4
	for lists+qemu-devel@lfdr.de; Mon, 06 Jan 2020 18:41:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51977)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1iobxB-0005Rz-1D
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 18:38:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1iobx8-0006G3-HD
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 18:38:31 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:37015
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1iobx8-0006FH-D2
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 18:38:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578353909;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vOyTcMLr9WzrXoxI0/cmErtAO80sAJQrm+KZusxm4dw=;
 b=BxWmy4hiVcq9lN7lhnELID9ZgtG6Npf3TyPV5A6n8J5LhlpATPzVfHZMaXPup4rJAS6qbe
 pVMbVyGDF0H69RTX+ULRHFznaNVtTbclVBWFzxtIbt/TRC2cq4M4Qvcfm6z9Pbl5c9c3bz
 /tFIwFRTS/VLtNiSfSJX3HoTg7jf7yU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-Wd5YEv4HMBCP6QgXnIEGcA-1; Mon, 06 Jan 2020 18:38:27 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 901BE107ACC5;
 Mon,  6 Jan 2020 23:38:26 +0000 (UTC)
Received: from redhat.com (ovpn-116-57.ams2.redhat.com [10.36.116.57])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C1A9387;
 Mon,  6 Jan 2020 23:38:25 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v1 05/59] ram.c: remove unneeded labels
In-Reply-To: <20200106182425.20312-6-danielhb413@gmail.com> (Daniel Henrique
 Barboza's message of "Mon, 6 Jan 2020 15:23:31 -0300")
References: <20200106182425.20312-1-danielhb413@gmail.com>
 <20200106182425.20312-6-danielhb413@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Tue, 07 Jan 2020 00:38:23 +0100
Message-ID: <87blrgxij4.fsf@trasno.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: Wd5YEv4HMBCP6QgXnIEGcA-1
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
Reply-To: quintela@redhat.com
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
> ram_save_queue_pages() has an 'err' label that can be replaced by
> 'return -1' instead.
>
> Same thing with ram_discard_range(), and in this case we can also
> get rid of the 'ret' variable and return either '-1' on error
> or the result of ram_block_discard_range().
>
> CC: Juan Quintela <quintela@redhat.com>
> CC: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


