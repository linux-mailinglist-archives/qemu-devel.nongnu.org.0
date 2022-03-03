Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEB34CC76D
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 21:58:56 +0100 (CET)
Received: from localhost ([::1]:50260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPsXH-0002aJ-Du
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 15:58:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1nPsU9-0008Tc-Sz
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:55:42 -0500
Received: from [2607:f8b0:4864:20::62f] (port=44653
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1nPsU7-00039K-RZ
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:55:41 -0500
Received: by mail-pl1-x62f.google.com with SMTP id q11so5841046pln.11
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 12:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=vEq5XEGjeKku93i9ZIVd+lPLyjIL5kXAT/16BO0sKFY=;
 b=Unan2DRSfJOeD3TUq09OmLNr33A89FTTfDK1Xtud6PVsQkquvafjCRigU2AEnl0iA9
 e4TzMoM4/W33I68o/C3rFIm0dN6vjA1MiSC/kj12+yMllZDOilBJKQ4u5Ad1XIItYjmA
 T+WQhqr/xSAEKbGS2KHnyzQvafj8vezFl6fl56fb9qeDvuWJ9JxhKBFw3aDXk3AFWgTP
 N6U09XRwBNFy8FaDjSeIHUU2QOpEyJxZ8HaOvuspMNzspxAUdeC85P7F8jB0L0ilhupx
 8B7nUVpwfcNNn2Ieoa1HjQZpykK5D6umChCQ085TBoqC+zcgkjVsjjH7qIG6pGKQk7IT
 62Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=vEq5XEGjeKku93i9ZIVd+lPLyjIL5kXAT/16BO0sKFY=;
 b=t2yyyeA0RVPKs0Rc3Pqfzzn8GphLKAKy8ZXRJLJeLLs4g8D/k67+F23JLKS+XXbrwN
 Rw7Iajv/rqXUFvtHHpGSHV9ONpgBzrBWahvIxT5mJKQ+3n1uZKIh24wZ9pt9R0pZHIt9
 fyCcXTRvwGR5Flmc4vtYscZLpgamU3mt7sbWGfF7h//JCFv2b92Yg6OTZlK2CNSOgFIS
 38D9BfZCq8NLOXTZoxmqPLqgxl++54u453OINlaywVEiEIYr8rtpm3tIGGyDxajelsNR
 l5RIFBpSe64QlRBjivRvsM7M0dYVx7SB8mmsdgEb4ImDNldi9u+LdCWxu9WR9Wq9bUnt
 BseA==
X-Gm-Message-State: AOAM532A6UOTKviMep9+0JaxkmVIsgcD5i05HQuQoPiUfJ741iSKnxVf
 zZe1uHT+px1PfpyEtr2syeCZ8bOrz9/tLQ==
X-Google-Smtp-Source: ABdhPJwHiSGy6Fr0R/UMIbb69BlQT5kmitYxIdykeu5oOR/IVSbOidQ59jFl3Oa7OMVchzGLXTT/3g==
X-Received: by 2002:a17:90a:d081:b0:1bd:4c83:56ec with SMTP id
 k1-20020a17090ad08100b001bd4c8356ecmr7310319pju.238.1646340936378; 
 Thu, 03 Mar 2022 12:55:36 -0800 (PST)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 k5-20020aa788c5000000b004df7bf0a290sm3477934pff.1.2022.03.03.12.55.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 12:55:35 -0800 (PST)
Date: Thu, 03 Mar 2022 12:55:35 -0800 (PST)
X-Google-Original-Date: Thu, 03 Mar 2022 12:54:49 PST (-0800)
Subject: Re: [PATCH] docs/system: riscv: Update description of CPU
In-Reply-To: <9040401e-8f87-ef4a-d840-6703f08d068c@bytedance.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: liyu.yukiteru@bytedance.com
Message-ID: <mhng-10786ebc-b90a-48dc-a4ef-3d732f2cd6d7@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=palmer@dabbelt.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, liyu.yukiteru@bytedance.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 08 Feb 2022 05:07:23 PST (-0800), liyu.yukiteru@bytedance.com wrote:
> Since the hypervisor extension been non experimental and enabled for
> default CPU, the previous command is no longer available and the
> option `x-h=true` or `h=true` is also no longer required.
>
> Signed-off-by: Yu Li <liyu.yukiteru@bytedance.com>
> ---
>   docs/system/riscv/virt.rst | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
> index fa016584bf..08ce3c4177 100644
> --- a/docs/system/riscv/virt.rst
> +++ b/docs/system/riscv/virt.rst
> @@ -23,9 +23,9 @@ The ``virt`` machine supports the following devices:
>   * 1 generic PCIe host bridge
>   * The fw_cfg device that allows a guest to obtain data from QEMU
>
> -Note that the default CPU is a generic RV32GC/RV64GC. Optional extensions
> -can be enabled via command line parameters, e.g.: ``-cpu rv64,x-h=true``
> -enables the hypervisor extension for RV64.
> +The hypervisor extension has been enabled for the default CPU, so virtual
> +machines with hypervisor extension can simply be used without explicitly
> +declaring.
>
>   Hardware configuration information
>   ----------------------------------

I saw this landed, but I'm not sure the wording is quite right.  I think 
it's at least missing what is being declared, so something like this

    diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
    index 08ce3c4177..fe40d6565a 100644
    --- a/docs/system/riscv/virt.rst
    +++ b/docs/system/riscv/virt.rst
    @@ -24,8 +24,8 @@ The ``virt`` machine supports the following devices:
     * The fw_cfg device that allows a guest to obtain data from QEMU
    
     The hypervisor extension has been enabled for the default CPU, so virtual
    -machines with hypervisor extension can simply be used without explicitly
    -declaring.
    +machines with the hypervisor extension can simply be used without explicitly
    +declaring it as enabled.
    
     Hardware configuration information
     ----------------------------------

That said, I think we'd be better off just picking a different example 
extension to enable -- IMO this was less about the hypervisor extension 
and more about the syntax for enabling extensions, that's certianly what 
I end up looking at the docs for.  So IMO we'd be better off with 
something like

    diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
    index 08ce3c4177..f59e8777b2 100644
    --- a/docs/system/riscv/virt.rst
    +++ b/docs/system/riscv/virt.rst
    @@ -23,9 +23,9 @@ The ``virt`` machine supports the following devices:
     * 1 generic PCIe host bridge
     * The fw_cfg device that allows a guest to obtain data from QEMU
    
    -The hypervisor extension has been enabled for the default CPU, so virtual
    -machines with hypervisor extension can simply be used without explicitly
    -declaring.
    +Note that the default CPU is a generic RV32GC/RV64GC. Optional extensions
    +can be enabled via command line parameters, e.g.: ``-cpu rv64,c=false``
    +disables the C extension.
    
     Hardware configuration information
     ----------------------------------

