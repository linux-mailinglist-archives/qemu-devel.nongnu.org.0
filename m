Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BDE6AE271
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 15:31:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZYKq-0006Ju-E0; Tue, 07 Mar 2023 09:30:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZYKo-0006IP-3A
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:30:34 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZYKm-0007Fn-J6
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:30:33 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 bg16-20020a05600c3c9000b003eb34e21bdfso10573744wmb.0
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 06:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678199431;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lI7njEETZfbtZhY4ryxwf6AgQBevQ9BycQ5nRxlv40E=;
 b=KDLHCAg4VKsV4+wx8FZLc475Kq2fcW7k97rBoPbbr1Xg2RRbP6bAg17fcMHKJYynxj
 qvncC0Nz1cb+s+xbRvEExVUm4lV6btuFoRVvbtd0tCQy031r7m3+LexBc5oaBgeh3Rd1
 DQzEwQqDOtfMSl4KAoSzQCBZCECh03FWxkUOU0o/utqO4X2qFL9Fn/y5zO8SCFcjmE8V
 at/btXNafsNNGjnbfkKDV0ycU5G9lf8pB9g/LyygV2Hf9s6Z1fmTysKT2LS3ya/kC1P/
 4bOKVayyvLFpqUXnlCaEZ166v73Ikhq+pS+5rzpxeVxrESS4T1eaBYSRUcSI++tlRY+m
 CQow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678199431;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lI7njEETZfbtZhY4ryxwf6AgQBevQ9BycQ5nRxlv40E=;
 b=zLNHagLMCszee5O0IUXWxYdgNFESoQ+VxLEC1ajJ+HASiuAQp8cpJhBVXR9yxbcQzr
 WB+s0zsYeEoNGqwsQ/GPPqgVNiuCaBdkAdQSX/2brullxFeY7+FPBdyd6X8/+7+eEdng
 a7oE0wqwCMHm9tvyJ5aVMVCCya1xBfLE4SBs93Sjn4dxkl5sYPxBcTPpZK1oIh7bpph0
 +Ij7Jb5RqP1TI/tIsS+Ou0/mXuzj8HhBUGsaE5xRj3D/hFzejr3gOdIlzlvBEAC83HOf
 f6l+u0lakW2TZK8flafgCSL14rmpFcHiF0K8JsfSr8MBY/RZlf1gYDjbPk7TsWdK2XQl
 MAdg==
X-Gm-Message-State: AO0yUKWLjmchQXTHIPBfrEybe52/6cv7HLPfXERcbSN42M3EgTnil3JB
 KnP6baem2KuKPScJPaktUOg=
X-Google-Smtp-Source: AK7set/r76LMNSw/ok5klQNRFQSycL7zdWrfke+YueXkMJLikpP0WP8+eAAfuOPN4RdwZR/Seb/1uQ==
X-Received: by 2002:a05:600c:45d3:b0:3e7:cee4:f8a with SMTP id
 s19-20020a05600c45d300b003e7cee40f8amr13037923wmo.29.1678199430711; 
 Tue, 07 Mar 2023 06:30:30 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 v12-20020a05600c12cc00b003de2fc8214esm12845019wmd.20.2023.03.07.06.30.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 06:30:30 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <4c5938c7-dc09-435d-1da3-6e9842c64d21@xen.org>
Date: Tue, 7 Mar 2023 14:30:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v1 11/25] hw/xen: Pass grant ref to gnttab unmap
 operation
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-12-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-12-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x335.google.com
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
> The previous commit introduced redirectable gnttab operations fairly
> much like-for-like, with the exception of the extra arguments to the
> ->open() call which were always NULL/0 anyway.
> 
> This *changes* the arguments to the ->unmap() operation to include the
> original ref# that was mapped. Under real Xen it isn't necessary; all we
> need to do from QEMU is munmap(), then the kernel will release the grant,
> and Xen does the tracking/refcounting for the guest.
> 
> When we have emulated grant tables though, we need to do all that for
> ourselves. So let's have the back ends keep track of what they mapped
> and pass it in to the ->unmap() method for us.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/9pfs/xen-9p-backend.c            |  7 ++++---
>   hw/block/dataplane/xen-block.c      |  1 +
>   hw/char/xen_console.c               |  2 +-
>   hw/net/xen_nic.c                    | 13 ++++++++-----
>   hw/usb/xen-usb.c                    | 21 ++++++++++++++++-----
>   hw/xen/xen-bus.c                    |  4 ++--
>   hw/xen/xen-legacy-backend.c         |  4 ++--
>   hw/xen/xen-operations.c             |  9 ++++++++-
>   include/hw/xen/xen-bus.h            |  2 +-
>   include/hw/xen/xen-legacy-backend.h |  6 +++---
>   include/hw/xen/xen_backend_ops.h    |  7 ++++---
>   11 files changed, 50 insertions(+), 26 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


