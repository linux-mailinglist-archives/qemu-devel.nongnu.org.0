Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B8832AA73
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 20:35:12 +0100 (CET)
Received: from localhost ([::1]:43900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHAnX-0003bq-Vj
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 14:35:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lHAQD-00017U-7Q
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 14:11:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lHAQ7-0001d7-6p
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 14:11:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614712257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1rJjCS8SfMd6EiWy+oL4Wkvtu28oL1WJmN+YYr+9Ai4=;
 b=RdNtJ6/CYxenIux0XlbojS6q3sBapviqNSFwfm909t7SRm84xa6ydB1nV4JuLfk+GECMuh
 StLEvx9cSiTqEk4Z5vO1mY0KC0tQGKvPIuLzB9qRSBXu4NEMZFgD67Joq7NgVs2Bp7tSPk
 px7Nk/0XwfUAipWwZdXJaxfAFm2Gaos=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-VIkJaDvLNzODWURBvDbnGg-1; Tue, 02 Mar 2021 14:10:55 -0500
X-MC-Unique: VIkJaDvLNzODWURBvDbnGg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E349819611A0;
 Tue,  2 Mar 2021 19:10:52 +0000 (UTC)
Received: from [10.3.113.12] (ovpn-113-12.phx2.redhat.com [10.3.113.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 313B46F447;
 Tue,  2 Mar 2021 19:10:47 +0000 (UTC)
Subject: Re: [PATCH v6 1/5] qapi: net: Add query-netdev command
To: Alexey Kirillov <lekiravi@yandex-team.ru>,
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20210302180205.5009-1-lekiravi@yandex-team.ru>
 <20210302180205.5009-2-lekiravi@yandex-team.ru>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <79930db1-80fa-c810-7f72-131ec4671a71@redhat.com>
Date: Tue, 2 Mar 2021 13:10:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210302180205.5009-2-lekiravi@yandex-team.ru>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Stefan Weil <sw@weilnetz.de>,
 xen-devel@lists.xenproject.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Paul Durrant <paul@xen.org>,
 qemu-devel@nongnu.org, Vincenzo Maffione <v.maffione@gmail.com>,
 yc-core@yandex-team.ru, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Giuseppe Lettieri <g.lettieri@iet.unipi.it>, Luigi Rizzo <rizzo@iet.unipi.it>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/21 12:02 PM, Alexey Kirillov wrote:
> The query-netdev command is used to get the configuration of the current
> network device backends (netdevs).
> This is the QMP analog of the HMP command "info network" but only for netdevs
> (i.e. excluding NIC and hubports).
> 
> The query-netdev command returns an array of objects of the NetdevInfo type,
> which are an extension of Netdev type. It means that response can be used for
> netdev-add after small modification. This can be useful for recreate the same
> netdev configuration.
> 
> Information about the network device is filled in when it is created or
> modified and is available through the NetClientState->stored_config.
> 
> Signed-off-by: Alexey Kirillov <lekiravi@yandex-team.ru>
> Acked-by: Markus Armbruster <armbru@redhat.com>
> ---

> +++ b/net/net.c

>  
> +NetdevInfoList *qmp_query_netdev(Error **errp)
> +{
> +    NetdevInfoList *list = NULL;
> +    NetClientState *nc;
> +
> +    QTAILQ_FOREACH(nc, &net_clients, next) {
> +        /*
> +         * Only look at netdevs (backend network devices), not for each queue
> +         * or NIC / hubport
> +         */
> +        if (nc->stored_config) {
> +            NetdevInfoList *node = g_new0(NetdevInfoList, 1);

Please use QAPI_LIST_PREPEND instead of open-coding it.

> +
> +            node->value = QAPI_CLONE(NetdevInfo, nc->stored_config);
> +            g_free(node->value->id); /* Need to dealloc default empty id */
> +            node->value->id = g_strdup(nc->name);
> +
> +            node->value->has_peer_id = nc->peer != NULL;
> +            if (node->value->has_peer_id) {
> +                node->value->peer_id = g_strdup(nc->peer->name);
> +            }
> +
> +            node->next = list;
> +            list = node;
> +        }
> +    }
> +

> +++ b/net/slirp.c
> @@ -345,6 +345,14 @@ static SaveVMHandlers savevm_slirp_state = {
>      .load_state = net_slirp_state_load,
>  };
>  
> +#define APPEND_STRINGLIST(tail, new_val) \
> +    do { \
> +        *(tail) = g_new0(StringList, 1); \
> +        (*(tail))->value = g_new0(String, 1); \
> +        (*(tail))->value->str = g_strdup((new_val)); \
> +        (tail) = &((*(tail))->next); \
> +    } while (0)

Please use QAPI_LIST_APPEND instead of re-coding it.

> +++ b/qapi/net.json
> @@ -714,3 +714,83 @@
>  ##
>  { 'event': 'FAILOVER_NEGOTIATED',
>    'data': {'device-id': 'str'} }
> +
> +##
> +# @NetBackend:
> +#
> +# Available netdev backend drivers.
> +#
> +# Since: 6.0
> +##
> +{ 'enum': 'NetBackend',
> +  'data': [ 'user', 'tap', 'l2tpv3', 'socket', 'vde', 'bridge', 'netmap',
> +            'vhost-user', 'vhost-vdpa' ] }

Is it worth alphabetizing this list?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


