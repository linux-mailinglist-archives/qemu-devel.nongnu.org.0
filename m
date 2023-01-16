Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3597F66BCAE
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 12:19:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHNVZ-0000EX-Rd; Mon, 16 Jan 2023 06:18:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pHNVV-00009d-VN
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 06:18:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pHNVT-0006KA-W3
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 06:18:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673867906;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=OQRH93CQRpyhAaMsR0tR5TLVSXEK+iJdfUV13e8OCso=;
 b=DYyl1JK1WsUCbDLT9gM3oII8EkrI1jHB0NWGserx/uO6Oq/OUAmdBal0ot1LgnqBjn71PD
 h3J2/FiM4I6XssBWrnd6/wCrPobzqycDlykxsvlTRzkTOWwH9QHLJY3rgOUJH50voZB/+c
 /8NLc/D2vLCp1Cx9JXVMyxfvCHTHplk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-BSrsuxpyNZeoxYTb2up7Tw-1; Mon, 16 Jan 2023 06:18:23 -0500
X-MC-Unique: BSrsuxpyNZeoxYTb2up7Tw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8976802D36;
 Mon, 16 Jan 2023 11:18:22 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F4F12026D4B;
 Mon, 16 Jan 2023 11:18:21 +0000 (UTC)
Date: Mon, 16 Jan 2023 11:18:19 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: arei.gonglei@huawei.com, mst@redhat.com, dgilbert@redhat.com,
 eblake@redhat.com, armbru@redhat.com, michael.roth@amd.com,
 pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: Re: [for-8.0 v2 05/11] cryptodev: Introduce 'query-cryptodev' QMP
 command
Message-ID: <Y8UyezxcEeE+TH2p@redhat.com>
References: <20221122140756.686982-1-pizhenwei@bytedance.com>
 <20221122140756.686982-6-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221122140756.686982-6-pizhenwei@bytedance.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Nov 22, 2022 at 10:07:50PM +0800, zhenwei pi wrote:
> Now we have a QMP command to query crypto devices:
> virsh qemu-monitor-command vm '{"execute": "query-cryptodev"}' | jq
> {
>   "return": [
>     {
>       "service": [
>         "akcipher",
>         "mac",
>         "hash",
>         "cipher"
>       ],
>       "id": "cryptodev1",
>       "client": [
>         {
>           "queue": 0,
>           "type": "builtin",
>           "info": "cryptodev-builtin0"
>         }
>       ]
>     },
>     {
>       "service": [
>         "akcipher"
>       ],
>       "id": "cryptodev0",
>       "client": [
>         {
>           "queue": 0,
>           "type": "lkcf",
>           "info": "cryptodev-lkcf0"
>         }
>       ]
>     }
>   ],
>   "id": "libvirt-415"
> }
> 
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  backends/cryptodev.c | 49 ++++++++++++++++++++++++++++++++++++++++++++
>  qapi/cryptodev.json  | 43 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 92 insertions(+)
> 
> diff --git a/backends/cryptodev.c b/backends/cryptodev.c
> index d3caded920..bf2f3234c9 100644
> --- a/backends/cryptodev.c
> +++ b/backends/cryptodev.c
> @@ -24,6 +24,7 @@
>  #include "qemu/osdep.h"
>  #include "sysemu/cryptodev.h"
>  #include "qapi/error.h"
> +#include "qapi/qapi-commands-cryptodev.h"
>  #include "qapi/visitor.h"
>  #include "qemu/config-file.h"
>  #include "qemu/error-report.h"
> @@ -33,6 +34,54 @@
>  
>  static QTAILQ_HEAD(, CryptoDevBackendClient) crypto_clients;
>  
> +static int qmp_query_cryptodev_foreach(Object *obj, void *data)
> +{
> +    CryptoDevBackend *backend;
> +    CryptodevInfoList **infolist = data;
> +    uint32_t services;
> +
> +    if (!object_dynamic_cast(obj, TYPE_CRYPTODEV_BACKEND)) {
> +        return 0;
> +    }
> +
> +    CryptodevInfo *info = g_new0(CryptodevInfo, 1);
> +    info->id = g_strdup(object_get_canonical_path_component(obj));
> +
> +    backend = CRYPTODEV_BACKEND(obj);
> +    services = backend->conf.crypto_services;
> +    for (uint32_t i = 0; i < QCRYPTODEV_BACKEND_SERVICE__MAX; i++) {

QEMU coding style doesn't declare types inside the for() control
conditions. I'd suggest 'size_t i', and put it at top of this
function.

> +        if (services & (1 << i)) {
> +            QAPI_LIST_PREPEND(info->service, i);
> +        }
> +    }
> +
> +    for (uint32_t i = 0; i < backend->conf.peers.queues; i++) {
> +        CryptoDevBackendClient *cc = backend->conf.peers.ccs[i];
> +        CryptodevBackendClient *client = g_new0(CryptodevBackendClient, 1);
> +
> +        client->queue = cc->queue_index;
> +        client->type = cc->type;
> +        if (cc->info_str) {
> +            client->has_info = true;
> +            client->info = strdup(cc->info_str);

This will need rebasing, because the 'has_XXXX' fields have gone
away for all pointer types.

> +        }
> +        QAPI_LIST_PREPEND(info->client, client);
> +    }
> +
> +    QAPI_LIST_PREPEND(*infolist, info);
> +
> +    return 0;
> +}
> +
> +CryptodevInfoList *qmp_query_cryptodev(Error **errp)
> +{
> +    CryptodevInfoList *list = NULL;
> +    Object *objs = container_get(object_get_root(), "/objects");
> +
> +    object_child_foreach(objs, qmp_query_cryptodev_foreach, &list);
> +
> +    return list;
> +}
>  
>  CryptoDevBackendClient *cryptodev_backend_new_client(void)
>  {
> diff --git a/qapi/cryptodev.json b/qapi/cryptodev.json
> index 8732a30524..4cc4f4f0ed 100644
> --- a/qapi/cryptodev.json
> +++ b/qapi/cryptodev.json
> @@ -43,3 +43,46 @@
>  { 'enum': 'QCryptodevBackendType',
>    'prefix': 'QCRYPTODEV_BACKEND_TYPE',
>    'data': ['builtin', 'vhost-user', 'lkcf']}
> +
> +##
> +# @CryptodevBackendClient:
> +#
> +# Information about a queue of crypto device.
> +#
> +# @type: the type of the crypto device
> +#
> +# @info: the additional infomation of the crypto device
> +#
> +# Since: 8.0
> +##
> +{ 'struct': 'CryptodevBackendClient',
> +  'data': { 'queue': 'int',
> +            'type': 'QCryptodevBackendType',
> +            '*info': 'str' } }

'queue' field is not documented

I'm not too sure about the approach of exposing 'info'.

It looks like this is either a plain static string whose
value is implicitly determined by 'type', for the 'builtin'
and 'lkcf' backend types, or it is a printf() formattted
string for the 'vhost-user' type, which references the
chardev.

Exposing printf() formatted output is often an anti-pattern
for QAPI design. For example, if it is important for users
to know the chardev assocaited with the vhost-user backend,
then 'info' should be a union that is discriminated by
'type'. The 'vhost-user' branch of the enum should then
identify the chardev 'id' directly.

> +##
> +# @CryptodevInfo:
> +#
> +# Information about a crypto device.
> +#
> +# @service: supported service types of a crypto device
> +#
> +# @client: the additional infomation of the crypto device
> +#
> +# Since: 8.0
> +##
> +{ 'struct': 'CryptodevInfo',
> +  'data': { 'id': 'str',
> +            'service': ['QCryptodevBackendServiceType'],
> +            'client': ['CryptodevBackendClient'] } }

'id' field is not documented.

> +
> +##
> +# @query-cryptodev:
> +#
> +# Returns information about current crypto devices.
> +#
> +# Returns: a list of @CryptodevInfo
> +#
> +# Since: 8.0
> +##
> +{ 'command': 'query-cryptodev', 'returns': ['CryptodevInfo']}

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


