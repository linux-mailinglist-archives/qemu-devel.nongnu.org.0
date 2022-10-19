Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9E7604A66
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 17:04:35 +0200 (CEST)
Received: from localhost ([::1]:37958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olAcT-0007yD-Vn
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 11:04:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1olAXr-0005b8-6Z
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 10:59:47 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:42644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1olAXo-0007WT-UJ
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 10:59:46 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 o20-20020a05600c4fd400b003b4a516c479so205397wmq.1
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 07:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=XoEeh4KZ31p8n/r4n57cbRW8eoKncmT5vVUmUJK3abU=;
 b=L2sw2TPWXnqend4GkIKrF70tZItmzrLiaR/2OxEAg0eEOWbsDkU+J71PF1nwWAXkKy
 TMYU66e/b8bVfDOFP/mQffjSfG647G2OvnnQp8MZFK1wHmTaknqYRn627H0qmxQINxQz
 /eeeh+pR+6u7+lgO5SVaGrGvg5tJ71Yt2SoNn2wgl6DNnzIxxW6hUzHXBVd589K6lvOT
 QgkoSDDcIsHBvaUo2FaSKsVYBjyk9p3Dav+pmplR12Luct8YHut+kXxR3TEa/pa5E1dA
 XAKxgoGxUwwEaFzyxoeQLyu4HVrLSelYPf603CRwYtM3V+HTtfGDorFabAjdWd0jP3Cb
 lFdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XoEeh4KZ31p8n/r4n57cbRW8eoKncmT5vVUmUJK3abU=;
 b=biJTLgfP9tX2HC78HSS2fG89ZcMPtzKqPAuL4+6mC9w/chs2Rp9YqJfITn6x9wSLGq
 A+/IIMDJ89QUYR0+qdhNLTqPc1kO25tsV8p85tujXTjqV59Qf52OPjEUaewwDc+J2Mpv
 V7NmNC5KjtqdXzG0NdAcvfzzkeP9kF/jbJEVjmQnBuk78OzIRSmlHyaTtmP/m//dk0Di
 F9Si0n2ZOXU/VUD4de1mW2Pjg6cGpJM/wgEZIlZ4nL3+30h6z2y0VMk/mB19i1kNj1eO
 G7lzQpxDxFs7j0Y09Zm6WQ43OpMXnCdQBJnFLFji8PUJW0rvY1/CxApxXYytqpBvCt8U
 Nz1Q==
X-Gm-Message-State: ACrzQf0u1uJEvVIAswS3ch5AMWnm0C95KgBXrexFTkuKjCEHcIbbwnU6
 qCujVcq4QvVIxwqElXhoSxU=
X-Google-Smtp-Source: AMsMyM5akBAxdTLdyO602pWu43D5XtULy0iuDq8UgMPWYLOzH8BUZI8IchS6XWDc7Z4GwjkwpFHKeg==
X-Received: by 2002:a05:600c:3d08:b0:3c6:fb56:ac9f with SMTP id
 bh8-20020a05600c3d0800b003c6fb56ac9fmr8946745wmb.193.1666191581617; 
 Wed, 19 Oct 2022 07:59:41 -0700 (PDT)
Received: from [192.168.16.131] (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a1c440b000000b003c6f8d30e40sm129706wma.31.2022.10.19.07.59.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 07:59:41 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <50fc4560-1658-f6c7-6617-9ae37b0cffab@xen.org>
Date: Wed, 19 Oct 2022 15:59:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v1 03/12] hw/i386/xen: rearrange xen_hvm_init_pc
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org
Cc: stefano.stabellini@amd.com, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-4-vikram.garhwal@amd.com>
Organization: Xen Project
In-Reply-To: <20221015050750.4185-4-vikram.garhwal@amd.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/10/2022 06:07, Vikram Garhwal wrote:
> In preparation to moving most of xen-hvm code to an arch-neutral location,
> move non IOREQ references to:
> - xen_get_vmport_regs_pfn
> - xen_suspend_notifier
> - xen_wakeup_notifier
> - xen_ram_init
> 
> towards the end of the xen_hvm_init_pc() function.
> 
> This is done to keep the common ioreq functions in one place which will be
> moved to new function in next patch in order to make it common to both x86 and
> aarch64 machines.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Reviewed-by: Paul Durrant <paul@xen.org>


