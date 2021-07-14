Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0F73C829F
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 12:18:25 +0200 (CEST)
Received: from localhost ([::1]:50290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3byC-0004e4-SZ
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 06:18:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m3bso-0005qT-6W
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 06:12:50 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:46892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m3bsm-0003CL-Mv
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 06:12:49 -0400
Received: by mail-io1-xd32.google.com with SMTP id p186so1315248iod.13
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 03:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g8/uBdHS75KyU703p0E+tbIxBCagTSrYNQiB0JbVEHc=;
 b=VITK5Y1h8LONEthPmAf/YkNl1/b8gSy/8A58JypzePlwEruUrjrqeFrucXK0HCr5EG
 dkM5dHieHq4QW2r2P4aPx8c/kH/MyOAG9JMKuFod1zgZkvbygSb7MIT+mhszAGDl7keT
 4LrWTIUbxRIEYqSVJuILU8fjcIFcE6TynnnbvCoOQPsVn6dW0OHrrziDIhxzooQlBSNH
 RS+lkSaFcOwKOq2ZVmD+11O/O9tdrYH7NHr2srK7upkJN/jyNHZBqRug6QAOXUicGiEx
 ymArcTJb0i/MVZCQoCr1mFL+YVVxo4NmnSQl/LgmnqDS4ZsWqXTzolOEwQcJfa3/qcV/
 4M+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g8/uBdHS75KyU703p0E+tbIxBCagTSrYNQiB0JbVEHc=;
 b=YcBB/WClgt7Q7DlbKqzCQLQUBx9glNKvA25YYCe3S/kZqGuYMOcCh8rcwlZlzSswte
 EF7W1yiUUab7YwoaD/rwbSfuqnUquBQeQbSuNxeH3wz5GlQoNIapUxO3N7DqQ/Fcva+E
 8wcmcyftjfCgP5pAyPem3LNVHSFGDZA+yZ6rzhnHwTSuAylL3kwKHYMTv3louh8m6J2Z
 C6XFjt+BVO1433+IHo9AdkFSDxzLSIE8W/n0piazPpdDjU4rIARcgeLBfSxEJ8T1Q9Oc
 6JOnuxSIxnsd/Uh3VwtlbpbiI4OacRlWKIk8Ad2mN857KJE+VdsNaCn40ZNU/lGZoV5a
 TfIA==
X-Gm-Message-State: AOAM530XG4VJZ200aICpuZNKqO802em8U9ApPdOmVZUbmy590esSqwD/
 g+skuhm0zl7pfyPJzINbFgq3pYAVzorLfuTlNFs=
X-Google-Smtp-Source: ABdhPJxeb+ZaBYPa0EN4Ll2Z7PH58rt11zGhbZlMtM28QBl7YWalDl37BTMNFRdkxYOj3ttucugTwoJj8PPlxndx9xM=
X-Received: by 2002:a6b:f41a:: with SMTP id i26mr6607557iog.162.1626257567319; 
 Wed, 14 Jul 2021 03:12:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210714092946.569516-1-stefanha@redhat.com>
 <20210714092946.569516-3-stefanha@redhat.com>
In-Reply-To: <20210714092946.569516-3-stefanha@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Wed, 14 Jul 2021 12:12:36 +0200
Message-ID: <CAM9Jb+i4eAZBo32tVfdLJeSaSPW14gGcA9TFgxF_CqB8Q378AA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] memory: add memory_region_is_mapped_shared()
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Qemu Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> Add a function to query whether a memory region is mmap(MAP_SHARED).
> This will be used to check that vhost-user memory regions can be shared
> with the device backend process in the next patch.
>
> An inline function in "exec/memory.h" would have been nice but RAMBlock
> fields are only accessible from memory.c (see "exec/ramblock.h").
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  include/exec/memory.h | 11 +++++++++++
>  softmmu/memory.c      |  6 ++++++
>  2 files changed, 17 insertions(+)
>
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index c3d417d317..5976f05a01 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -2763,6 +2763,17 @@ static inline bool memory_access_is_direct(MemoryRegion *mr, bool is_write)
>      }
>  }
>
> +/**
> + * memory_region_is_mapped_shared: check whether a memory region is
> + * mmap(MAP_SHARED)
> + *
> + * Returns %true is a memory region is mmap(MAP_SHARED). This is always false
> + * on memory regions that do not support memory_region_get_ram_ptr().
> + *
> + * @mr: the memory region being queried
> + */
> +bool memory_region_is_mapped_shared(MemoryRegion *mr);
> +
>  /**
>   * address_space_read: read from an address space.
>   *
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index bfedaf9c4d..3c4510c809 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -1811,6 +1811,12 @@ bool memory_region_is_ram_device(MemoryRegion *mr)
>      return mr->ram_device;
>  }
>
> +bool memory_region_is_mapped_shared(MemoryRegion *mr)
> +{
> +    return memory_access_is_direct(mr, false) &&
> +           (mr->ram_block->flags & RAM_SHARED);
> +}
> +
>  uint8_t memory_region_get_dirty_log_mask(MemoryRegion *mr)
>  {
>      uint8_t mask = mr->dirty_log_mask;

Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>

