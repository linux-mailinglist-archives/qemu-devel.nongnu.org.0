Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3999C323B5B
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 12:37:54 +0100 (CET)
Received: from localhost ([::1]:49700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEsUL-00020q-2h
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 06:37:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lEsT3-0001ZS-If
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 06:36:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lEsT2-0004zX-3p
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 06:36:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614166591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9q57BQE7J8N5RndjfIz1Ttn+JDz/DhSjYC7VXV18L3A=;
 b=bjfFKj4LRqNt72hyDyKo8ZxwCZipV35U8dpq0/zDrS2pSJm384NHwauyA94WoAGPE0DvtU
 FslXE9OE8qjpmz2zQc4v7iLJ/XiTWmZqi+mx+0DnPFnjtPdN6HjIgUgK4C+68qa0qyiumB
 XgkIFkhZHDOyAYfTPBNtI3nmruT2Ruc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-2jfunPepNEGZZphYUF1mOA-1; Wed, 24 Feb 2021 06:36:29 -0500
X-MC-Unique: 2jfunPepNEGZZphYUF1mOA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30A4F801965;
 Wed, 24 Feb 2021 11:36:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-4.ams2.redhat.com
 [10.36.114.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 41BA41899A;
 Wed, 24 Feb 2021 11:36:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 85B3318000AE; Wed, 24 Feb 2021 12:36:17 +0100 (CET)
Date: Wed, 24 Feb 2021 12:36:17 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH v2 1/1] hw/s390x: modularize virtio-gpu-ccw
Message-ID: <20210224113617.6v42bfxyzvw6733h@sirius.home.kraxel.org>
References: <20210222125548.346166-1-pasic@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20210222125548.346166-1-pasic@linux.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Boris Fiuczynski <fiuczy@linux.ibm.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Bruce Rogers <brogers@suse.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>  static void virtio_ccw_gpu_register(void)
>  {
> +#ifdef CONFIG_MODULES
> +    type_register_static_mayfail(&virtio_ccw_gpu);
> +#else
>      type_register_static(&virtio_ccw_gpu);
> +#endif

Move the ifdef to type_register_static_mayfail, so this is not
duplicated for every module which might need this?

> --- a/include/hw/s390x/css.h
> +++ b/include/hw/s390x/css.h

Move this to a separate patch?
The "add type_register_mayfail" and "modularize virtio-gpu-ccw" changes
should be separate patches too.

> -static TypeImpl *type_register_internal(const TypeInfo *info)
> +static TypeImpl *type_register_internal(const TypeInfo *info, bool mayfail)
>  {
>      TypeImpl *ti;
>      ti = type_new(info);

Hmm, type_register_internal seems to not look at the new mayfail flag.
Patch looks incomplete ...

take care,
  Gerd


