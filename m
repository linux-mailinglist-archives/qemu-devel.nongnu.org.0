Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D486F3B0310
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 13:43:47 +0200 (CEST)
Received: from localhost ([::1]:44492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lveok-0004Ra-V6
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 07:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvenX-0003f7-Ml
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 07:42:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvenW-0000yk-9N
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 07:42:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624362149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FC3UkBuvsXh67RL8ON/Mazbd07g4m+t2PtCMgUmb3j4=;
 b=FouqDKqaJKgjnPuxXOyYCl7YXe14Jpccobo8M/pwqPSTgv+6ycHczMWSyhjWjB82amaVtd
 kZIq43hACK0H3AoyTCK9/rbcKTZG1pJ/ZkI6rjcD4Xt0SSLSYgAQzGdIAJx9RYegAs3hSo
 mDlX/496bH638wmie3gCJxvojlEC3KQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-_e9hVlk_PkSUA-oolouK-A-1; Tue, 22 Jun 2021 07:42:28 -0400
X-MC-Unique: _e9hVlk_PkSUA-oolouK-A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C72299126B;
 Tue, 22 Jun 2021 11:42:26 +0000 (UTC)
Received: from localhost (ovpn-113-161.ams2.redhat.com [10.36.113.161])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F9CA60BF1;
 Tue, 22 Jun 2021 11:42:26 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: "Cho, Yu-Chen" <acho@suse.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Subject: Re: [RFC v5 09/13] target/s390x: make helper.c sysemu-only
In-Reply-To: <20210622101726.20860-10-acho@suse.com>
Organization: Red Hat GmbH
References: <20210622101726.20860-1-acho@suse.com>
 <20210622101726.20860-10-acho@suse.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Tue, 22 Jun 2021 13:42:24 +0200
Message-ID: <87a6ninn1b.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: cfontana@suse.com, acho@suse.com, Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 22 2021, "Cho, Yu-Chen" <acho@suse.com> wrote:

> Now that we have moved cpu-dump functionality out of helper.c,
> we can make the module sysemu-only.
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Cho, Yu-Chen <acho@suse.com>
> Acked-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  target/s390x/helper.c    | 6 +-----
>  target/s390x/meson.build | 2 +-
>  2 files changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/target/s390x/helper.c b/target/s390x/helper.c
> index 41ccc83d11..b9d18325bc 100644
> --- a/target/s390x/helper.c
> +++ b/target/s390x/helper.c
> @@ -1,5 +1,5 @@
>  /*
> - *  S/390 helpers
> + *  S/390 helpers - systemu only

Typo -- you probably meant "sysemu"? (Although I'd probably spell it out
as "system emulation".)

>   *
>   *  Copyright (c) 2009 Ulrich Hecht
>   *  Copyright (c) 2011 Alexander Graf


