Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B2A2976C8
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Oct 2020 20:20:26 +0200 (CEST)
Received: from localhost ([::1]:48996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kW1ft-0004rQ-3i
	for lists+qemu-devel@lfdr.de; Fri, 23 Oct 2020 14:20:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kW1ci-0003nn-PP
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 14:17:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kW1cf-0007MA-IM
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 14:17:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603477024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rUAi8mSaXYPbcPbAPZ6PqbOpQIdlnlH3eh1svEmo0f8=;
 b=YOc58FFS0h/8Y37QqetjG8ZRgyV4XbGmr5+d7pbLAA4x15sCOu6CjDhdV3G/ACvjqFvhS2
 6rMGwdnaaMjlQ1zrCdZNXPk8iw+ZjcGyImjQhWddANhJKxvC1xiS3xkq9PgSVPAZ5bMYEF
 ts3Lffj+ZH/SadrAFmaHnX90gtxw8Yc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-q7PNM3frO_yrraml6U9Qog-1; Fri, 23 Oct 2020 14:17:02 -0400
X-MC-Unique: q7PNM3frO_yrraml6U9Qog-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AD0B1009E2B
 for <qemu-devel@nongnu.org>; Fri, 23 Oct 2020 18:17:01 +0000 (UTC)
Received: from localhost (unknown [10.40.208.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 559636EF41;
 Fri, 23 Oct 2020 18:16:56 +0000 (UTC)
Date: Fri, 23 Oct 2020 20:16:55 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 05/24] vhost-user: Register "chardev" as class property
Message-ID: <20201023201655.200dc941@redhat.com>
In-Reply-To: <20200921221045.699690-6-ehabkost@redhat.com>
References: <20200921221045.699690-1-ehabkost@redhat.com>
 <20200921221045.699690-6-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 01:44:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Sep 2020 18:10:26 -0400
Eduardo Habkost <ehabkost@redhat.com> wrote:

> Class properties make QOM introspection simpler and easier, as
> they don't require an object to be instantiated.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: qemu-devel@nongnu.org
> ---
>  backends/vhost-user.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/backends/vhost-user.c b/backends/vhost-user.c
> index 9e6e1985465..858fdeae26c 100644
> --- a/backends/vhost-user.c
> +++ b/backends/vhost-user.c
> @@ -175,9 +175,9 @@ static char *get_chardev(Object *obj, Error **errp)
>      return NULL;
>  }
>  
> -static void vhost_user_backend_init(Object *obj)
> +static void vhost_user_backend_class_init(ObjectClass *oc, void *data)
>  {
> -    object_property_add_str(obj, "chardev", get_chardev, set_chardev);
> +    object_class_property_add_str(oc, "chardev", get_chardev, set_chardev);
>  }
>  
>  static void vhost_user_backend_finalize(Object *obj)
> @@ -195,7 +195,7 @@ static const TypeInfo vhost_user_backend_info = {
>      .name = TYPE_VHOST_USER_BACKEND,
>      .parent = TYPE_OBJECT,
>      .instance_size = sizeof(VhostUserBackend),
> -    .instance_init = vhost_user_backend_init,
> +    .class_init = vhost_user_backend_class_init,
>      .instance_finalize = vhost_user_backend_finalize,
>      .class_size = sizeof(VhostUserBackendClass),
>  };


