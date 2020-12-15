Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2356B2DAF1B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 15:41:36 +0100 (CET)
Received: from localhost ([::1]:44630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpBWB-0004Gv-6g
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 09:41:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kpBRh-0006er-Dx
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:36:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kpBRf-0006pg-Md
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:36:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608043015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=90PukaEdfkn9AZOpYyz75eBTamIOKMMyMTQE6GrZ4ZY=;
 b=T+0uEry2Xu6WEw3WUOl9c8ACKN/oJ4iRoyq0UxUg7m8vU4EN1GWSN/00XiZZR4oUMaaQYP
 QF7L6l5eW11/mDZcKuoPs4/Q1td84eSh7dctGJKAAzRRlLavWXaDCHyBGblyvHru7PdCaf
 ecQ9BSAGytru2Zx6zF3ULjrEXX7SH3U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-TjWP_NNTPe2TKoXhtkYQuQ-1; Tue, 15 Dec 2020 09:36:51 -0500
X-MC-Unique: TjWP_NNTPe2TKoXhtkYQuQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 494D980EDAE;
 Tue, 15 Dec 2020 14:36:50 +0000 (UTC)
Received: from localhost (ovpn-113-127.ams2.redhat.com [10.36.113.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 22E66189B8;
 Tue, 15 Dec 2020 14:36:43 +0000 (UTC)
Date: Tue, 15 Dec 2020 15:36:42 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v4 28/32] qdev: Move qdev_prop_tpm declaration to
 tpm_prop.h
Message-ID: <20201215153642.3742607f@redhat.com>
In-Reply-To: <20201211220529.2290218-29-ehabkost@redhat.com>
References: <20201211220529.2290218-1-ehabkost@redhat.com>
 <20201211220529.2290218-29-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 11 Dec 2020 17:05:25 -0500
Eduardo Habkost <ehabkost@redhat.com> wrote:

> Move the variable declaration close to the macro that uses it.
>=20
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
> Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Daniel P. Berrang=C3=A9" <berrange@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: qemu-devel@nongnu.org
> ---
>  hw/tpm/tpm_prop.h            | 2 ++
>  include/hw/qdev-properties.h | 1 -
>  2 files changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/tpm/tpm_prop.h b/hw/tpm/tpm_prop.h
> index d19e40c112..bbd4225d66 100644
> --- a/hw/tpm/tpm_prop.h
> +++ b/hw/tpm/tpm_prop.h
> @@ -25,6 +25,8 @@
>  #include "sysemu/tpm_backend.h"
>  #include "hw/qdev-properties.h"
> =20
> +extern const PropertyInfo qdev_prop_tpm;
> +
>  #define DEFINE_PROP_TPMBE(_n, _s, _f)                     \
>      DEFINE_PROP(_n, _s, _f, qdev_prop_tpm, TPMBackend *)
> =20
> diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
> index aae882317a..68e544708b 100644
> --- a/include/hw/qdev-properties.h
> +++ b/include/hw/qdev-properties.h
> @@ -56,7 +56,6 @@ extern const PropertyInfo qdev_prop_uint64;
>  extern const PropertyInfo qdev_prop_int64;
>  extern const PropertyInfo qdev_prop_size;
>  extern const PropertyInfo qdev_prop_string;
> -extern const PropertyInfo qdev_prop_tpm;
>  extern const PropertyInfo qdev_prop_on_off_auto;
>  extern const PropertyInfo qdev_prop_size32;
>  extern const PropertyInfo qdev_prop_arraylen;


