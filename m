Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2066AE19E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 15:05:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZXwE-0008TL-KD; Tue, 07 Mar 2023 09:05:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZXw6-0008Gu-SO
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:05:07 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZXw5-0001uZ-1Q
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:05:02 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 bg16-20020a05600c3c9000b003eb34e21bdfso10519214wmb.0
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 06:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678197899;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zCR+/N3JyI+Rqvibb9E6aDk11EXgY7qQNvMvTlCWGys=;
 b=ZT1+yqNLKF4tCXDwhfbe6ei5KUOCnCYN6paoXOyafFTh/s98Usj8fCHKAiTBHWRL0U
 HAOkYv5emKWiAF/l0JdSuhg8/oR+35GjDNG/edIWC6ub/G1ei1+p6UbamjLvkW2CES3L
 TbSKnHA5R/hX/ErtxLj//ZLblQVyGZJCpOX2fdCEt9W46lPShQO7EvX4XWtclVlfVIrx
 n/2uC1tD/g+mQaXEw8bNgX7MdOjend3MWNmFjiiLGOgS8j4MH4QQ3QrfBXLfgCIiuWa0
 MU78kOiwKm3UYnATJd9WOatuMaLfgEDu4is4PiZm9SMet+Q/uqAO8eWKkklvdFHah+RF
 sCqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678197899;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zCR+/N3JyI+Rqvibb9E6aDk11EXgY7qQNvMvTlCWGys=;
 b=40TOeHGGLvKju6+KVu/AtdZ/7wU3xO+m4YC1ahY7aFez1Bj8Y0IOkx8nXf+HkfKvC9
 Umqkex9Ac/J0Zdbw2KXF6+jpIhgHkHPAzrw1fx3/mDodag2BbS26u79dWtFR1WkmuTyh
 T5kpiz7ZXWS3xgGe897cy3b77d4rjXdg/kwaI/OYxhbz1/LxzbIiZbvgfhLczYXze2Mf
 sD26dZlzV9Pn8YJb3LvTQlQijlHvODW6wKi562hwi0MaUZ+Nqzp7E7lr/4ZLfXZd5/Yv
 fudLFuHfuoR9Ymijnk/2WsKNJD0pgTK19cl0JrbpL5viaVOSc2dHocvyiMYg7Nx3V39E
 uh2Q==
X-Gm-Message-State: AO0yUKX9Nbf57tcz8WpEMZ5wGgHtcZkKAiHdSLq54mu2vy5BCArac8xN
 IOTU9GhAur3BnM4RZmXxfXA=
X-Google-Smtp-Source: AK7set+JQIL0mryS1clp30PdlBA8ugHIKdAQwBeb8lXItjElggkk+mBYVgbh9t3cvK566shmRyn1mw==
X-Received: by 2002:a05:600c:4997:b0:3eb:9822:28f7 with SMTP id
 h23-20020a05600c499700b003eb982228f7mr9878373wmp.9.1678197899227; 
 Tue, 07 Mar 2023 06:04:59 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a05600c359000b003e209b45f6bsm18816506wmq.29.2023.03.07.06.04.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 06:04:58 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <abd65d3c-0b2d-7f90-b5f1-3a26d56bc6c4@xen.org>
Date: Tue, 7 Mar 2023 14:04:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v1 09/25] hw/xen: Add evtchn operations to allow
 redirection to internal emulation
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-10-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-10-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x333.google.com
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
> The existing implementation calling into the real libxenevtchn moves to
> a new file hw/xen/xen-operations.c, and is called via a function table
> which in a subsequent commit will also be able to invoke the emulated
> event channel support.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> ---
>   hw/9pfs/xen-9p-backend.c            |  24 +++---
>   hw/i386/xen/xen-hvm.c               |  27 ++++---
>   hw/xen/meson.build                  |   1 +
>   hw/xen/xen-bus.c                    |  22 +++---
>   hw/xen/xen-legacy-backend.c         |   8 +-
>   hw/xen/xen-operations.c             |  71 +++++++++++++++++
>   hw/xen/xen_pvdev.c                  |  12 +--
>   include/hw/xen/xen-bus.h            |   1 +
>   include/hw/xen/xen-legacy-backend.h |   1 +
>   include/hw/xen/xen_backend_ops.h    | 118 ++++++++++++++++++++++++++++
>   include/hw/xen/xen_common.h         |  12 ---
>   include/hw/xen/xen_pvdev.h          |   1 +
>   softmmu/globals.c                   |   1 +
>   13 files changed, 242 insertions(+), 57 deletions(-)
>   create mode 100644 hw/xen/xen-operations.c
>   create mode 100644 include/hw/xen/xen_backend_ops.h
> 

Reviewed-by: Paul Durrant <paul@xen.org>


