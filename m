Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AE83E3596
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 15:44:49 +0200 (CEST)
Received: from localhost ([::1]:36566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCMd6-0006Gm-LY
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 09:44:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mCMbT-0004Fb-87
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 09:43:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mCMbQ-0007UC-Bu
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 09:43:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628343783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kU6csU4JQCj1i0FEftJlHDbCIchH/Psu6bYq9AY0A1k=;
 b=QSf0RT6lVNnDv8bsQP1OfqIeAU0gRR7d7onEL8RzaRBKM4nRejg1g+WGz7s9tCfbpJYtz0
 gumNDu1pmbgfQ/9xES13OZK4xxXvBYRf0FqZg2pgbJ3bbZnaN8N026qlDt+TULv5bYTQPY
 d2Ej67cOu+zI5rQHNja2iN3F3XqXuyY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-prLDq23jNSCMEGhNIZ4IEQ-1; Sat, 07 Aug 2021 09:43:00 -0400
X-MC-Unique: prLDq23jNSCMEGhNIZ4IEQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72CE31006C81;
 Sat,  7 Aug 2021 13:42:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FD6269CBA;
 Sat,  7 Aug 2021 13:42:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E27DF11380A0; Sat,  7 Aug 2021 15:42:57 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH for-6.2 v6 4/7] qapi/qdev.json: fix DEVICE_DELETED
 parameters doc
References: <20210719200827.1507276-1-danielhb413@gmail.com>
 <20210719200827.1507276-5-danielhb413@gmail.com>
Date: Sat, 07 Aug 2021 15:42:57 +0200
In-Reply-To: <20210719200827.1507276-5-danielhb413@gmail.com> (Daniel Henrique
 Barboza's message of "Mon, 19 Jul 2021 17:08:24 -0300")
Message-ID: <874kc1cqvy.fsf@dusky.pond.sub.org>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: groug@kaod.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel Henrique Barboza <danielhb413@gmail.com> writes:

> Clarify that @device is optional and that 'path' is the device
> path from QOM.
>
> This change follows Markus' suggestion verbatim, provided in full
> context here:
>
> https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg01891.html
>
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Greg Kurz <groug@kaod.org>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  qapi/qdev.json | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/qapi/qdev.json b/qapi/qdev.json
> index b83178220b..d1d3681a50 100644
> --- a/qapi/qdev.json
> +++ b/qapi/qdev.json
> @@ -108,9 +108,9 @@
>  # At this point, it's safe to reuse the specified device ID. Device removal can
>  # be initiated by the guest or by HMP/QMP commands.
>  #
> -# @device: device name
> +# @device: the device's ID if it has one
>  #
> -# @path: device path
> +# @path: the device's path within the object model

Recommend "the device's QOM path".

>  #
>  # Since: 1.5
>  #

Reviewed-by: Markus Armbruster <armbru@redhat.com>


