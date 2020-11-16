Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BD02B4B64
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 17:39:19 +0100 (CET)
Received: from localhost ([::1]:45400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kehXC-0006Mj-57
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 11:39:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kehEl-0003SJ-OO
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:20:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kehEh-00033l-Ua
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:20:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605543609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m9Hw6FKtnCz4lDiRodp2ss1CqBRCirABE+S5cZvxTSs=;
 b=eParcPwlrBnfKsYofXKfNH/a0AzghCtGmbBGEHe/VQVkp4+OiLMLWB5m1qkteFBH5nF6ok
 C9xdhaa4AmMEJJdVCzcx2gnbQJf1zTp/+rLo7cQHsxTvIRDfXlTHbg2y8CFlNnZMZM7bNP
 O8sq84Otd1/E00l3TkMuEf0TjP0cyVE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-Ri2nVE82NpG6AXGVY3OepQ-1; Mon, 16 Nov 2020 11:20:06 -0500
X-MC-Unique: Ri2nVE82NpG6AXGVY3OepQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6ED2188C13D;
 Mon, 16 Nov 2020 16:20:05 +0000 (UTC)
Received: from [10.3.113.36] (ovpn-113-36.phx2.redhat.com [10.3.113.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F41F5DA33;
 Mon, 16 Nov 2020 16:20:05 +0000 (UTC)
Subject: Re: [PATCH for-6.0 1/6] qapi: Add query-accel command
To: Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
References: <20201116131011.26607-1-r.bolshakov@yadro.com>
 <20201116131011.26607-2-r.bolshakov@yadro.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <2d934855-ad11-9f61-28a1-7c0a35347a66@redhat.com>
Date: Mon, 16 Nov 2020 10:20:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116131011.26607-2-r.bolshakov@yadro.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:46:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/20 7:10 AM, Roman Bolshakov wrote:
> There's a problem for management applications to determine if certain
> accelerators available. Generic QMP command should help with that.
> 
> Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
> ---
>  monitor/qmp-cmds.c | 15 +++++++++++++++
>  qapi/machine.json  | 19 +++++++++++++++++++
>  2 files changed, 34 insertions(+)
> 

> +++ b/qapi/machine.json
> @@ -591,6 +591,25 @@
>  ##
>  { 'command': 'query-kvm', 'returns': 'KvmInfo' }
>  
> +##
> +# @query-accel:
> +#
> +# Returns information about an accelerator
> +#
> +# Returns: @KvmInfo
> +#
> +# Since: 6.0.0

We're inconsistent on whether we have 'Since: x.y' or 'Since: x.y.z',
although I prefer the shorter form.  Maybe Markus has an opnion on that.

> +#
> +# Example:
> +#
> +# -> { "execute": "query-accel", "arguments": { "name": "kvm" } }
> +# <- { "return": { "enabled": true, "present": true } }
> +#
> +##
> +{ 'command': 'query-accel',
> +  'data': { 'name': 'str' },
> +  'returns': 'KvmInfo' }

'@name' is undocumented and an open-coded string.  Better would be
requiring 'name' to be one of an enum type.  Even better would be
returning an array of KvmInfo with information on all supported
accelerators at once, rather than making the user call this command once
per name.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


