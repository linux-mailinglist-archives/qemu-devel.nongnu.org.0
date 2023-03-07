Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BD66AE2E5
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 15:41:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZYUp-0001f5-N0; Tue, 07 Mar 2023 09:40:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZYUm-0001du-VV
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:40:52 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZYUl-00019T-91
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:40:52 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso7357117wmo.0
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 06:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678200050;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Cd7r0E6egEeOQJKPiGStKR4A/mQxjInl3PZyVX0qqN4=;
 b=boRiul5MDGRzTHWvmpZKeuB3QNhk9U3VoOjDYMlNZHbzck0rRn7HMVqK8eT0VxhhGh
 iFB7HJFP4280Jcc8UyvJghLSGOf2182uwqQm8JCSiu5m5hPoJBfviZ2d25Kov3PuU6lW
 pSKkay3ZOQUtve1U0WcTksrFbtRH3LmZmzwb7bYvEh9I6rrLRVTvJqG9qUBhO/EcoEfE
 zecP8azTx1dmdX+LxcVETQjhaFNrTsIskJb3cH5ndyBnWsgzEd7oz1KBxaYIroz+90LV
 eMErCDVSFZlkQRj9pfIaSIaAZAXNoovsAR5g8lc8q2ODcHn4PLo0ewXo/pe8r20njYXg
 s70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678200050;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cd7r0E6egEeOQJKPiGStKR4A/mQxjInl3PZyVX0qqN4=;
 b=GTtkbPj1hx0wANMvV9CWUMMCJjHQ7U/WWKT4lseXBDxjKUH6yjYWLywPFZ6N2RRzhD
 mYNo8JcTWtitMxF4pY0eJkX+N0CwzhiK5KjlMxsEammVaWhdG1FeiykiXK8FZa00vwQ/
 WgWBFw0RM5ObuT9IvuNhLiwIlolWzSO5ig/V44pxFaXyM2NQwlRRclpHwjzOzKQofO5N
 zo6N062v7kg70DK391XjEquRnbHPpwyikcXpWkdD1EGeJ9nVkbw+Uja3D2DWkYRCN7x8
 KxC0mv4Lfgx6Ue+vPIZdZDcERhQHwGL1qQnM8/UYrhTl/aJ49zjMzbX6FYNmXT6TIMac
 bmPw==
X-Gm-Message-State: AO0yUKUJ5EPEzB9uJ3pr4XCvbtWIA5d7gXZ9n9urmiDY6BhGCtBTlgHM
 MGxqT5ZHbyxUoc/sF5xE0Zg=
X-Google-Smtp-Source: AK7set9ka4HjGPxXSbVhfdpPv+uZeUTPWrsODgLJe+MS+2XAXrYwMmCaoipDOHJZ+PqHIYxTcZDr7Q==
X-Received: by 2002:a05:600c:4f14:b0:3eb:1d0c:ad71 with SMTP id
 l20-20020a05600c4f1400b003eb1d0cad71mr12613828wmq.23.1678200049812; 
 Tue, 07 Mar 2023 06:40:49 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a05600c3b1200b003db0ad636d1sm18553965wms.28.2023.03.07.06.40.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 06:40:49 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <470e51bf-5159-fd32-93b5-03f5bdf5f050@xen.org>
Date: Tue, 7 Mar 2023 14:40:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v1 12/25] hw/xen: Add foreignmem operations to allow
 redirection to internal emulation
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-13-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-13-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 02/03/2023 15:34, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> ---
>   hw/char/xen_console.c            |  8 +++---
>   hw/display/xenfb.c               | 20 +++++++-------
>   hw/xen/xen-operations.c          | 45 ++++++++++++++++++++++++++++++++
>   include/hw/xen/xen_backend_ops.h | 26 ++++++++++++++++++
>   include/hw/xen/xen_common.h      | 13 ---------
>   softmmu/globals.c                |  1 +
>   tests/unit/test-xs-node.c        |  1 +
>   7 files changed, 88 insertions(+), 26 deletions(-)
> 
[snip]
> diff --git a/include/hw/xen/xen_common.h b/include/hw/xen/xen_common.h
> index d4d10d3ff1..632ce617cc 100644
> --- a/include/hw/xen/xen_common.h
> +++ b/include/hw/xen/xen_common.h
> @@ -32,19 +32,6 @@ typedef xc_interface xenforeignmemory_handle;
>   #define xenforeignmemory_open(l, f) xen_xc
>   #define xenforeignmemory_close(h)
>   
> -static inline void *xenforeignmemory_map(xc_interface *h, uint32_t dom,
> -                                         int prot, size_t pages,
> -                                         const xen_pfn_t arr[/*pages*/],
> -                                         int err[/*pages*/])
> -{
> -    if (err)
> -        return xc_map_foreign_bulk(h, dom, prot, arr, err, pages);
> -    else
> -        return xc_map_foreign_pages(h, dom, prot, arr, pages);
> -}
> -
> -#define xenforeignmemory_unmap(h, p, s) munmap(p, s * XC_PAGE_SIZE)
> -

Actually, probably best 'static inline' that, or at least put brackets 
round the 'p' and 's' for safety.

With either one of those options chosen...

Reviewed-by: Paul Durrant <paul@xen.org>


