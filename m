Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 698EF371F1C
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 20:03:35 +0200 (CEST)
Received: from localhost ([::1]:49822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldcus-0001Mk-EU
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 14:03:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ldcqM-0007nQ-MW
 for qemu-devel@nongnu.org; Mon, 03 May 2021 13:58:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ldcq8-0004Cb-C8
 for qemu-devel@nongnu.org; Mon, 03 May 2021 13:58:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620064718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ALEqNauj06tWa4aAUTZt/iUiRPsSsrnquejo6yddIiY=;
 b=jCLjXZY+mI4buAuBbPSrSt50nbgKgjDEx2UhwYSUwK0Sd/iItpsfNZyNdvWQSxR8YWKrCk
 tSOpf8ghIfaVrFndC0Ab8QIvybr3rcSuZ6O0110Rlwt+xkjCyWd9kBqoSj2Lr1p3GuIKj9
 bwhMznHbUhYND8AjRFyUN1lEr6fzw4c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-0KGtrbvWPnCynBBE-VT8vw-1; Mon, 03 May 2021 13:58:36 -0400
X-MC-Unique: 0KGtrbvWPnCynBBE-VT8vw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 689701B18BC0;
 Mon,  3 May 2021 17:58:35 +0000 (UTC)
Received: from [10.3.114.144] (ovpn-114-144.phx2.redhat.com [10.3.114.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E78B019C45;
 Mon,  3 May 2021 17:58:34 +0000 (UTC)
Subject: Re: [RESEND PATCH 25/32] qmp: Add query-sgx command
To: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20210430062455.8117-1-yang.zhong@intel.com>
 <20210430062455.8117-26-yang.zhong@intel.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <4d094391-7855-286f-46fd-5a840543d178@redhat.com>
Date: Mon, 3 May 2021 12:58:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210430062455.8117-26-yang.zhong@intel.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, kai.huang@intel.com, seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/30/21 1:24 AM, Yang Zhong wrote:
> This QMP query command can be used by some userspaces to retrieve
> the SGX information when SGX is enabled on Intel platform.
> 
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> ---
>  monitor/qmp-cmds.c         |  6 ++++++
>  qapi/misc.json             | 42 ++++++++++++++++++++++++++++++++++++++
>  tests/qtest/qmp-cmd-test.c |  1 +
>  3 files changed, 49 insertions(+)
> 

> +++ b/qapi/misc.json
> @@ -519,3 +519,45 @@
>   'data': { '*option': 'str' },
>   'returns': ['CommandLineOptionInfo'],
>   'allow-preconfig': true }
> +
> +##
> +# @SGXInfo:
> +#
> +# Information about intel Safe Guard eXtension (SGX) support
> +#
> +# @sgx: true if SGX is support

is supported

> +#
> +# @sgx1: true if SGX1 is support
> +#
> +# @sgx2: true if SGX2 is support
> +#
> +# @flc: true if FLC is support

again, for each of these too.

> +#
> +# @section-size: The EPC section size for guest
> +#
> +# Since: 5.1

6.1 (5.1 was last year).

> +##
> +{ 'struct': 'SGXInfo',
> +  'data': { 'sgx': 'bool',
> +            'sgx1': 'bool',
> +            'sgx2': 'bool',
> +            'flc': 'bool',
> +            'section-size': 'uint64'}}
> +
> +##
> +# @query-sgx:
> +#
> +# Returns information about SGX
> +#
> +# Returns: @SGXInfo
> +#
> +# Since: 5.1

6.1

> +#
> +# Example:
> +#
> +# -> { "execute": "query-sgx" }
> +# <- { "return": { "sgx": true, "sgx1" : true, "sgx2" : true,
> +#                  "flc": true, "section-size" : 0 } }
> +#
> +##
> +{ 'command': 'query-sgx', 'returns': 'SGXInfo' }
> diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
> index c98b78d033..b75f3364f3 100644
> --- a/tests/qtest/qmp-cmd-test.c
> +++ b/tests/qtest/qmp-cmd-test.c
> @@ -100,6 +100,7 @@ static bool query_is_ignored(const char *cmd)
>          /* Success depends on Host or Hypervisor SEV support */
>          "query-sev",
>          "query-sev-capabilities",
> +        "query-sgx",
>          NULL
>      };
>      int i;
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


