Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6C23CD58B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 15:08:50 +0200 (CEST)
Received: from localhost ([::1]:35574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5T0r-00089E-9Y
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 09:08:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m5SzK-0006qX-E9
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 09:07:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m5SzI-0005D5-Iu
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 09:07:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626700031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zh2h3jo3vJVB9CUtnRN1He1axcmzaMSy+6QVdGd3xv0=;
 b=giD300ui17CBckQ27Ib84dvrd927F9bGWVMahdl9W7erLk8nh2l1oUf7VJDTTsRUa0vPXB
 gh5K6AQKLHTFTMjjUXArtK2lt1eZGax9Hy8VrEYDmf7IlC12X7yVFbcfm2iGn9/YI9sfQR
 R1J8uKvznEbAX3KR09wfDFDNxZmmEAk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-r_-uzsTXOzitpCoEzL1amw-1; Mon, 19 Jul 2021 09:07:08 -0400
X-MC-Unique: r_-uzsTXOzitpCoEzL1amw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E1C5800050;
 Mon, 19 Jul 2021 13:07:07 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F91B18A50;
 Mon, 19 Jul 2021 13:07:06 +0000 (UTC)
Date: Mon, 19 Jul 2021 15:07:05 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] qemu-options.hx: Fix formatting of -machine
 memory-backend option
Message-ID: <20210719150705.26db8ed4@redhat.com>
In-Reply-To: <20210719105257.3599-1-peter.maydell@linaro.org>
References: <20210719105257.3599-1-peter.maydell@linaro.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 19 Jul 2021 11:52:57 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> The documentation of the -machine memory-backend has some minor
> formatting errors:
>  * Misindentation of the initial line meant that the whole option
>    section is incorrectly indented in the HTML output compared to
>    the other -machine options
>  * The examples weren't indented, which meant that they were formatted
>    as plain run-on text including outputting the "::" as text.
>  * The a) b) list has no rst-format markup so it is rendered as
>    a single run-on paragraph
> 
> Fix the formatting.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  qemu-options.hx | 30 +++++++++++++++++-------------
>  1 file changed, 17 insertions(+), 13 deletions(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 0c9ddc02746..d783626d5b6 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -98,28 +98,32 @@ SRST
>          Enables or disables ACPI Heterogeneous Memory Attribute Table
>          (HMAT) support. The default is off.
>  
> -     ``memory-backend='id'``
> +    ``memory-backend='id'``
>          An alternative to legacy ``-mem-path`` and ``mem-prealloc`` options.
>          Allows to use a memory backend as main RAM.
>  
>          For example:
>          ::
> -        -object memory-backend-file,id=pc.ram,size=512M,mem-path=/hugetlbfs,prealloc=on,share=on
> -        -machine memory-backend=pc.ram
> -        -m 512M
> +
> +            -object memory-backend-file,id=pc.ram,size=512M,mem-path=/hugetlbfs,prealloc=on,share=on
> +            -machine memory-backend=pc.ram
> +            -m 512M
>  
>          Migration compatibility note:
> -        a) as backend id one shall use value of 'default-ram-id', advertised by
> -        machine type (available via ``query-machines`` QMP command), if migration
> -        to/from old QEMU (<5.0) is expected.
> -        b) for machine types 4.0 and older, user shall
> -        use ``x-use-canonical-path-for-ramblock-id=off`` backend option
> -        if migration to/from old QEMU (<5.0) is expected.
> +
> +        * as backend id one shall use value of 'default-ram-id', advertised by
> +          machine type (available via ``query-machines`` QMP command), if migration
> +          to/from old QEMU (<5.0) is expected.
> +        * for machine types 4.0 and older, user shall
> +          use ``x-use-canonical-path-for-ramblock-id=off`` backend option
> +          if migration to/from old QEMU (<5.0) is expected.
> +
>          For example:
>          ::
> -        -object memory-backend-ram,id=pc.ram,size=512M,x-use-canonical-path-for-ramblock-id=off
> -        -machine memory-backend=pc.ram
> -        -m 512M
> +
> +            -object memory-backend-ram,id=pc.ram,size=512M,x-use-canonical-path-for-ramblock-id=off
> +            -machine memory-backend=pc.ram
> +            -m 512M
>  ERST
>  
>  HXCOMM Deprecated by -machine


