Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AAAE13AE
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Oct 2019 10:10:05 +0200 (CEST)
Received: from localhost ([::1]:56882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNBiW-0001GX-Fh
	for lists+qemu-devel@lfdr.de; Wed, 23 Oct 2019 04:10:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45845)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1iNBer-0007v5-5O
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 04:06:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1iNBen-0000vx-SW
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 04:06:15 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:20115
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1iNBem-0000uw-Tw
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 04:06:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571817970;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RM/2bddLhUzZRDeJpUUEiZsDOfLIbtwaInxiTrFtrAI=;
 b=F0W+VUofo+5vB148CsvNYexRFf1IA7+PFHtkDDwhEKn/uCYqgJMAA3REh9hUwr0DxLxK28
 GRR5TsiuwTzEQiuvEMs8xYJc+4cZCOSyp6m6foZvF2LL+AEDY/UZN4OVgogHyKAei7XKW0
 aNBmOaz5mxtrTkS3EoIA+tsBj6lFGqU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-kzpNM_46ONm-mllRTOJ6LQ-1; Wed, 23 Oct 2019 04:06:08 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D7AB800D49;
 Wed, 23 Oct 2019 08:06:08 +0000 (UTC)
Received: from redhat.com (unknown [10.36.118.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 317C160BE1;
 Wed, 23 Oct 2019 08:06:02 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v4] migration: Support QLIST migration
In-Reply-To: <20191018092136.26581-1-eric.auger@redhat.com> (Eric Auger's
 message of "Fri, 18 Oct 2019 11:21:36 +0200")
References: <20191018092136.26581-1-eric.auger@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
Date: Wed, 23 Oct 2019 10:06:00 +0200
Message-ID: <87imof7uon.fsf@trasno.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: kzpNM_46ONm-mllRTOJ6LQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
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
Cc: peterx@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Auger <eric.auger@redhat.com> wrote:
> Support QLIST migration using the same principle as QTAILQ:
> 94869d5c52 ("migration: migrate QTAILQ").
>
> The VMSTATE_QLIST_V macro has the same proto as VMSTATE_QTAILQ_V.
> The change mainly resides in QLIST RAW macros: QLIST_RAW_INSERT_HEAD
> and QLIST_RAW_REVERSE.
>
> Tests also are provided.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

With the minor fix found by peter.


