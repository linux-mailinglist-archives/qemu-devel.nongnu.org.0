Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC8E66BC55
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 11:59:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHNCa-0005n6-0y; Mon, 16 Jan 2023 05:58:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pHNCX-0005lC-Ci
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 05:58:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pHNCU-0002v6-Dg
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 05:58:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673866728;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4y3mcBXLso84ECqhZipmlIIS5yeh+NTNwMExmQ++JoE=;
 b=E/o9h2ewWOhPej3GWH1UHF8uz1P4uAyOtu7GWpsG5iH1dFwZjlaUis09ff9Co7kPtNdJ7H
 N6zZ1FfLw+AZK0P8PUeHkBnMYdw0noY7XfvSYjd0gflN/8q268WXNAqteKitoDYoiOQChV
 /0i2+ItF69/AycHmd2+q/MezNzgzsbE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-546-dAfhfy5YNEK4oW67hj53iQ-1; Mon, 16 Jan 2023 05:58:45 -0500
X-MC-Unique: dAfhfy5YNEK4oW67hj53iQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B0B7C3C0E211;
 Mon, 16 Jan 2023 10:58:44 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 38DA2492B00;
 Mon, 16 Jan 2023 10:58:42 +0000 (UTC)
Date: Mon, 16 Jan 2023 10:58:40 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: arei.gonglei@huawei.com, mst@redhat.com, dgilbert@redhat.com,
 eblake@redhat.com, armbru@redhat.com, michael.roth@amd.com,
 pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: Re: [for-8.0 v2 01/11] cryptodev: Introduce cryptodev.json
Message-ID: <Y8Ut4OqS+hPOjydv@redhat.com>
References: <20221122140756.686982-1-pizhenwei@bytedance.com>
 <20221122140756.686982-2-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221122140756.686982-2-pizhenwei@bytedance.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

On Tue, Nov 22, 2022 at 10:07:46PM +0800, zhenwei pi wrote:
> Introduce QCryptodevBackendType in cryptodev.json, also apply this to
> related codes. Then we can drop 'enum CryptoDevBackendOptionsType'.
> 
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  MAINTAINERS                     |  1 +
>  backends/cryptodev-builtin.c    |  2 +-
>  backends/cryptodev-lkcf.c       |  2 +-
>  backends/cryptodev-vhost-user.c |  4 ++--
>  backends/cryptodev-vhost.c      |  4 ++--
>  include/sysemu/cryptodev.h      | 11 ++---------
>  qapi/cryptodev.json             | 20 ++++++++++++++++++++
>  qapi/meson.build                |  1 +
>  qapi/qapi-schema.json           |  1 +
>  9 files changed, 31 insertions(+), 15 deletions(-)
>  create mode 100644 qapi/cryptodev.json


> @@ -215,16 +216,8 @@ struct CryptoDevBackendClass {
>                   void *opaque);
>  };
>  
> -typedef enum CryptoDevBackendOptionsType {
> -    CRYPTODEV_BACKEND_TYPE_NONE = 0,
> -    CRYPTODEV_BACKEND_TYPE_BUILTIN = 1,
> -    CRYPTODEV_BACKEND_TYPE_VHOST_USER = 2,
> -    CRYPTODEV_BACKEND_TYPE_LKCF = 3,
> -    CRYPTODEV_BACKEND_TYPE__MAX,
> -} CryptoDevBackendOptionsType;

Old code has a 'NONE' value as the default


> +##
> +# @QCryptodevBackendType:
> +#
> +# The crypto device backend type
> +#
> +# @builtin: the QEMU builtin support
> +# @vhost-user: vhost-user
> +# @lkcf: Linux kernel cryptographic framework
> +#
> +# Since: 8.0
> +##
> +{ 'enum': 'QCryptodevBackendType',
> +  'prefix': 'QCRYPTODEV_BACKEND_TYPE',
> +  'data': ['builtin', 'vhost-user', 'lkcf']}

...but new code has no 'none'. None the less I think that is
OK, as I'm not seeing anything that needed the 'none' type.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


