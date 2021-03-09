Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3254033222D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 10:39:04 +0100 (CET)
Received: from localhost ([::1]:38764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJYpS-0006wd-Uo
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 04:39:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lJYmV-0005nV-0N
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 04:35:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lJYmQ-00008I-JN
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 04:35:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615282552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HojpXorL2IhvEPmjoG/lwImU4IPA7ibKrwoH8nzX+pU=;
 b=K5knr5EyUK/dADbF2m9yXQuSIxuytKfNep2kR7gCzElToMDR1XVOdwpCbJ42gTpFBsqJ3l
 70xQLVQSVXAZ3VQqcAl/z0uJEQKqupYjJ0gE9TQaD2fwV9nEdRCcBP3MNVBB3hBW/uULZD
 XJR7Yiy14tL/fW7VkBNic05rkGC1ut4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-IW9OAMoJPhClXiFSZagrKQ-1; Tue, 09 Mar 2021 04:35:50 -0500
X-MC-Unique: IW9OAMoJPhClXiFSZagrKQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7501B801814;
 Tue,  9 Mar 2021 09:35:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DD02D5D9DC;
 Tue,  9 Mar 2021 09:35:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 67AB01132C12; Tue,  9 Mar 2021 10:35:44 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Zihao Chang <changzihao1@huawei.com>
Subject: Re: [PATCH v4 3/3] qmp: add new qmp display-reload
References: <20210224123419.786-1-changzihao1@huawei.com>
 <20210224123419.786-4-changzihao1@huawei.com>
Date: Tue, 09 Mar 2021 10:35:44 +0100
In-Reply-To: <20210224123419.786-4-changzihao1@huawei.com> (Zihao Chang's
 message of "Wed, 24 Feb 2021 20:34:19 +0800")
Message-ID: <87lfawu0sv.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: berrange@redhat.com, oscar.zhangbo@huawei.com, qemu-devel@nongnu.org,
 xiexiangyou@huawei.com, armbru@redhat.com, yebiaoxiang@huawei.com,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sorry for the delay, I missed this one.

Zihao Chang <changzihao1@huawei.com> writes:

> This patch provides a new qmp to reload display configuration
> without restart VM, but only reloading the vnc tls certificates
> is implemented.
> Example:
> {"execute": "display-reload", "arguments":{"vnc-tls-certs": true}}
>
> Signed-off-by: Zihao Chang <changzihao1@huawei.com>
> ---
>  monitor/qmp-cmds.c | 12 ++++++++++++
>  qapi/ui.json       | 32 ++++++++++++++++++++++++++++++++
>  2 files changed, 44 insertions(+)
>
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index c7df8c0ee268..02ac2fdb1a47 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -334,3 +334,15 @@ MemoryInfo *qmp_query_memory_size_summary(Error **errp)
>  
>      return mem_info;
>  }
> +
> +void qmp_display_reload(DisplayReloadInfo *arg, Error **errp)
> +{
> +    Error *local_err = NULL;
> +
> +    if (arg->has_vnc_tls_certs && arg->vnc_tls_certs) {
> +        if (!vnc_display_reload_certs(NULL, &local_err)) {
> +            error_propagate(errp, local_err);
> +            return;
> +        }
> +    }
> +}
> diff --git a/qapi/ui.json b/qapi/ui.json
> index d08d72b43923..922d9ae0772e 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1179,3 +1179,35 @@
>  ##
>  { 'command': 'query-display-options',
>    'returns': 'DisplayOptions' }
> +
> +##
> +# @DisplayReloadInfo:
> +#
> +# The basic information for reload Display configuration
> +#
> +# @vnc-tls-certs: whether to reload tls certs
> +#
> +# Since: 6.0
> +##
> +{ 'struct': 'DisplayReloadInfo',
> +  'data': { '*vnc-tls-certs': 'bool' } }
> +
> +##
> +# @display-reload:
> +#
> +# Reload display configuration
> +#
> +# Returns: Nothing on success
> +#
> +# Since: 6.0
> +#
> +# Example:
> +#
> +# -> { "execute": "display-reload",
> +#      "arguments": { "vnc-tls-certs": true } }
> +# <- { "return": {} }
> +#
> +##
> +{ 'command': 'display-reload',
> +  'data': 'DisplayReloadInfo',
> +  'boxed' : true }

Why 'boxed': true?

What about:

   ##
   # @display-reload:
   #
   # Reload display configuration
   #
   # Returns: Nothing on success
   #
   # Since: 6.0
   #
   # Example:
   #
   # -> { "execute": "display-reload",
   #      "arguments": { "vnc-tls-certs": true } }
   # <- { "return": {} }
   #
   ##
   { 'command': 'display-reload',
     'data': { '*vnc-tls-certs': 'bool' } }


