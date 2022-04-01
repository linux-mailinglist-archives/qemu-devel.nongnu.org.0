Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0875F4EE9A7
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 10:15:09 +0200 (CEST)
Received: from localhost ([::1]:34470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naCR1-0002If-VB
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 04:15:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1naCFh-0002Kp-30
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 04:03:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1naCFf-0004k9-J6
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 04:03:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648800203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UlE/zBG0o4oZ7jphJaMzW3IVG7ZwLoYkj48AV57f2Uc=;
 b=URKXf3ZENWj4fX5DGHFOJwc0yWT4ok1gBBe44o1GdvJNQ4U6Ah54BUlMTcFOUg+L8aZdEN
 KYrZn6F5q+c2At/j2JtXax2rw9BZbDypt3qbdjtQchW8hbdP6FB+ySwoOtg7uvMxOr5KSf
 q8aO3cjeTX1LxGEBDnESeoDaigN8BJ0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-hSjCs633M-KLrY0H9xSjvw-1; Fri, 01 Apr 2022 04:03:19 -0400
X-MC-Unique: hSjCs633M-KLrY0H9xSjvw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F7CC185A7A4
 for <qemu-devel@nongnu.org>; Fri,  1 Apr 2022 08:03:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE188401DBC;
 Fri,  1 Apr 2022 08:03:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DCED221E691D; Fri,  1 Apr 2022 10:03:17 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Victor Toso <victortoso@redhat.com>
Subject: Re: [PATCH v1 4/9] qapi: fix example of query-spice command
References: <20220331190633.121077-1-victortoso@redhat.com>
 <20220331190633.121077-5-victortoso@redhat.com>
Date: Fri, 01 Apr 2022 10:03:17 +0200
In-Reply-To: <20220331190633.121077-5-victortoso@redhat.com> (Victor Toso's
 message of "Thu, 31 Mar 2022 21:06:28 +0200")
Message-ID: <87h77db58a.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Victor Toso <victortoso@redhat.com> writes:

> Example output is missing mandatory members @migrated and @mouse-mode.
> Fix it.
>
> Signed-off-by: Victor Toso <victortoso@redhat.com>
> ---
>  qapi/ui.json | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/qapi/ui.json b/qapi/ui.json
> index a810ed680c..c039b8b3cb 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -324,8 +324,10 @@
>  #          "enabled": true,
>  #          "auth": "spice",
>  #          "port": 5920,
> +#          "migrated":false,
>  #          "tls-port": 5921,
>  #          "host": "0.0.0.0",
> +#          "mouse-mode":"client",
>  #          "channels": [
>  #             {
>  #                "port": "54924",

Reviewed-by: Markus Armbruster <armbru@redhat.com>


