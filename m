Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A6239D515
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 08:37:58 +0200 (CEST)
Received: from localhost ([::1]:50736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lq8tZ-0004tX-MQ
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 02:37:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lq8ry-0003fL-Gz
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 02:36:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lq8rw-0003ry-NW
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 02:36:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623047775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=thJrtqAEZWgLsa5T9uUPgNMHYTXTQwSguSbLhPSvi3M=;
 b=awy5yx/GK6aEYHoYHE260aDfOrodF2Jaln1clpL/tCLsici2xB5IleAIZ21CgM6eZBH9NL
 OXP1pfv8/lwJvI7m24O/WB1N3bnVKkwH6sP7MvanY8pXCfUmLIkBfgj16zTBur2ppArRpb
 Nd0MRf8jr/Ned7AIIAhcTQcvwznicAA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-K0TVKLSIPfaJTMzj-bO6sA-1; Mon, 07 Jun 2021 02:36:10 -0400
X-MC-Unique: K0TVKLSIPfaJTMzj-bO6sA-1
Received: by mail-wr1-f69.google.com with SMTP id
 r17-20020a5d52d10000b0290119976473fcso5229433wrv.15
 for <qemu-devel@nongnu.org>; Sun, 06 Jun 2021 23:36:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=thJrtqAEZWgLsa5T9uUPgNMHYTXTQwSguSbLhPSvi3M=;
 b=hUYHpOQph6i4cobUo+6yzFoEJ1gvngKbivnDQlRS+HSgVIsyh/SV20TJv1Qm50P9kD
 qUazUzM1bN7ZFt7pFd3aI/kF/oOzPDA/6V6Y20W9NNe+cxPf5nnT87rJUuRN1aeC66T6
 owf23EOwT7S8qdKkMGNywFMLpgK9sEFg0OJpDbtns1QwX2XTDz6aqDW6Lb6zxVVrZZez
 PvEHl9JGQAr3FVa27VlFByFqUY8rcn4KWVZUF2B16p8U1l19UbeVv6mFb9bQzD5xGGCE
 8MFAzFaWYjmOxjFGNg+/b+fLQcYkjr+1rnxODZMaxCNO3fxkw1zwNTppX0oiB6oDI05h
 Y4GA==
X-Gm-Message-State: AOAM533DISgqrD3oFRrwYixUc6/lvge6UsSpfsNlMsZj16CGpn0nEyOd
 Q5quehd5G/FLZJ5njW9rUIgEvnC3F+Ni71O0JrFSVNovlo64PWdkhKjSKBD50bn//AvcHWTJeyL
 gxp+h6xy6W7mw9IA=
X-Received: by 2002:a1c:1f51:: with SMTP id f78mr15330456wmf.7.1623047769490; 
 Sun, 06 Jun 2021 23:36:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylIkmTDkwgmIQM4R2Pny1BX6EiFV+JC8gjufLOIUNCoJ8dJnFVzgajFrArTMLPjOqGd59ivw==
X-Received: by 2002:a1c:1f51:: with SMTP id f78mr15330437wmf.7.1623047769298; 
 Sun, 06 Jun 2021 23:36:09 -0700 (PDT)
Received: from thuth.remote.csb (pd957536e.dip0.t-ipconnect.de.
 [217.87.83.110])
 by smtp.gmail.com with ESMTPSA id i15sm4425627wmq.23.2021.06.06.23.36.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Jun 2021 23:36:08 -0700 (PDT)
Subject: Re: [PATCH 2/2] Remove leading underscores from Xen defines
To: Ahmed Abouzied <email@aabouzied.com>, qemu-devel@nongnu.org
References: <20210605175001.13836-1-email@aabouzied.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <01ba2176-b559-1078-8a9f-39553989d9d3@redhat.com>
Date: Mon, 7 Jun 2021 08:36:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210605175001.13836-1-email@aabouzied.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Anthony Perard <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul@xen.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/06/2021 19.50, Ahmed Abouzied wrote:
> Identifiers with leading underscores followed by capital letters or
> underscores are reserved for C standards.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/369
> 
> Signed-off-by: Ahmed Abouzied <email@aabouzied.com>
> ---
>   include/hw/xen/interface/grant_table.h  | 4 ++--
>   include/hw/xen/interface/io/blkif.h     | 4 ++--
>   include/hw/xen/interface/io/console.h   | 4 ++--
>   include/hw/xen/interface/io/fbif.h      | 4 ++--
>   include/hw/xen/interface/io/kbdif.h     | 4 ++--
>   include/hw/xen/interface/io/netif.h     | 4 ++--
>   include/hw/xen/interface/io/protocols.h | 4 ++--
>   include/hw/xen/interface/io/ring.h      | 4 ++--
>   include/hw/xen/interface/io/usbif.h     | 4 ++--
>   9 files changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/include/hw/xen/interface/grant_table.h b/include/hw/xen/interface/grant_table.h
> index 2af0cbdde3..c0a09dadad 100644
> --- a/include/hw/xen/interface/grant_table.h
> +++ b/include/hw/xen/interface/grant_table.h
> @@ -25,8 +25,8 @@
>    * Copyright (c) 2004, K A Fraser
>    */
>   
> -#ifndef __XEN_PUBLIC_GRANT_TABLE_H__
> -#define __XEN_PUBLIC_GRANT_TABLE_H__
> +#ifndef XEN_PUBLIC_GRANT_TABLE_H
> +#define XEN_PUBLIC_GRANT_TABLE_H
>   
>   /*
>    * Reference to a grant entry in a specified domain's grant table.
> diff --git a/include/hw/xen/interface/io/blkif.h b/include/hw/xen/interface/io/blkif.h
> index d07fa1e078..680914571f 100644
> --- a/include/hw/xen/interface/io/blkif.h
> +++ b/include/hw/xen/interface/io/blkif.h
> @@ -25,8 +25,8 @@
>    * Copyright (c) 2012, Spectra Logic Corporation
>    */
>   
> -#ifndef __XEN_PUBLIC_IO_BLKIF_H__
> -#define __XEN_PUBLIC_IO_BLKIF_H__
> +#ifndef XEN_PUBLIC_IO_BLKIF_H
> +#define XEN_PUBLIC_IO_BLKIF_H
>   
>   #include "ring.h"
>   #include "../grant_table.h"
> diff --git a/include/hw/xen/interface/io/console.h b/include/hw/xen/interface/io/console.h
> index e2155d1cf5..0d4a72456e 100644
> --- a/include/hw/xen/interface/io/console.h
> +++ b/include/hw/xen/interface/io/console.h
> @@ -24,8 +24,8 @@
>    * Copyright (c) 2005, Keir Fraser
>    */
>   
> -#ifndef __XEN_PUBLIC_IO_CONSOLE_H__
> -#define __XEN_PUBLIC_IO_CONSOLE_H__
> +#ifndef XEN_PUBLIC_IO_CONSOLE_H
> +#define XEN_PUBLIC_IO_CONSOLE_H
>   
>   typedef uint32_t XENCONS_RING_IDX;
>   
> diff --git a/include/hw/xen/interface/io/fbif.h b/include/hw/xen/interface/io/fbif.h
> index ea87ebec0a..4e25423490 100644
> --- a/include/hw/xen/interface/io/fbif.h
> +++ b/include/hw/xen/interface/io/fbif.h
> @@ -23,8 +23,8 @@
>    * Copyright (C) 2006 Red Hat, Inc., Markus Armbruster <armbru@redhat.com>
>    */
>   
> -#ifndef __XEN_PUBLIC_IO_FBIF_H__
> -#define __XEN_PUBLIC_IO_FBIF_H__
> +#ifndef XEN_PUBLIC_IO_FBIF_H
> +#define XEN_PUBLIC_IO_FBIF_H
>   
>   /* Out events (frontend -> backend) */
>   
> diff --git a/include/hw/xen/interface/io/kbdif.h b/include/hw/xen/interface/io/kbdif.h
> index 1d68cd458e..a952c77bf2 100644
> --- a/include/hw/xen/interface/io/kbdif.h
> +++ b/include/hw/xen/interface/io/kbdif.h
> @@ -23,8 +23,8 @@
>    * Copyright (C) 2006 Red Hat, Inc., Markus Armbruster <armbru@redhat.com>
>    */
>   
> -#ifndef __XEN_PUBLIC_IO_KBDIF_H__
> -#define __XEN_PUBLIC_IO_KBDIF_H__
> +#ifndef XEN_PUBLIC_IO_KBDIF_H
> +#define XEN_PUBLIC_IO_KBDIF_H
>   
>   /*
>    *****************************************************************************
> diff --git a/include/hw/xen/interface/io/netif.h b/include/hw/xen/interface/io/netif.h
> index 48fa530950..f4a28a43b1 100644
> --- a/include/hw/xen/interface/io/netif.h
> +++ b/include/hw/xen/interface/io/netif.h
> @@ -24,8 +24,8 @@
>    * Copyright (c) 2003-2004, Keir Fraser
>    */
>   
> -#ifndef __XEN_PUBLIC_IO_NETIF_H__
> -#define __XEN_PUBLIC_IO_NETIF_H__
> +#ifndef XEN_PUBLIC_IO_NETIF_H
> +#define XEN_PUBLIC_IO_NETIF_H
>   
>   #include "ring.h"
>   #include "../grant_table.h"
> diff --git a/include/hw/xen/interface/io/protocols.h b/include/hw/xen/interface/io/protocols.h
> index 52b4de0f81..3d1cac322b 100644
> --- a/include/hw/xen/interface/io/protocols.h
> +++ b/include/hw/xen/interface/io/protocols.h
> @@ -22,8 +22,8 @@
>    * Copyright (c) 2008, Keir Fraser
>    */
>   
> -#ifndef __XEN_PROTOCOLS_H__
> -#define __XEN_PROTOCOLS_H__
> +#ifndef XEN_PROTOCOLS_H
> +#define XEN_PROTOCOLS_H
>   
>   #define XEN_IO_PROTO_ABI_X86_32     "x86_32-abi"
>   #define XEN_IO_PROTO_ABI_X86_64     "x86_64-abi"
> diff --git a/include/hw/xen/interface/io/ring.h b/include/hw/xen/interface/io/ring.h
> index 115705f3f4..ea324c5a62 100644
> --- a/include/hw/xen/interface/io/ring.h
> +++ b/include/hw/xen/interface/io/ring.h
> @@ -24,8 +24,8 @@
>    * Tim Deegan and Andrew Warfield November 2004.
>    */
>   
> -#ifndef __XEN_PUBLIC_IO_RING_H__
> -#define __XEN_PUBLIC_IO_RING_H__
> +#ifndef XEN_PUBLIC_IO_RING_H
> +#define XEN_PUBLIC_IO_RING_H
>   
>   /*
>    * When #include'ing this header, you need to provide the following
> diff --git a/include/hw/xen/interface/io/usbif.h b/include/hw/xen/interface/io/usbif.h
> index c6a58639d6..564c0115e8 100644
> --- a/include/hw/xen/interface/io/usbif.h
> +++ b/include/hw/xen/interface/io/usbif.h
> @@ -25,8 +25,8 @@
>    * DEALINGS IN THE SOFTWARE.
>    */
>   
> -#ifndef __XEN_PUBLIC_IO_USBIF_H__
> -#define __XEN_PUBLIC_IO_USBIF_H__
> +#ifndef XEN_PUBLIC_IO_USBIF_H
> +#define XEN_PUBLIC_IO_USBIF_H
>   
>   #include "ring.h"
>   #include "../grant_table.h"
> 

I hope the Xen people can comment on whether the underscores had a purpose 
here or whether it's ok to remove them, thus:

Cc: xen-devel@lists.xenproject.org

 From my QEMU-developer's side of view:

Reviewed-by: Thomas Huth <thuth@redhat.com>


