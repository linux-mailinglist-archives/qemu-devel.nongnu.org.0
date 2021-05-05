Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6763737A1
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 11:35:58 +0200 (CEST)
Received: from localhost ([::1]:58558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leDwj-0003cM-2c
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 05:35:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1leDun-0002Ji-Rm
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:33:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1leDui-0003P1-PN
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:33:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620207231;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fyFEo9eavQJfisTMgFeKu0xCt1xRWpwON9ggUG5BwJc=;
 b=cTy1ryePNMZ8g0N20vYI3HZZTYPiXKu4neqN8yDtL6Mb7+2KaN7OGsJMHG2fwzMTVfVptu
 4wUXIKbcmDUYVpWYLKGiKenHBR0QrydoEjZj7DQzs3oudRLU8h9tNRqqz+vhFPqvMBPuHM
 ci3r0tnqUvDuZnTafPI2EKRU0ANSbhk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-xg-guAHVPjC7eHmGddx7AQ-1; Wed, 05 May 2021 05:33:35 -0400
X-MC-Unique: xg-guAHVPjC7eHmGddx7AQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94F10818400;
 Wed,  5 May 2021 09:33:33 +0000 (UTC)
Received: from redhat.com (ovpn-114-253.ams2.redhat.com [10.36.114.253])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A0824687CD;
 Wed,  5 May 2021 09:33:23 +0000 (UTC)
Date: Wed, 5 May 2021 10:33:20 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v1 5/7] docs: mark intention to deprecate TCG tracing
 functionality
Message-ID: <YJJmYOWDl0UzziW7@redhat.com>
References: <20210505092259.8202-1-alex.bennee@linaro.org>
 <20210505092259.8202-6-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210505092259.8202-6-alex.bennee@linaro.org>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: "reviewer:Incompatible changes" <libvir-list@redhat.com>,
 qemu-devel@nongnu.org, robhenry@microsoft.com, aaron@os.amperecomputing.com,
 vilanova@imperial.ac.uk, mahmoudabdalghany@outlook.com, minyihh@uci.edu,
 cota@braap.org, stefanha@redhat.com, mohamad.gebai@gmail.com,
 kuhn.chenqun@huawei.com, matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 05, 2021 at 10:22:57AM +0100, Alex Bennée wrote:
> Currently attempts to add a new TCG trace events results in failures
> to build. Previous discussions have suggested maybe it's time to mark
> the feature as deprecated and push people towards using plugins.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Luis Vilanova <vilanova@imperial.ac.uk>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  docs/devel/tcg-plugins.rst |  2 ++
>  docs/devel/tracing.rst     |  7 +++++++
>  docs/system/deprecated.rst | 13 +++++++++++++
>  3 files changed, 22 insertions(+)
> 
> diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
> index 18c6581d85..edf04e3091 100644
> --- a/docs/devel/tcg-plugins.rst
> +++ b/docs/devel/tcg-plugins.rst
> @@ -3,6 +3,8 @@
>     Copyright (c) 2019, Linaro Limited
>     Written by Emilio Cota and Alex Bennée
>  
> +.. _tcgplugin-ref:
> +
>  ================
>  QEMU TCG Plugins
>  ================
> diff --git a/docs/devel/tracing.rst b/docs/devel/tracing.rst
> index ba83954899..6b0f46cd54 100644
> --- a/docs/devel/tracing.rst
> +++ b/docs/devel/tracing.rst
> @@ -414,6 +414,13 @@ disabled, this check will have no performance impact.
>  "tcg"
>  -----
>  
> +.. warning::
> +   The ability to add new TCG trace points relies on a having a good
> +   understanding of the TCG internals. In the meantime TCG plugins
> +   have been introduced which solve many of the same problems with
> +   more of a focus on analysing guest code. See :ref:`tcgplugin-ref`
> +   for more details.
> +
>  Guest code generated by TCG can be traced by defining an event with the "tcg"
>  event property. Internally, this property generates two events:
>  "<eventname>_trans" to trace the event at translation time, and
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index 80cae86252..0c9d3c1e1e 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -312,6 +312,19 @@ The ``I7200`` guest CPU relies on the nanoMIPS ISA, which is deprecated
>  (the ISA has never been upstreamed to a compiler toolchain). Therefore
>  this CPU is also deprecated.
>  
> +TCG introspection features
> +--------------------------
> +
> +TCG trace-events (since 6.1)
> +''''''''''''''''''''''''''''
> +
> +The ability to add new TCG trace points has bit rotted and as the

When you say this "has bit rotted", just how bad is the situation ?

Is the TCG tracing still usable at all, or is is fully broken
already ?


> +feature can be replicated with TCG plugins it will be deprecated. If
> +any user is currently using this feature and needs help with
> +converting to using TCG plugins they should contact the qemu-devel
> +mailing list.
> +

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


