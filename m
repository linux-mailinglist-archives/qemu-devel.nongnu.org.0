Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5D25A7C88
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 13:52:49 +0200 (CEST)
Received: from localhost ([::1]:40746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTMH1-0001K2-TR
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 07:52:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oTMEx-00073N-IH
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 07:50:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oTMEu-000605-Bd
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 07:50:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661946634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ykpMOu8/bl4YbrX9j8Cej/NPazAYI0csqbku2j4jkso=;
 b=h3nJi3wY4MVpUAtheIJUHD1DK1ujPWfEN4FEnYiU+e1qKbANNp2gsKgGcwrxr0SOCI3xz9
 06ZEu4MCRCeIMHiN8VWZs7o+AXnW0sfLqXpXbetapEFTZXOnbYkv5W5+lPu89TjvzTpMN+
 MqYd7sQIkTN23e1ayV0+2JuoJi9a3Yw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-Xvp2UXzzNSuxJ9AlH8HIKQ-1; Wed, 31 Aug 2022 07:50:33 -0400
X-MC-Unique: Xvp2UXzzNSuxJ9AlH8HIKQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F07B838164CC;
 Wed, 31 Aug 2022 11:50:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C175E403344;
 Wed, 31 Aug 2022 11:50:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8615D21E6900; Wed, 31 Aug 2022 13:50:31 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Victor Toso <victortoso@redhat.com>
Cc: qemu-devel@nongnu.org,  Eric Blake <eblake@redhat.com>,  John Snow
 <jsnow@redhat.com>,  Michael Roth <michael.roth@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v1 03/16] qapi: fix example of query-spice command
References: <20220830161545.84198-1-victortoso@redhat.com>
 <20220830161545.84198-4-victortoso@redhat.com>
Date: Wed, 31 Aug 2022 13:50:31 +0200
In-Reply-To: <20220830161545.84198-4-victortoso@redhat.com> (Victor Toso's
 message of "Tue, 30 Aug 2022 18:15:32 +0200")
Message-ID: <87sflcaayg.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

> Example output has an extra ',' delimiter and a foreign comment
> format. Fix it.
>
> Problem was noticed when trying to load the example into python's json
> library.
>
> Signed-off-by: Victor Toso <victortoso@redhat.com>
> ---
>  qapi/ui.json | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/qapi/ui.json b/qapi/ui.json
> index 286c5731d1..901b84da8a 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -356,8 +356,7 @@
>  #                "host": "127.0.0.1",
>  #                "channel-id": 0,
>  #                "tls": false
> -#             },
> -#             [ ... more channels follow ... ]
> +#             }
>  #          ]
>  #       }
>  #    }

Hmm.  You're removing an ellipsis Gerd put there for a reason, I presume
(commit cb42a870c3 "spice: add qmp 'query-spice' and hmp 'info spice'
commands.")

Even if we can do without it here, We may still want a way to abridge
examples.  Thoughts?


