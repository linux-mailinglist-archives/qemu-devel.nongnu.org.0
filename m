Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 447E632AA58
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 20:29:04 +0100 (CET)
Received: from localhost ([::1]:60234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHAhb-0006mm-AG
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 14:29:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lHAJ9-00024x-O0
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 14:03:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lHAJ5-0000VJ-14
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 14:03:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614711822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J2oBy8UL5K1k3KYeVa9G1gKodpBgvOMKAS59uiLcNOA=;
 b=ZYk9ioy3OhA8xfjWyemunC+0jR08ku8TfjtIQooVUWlVcIgt8+I0ZPvP4alsMjU0LByFWJ
 UZHxqako04zMXpETuRr83ZDrU8tIFhAVmWXjdyv0PnXIAWycgjCjRy/Hr6Jt9+rGnvWN9y
 sUqPExjXJ53qtM7Ew/AhK8ehKtyxG9w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-jBDqQ0svNHuYW9oYBcpENg-1; Tue, 02 Mar 2021 14:03:40 -0500
X-MC-Unique: jBDqQ0svNHuYW9oYBcpENg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DEDB801977;
 Tue,  2 Mar 2021 19:03:39 +0000 (UTC)
Received: from [10.3.113.12] (ovpn-113-12.phx2.redhat.com [10.3.113.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ACBA718032;
 Tue,  2 Mar 2021 19:03:35 +0000 (UTC)
Subject: Re: [PATCH 1/3] qapi, audio: add query-audiodev command
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210302175524.1290840-1-berrange@redhat.com>
 <20210302175524.1290840-2-berrange@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <13e00c52-54e1-074e-6575-b03ab4bd7706@redhat.com>
Date: Tue, 2 Mar 2021 13:03:35 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210302175524.1290840-2-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/21 11:55 AM, Daniel P. Berrangé wrote:
> Way back in QEMU 4.0, the -audiodev command line option was introduced
> for configuring audio backends. This CLI option does not use QemuOpts
> so it is not visible for introspection in 'query-command-line-options',
> instead using the QAPI Audiodev type.  Unfortunately there is also no
> QMP command that uses the Audiodev type, so it is not introspectable
> with 'query-qmp-schema' either.
> 
> This introduces a 'query-audiodev' command that simply reflects back
> the list of configured -audiodev command line options. This in turn
> makes Audiodev introspectable via 'query-qmp-schema'.

Even if we never call the query-audiodev command, its mere existence is
useful ;)

> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  audio/audio.c   | 19 +++++++++++++++++++
>  qapi/audio.json | 13 +++++++++++++
>  2 files changed, 32 insertions(+)


> +AudiodevList *qmp_query_audiodevs(Error **errp)
> +{
> +    AudiodevList *ret = NULL, *prev = NULL, *curr;
> +    AudiodevListEntry *e;
> +    QSIMPLEQ_FOREACH(e, &audiodevs, next) {
> +        curr = g_new0(AudiodevList, 1);
> +        curr->value = QAPI_CLONE(Audiodev, e->dev);
> +        if (prev) {
> +            prev->next = curr;
> +            prev = curr;
> +        } else {
> +            ret = prev = curr;
> +        }

Please use QAPI_LIST_PREPEND here instead of open-coding it.

> +
> +##
> +# @query-audiodevs:
> +#
> +# Returns information about audiodev configuration
> +#
> +# Returns: array of @Audiodev
> +#
> +# Since: 6.0
> +#
> +##
> +{ 'command': 'query-audiodevs',
> +  'returns': ['Audiodev'] }
> 

Otherwise looks nice.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


