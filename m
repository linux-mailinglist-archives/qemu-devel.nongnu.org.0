Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5C5458AF2
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 10:01:24 +0100 (CET)
Received: from localhost ([::1]:46580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp5CV-0006Fl-LA
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 04:01:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mp5A4-0004oQ-2r
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 03:58:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mp59z-0007sA-TH
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 03:58:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637571521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AnYRgCoF2wjiecNHExkvAH9qqcXIaDH30Dtd/xPrZmI=;
 b=VI5bCHH6jGJYw+CZJVd2EpH3CVdAEgYJABw7aJP9D20xQYFX2CMg/ACj8EHhXhWvAZUhrM
 0mYTOvbgNTDs7Yro1f7QZKQedFfZiQZPET27onAHy6vQO6K0MhHn/Rx2WewaHfNXj/hQjj
 e2oEQH4oyVNx3zL0BkvoTlWE+Cyxm/4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-T8AaTVcxPnWABAz9kkKtTw-1; Mon, 22 Nov 2021 03:58:36 -0500
X-MC-Unique: T8AaTVcxPnWABAz9kkKtTw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B433101F7A3;
 Mon, 22 Nov 2021 08:58:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C7E7418E;
 Mon, 22 Nov 2021 08:58:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id ED06911380A7; Mon, 22 Nov 2021 09:58:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Rao, Lei" <lei.rao@intel.com>
Subject: Re: [PATCH v2 1/2] docs: Drop deprecated 'props' from object-add
References: <1637567387-28250-1-git-send-email-lei.rao@intel.com>
Date: Mon, 22 Nov 2021 09:58:32 +0100
In-Reply-To: <1637567387-28250-1-git-send-email-lei.rao@intel.com> (Lei Rao's
 message of "Mon, 22 Nov 2021 15:49:46 +0800")
Message-ID: <87o86co9c7.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: vsementsov@virtuozzo.com, berto@igalia.com, zhang.zhanghailiang@huawei.com,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org, wencongyang2@huawei.com,
 xiechanglong.d@gmail.com, qemu-devel@nongnu.org, chen.zhang@intel.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Rao, Lei" <lei.rao@intel.com> writes:

> From: "Rao, Lei" <lei.rao@intel.com>
>
> In commit 5024340745 "qapi/qom: Drop deprecated 'props' from
> object-add" (v6.0.0), we also should update documents.
>
> Signed-off-by: Lei Rao <lei.rao@intel.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>


