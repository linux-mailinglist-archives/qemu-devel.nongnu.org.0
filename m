Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 504874B851A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 11:01:57 +0100 (CET)
Received: from localhost ([::1]:38850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKH8G-0007v2-Dk
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 05:01:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nKH2A-00088d-Oc
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 04:55:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nKH28-000732-Vs
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 04:55:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645005336;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=D84HDI1be0FrZTS0rLpqgBSuTvwKzxB3F1cGlx/SrLY=;
 b=WOjI6fOwXbh3XaGaIlvIh7wF5kPsh+OZwF4pamWw9hv3YxSwoHChG4r3SFlgA/QlIrRB7D
 ejrhVtrVVeUSO117Wg30Vdradb0xx25Pa+ANUxpqgrleLYaHv1OUFNlRdLTn4VVYiS+/9T
 jhHV+j8l+HY2lHin2MzjCNZ9Dok0mJU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-z-PdfPTaPRSKfbmcxXTn0g-1; Wed, 16 Feb 2022 04:55:33 -0500
X-MC-Unique: z-PdfPTaPRSKfbmcxXTn0g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1DED2F44;
 Wed, 16 Feb 2022 09:55:31 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CAA0856A81;
 Wed, 16 Feb 2022 09:55:29 +0000 (UTC)
Date: Wed, 16 Feb 2022 09:55:26 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v2] arm: Remove swift-bmc machine
Message-ID: <YgzKDo8A8g6hkyde@redhat.com>
References: <20220216080947.65955-1-joel@jms.id.au>
MIME-Version: 1.0
In-Reply-To: <20220216080947.65955-1-joel@jms.id.au>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 16, 2022 at 06:39:47PM +1030, Joel Stanley wrote:
> It was scheduled for removal in 7.0.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> v2: also remove from docs/about/deprecated.rst
> 
>  docs/about/deprecated.rst  |  7 -----
>  docs/system/arm/aspeed.rst |  1 -
>  hw/arm/aspeed.c            | 53 --------------------------------------
>  3 files changed, 61 deletions(-)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 26d00812ba94..85773db631c1 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -315,13 +315,6 @@ Use the more generic event ``DEVICE_UNPLUG_GUEST_ERROR`` instead.
>  System emulator machines
>  ------------------------
>  
> -Aspeed ``swift-bmc`` machine (since 6.1)
> -''''''''''''''''''''''''''''''''''''''''
> -
> -This machine is deprecated because we have enough AST2500 based OpenPOWER
> -machines. It can be easily replaced by the ``witherspoon-bmc`` or the
> -``romulus-bmc`` machines.
> -

An equivalent note needs to be added to removed-features.rst

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


