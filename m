Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 387A4371F23
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 20:04:48 +0200 (CEST)
Received: from localhost ([::1]:52194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldcw3-0002NU-7Q
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 14:04:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ldcsF-0000b4-4e
 for qemu-devel@nongnu.org; Mon, 03 May 2021 14:00:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ldcs5-0005Nf-QM
 for qemu-devel@nongnu.org; Mon, 03 May 2021 14:00:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620064841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jVVpdIn0tXZJJJMFURHYFnSsO0u7DC6PbAhnNdNDWUE=;
 b=Dam/b9owPbuLobitwoCOxC2KVbqVvKa5YUO0nyj1ut31lC4+djkFo+RGHvvYlB+qGunfjL
 f1zl7Rf9jnibQUClVHoVMO0pqLSuOlzGC+M6KUXJ3MgQ6HigNmXWh/bllwoUHI1DlDBwvC
 prabGXjkLledPEPr85kMTD7HSS+uouc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-eyzUpk7KOwOETSSrKj5pNA-1; Mon, 03 May 2021 14:00:39 -0400
X-MC-Unique: eyzUpk7KOwOETSSrKj5pNA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17E021A8A60;
 Mon,  3 May 2021 18:00:38 +0000 (UTC)
Received: from [10.3.114.144] (ovpn-114-144.phx2.redhat.com [10.3.114.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB67E5D9D0;
 Mon,  3 May 2021 18:00:37 +0000 (UTC)
Subject: Re: [RESEND PATCH 29/32] qmp: Add the qmp_query_sgx_capabilities()
To: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20210430062455.8117-1-yang.zhong@intel.com>
 <20210430062455.8117-30-yang.zhong@intel.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <7a3a9cde-a213-91f1-b5b1-522e45dbc4df@redhat.com>
Date: Mon, 3 May 2021 13:00:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210430062455.8117-30-yang.zhong@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
> The libvirt can use qmp_query_sgx_capabilities() to get the host

s/The libvirt/Libvirt/

> sgx capabilitis.
> 

capabilities

> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> ---
>  hw/i386/sgx-epc.c          | 66 ++++++++++++++++++++++++++++++++++++++
>  include/hw/i386/pc.h       |  1 +
>  monitor/qmp-cmds.c         |  5 +++
>  qapi/misc.json             | 19 +++++++++++
>  stubs/sgx-stub.c           |  5 +++
>  tests/qtest/qmp-cmd-test.c |  1 +
>  6 files changed, 97 insertions(+)
> 

> +++ b/qapi/misc.json
> @@ -561,3 +561,22 @@
>  #
>  ##
>  { 'command': 'query-sgx', 'returns': 'SGXInfo' }
> +
> +
> +##
> +# @query-sgx-capabilities:
> +#
> +# Returns information from host SGX capabilities
> +#
> +# Returns: @SGXInfo
> +#
> +# Since: 5.1

6.1

> +#
> +# Example:
> +#
> +# -> { "execute": "query-sgx-capabilities" }
> +# <- { "return": { "sgx": true, "sgx1" : true, "sgx2" : true,
> +#                  "flc": true, "section-size" : 0 } }
> +#
> +##
> +{ 'command': 'query-sgx-capabilities', 'returns': 'SGXInfo' }
> diff --git a/stubs/sgx-stub.c b/stubs/sgx-stub.c
> index c2b59a88fd..1dedf3f3db 100644
> --- a/stubs/sgx-stub.c
-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


