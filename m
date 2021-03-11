Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AAB3370E9
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 12:14:40 +0100 (CET)
Received: from localhost ([::1]:51900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKJH5-0003rz-DO
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 06:14:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lKJFS-0003H6-AD
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 06:12:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lKJFQ-0005Hl-Bv
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 06:12:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615461175;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=4ZIGVBWBHYB+UkFKnUKJ79l81zGwi99zcyH22iuzBko=;
 b=EXedX/Mr+HS1QFMcf2ZTjiyFgEJmEe97tMOKIL0UuJYid5YkjIKAsAcHmD9ZzFY3G7RcSD
 GBlt5kCYopkcHFjoFwIK5eXMtG5yZ1v1X1uqCvfZZSa9jvLKB62YlW7yYC2IFlDbdNO7PE
 /JbIekKxy1ovL6AQg/ptlF8zB/Hqv5U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-vOYV8Y4nOpiRL4l4QlHVMA-1; Thu, 11 Mar 2021 06:12:47 -0500
X-MC-Unique: vOYV8Y4nOpiRL4l4QlHVMA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B17A257;
 Thu, 11 Mar 2021 11:12:45 +0000 (UTC)
Received: from redhat.com (ovpn-115-85.ams2.redhat.com [10.36.115.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F229A5B6A8;
 Thu, 11 Mar 2021 11:12:39 +0000 (UTC)
Date: Thu, 11 Mar 2021 11:12:36 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Zihao Chang <changzihao1@huawei.com>
Subject: Re: [PATCH v5 1/3] crypto: add reload for QCryptoTLSCredsClass
Message-ID: <YEn7JDQMHk+SnknN@redhat.com>
References: <20210311105424.1370-1-changzihao1@huawei.com>
 <20210311105424.1370-2-changzihao1@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210311105424.1370-2-changzihao1@huawei.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: oscar.zhangbo@huawei.com, qemu-devel@nongnu.org, xiexiangyou@huawei.com,
 armbru@redhat.com, yebiaoxiang@huawei.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 11, 2021 at 06:54:22PM +0800, Zihao Chang wrote:
> This patch adds reload interface for QCryptoTLSCredsClass and implements
> the interface for QCryptoTLSCredsX509.
> 
> Signed-off-by: Zihao Chang <changzihao1@huawei.com>
> ---
>  crypto/tlscredsx509.c     | 117 ++++++++++++++++++++++++++++++++++++++
>  include/crypto/tlscreds.h |   8 ++-
>  2 files changed, 122 insertions(+), 3 deletions(-)
> 
> diff --git a/crypto/tlscredsx509.c b/crypto/tlscredsx509.c
> index dbadad4df28e..6b57f14f2df1 100644
> --- a/crypto/tlscredsx509.c
> +++ b/crypto/tlscredsx509.c
> @@ -23,8 +23,10 @@
>  #include "tlscredspriv.h"
>  #include "crypto/secret.h"
>  #include "qapi/error.h"
> +#include "qapi/qmp/qstring.h"
>  #include "qemu/module.h"
>  #include "qom/object_interfaces.h"
> +#include "qom/qom-qobject.h"
>  #include "trace.h"
>  
>  
> @@ -770,6 +772,118 @@ qcrypto_tls_creds_x509_prop_get_sanity(Object *obj,
>  }
>  
>  
> +#ifdef CONFIG_GNUTLS
> +
> +
> +/*
> + * object_property_get_qobject() return "" for NULL QString,
> + * set NULL QString prop as "" is unsafe.
> + */
> +static bool
> +qcrypto_tls_creds_x509_need_set_prop(QObject *qobj)
> +{
> +    QString *qstring = qobject_to(QString, qobj);
> +    /* prop type is not QString. */
> +    if (!qstring) {
> +        return true;
> +    }
> +
> +    return strlen(qstring_get_str(qstring)) > 0;
> +}
> +
> +
> +static bool
> +qcrypto_tls_creds_x509_copy_propertites(Object *new,
> +                                        Object *old,
> +                                        Error **errp)
> +{
> +    ObjectProperty *prop = NULL;
> +    ObjectPropertyIterator iter;
> +    Error *local_err = NULL;
> +
> +    object_property_iter_init(&iter, old);
> +    while ((prop = object_property_iter_next(&iter))) {
> +        QObject *value = NULL;
> +        /* "loaded" depends on other props, copy it finally. */
> +        if (g_strcmp0(prop->name, "loaded") == 0) {
> +            continue;
> +        }
> +
> +        /* prop do not support set. */
> +        if (!prop->set) {
> +            continue;
> +        }
> +
> +        value = object_property_get_qobject(old, prop->name, &local_err);
> +        if (local_err) {
> +            error_propagate(errp, local_err);
> +            return false;
> +        }
> +
> +        if (qcrypto_tls_creds_x509_need_set_prop(value)) {
> +            object_property_set_qobject(new, prop->name, value, &local_err);
> +            if (local_err) {
> +                error_propagate(errp, local_err);
> +                qobject_unref(value);
> +                return false;
> +            }
> +        }
> +        qobject_unref(value);
> +    }
> +
> +    return true;
> +}
> +
> +
> +static bool
> +qcrypto_tls_creds_x509_reload(QCryptoTLSCreds *creds, Error **errp)
> +{
> +    Object *old = OBJECT(creds);
> +    QCryptoTLSCredsX509 *old_x509 = QCRYPTO_TLS_CREDS_X509(creds);
> +    Object *new = object_new(TYPE_QCRYPTO_TLS_CREDS_X509);
> +    QCryptoTLSCredsX509 *new_x509 = QCRYPTO_TLS_CREDS_X509(new);
> +    Error *local_err = NULL;
> +    bool ret = false;
> +
> +    if (!qcrypto_tls_creds_x509_copy_propertites(new, old, &local_err)) {
> +        error_propagate(errp, local_err);
> +        goto out;
> +    }

IMHO creating a parallel object with duplicate properties is a rather
too complex way to solve this.

> +    qcrypto_tls_creds_x509_load(new_x509, &local_err);

IMHO you should just be changing this method so that it
doesn't replace the existing 'data' and 'dh_params' fields
until the very end when it knows it was successful.

> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +        goto out;
> +    }
> +
> +    /* load new cert successfully, release old data and update */
> +    qcrypto_tls_creds_x509_unload(old_x509);
> +    old_x509->data = new_x509->data;
> +    old_x509->parent_obj.dh_params = new_x509->parent_obj.dh_params;
> +    new_x509->data = NULL;
> +    new_x509->parent_obj.dh_params = NULL;
> +
> +    ret = true;
> +
> + out:
> +    object_unref(new);
> +    return ret;
> +}
> +
> +
> +#else /* ! CONFIG_GNUTLS */
> +
> +
> +static bool
> +qcrypto_tls_creds_x509_reload(QCryptoTLSCreds *creds, Error **errp)
> +{
> +    return false;
> +}
> +
> +
> +#endif /* ! CONFIG_GNUTLS */
> +
> +
>  static void
>  qcrypto_tls_creds_x509_complete(UserCreatable *uc, Error **errp)
>  {
> @@ -800,6 +914,9 @@ static void
>  qcrypto_tls_creds_x509_class_init(ObjectClass *oc, void *data)
>  {
>      UserCreatableClass *ucc = USER_CREATABLE_CLASS(oc);
> +    QCryptoTLSCredsClass *ctcc = QCRYPTO_TLS_CREDS_CLASS(oc);
> +
> +    ctcc->reload = qcrypto_tls_creds_x509_reload;
>  
>      ucc->complete = qcrypto_tls_creds_x509_complete;
>  
> diff --git a/include/crypto/tlscreds.h b/include/crypto/tlscreds.h
> index 079e37604784..d0808e391e91 100644
> --- a/include/crypto/tlscreds.h
> +++ b/include/crypto/tlscreds.h
> @@ -30,14 +30,15 @@
>  
>  #define TYPE_QCRYPTO_TLS_CREDS "tls-creds"
>  typedef struct QCryptoTLSCreds QCryptoTLSCreds;
> -DECLARE_INSTANCE_CHECKER(QCryptoTLSCreds, QCRYPTO_TLS_CREDS,
> -                         TYPE_QCRYPTO_TLS_CREDS)
> -
>  typedef struct QCryptoTLSCredsClass QCryptoTLSCredsClass;
> +DECLARE_OBJ_CHECKERS(QCryptoTLSCreds, QCryptoTLSCredsClass, QCRYPTO_TLS_CREDS,
> +                     TYPE_QCRYPTO_TLS_CREDS)
> +
>  
>  #define QCRYPTO_TLS_CREDS_DH_PARAMS "dh-params.pem"
>  
>  
> +typedef bool (*CryptoTLSCredsReload)(QCryptoTLSCreds *, Error **);
>  /**
>   * QCryptoTLSCreds:
>   *
> @@ -61,6 +62,7 @@ struct QCryptoTLSCreds {
>  
>  struct QCryptoTLSCredsClass {
>      ObjectClass parent_class;
> +    CryptoTLSCredsReload reload;
>  };
>  
>  
> -- 
> 2.28.0
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


