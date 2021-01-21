Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BA12FE68C
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 10:41:35 +0100 (CET)
Received: from localhost ([::1]:49058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2WT8-0004da-Rh
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 04:41:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l2WRe-0004D7-0S
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 04:40:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l2WRb-0000CX-9X
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 04:40:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611221996;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=8NS7h7aGV7HpqixMQaEQCSDMLt/o2QPHlbkcaKnoBcA=;
 b=aH3uC2zbmwZCW5PRPXF0O2+AMNeqJbT/Tt+9yHBPT8SxDW6q2o1QklMeXr5wSHYPQ8coRr
 RB9QQK6b4u0fQr5vXj7VN5PtmqAncqaj7O836Bp0BaxZGd5fPFOHze+Hy7FFavmdVXKJg2
 MsU1Hz8ES+ssnioNsNyQP/oEVVF4Sc4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-RMta7G4TO9CzEApsvCjCHQ-1; Thu, 21 Jan 2021 04:39:55 -0500
X-MC-Unique: RMta7G4TO9CzEApsvCjCHQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90A81A0CB1;
 Thu, 21 Jan 2021 09:39:53 +0000 (UTC)
Received: from redhat.com (ovpn-115-126.ams2.redhat.com [10.36.115.126])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CAD8670483;
 Thu, 21 Jan 2021 09:39:47 +0000 (UTC)
Date: Thu, 21 Jan 2021 09:39:44 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH] docs/system: Deprecate `-cpu ...,+feature,-feature` syntax
Message-ID: <20210121093944.GE3125227@redhat.com>
References: <20210119142207.3443123-1-david.edmondson@oracle.com>
 <20210119142207.3443123-2-david.edmondson@oracle.com>
 <20210119152056.GE1227584@habkost.net> <cuna6t499ir.fsf@dme.org>
 <20210119163052.GG1227584@habkost.net>
 <20210120100803.GF3015589@redhat.com> <cuny2gn7vzz.fsf@dme.org>
 <20210120161801.GP1227584@habkost.net>
 <20210120202134.4e0c4523@redhat.com>
 <20210120201241.GR1227584@habkost.net>
MIME-Version: 1.0
In-Reply-To: <20210120201241.GR1227584@habkost.net>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Edmondson <dme@dme.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 20, 2021 at 03:12:41PM -0500, Eduardo Habkost wrote:
> The ordering semantics of +feature/-feature is tricky and not
> obvious, and it requires a custom option parser.  Deprecate that
> syntax so we can eventually remove the custom -cpu option parser
> and plus_features/minus_features global variables in i386.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  docs/system/deprecated.rst | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

Ideally we would also print a warning on stderr when this deprecated
style is used.

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

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


