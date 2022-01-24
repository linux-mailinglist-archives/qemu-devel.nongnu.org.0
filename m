Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D91C8497D34
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 11:31:15 +0100 (CET)
Received: from localhost ([::1]:57118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBwd0-0006Ew-Er
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 05:31:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nBwZE-0004Lp-Ua
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 05:27:20 -0500
Received: from [2a00:1450:4864:20::134] (port=36472
 helo=mail-lf1-x134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nBwZB-0007yj-Cd
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 05:27:20 -0500
Received: by mail-lf1-x134.google.com with SMTP id b14so48252266lff.3
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 02:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DOXx9LW6IaT7QMjmOcFntVFmSjHWgHT3Wtxq27ct8Ao=;
 b=YtSIovT4rwFmhL4BGXZWhrrVOvqi5uDi1O7R6hcqKnyvXedx+RnSRagc5qlJLAKdp+
 NsjRlrZLK2HxH9II73d6natJD/TsbbcO82vcwDEqW77bsHqkfL6ectLYk/yuVA2sXYdi
 CB+7WWjw0qbhqkAW/Mii7AfQcF0FAMvPd3B7stsFYq+x0YSkL9sfz5ejjcUO/RJmVA2I
 lttszKKKY32ftGRHoCYQtrNSpqYaucSNZFxK0EjJ7OwueYhRGCIuHVgwH5rJ/KGbDAeC
 454XRWjAWKFZNiXizPDp4gGnPjMhBYl15BfGwjM99Xx5GZIjcpzc/HmJwNVpPN9FJED9
 TM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DOXx9LW6IaT7QMjmOcFntVFmSjHWgHT3Wtxq27ct8Ao=;
 b=n5WuVXOFgpFoWh2dce3K4GB7LLnM7fJXeKP3zjhtjMCLneFiSmX8hYjXwW4/dqGVM2
 qRiSqhVmnHWfgp50laadKPc2nfekVqw1WtnpvMa2dc2B9WhvQveg0FwJOEldOJYzCc7u
 wzifv+yTrt48AvkLwdne+gLglteJRE6BpcgRfAP5l+Sx4Rq061bd6o7FalhF01sovuv4
 aQwiGwsRvz7dsSI68a8RBh90DR+bLB5Y+5+fzET+Vn0L+wkzKrOyHlgrAZ0UXCW5bML0
 uy18gup3O+rnMY3+p7t2bl1x1yxJ863Y1mZl800N6EQeVCmO8oVQAZuBhrr3DmDGEc7v
 7DPQ==
X-Gm-Message-State: AOAM532rvKJAWGojaVmoFqOCmsS5M/5dHgBwEq8iWe0nbu2VLuJXG99I
 emxo1M7EqMOX3oO3AvUbhGhoUmI07VA=
X-Google-Smtp-Source: ABdhPJzPuXekJBGtF6R/hwRw53EttHQ0TOY8UGR3J2TlKO0fniULY+90dj4mqBB3VhbDucCTOZBOdA==
X-Received: by 2002:a17:907:72c1:: with SMTP id
 du1mr3716425ejc.32.1643019480186; 
 Mon, 24 Jan 2022 02:18:00 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id g15sm6354497edy.77.2022.01.24.02.17.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 02:17:59 -0800 (PST)
Message-ID: <9ecc915b-17d8-ec58-819b-371ce4244d0a@redhat.com>
Date: Mon, 24 Jan 2022 11:17:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 0/7] AMX support in Qemu
Content-Language: en-US
To: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20220124075523.108875-1-yang.zhong@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220124075523.108875-1-yang.zhong@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::134
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-lf1-x134.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: seanjc@google.com, kevin.tian@intel.com, jing2.liu@linux.intel.com,
 wei.w.wang@intel.com, guang.zeng@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/24/22 08:55, Yang Zhong wrote:
> Intel introduces Advanced Matrix Extensions (AMX) [1] feature that
> consists of configurable two-dimensional "TILE" registers and new
> accelerator instructions that operate on them. TMUL (Tile matrix
> MULtiply) is the first accelerator instruction set to use the new
> registers.
> 
> Since AMX KVM patches have been merged into Linux release, this series
> is based on latest Linux release.
> 
> According to the KVM design, the userspace VMM (e.g. Qemu) is expected
> to request guest permission for the dynamically-enabled XSAVE features
> only once when the first vCPU is created, and KVM checks guest permission
> in KVM_SET_CPUID2.
> 
> Intel AMX is XSAVE supported and XSAVE enabled. Those extended features
> has large state while current kvm_xsave only allows 4KB. The AMX KVM has
> extended struct kvm_xsave to meet this requirenment and added one extra
> KVM_GET_XSAVE2 ioctl to handle extended features. From our test, the AMX
> live migration work well.
> 
> Notice: This version still includes some definitions in the linux-headers,
> once Qemu sync those linux-headers, I will remove those definitions. So
> please ignore those changes.

Yes, no problem with that.

I think the KVM API is insufficient and needs a small but important 
extra feature, equivalent to ARCH_GET_XCOMP_SUPP.  We can implement that 
easily in 5.17 though.

Paolo

> [1] Intel Architecture Instruction Set Extension Programming Reference
>      https://software.intel.com/content/dam/develop/external/us/en/documents/\
>      architecture-instruction-set-extensions-programming-reference.pdf


