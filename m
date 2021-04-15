Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4A73607EE
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 13:03:56 +0200 (CEST)
Received: from localhost ([::1]:49684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWzmt-00076C-PO
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 07:03:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lWzlh-0006Ze-43
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 07:02:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lWzlf-0005es-Lf
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 07:02:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618484558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FhAfqKC8pFoGRYT7he+cuEvUCV/J2lVGqECW1sFwZqc=;
 b=XH3Lp28P7/IRIQDujJcVKNDtaSg4hgpTneRm/hsLooxd6EJBl3+zZqDaVf1u6IA6QdbQ7x
 xt7NPtkbpK8Pmq/BhZJhs8phRHbzsirm1OY/z9DXd23Lu/KtcbQEVjcr40vPnisuvEYwJg
 HvMZtFX/HTLJ6BA+vgkrjcc4dqEnCeo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-jw-s9GjUNHqxwndVKg1kNw-1; Thu, 15 Apr 2021 07:02:34 -0400
X-MC-Unique: jw-s9GjUNHqxwndVKg1kNw-1
Received: by mail-ej1-f69.google.com with SMTP id
 z6-20020a17090665c6b02903700252d1ccso789675ejn.10
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 04:02:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=FhAfqKC8pFoGRYT7he+cuEvUCV/J2lVGqECW1sFwZqc=;
 b=IKXKENBauHDF35T9tErgEy4UZ0N1lJDTliP2tJam0/btc2IQtSL1/f8V2TGkT9Z8mP
 u75VIVxNQuaztRSdA4dPlIijY6GsDOXlmW4pCEaaSNy4N9cgFimrpuQ5b1+1bWfYmT1h
 jehnEEvIAKurFo7t/GIONtzlbdDbTCl37jGfJCDhoPMBNbK6b/3g/oF6BOfwWNrujCYM
 W6TAagJTDcWHgiFoBSslRWx7VsEK+zFyOCKpioyaj2myCdCCML2LwKm/hsRfzYP4TW3G
 tk1S6kUZ+KNbo7UrVPPQ6/QTgJHsC6fMHt0ODEswOeldwqAIZNW0epu4l4FTvLp5gRZ3
 Dkhw==
X-Gm-Message-State: AOAM532iDY41AAIzWG+cpi0NR3ljzKgqcrZLjl5ZQN1ooDANspUg7W7N
 eJzFYY46/h0Yjt9ygHVwBaPJRdyhKovJ2ADh8BgFP2oFxqi7DHHPKfqhk4KPvOlefS3eZodYxG6
 MtUe7rItEFKtkln8=
X-Received: by 2002:a17:906:af94:: with SMTP id
 mj20mr2823560ejb.279.1618484553389; 
 Thu, 15 Apr 2021 04:02:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgwGJh6gJOTGzb3pzO29koLiI5oQyVkaA/aSqyy0GgjZA3NQKMpYB7nTk1k0HLovX5JGXHnA==
X-Received: by 2002:a17:906:af94:: with SMTP id
 mj20mr2823545ejb.279.1618484553207; 
 Thu, 15 Apr 2021 04:02:33 -0700 (PDT)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id y16sm2119532edc.62.2021.04.15.04.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 04:02:32 -0700 (PDT)
Date: Thu, 15 Apr 2021 13:02:30 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 2/2] hw/elf_ops: clear uninitialized segment space
Message-ID: <20210415110230.ucaeqr72fum52fst@steredhat>
References: <20210415100409.3977971-1-philmd@redhat.com>
 <20210415100409.3977971-3-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210415100409.3977971-3-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 15, 2021 at 12:04:09PM +0200, Philippe Mathieu-Daudé wrote:
>From: Laurent Vivier <laurent@vivier.eu>
>
>When the mem_size of the segment is bigger than the file_size,
>and if this space doesn't overlap another segment, it needs
>to be cleared.
>
>This bug is very similar to the one we had for linux-user,
>22d113b52f41 ("linux-user: Fix loading of BSS segments"),
>where .bss section is encoded as an extension of the the data
>one by setting the segment p_memsz > p_filesz.
>
>Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>Message-Id: <20210414105838.205019-1-laurent@vivier.eu>
>[PMD: Use recently added address_space_set()]
>Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>---
> include/hw/elf_ops.h | 13 +++++++++++++
> 1 file changed, 13 insertions(+)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
>index 6ee458e7bc3..29f4c43e231 100644
>--- a/include/hw/elf_ops.h
>+++ b/include/hw/elf_ops.h
>@@ -562,6 +562,19 @@ static int glue(load_elf, SZ)(const char *name, int fd,
>                     if (res != MEMTX_OK) {
>                         goto fail;
>                     }
>+                    /*
>+                     * We need to zero'ify the space that is not copied
>+                     * from file
>+                     */
>+                    if (file_size < mem_size) {
>+                        res = address_space_set(as ? as : &address_space_memory,
>+                                                addr + file_size, 0,
>+                                                mem_size - file_size,
>+                                                MEMTXATTRS_UNSPECIFIED);
>+                        if (res != MEMTX_OK) {
>+                            goto fail;
>+                        }
>+                    }
>                 }
>             }
>
>-- 
>2.26.3
>


