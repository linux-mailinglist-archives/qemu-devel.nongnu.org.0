Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8762F61F8
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 14:29:06 +0100 (CET)
Received: from localhost ([::1]:40896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l02gT-0000le-7k
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 08:29:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l02TC-0005si-Mt
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:15:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l02T2-0004kl-Tz
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:15:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610630111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S1RS5rcumARVOeLrq0V22CXp6TSpYOQ8ZMJc2dRLWRU=;
 b=Um/4rNh8tsE0Y7wfZXn2OrYttY4mjW87mRCCNOjKRDtGckjuQ2O1u7KwzrzrI5VVdp8WQt
 2mIW1udxK8dvELhbLP1sUxNINII+oB88lQ4Olh5Kxae5+Rr0NjpEFbENCdHpdc+FEcNYwb
 Ya1L3EAVvhRTupBzo5FSQuUfqKafw50=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-ktF4-vW-MK-wyxROcnA1Ag-1; Thu, 14 Jan 2021 08:15:09 -0500
X-MC-Unique: ktF4-vW-MK-wyxROcnA1Ag-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 434469CC03;
 Thu, 14 Jan 2021 13:15:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-172.ams2.redhat.com
 [10.36.112.172])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 13FD960C47;
 Thu, 14 Jan 2021 13:15:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7CCF311386A7; Thu, 14 Jan 2021 14:15:06 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v4 0/5] Common macros for QAPI list growth
References: <20210113221013.390592-1-eblake@redhat.com>
Date: Thu, 14 Jan 2021 14:15:06 +0100
In-Reply-To: <20210113221013.390592-1-eblake@redhat.com> (Eric Blake's message
 of "Wed, 13 Jan 2021 16:10:08 -0600")
Message-ID: <871renbqxx.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: vsementsov@virtuozzo.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> v3 was here:
> https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg06009.html
>
> Since then: rebase to the patches that were already applied [Markus],
> address review comments [Markus, Vladimir]

Queued.  I can still squash in the commit message tweak Vladimir
suggested for PATCH 1.  You tell me.

Thanks!


