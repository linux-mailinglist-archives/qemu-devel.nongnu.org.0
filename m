Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D71D52FE787
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 11:27:50 +0100 (CET)
Received: from localhost ([::1]:57114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2XBt-0008Sw-VA
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 05:27:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l2XA9-0007Pm-Ae
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 05:26:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l2XA6-0004Be-0r
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 05:26:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611224756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VwIm06UKmTylZwdS5dRZDMa/paKrmaTWqH4rj4LUc7U=;
 b=ZsDqUFwVPf2E+e5gTBLbjNAjbcOfXHoJjtQfX2/RgaaWPpDUyoEhgYcGKn91uhc252XF5Y
 P9D94JPYQdfrIE7O7sJN5tAOZ2y0/0RHaDdSuCgXS1YE7I3K2UJSDg1RpjklzwFgkHhhGE
 BnZ3Aj7tdk0DmlWtY9qKmjfCxLviINo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-uy3KsIG3MLWOyQ2nRl4vBA-1; Thu, 21 Jan 2021 05:25:54 -0500
X-MC-Unique: uy3KsIG3MLWOyQ2nRl4vBA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B8C88030A1;
 Thu, 21 Jan 2021 10:25:53 +0000 (UTC)
Received: from localhost (unknown [10.40.208.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D07C10021AA;
 Thu, 21 Jan 2021 10:25:47 +0000 (UTC)
Date: Thu, 21 Jan 2021 11:25:46 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH] docs/system: Deprecate `-cpu ...,+feature,-feature` syntax
Message-ID: <20210121112546.6db5f4e6@redhat.com>
In-Reply-To: <20210120201241.GR1227584@habkost.net>
References: <20210119142207.3443123-1-david.edmondson@oracle.com>
 <20210119142207.3443123-2-david.edmondson@oracle.com>
 <20210119152056.GE1227584@habkost.net> <cuna6t499ir.fsf@dme.org>
 <20210119163052.GG1227584@habkost.net>
 <20210120100803.GF3015589@redhat.com> <cuny2gn7vzz.fsf@dme.org>
 <20210120161801.GP1227584@habkost.net>
 <20210120202134.4e0c4523@redhat.com>
 <20210120201241.GR1227584@habkost.net>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 David Edmondson <dme@dme.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 20 Jan 2021 15:12:41 -0500
Eduardo Habkost <ehabkost@redhat.com> wrote:

> The ordering semantics of +feature/-feature is tricky and not
> obvious, and it requires a custom option parser.  Deprecate that
> syntax so we can eventually remove the custom -cpu option parser
> and plus_features/minus_features global variables in i386.
it affects spark as well

with that

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  docs/system/deprecated.rst | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index e20bfcb17a4..2c4b8d4b78b 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -127,6 +127,20 @@ Drives with interface types other than ``if=none`` are for onboard
>  devices.  It is possible to use drives the board doesn't pick up with
>  -device.  This usage is now deprecated.  Use ``if=none`` instead.
>  
> +``-cpu`` ``+feature`` and ``-feature`` syntax (since 6.0.0)
> +'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +The ``-cpu ...,+feature`` and ``-cpu ...,-feature`` syntax for
> +enabling and disabling CPU features is deprecated.  The ``-cpu
> +...,feature=on`` or ``-cpu ...,feature=off`` should be used
> +instead.
> +
> +Note that the ordering semantics of ``-cpu ...,-feature,+feature``
> +is different from ``-cpu ...,feature=off,feature=on``.  With the
> +former, the feature got disabled because ``-feature`` had
> +precedence, but with the latter the feature will be enabled
> +because options are applied in the order they appear.
> +
>  
>  QEMU Machine Protocol (QMP) commands
>  ------------------------------------


