Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3384935F579
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 15:56:54 +0200 (CEST)
Received: from localhost ([::1]:34168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWg0j-00083L-BE
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 09:56:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lWfzS-00079D-Ev
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 09:55:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lWfzO-0002Yp-JF
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 09:55:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618408529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B58Ng+C6hzIUEjKc/qm1LJMGU0RF1ndsaFf7YaC7MGo=;
 b=Jd5aw9Asuhcs9oi0plbIcSE21zmqBjGGsCzR8gYIZDsr8l/rBirlBI+C7UsBIP6wC//EQL
 8Jx9r0kb+TthU871pfXNRde2n5lnzWIGSl8YKOfqSuRjOX3WeDclsb2+Z/0/Pnth3hbEaE
 /0iDNk2B4WiaU84f36kbQzPLZ+cvMbM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574--2DdG8mHPa2nocdkkabIWw-1; Wed, 14 Apr 2021 09:55:27 -0400
X-MC-Unique: -2DdG8mHPa2nocdkkabIWw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63BB7BBEE9;
 Wed, 14 Apr 2021 13:55:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CC585C22B;
 Wed, 14 Apr 2021 13:55:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9217A113525D; Wed, 14 Apr 2021 15:55:23 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH for-6.1 3/4] qapi/qom.json: Do not use
 CONFIG_VIRTIO_CRYPTO in common code
References: <20210414112004.943383-1-thuth@redhat.com>
 <20210414112004.943383-4-thuth@redhat.com>
Date: Wed, 14 Apr 2021 15:55:23 +0200
In-Reply-To: <20210414112004.943383-4-thuth@redhat.com> (Thomas Huth's message
 of "Wed, 14 Apr 2021 13:20:03 +0200")
Message-ID: <87tuo9j7hw.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thomas Huth <thuth@redhat.com> writes:

> The ObjectType enum and ObjectOptions are included from qapi-types-qom.h
> into common code. We should not use target-specific config switches like
> CONFIG_VIRTIO_CRYPTO here, since this is not defined in common code and
> thus the enum will look differently between common and target specific
> code. For this case, it's hopefully enough to check for CONFIG_VHOST_CRYPTO
> only (which is a host specific config switch, i.e. it's the same on all
> targets).

Drawback: introspection now claims cryptodev-vhost-user is among the
values of qom-type, which is a lie when !defined(CONFIG_VIRTIO_CRYPTO).

Is this the first lie about QOM object types?

Do we care?

> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  qapi/qom.json | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/qapi/qom.json b/qapi/qom.json
> index db5ac419b1..cd0e76d564 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -752,7 +752,7 @@
>      'cryptodev-backend',
>      'cryptodev-backend-builtin',
>      { 'name': 'cryptodev-vhost-user',
> -      'if': 'defined(CONFIG_VIRTIO_CRYPTO) && defined(CONFIG_VHOST_CRYPTO)' },
> +      'if': 'defined(CONFIG_VHOST_CRYPTO)' },
>      'dbus-vmstate',
>      'filter-buffer',
>      'filter-dump',
> @@ -809,7 +809,7 @@
>        'cryptodev-backend':          'CryptodevBackendProperties',
>        'cryptodev-backend-builtin':  'CryptodevBackendProperties',
>        'cryptodev-vhost-user':       { 'type': 'CryptodevVhostUserProperties',
> -                                      'if': 'defined(CONFIG_VIRTIO_CRYPTO) && defined(CONFIG_VHOST_CRYPTO)' },
> +                                      'if': 'defined(CONFIG_VHOST_CRYPTO)' },
>        'dbus-vmstate':               'DBusVMStateProperties',
>        'filter-buffer':              'FilterBufferProperties',
>        'filter-dump':                'FilterDumpProperties',

Could CryptodevVhostUserProperties be conditional, too?


