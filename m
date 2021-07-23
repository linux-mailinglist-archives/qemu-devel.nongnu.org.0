Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 866713D35AE
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 09:48:31 +0200 (CEST)
Received: from localhost ([::1]:46572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6pv4-0005QV-5x
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 03:48:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m6ptx-0004Mm-Si
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 03:47:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m6ptu-0007Ho-90
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 03:47:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627026436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gCz1+N0jHwFi+7wHp/Av1OJ8T8kIU1CoOy7PtjtFUX8=;
 b=jEw4Eig0ehEwa7gcr9x0HbDd0eAnYD7Xu5n1ZQ7OnvLLGcjpi+Tm5gX4uanJSNRDWwtFkB
 mTHfS3kOej1yDUqHqi3YitJxUGXWwDPh4Qidtpls6IaJoakZOA/PJbeOZyHeyMh9+EYXG6
 cLrUXI7rrVyYAVhGh6g4yGuH8FgYNHQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-DfmVYL-wPy-FzV5Dx3v-jA-1; Fri, 23 Jul 2021 03:47:15 -0400
X-MC-Unique: DfmVYL-wPy-FzV5Dx3v-jA-1
Received: by mail-ej1-f70.google.com with SMTP id
 kf3-20020a17090776c3b0290536d9b62eb6so378844ejc.2
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 00:47:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gCz1+N0jHwFi+7wHp/Av1OJ8T8kIU1CoOy7PtjtFUX8=;
 b=KObfAa7l1X+pbRQ1CbGYct2rfWc4X660mB1grp5y++o1gJgk+cz/tMfms0VaGQoWII
 YZp7s6v8zuz6wInytS0IwvFOpEoMkHcJHkTU4JmM7DMoo/zofiOZtzmxXRsIk3S9eNG7
 /wzdsZNEt6m2pfSl9atiwkv4NAPcyPH/JBzw3DI3yLj/yfhr/pHiNF5Ok38w0c9swYwM
 o4v41Ggg20sR8yd6jQRdL59WfGl1AcONIjcPdrshlogQmjXEM+QOAfPHdTJ6QDJDVr2V
 duPL6fZ6QnuiRUuxzaEbGGvZoXKDERFOr2/pf0vujLWWLnW8xr2y1ZmaBRGRfpsM2JN4
 a0Fw==
X-Gm-Message-State: AOAM530wAfw2ZC5GkkMg68pe8PP+OyQHP3FenXF/L135XnmveMnm+Wcq
 h9a+SnDDK6RrRfDdkLUIGuDBiJT3+9QVANxiajJXE4EjiDUVZag/QspKbE/9OEThLqbs4T1JzSm
 jzDH+JpimitPfwpw=
X-Received: by 2002:a05:6402:34c:: with SMTP id
 r12mr3993851edw.278.1627026434446; 
 Fri, 23 Jul 2021 00:47:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzuPiIm8lgcaY2f4w7JpmTXb2adYTnsd141wQgK6y0DhOT9w0UPaIeW62plMuIw0gILoK0hw==
X-Received: by 2002:a05:6402:34c:: with SMTP id
 r12mr3993836edw.278.1627026434262; 
 Fri, 23 Jul 2021 00:47:14 -0700 (PDT)
Received: from redhat.com ([2.55.16.196])
 by smtp.gmail.com with ESMTPSA id n15sm110427edw.70.2021.07.23.00.47.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 00:47:13 -0700 (PDT)
Date: Fri, 23 Jul 2021 03:47:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-6.1 2/2] docs: Move licence/copyright from HTML
 output to rST comments
Message-ID: <20210723034701-mutt-send-email-mst@kernel.org>
References: <20210722192016.24915-1-peter.maydell@linaro.org>
 <20210722192016.24915-3-peter.maydell@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210722192016.24915-3-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 22, 2021 at 08:20:16PM +0100, Peter Maydell wrote:
> Our built HTML documentation now has a standard footer which
> gives the license for QEMU (and its documentation as a whole).
> In almost all pages, we either don't bother to state the
> copyright/license for the individual rST sources, or we put
> it in an rST comment. There are just three pages which render
> copyright or license information into the user-visible HTML.
> 
> Quoting a specific (different) license for an individual HTML
> page within the manual is confusing. Downgrade the license
> and copyright info to a comment within the rST source, bringing
> these pages in line with the rest of our documents.
> 
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  docs/interop/vhost-user-gpu.rst |  7 ++++---
>  docs/interop/vhost-user.rst     | 12 +++++++-----
>  docs/system/generic-loader.rst  |  4 ++--
>  3 files changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/docs/interop/vhost-user-gpu.rst b/docs/interop/vhost-user-gpu.rst
> index 3268bf405ce..71a2c52b313 100644
> --- a/docs/interop/vhost-user-gpu.rst
> +++ b/docs/interop/vhost-user-gpu.rst
> @@ -2,9 +2,10 @@
>  Vhost-user-gpu Protocol
>  =======================
>  
> -:Licence: This work is licensed under the terms of the GNU GPL,
> -          version 2 or later. See the COPYING file in the top-level
> -          directory.
> +..
> +  Licence: This work is licensed under the terms of the GNU GPL,
> +           version 2 or later. See the COPYING file in the top-level
> +           directory.
>  
>  .. contents:: Table of Contents
>  
> diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
> index d6085f70452..d63f8d3f93a 100644
> --- a/docs/interop/vhost-user.rst
> +++ b/docs/interop/vhost-user.rst
> @@ -1,11 +1,13 @@
>  ===================
>  Vhost-user Protocol
>  ===================
> -:Copyright: 2014 Virtual Open Systems Sarl.
> -:Copyright: 2019 Intel Corporation
> -:Licence: This work is licensed under the terms of the GNU GPL,
> -          version 2 or later. See the COPYING file in the top-level
> -          directory.
> +
> +..
> +  Copyright 2014 Virtual Open Systems Sarl.
> +  Copyright 2019 Intel Corporation
> +  Licence: This work is licensed under the terms of the GNU GPL,
> +           version 2 or later. See the COPYING file in the top-level
> +           directory.
>  
>  .. contents:: Table of Contents
>  
> diff --git a/docs/system/generic-loader.rst b/docs/system/generic-loader.rst
> index 531ddbc8e34..4f9fb005f1d 100644
> --- a/docs/system/generic-loader.rst
> +++ b/docs/system/generic-loader.rst
> @@ -1,8 +1,8 @@
>  ..
>     Copyright (c) 2016, Xilinx Inc.
>  
> -This work is licensed under the terms of the GNU GPL, version 2 or later.  See
> -the COPYING file in the top-level directory.
> +   This work is licensed under the terms of the GNU GPL, version 2 or later.  See
> +   the COPYING file in the top-level directory.
>  
>  Generic Loader
>  --------------
> -- 
> 2.20.1


