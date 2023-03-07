Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B67AA6AE2F4
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 15:45:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZYYH-0005tD-Jn; Tue, 07 Mar 2023 09:44:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZYYE-0005oM-Vc
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:44:26 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZYYD-0001mS-AD
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:44:26 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 l7-20020a05600c1d0700b003eb5e6d906bso7333357wms.5
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 06:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678200263;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1vpSbqsNRdvuEz3fFpUC5AJNPHlYHSh6keWZcRzex34=;
 b=QUJjvrSsP3R/DyVq3RYS8W+EkMZ7KQk1SXtKGOIgzYMaDkNiHvSEoEPURvwLYY545o
 NR62RAi2BLIShZGaR2zfjiEsqDmdSAzAgNxXEup5pRC9whG7dhaum65/0f3F1sFH12wn
 KoEJI1EM8RjybN0GakwSeSMmDQAKFDUJE8H7k7RxCXgrXE/ibyFSh3GZjN8AOUI/RVuf
 GNT9pMpF2xiIVHXDiJTiTayqafpcpY4i/BZ3uqgLEvfGDAQb685LIZ7IKB9BaXNRD/wh
 HZRusZSxork5eOOjtHNrL72AKAZ6lhxg4fVX4rCJnj1d/9wwNLMu/T8Fmp15tmFbzTLM
 gjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678200263;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1vpSbqsNRdvuEz3fFpUC5AJNPHlYHSh6keWZcRzex34=;
 b=IhooZY0QSxxbFLNYXNqk+zqyVJ+2D381GFZBicb23j3rZQU3cpe6udhWnVFB4bs5bB
 Pc1AbPOfdQS5o8I7N6Z2AD9ImWKgPF4TVoeLGfHitfKE0CVwKSY5VxoJ1kFYgPwwvA6o
 WyM2RO19ydAizHYFZboPPvBFqoAHWzAWdl5fzFYRNQzamiXFO7i13FS4Q9VQnkWfiSbm
 nCtiqoph8c9VPdQEX03Z1iV4xTLaxloJcjlvznfsRUemJDHogbfGByb3vJYjgRE5l7B1
 u/hWzxZDddzghjXke6iIzwkMDWcOf3nquVg5o+BP2xoBDyyM69WItnlbltZUvjN8N7OT
 vRqg==
X-Gm-Message-State: AO0yUKVN1SqqR0RZpjAEVlJXMqLflCuoqlqg0mlET40EfrkDvkvtjIwF
 9yqX2Bo118LVn4auV8G8+aE=
X-Google-Smtp-Source: AK7set/1x6a2eQiNZ8loKuPP8J1iGUxMdVAbiKgnuFwid8+qGYKokj4HfdyME5UUK8UpvrJC+yYJJg==
X-Received: by 2002:a05:600c:450d:b0:3d9:f769:2115 with SMTP id
 t13-20020a05600c450d00b003d9f7692115mr13555203wmo.26.1678200263423; 
 Tue, 07 Mar 2023 06:44:23 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a05600c310c00b003dc49e0132asm18819877wmo.1.2023.03.07.06.44.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 06:44:23 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <71e68af5-1528-f5c3-221a-5166af9396c6@xen.org>
Date: Tue, 7 Mar 2023 14:44:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v1 13/25] hw/xen: Add xenstore operations to allow
 redirection to internal emulation
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-14-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-14-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x334.google.com
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
> From: Paul Durrant <pdurrant@amazon.com>
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   accel/xen/xen-all.c                 |  11 +-
>   hw/char/xen_console.c               |   2 +-
>   hw/i386/kvm/xen_xenstore.c          |   3 -
>   hw/i386/kvm/xenstore_impl.h         |   8 +-
>   hw/xen/xen-bus-helper.c             |  62 +++----
>   hw/xen/xen-bus.c                    | 261 ++++------------------------
>   hw/xen/xen-legacy-backend.c         | 119 +++++++------
>   hw/xen/xen-operations.c             | 198 +++++++++++++++++++++
>   hw/xen/xen_devconfig.c              |   4 +-
>   hw/xen/xen_pt_graphics.c            |   1 -
>   hw/xen/xen_pvdev.c                  |  49 +-----
>   include/hw/xen/xen-bus-helper.h     |  26 +--
>   include/hw/xen/xen-bus.h            |  17 +-
>   include/hw/xen/xen-legacy-backend.h |   6 +-
>   include/hw/xen/xen_backend_ops.h    | 163 +++++++++++++++++
>   include/hw/xen/xen_common.h         |   1 -
>   include/hw/xen/xen_pvdev.h          |   2 +-
>   softmmu/globals.c                   |   1 +
>   18 files changed, 525 insertions(+), 409 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


