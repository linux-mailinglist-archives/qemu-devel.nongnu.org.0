Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A68B6A78EB
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 02:37:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXXsK-0000bu-O1; Wed, 01 Mar 2023 20:36:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pXXsI-0000Ws-Gp
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 20:36:50 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pXXsD-0000El-Ik
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 20:36:48 -0500
Received: by mail-pg1-x529.google.com with SMTP id q23so8900966pgt.7
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 17:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1677721004;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=elvuBb4nHDtFhDS8BQP/eiLCOgYA+38haibImLr7qmY=;
 b=FUT29qgprBc0vWfHS94NwMUL0BQBXRLpSEsdrKwV/M0r+9+Pn6/piAJ7qRK5uxn+Ew
 paNcIXT5hPNluXvzZEma2FXLtVtDdeSOVzP/SPydEsKANZpJJ48nP2o9Y7sNWPLHfDrX
 HxAVYTp9L9KF/YfCe9AeFxLC0FbUZ2E9jF/kzouM4apiW+zKbIhC6bT3zevsBcNPjs3x
 71VnZCyw2rhvU7nynKZR7reuNUjYsSgSRD7R66h8r+YIp6g7lxrGUCgL8kNuloxt0MBb
 qXFktY3BWsHDK4y+n6tedbp/0S6n3uFc2qVQRY0drO8gsxJq8IsDn6mmDWOpsNZL5Kyn
 zL9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677721004;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=elvuBb4nHDtFhDS8BQP/eiLCOgYA+38haibImLr7qmY=;
 b=aV81r34cbZ9a6oXCilqNsTWWMLJikYhH/7HwFG34+Bc9dkvSbLeeG6v6bj77vrFcZ2
 d/coQCq3dtjpwcAGh01B8x3KEht8sVAN8oiRG/VJNax3AWyBbHF/7abw+uzfVFpYGq3i
 VNQB0Re48ztKq2GfaUCUdku0q67BIdsDm6+wLY96Y2+R9IQRfcrEj+ZQtUreZSg13Pis
 VMekW4P4GuQToVD0s1E4u7srNSVMr+YJ3AplbKgoxm/uwU4b/I5LTNytCakj7K4uJ2lb
 Ya1lz//2EM3TQfGspgB4bUleBEyfrimuosZlEQW6SNRXNP9+m5c6LooKSzM3Q7PM93Gl
 gVaw==
X-Gm-Message-State: AO0yUKWlfguI4eeKeShEDSld5KctxXVkWlrWZ4ARUIcrVoo23sCI9U8B
 5Lx39Opn67w3RGdh8wvtbhj4Hw==
X-Google-Smtp-Source: AK7set9vaprIzKjetfiP4TEjoTmZf6hxhrPdSjn3CpS1r7GrruVnu/pGH3BDdR95tMrwWQmo8T9ptQ==
X-Received: by 2002:aa7:96d0:0:b0:5a9:fcb0:e8a2 with SMTP id
 h16-20020aa796d0000000b005a9fcb0e8a2mr7061555pfq.11.1677721003708; 
 Wed, 01 Mar 2023 17:36:43 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 g11-20020aa7818b000000b005ae02dc5b94sm8534767pfi.219.2023.03.01.17.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 17:36:43 -0800 (PST)
Date: Wed, 01 Mar 2023 17:36:43 -0800 (PST)
X-Google-Original-Date: Wed, 01 Mar 2023 17:31:06 PST (-0800)
Subject: Re: [PATCH 0/6] target/riscv: Add support for Svadu extension
In-Reply-To: <20230224040852.37109-1-liweiwei@iscas.ac.cn>
CC: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 liweiwei@iscas.ac.cn
From: Palmer Dabbelt <palmer@dabbelt.com>
To: liweiwei@iscas.ac.cn
Message-ID: <mhng-0a186729-e21b-4901-ab25-4c644e45674d@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=palmer@dabbelt.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Thu, 23 Feb 2023 20:08:46 PST (-0800), liweiwei@iscas.ac.cn wrote:
> This patchset adds support svadu extension. It also fixes some relationship between *envcfg fields and Svpbmt/Sstc extensions.
>
> Specification for Svadu extension can be found in:
>
> https://github.com/riscv/riscv-svadu
>
> The port is available here:
> https://github.com/plctlab/plct-qemu/tree/plct-svadu-upstream
>
> Weiwei Li (6):
>   target/riscv: Fix the relationship between menvcfg.PBMTE/STCE and
>     Svpbmt/Sstc extensions
>   target/riscv: Fix the relationship of PBMTE/STCE fields between
>     menvcfg and henvcfg
>   target/riscv: Add csr support for svadu
>   target/riscv: Add *envcfg.PBMTE related check in address translation
>   target/riscv: Add *envcfg.HADE related check in address translation
>   target/riscv: Export Svadu property
>
>  target/riscv/cpu.c        |  8 ++++++++
>  target/riscv/cpu.h        |  1 +
>  target/riscv/cpu_bits.h   |  4 ++++
>  target/riscv/cpu_helper.c | 16 ++++++++++++++--
>  target/riscv/csr.c        | 26 ++++++++++++++++++++------
>  5 files changed, 47 insertions(+), 8 deletions(-)

Thanks, this is queued up on riscv-to-apply.next .

