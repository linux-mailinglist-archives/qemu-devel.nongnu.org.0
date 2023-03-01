Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D42B6A6998
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 10:14:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXIWn-0008DG-35; Wed, 01 Mar 2023 04:13:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pXIWk-00089J-Ul
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 04:13:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pXIWj-0004nu-7y
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 04:13:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677662012;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mjXqt3U7rdp3eRtlPD2cPRzu2cBpSfirkGk+AonnMSw=;
 b=SuaWvkZHpaZDA4AqMKNIH9EZo5rKy9I7yEkZwFyurwPj3sfeRkbFqP5NPBG/OLVmxTYh8H
 TCt7QZ6boChbBLsAEiikaiLPp9XqnVMECpH6GwdlRv3NlQsfPHG/wYFNGL4b7mIIBtVeP/
 28ze0nuUWEufVoiZTm6qWJrnliay2Sw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-218-YcibxsWAMw2MCzPKRn0SNQ-1; Wed, 01 Mar 2023 04:13:30 -0500
X-MC-Unique: YcibxsWAMw2MCzPKRn0SNQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A49588B7A0;
 Wed,  1 Mar 2023 09:13:30 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D217D2026D2A;
 Wed,  1 Mar 2023 09:13:28 +0000 (UTC)
Date: Wed, 1 Mar 2023 09:13:26 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: mst@redhat.com, arei.gonglei@huawei.com, dgilbert@redhat.com,
 pbonzini@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 11/12] cryptodev: Support query-stats QMP command
Message-ID: <Y/8XNqyqNDFu7rZ6@redhat.com>
References: <20230301025124.3605557-1-pizhenwei@bytedance.com>
 <20230301025124.3605557-12-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230301025124.3605557-12-pizhenwei@bytedance.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

On Wed, Mar 01, 2023 at 10:51:23AM +0800, zhenwei pi wrote:
> Now we can use "query-stats" QMP command to query statistics of
> crypto devices. (Originally this was designed to show statistics
> by '{"execute": "query-cryptodev"}'. Daniel Berrangé suggested that
> querying configuration info by "query-cryptodev", and querying
> runtime performance info by "query-stats". This makes sense!)
> 
> Example:
> ~# virsh qemu-monitor-command vm '{"execute": "query-stats", \
>    "arguments": {"target": "cryptodev"} }' | jq
> {
>   "return": [
>     {
>       "provider": "cryptodev",
>       "stats": [
>         {
>           "name": "asym-verify-bytes",
>           "value": 7680
>         },
>         ...
>         {
>           "name": "asym-decrypt-ops",
>           "value": 32
>         },
>         {
>           "name": "asym-encrypt-ops",
>           "value": 48
>         }
>       ],
>       "qom-path": "/objects/cryptodev0" # support asym only
>     },
>     {
>       "provider": "cryptodev",
>       "stats": [
>         {
>           "name": "asym-verify-bytes",
>           "value": 0
>         },
>         ...
>         {
>           "name": "sym-decrypt-bytes",
>           "value": 5376
>         },
>         ...
>       ],
>       "qom-path": "/objects/cryptodev1" # support asym/sym
>     }
>   ],
>   "id": "libvirt-422"
> }
> 
> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  backends/cryptodev.c   | 155 +++++++++++++++++++++++++++++++++++++++++
>  qapi/stats.json        |  10 ++-
>  stats/stats-hmp-cmds.c |   5 ++
>  stats/stats-qmp-cmds.c |   2 +
>  4 files changed, 170 insertions(+), 2 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


