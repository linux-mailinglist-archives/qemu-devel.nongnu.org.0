Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B23387471
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 10:56:06 +0200 (CEST)
Received: from localhost ([::1]:51730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1livWH-0001O7-3h
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 04:56:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1livVE-0000gX-7L
 for qemu-devel@nongnu.org; Tue, 18 May 2021 04:55:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1livVB-0005ui-DP
 for qemu-devel@nongnu.org; Tue, 18 May 2021 04:54:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621328096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=28uUUHDqZ6oBA0sjxC6/ytIIwa0MQynQ6oaMD1APuhc=;
 b=NysbhELZ306R0dvWZYmDDT2AzevqmsE/H/I6VU58cIJyxZ1UxrAe7Zqwz6TUdsDikv14pj
 Jt4T6Kau7SNcZ5bXgc2MlOtF/tsGkN67pS5UNumhnKhWzCaDYpqiT1Tq/Np/GEvSl31V6N
 xrTqZljye6PbfjwwNtsGwEhzXcgL8Vk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-KOhhwEZqMoiOlbAZdGFDkQ-1; Tue, 18 May 2021 04:54:54 -0400
X-MC-Unique: KOhhwEZqMoiOlbAZdGFDkQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF60610CE780
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 08:54:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A16296E70E;
 Tue, 18 May 2021 08:54:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1A631113861E; Tue, 18 May 2021 10:54:51 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] remove qemu-options* from root directory
References: <20210517121908.2624991-1-pbonzini@redhat.com>
Date: Tue, 18 May 2021 10:54:51 +0200
In-Reply-To: <20210517121908.2624991-1-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Mon, 17 May 2021 08:19:08 -0400")
Message-ID: <875yzg776s.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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

Paolo Bonzini <pbonzini@redhat.com> writes:

> These headers are also included from softmmu/vl.c, so they should be
> in include/.  Removing qemu-options-wrapper.h, since elsewhere
> we include "template" headers directly and #define the parameters in
> the including file, and move qemu-options.h to include/.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  qemu-options.h => include/qemu/qemu-options.h |  9 ++++-
>  os-posix.c                                    |  2 +-
>  os-win32.c                                    |  1 -
>  qemu-options-wrapper.h                        | 40 -------------------
>  qemu-options.hx                               |  4 ++
>  softmmu/vl.c                                  | 24 ++++++++---
>  6 files changed, 31 insertions(+), 49 deletions(-)
>  rename qemu-options.h => include/qemu/qemu-options.h (88%)
>  delete mode 100644 qemu-options-wrapper.h

Much nicer without qemu-options-wrapper.h.

I'd be tempted to rename qemu-options.def while there (what's .def?),
but that's up to you.

Reviewed-by: Markus Armbruster <armbru@redhat.com>


