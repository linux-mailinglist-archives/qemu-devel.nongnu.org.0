Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF284EE9AB
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 10:19:44 +0200 (CEST)
Received: from localhost ([::1]:39888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naCVS-00066n-W3
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 04:19:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1naCLe-0007Ih-Dj
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 04:09:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1naCLa-0005Oi-Rt
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 04:09:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648800570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1lgf5ledExj67k9eyRjVDPsN+iqsRUj5euUhynfGLxw=;
 b=GW1bx8krx7vjRyHmc6CKKU/63WZH5hndKcTOqLH1F4Acl5dwz0RUl4V209jtzliJ0WqWxM
 m6t+Nu39QjNNylvjeXGDMkhThAMRwGPdpXT5iajdlhB7+DzAMfXL94drTYmwT0lb9oGo3Q
 WcXDpz8PQSRXjeuIT+vcGVtmTcxV49k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-463-bLLdqMq9MqmBcq1M7wsLCw-1; Fri, 01 Apr 2022 04:09:29 -0400
X-MC-Unique: bLLdqMq9MqmBcq1M7wsLCw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 01F569730C0
 for <qemu-devel@nongnu.org>; Fri,  1 Apr 2022 08:09:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D19E94029BD;
 Fri,  1 Apr 2022 08:09:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D0E6C21E691D; Fri,  1 Apr 2022 10:09:27 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Victor Toso <victortoso@redhat.com>
Subject: Re: [PATCH v1 9/9] qapi: fix example of query-memdev command
References: <20220331190633.121077-1-victortoso@redhat.com>
 <20220331190633.121077-10-victortoso@redhat.com>
Date: Fri, 01 Apr 2022 10:09:27 +0200
In-Reply-To: <20220331190633.121077-10-victortoso@redhat.com> (Victor Toso's
 message of "Thu, 31 Mar 2022 21:06:33 +0200")
Message-ID: <87v8vt9qdk.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

> Example output is missing mandatory argument @share for the return
> JSON object. Add it.
>
> Signed-off-by: Victor Toso <victortoso@redhat.com>
> ---
>  qapi/machine.json | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 968f912989..d25a481ce4 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -839,6 +839,7 @@
>  #          "merge": false,
>  #          "dump": true,
>  #          "prealloc": false,
> +#          "share": false,
>  #          "host-nodes": [0, 1],
>  #          "policy": "bind"
>  #        },
> @@ -847,6 +848,7 @@
>  #          "merge": false,
>  #          "dump": true,
>  #          "prealloc": true,
> +#          "share": false,
>  #          "host-nodes": [2, 3],
>  #          "policy": "preferred"
>  #        }

Reviewed-by: Markus Armbruster <armbru@redhat.com>


