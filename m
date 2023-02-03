Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3383268A659
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 23:54:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO4wL-0008EW-MY; Fri, 03 Feb 2023 17:53:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pO4wJ-0008ED-Sn
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 17:53:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pO4wI-0004pE-Dg
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 17:53:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675464829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Jw6rtJsayLrP8WiMRLkeVRNkqMH3ijaEx/mCdcfg8JE=;
 b=MsfcY5R/92QndzXtw8bV7bduNmBAObbAU0VXDr854Jgn3lXlWbFBzB1KjKh0O8xvbSkAvH
 vuvoiYOjIUcthZ9cwBURfy0hWavVcr2vFOnuwZk0yTTxsD2pQlY9xI4iwoR03Ap5bDeOrC
 b2eB25RNbpDhd5sbQ2IUzP1KguqQqE0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-uLKCUZ9XOLCSjtkLJM6NUA-1; Fri, 03 Feb 2023 17:53:48 -0500
X-MC-Unique: uLKCUZ9XOLCSjtkLJM6NUA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E29185A5B1;
 Fri,  3 Feb 2023 22:53:48 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CAE60C15BA0;
 Fri,  3 Feb 2023 22:53:47 +0000 (UTC)
Date: Fri, 3 Feb 2023 16:53:46 -0600
From: Eric Blake <eblake@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, mjt@tls.msk.ru
Subject: Re: [PATCH 2/5] docs: differentiate between block driver create and
 runtime opts
Message-ID: <20230203225346.xcynxlccx6c2inrl@redhat.com>
References: <20230201211234.301918-1-stefanha@redhat.com>
 <20230201211234.301918-3-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230201211234.301918-3-stefanha@redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Feb 01, 2023 at 04:12:31PM -0500, Stefan Hajnoczi wrote:
> Options available with qemu-img create -o ... are called create options.
> They affect how the image file is created on disk.
> 
> Options available with --blockdev ... are called runtime options. They
> affect how the open blockdev behaves.
> 
> The documentation makes no distinction is made between the two. For

s/is made //

> example, the preallocation filter driver talks about the runtime options
> while the image format drivers talk about the create options.
> 
> Be explicit about create vs runtime options.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  docs/system/qemu-block-drivers.rst.inc | 26 ++++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/docs/system/qemu-block-drivers.rst.inc b/docs/system/qemu-block-drivers.rst.inc
> index dfe5d2293d..be6eec1eb6 100644
> --- a/docs/system/qemu-block-drivers.rst.inc
> +++ b/docs/system/qemu-block-drivers.rst.inc
> @@ -6,9 +6,11 @@ any of the tools (like ``qemu-img``). This includes the preferred formats
>  raw and qcow2 as well as formats that are supported for compatibility with
>  older QEMU versions or other hypervisors.
>  
> -Depending on the image format, different options can be passed to
> -``qemu-img create`` and ``qemu-img convert`` using the ``-o`` option.
> -This section describes each format and the options that are supported for it.
> +Depending on the image format, different options can be passed to ``qemu-img
> +create`` and ``qemu-img convert`` using the ``-o`` option. These are called
> +*create options*. Image formats also support different ``--blockdev`` options.
> +These are called *runtime options*. This section describes each format and the
> +options that are supported for it.
>  

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


