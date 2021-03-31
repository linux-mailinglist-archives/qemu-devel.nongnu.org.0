Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 316B534FF44
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 13:09:18 +0200 (CEST)
Received: from localhost ([::1]:57544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRYiq-0007Jz-Nz
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 07:09:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lRYhn-0006tm-Fe
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 07:08:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lRYhj-0003Fk-Ez
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 07:08:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617188886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gzis8Kip7x+jaGjOxvqerJgFzTdNsnjYTEyj19Sa9+U=;
 b=LZjypwi7VX/4ifgPRSSqbESb6OJnDFcZV3fjlJLrEurLD+Tg18oRBmiRon1Grf0ViU+G+F
 emT0dFoLqLU8YRTmyHQWgT5/oCWjU3sMcFSmeQJemx4gRIoIcNsk6VYEfpIaljiyl6uG3O
 dgkndokSEk46rhsMU5HMyK4T+vRfPsk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-rTuu3AH8P92qSboyFeownw-1; Wed, 31 Mar 2021 07:08:02 -0400
X-MC-Unique: rTuu3AH8P92qSboyFeownw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 168FD10866AD;
 Wed, 31 Mar 2021 11:08:01 +0000 (UTC)
Received: from gondolin (ovpn-113-187.ams2.redhat.com [10.36.113.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F35FD62AF8;
 Wed, 31 Mar 2021 11:07:58 +0000 (UTC)
Date: Wed, 31 Mar 2021 13:07:56 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v1 1/5] hw/s390x: only build qemu-tod from the CONFIG_TCG
 build
Message-ID: <20210331130756.20971c8a.cohuck@redhat.com>
In-Reply-To: <20210322191551.25752-2-cfontana@suse.de>
References: <20210322191551.25752-1-cfontana@suse.de>
 <20210322191551.25752-2-cfontana@suse.de>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 22 Mar 2021 20:15:47 +0100
Claudio Fontana <cfontana@suse.de> wrote:

> this allows to remove unneeded stubs for target/s390x.

This patch doesn't seem to remove any, though?

> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  hw/s390x/tod.c       | 9 ++++++++-
>  hw/s390x/meson.build | 5 ++++-
>  2 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/s390x/tod.c b/hw/s390x/tod.c
> index 3c2979175e..322732d7fd 100644
> --- a/hw/s390x/tod.c
> +++ b/hw/s390x/tod.c
> @@ -14,6 +14,8 @@
>  #include "qemu/error-report.h"
>  #include "qemu/module.h"
>  #include "sysemu/kvm.h"
> +#include "sysemu/tcg.h"
> +#include "sysemu/qtest.h"
>  #include "migration/qemu-file-types.h"
>  #include "migration/register.h"
>  
> @@ -23,8 +25,13 @@ void s390_init_tod(void)
>  
>      if (kvm_enabled()) {
>          obj = object_new(TYPE_KVM_S390_TOD);
> -    } else {
> +    } else if (tcg_enabled()) {
>          obj = object_new(TYPE_QEMU_S390_TOD);
> +    } else if (qtest_enabled()) {
> +        return;
> +    } else {
> +        warn_report("current accelerator not handled in s390_init_tod!");
> +        return;

I'm wondering whether this should be a fatal error.

>      }
>      object_property_add_child(qdev_get_machine(), TYPE_S390_TOD, obj);
>      object_unref(obj);
> diff --git a/hw/s390x/meson.build b/hw/s390x/meson.build
> index 91495b5631..7f31f9e5d5 100644
> --- a/hw/s390x/meson.build
> +++ b/hw/s390x/meson.build
> @@ -16,7 +16,6 @@ s390x_ss.add(files(
>    'sclp.c',
>    'sclpcpu.c',
>    'sclpquiesce.c',
> -  'tod-qemu.c',
>    'tod.c',
>  ))
>  s390x_ss.add(when: 'CONFIG_KVM', if_true: files(
> @@ -25,6 +24,10 @@ s390x_ss.add(when: 'CONFIG_KVM', if_true: files(
>    's390-stattrib-kvm.c',
>    'pv.c',
>  ))
> +s390x_ss.add(when: 'CONFIG_TCG', if_true: files(
> +  'tod-qemu.c',

Should we rename this to tod-tcg.c?

> +))
> +
>  s390x_ss.add(when: 'CONFIG_S390_CCW_VIRTIO', if_true: files('s390-virtio-ccw.c'))
>  s390x_ss.add(when: 'CONFIG_TERMINAL3270', if_true: files('3270-ccw.c'))
>  s390x_ss.add(when: 'CONFIG_VFIO', if_true: files('s390-pci-vfio.c'))


