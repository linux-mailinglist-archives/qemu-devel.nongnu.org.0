Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 876755A7C55
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 13:42:25 +0200 (CEST)
Received: from localhost ([::1]:52190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTM6y-0002EQ-2a
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 07:42:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oTM2H-0007IO-8x
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 07:37:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oTM23-0003Ns-0H
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 07:37:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661945837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ez/4clLAerNX+U3JgwO2GhposqDcz+ijTsjnnkhyzZ8=;
 b=PRG3Wu+DMwp4CjquWpXn9B8eEJt32OI4Sun7923omTlC0JPhR2YkEwLL/VRjd80X3CXjAE
 M/BleQH2Ccn2K+XDaa7SRBdqEGPgYIIDiN4kRd2lqX4GMuACiAD6MQ8taddyaz09kN4arh
 TM2QAre8iouR6kDXqqZBRW+6bM5h6Kk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-yLybtTdQP82O7xIcp9A4mA-1; Wed, 31 Aug 2022 07:37:14 -0400
X-MC-Unique: yLybtTdQP82O7xIcp9A4mA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E4C50185A7A4;
 Wed, 31 Aug 2022 11:37:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ADE632026D4C;
 Wed, 31 Aug 2022 11:37:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 66F9A21E6900; Wed, 31 Aug 2022 13:37:12 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Victor Toso <victortoso@redhat.com>
Cc: qemu-devel@nongnu.org,  Eric Blake <eblake@redhat.com>,  Markus
 Armbruster <armbru@redhat.com>,  John Snow <jsnow@redhat.com>,  Michael
 Roth <michael.roth@amd.com>
Subject: Re: [PATCH v1 08/16] qapi: fix example of NIC_RX_FILTER_CHANGED event
References: <20220830161545.84198-1-victortoso@redhat.com>
 <20220830161545.84198-9-victortoso@redhat.com>
Date: Wed, 31 Aug 2022 13:37:12 +0200
In-Reply-To: <20220830161545.84198-9-victortoso@redhat.com> (Victor Toso's
 message of "Tue, 30 Aug 2022 18:15:37 +0200")
Message-ID: <874jxsbq53.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Victor Toso <victortoso@redhat.com> writes:

> Example output has an extra ending curly bracket. Fix it.
>
> Problem was noticed when trying to load the example into python's json
> library.
>
> Signed-off-by: Victor Toso <victortoso@redhat.com>
> ---
>  qapi/net.json | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/qapi/net.json b/qapi/net.json
> index 75ba2cb989..a8ad698e7d 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -756,7 +756,7 @@
>  # <- { "event": "NIC_RX_FILTER_CHANGED",
>  #      "data": { "name": "vnet0",
>  #                "path": "/machine/peripheral/vnet0/virtio-backend" },
> -#      "timestamp": { "seconds": 1368697518, "microseconds": 326866 } }
> +#      "timestamp": { "seconds": 1368697518, "microseconds": 326866 }
>  #    }
>  #
>  ##

Again, for local consistency:

diff --git a/qapi/net.json b/qapi/net.json
index 75ba2cb989..dd088c09c5 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -757,7 +757,6 @@
 #      "data": { "name": "vnet0",
 #                "path": "/machine/peripheral/vnet0/virtio-backend" },
 #      "timestamp": { "seconds": 1368697518, "microseconds": 326866 } }
-#    }
 #
 ##
 { 'event': 'NIC_RX_FILTER_CHANGED',


