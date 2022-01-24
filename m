Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF9A497CDF
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 11:22:00 +0100 (CET)
Received: from localhost ([::1]:47164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBwU3-0007i6-L1
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 05:21:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nBwR6-0004k9-9w
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 05:18:58 -0500
Received: from [2a00:1450:4864:20::429] (port=44809
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nBwR3-0006hH-T3
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 05:18:55 -0500
Received: by mail-wr1-x429.google.com with SMTP id k18so12565888wrg.11
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 02:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=C7F+Q4CA2RNy6CZWjzFG1wh2+Fctjy68+czKXKJpX+Y=;
 b=aJlYd7p641WNr0S2sNluu3Ug0u3+Win2Z5HXYy5XtPOArX9ASiBTVmYy+2b8ziaSxW
 kv5dvjErCMvTyqctMk6OBVQLbr1oX9SZ1vAY5uNfOEv08D9LZ3szPOBaVhdOSeohhpJV
 pEGXBdA/REctnX9HrHo87ZIZqPXJfRi7SrE3/hib7YLTuc5cgRyPGS9oG6BYRVM3YmJE
 QYHx6OY5QUrrnndSEuRmRB1z5faD7wS6Ho7hfhdVTj/XUJ6rfyqotb3BRBQu1+55H99+
 w3dggfsJE3OVqSRhES/efJlH7TRhl2Jtjm3mDFAS4MRHphYyuBTR+7PVL870YSmvFzTg
 F9SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=C7F+Q4CA2RNy6CZWjzFG1wh2+Fctjy68+czKXKJpX+Y=;
 b=P1angl61PFuosQ0F0vNPQLGuMJunuwCVAwVEZW2Dc/8f2boYdyNd3KNuG/6GjXfymy
 sRNt52B3GmuxV01DPnDHvamBXOmT449NrkA1mUvpIRqAtaogpNmFhQS9LTVD6KPtBGeg
 LG8miTieT00jZEvCK9WDlc/orXwzYjFAacw4kffSwX3inCLPhbfc1Q1fa2bp4zUCO4aU
 Ubm7pQe7eSCZHWs5y8K5hfhj7KLQdRDgDkPGvMbMYN6XUBZPJP1ObyGoAcHBHjTvQ+s4
 uGkpH232F8/3t7zucBzNX04mNgtTZ2MvrtL43DABRJ8XLEozDHbV2M0Bo/qPu/yEv3wL
 g6hg==
X-Gm-Message-State: AOAM532hyNHnZOdkbdgVIgKgnZ3DmycB6N1HNoZHDd8QWpRN9nH+DwBC
 Ofn46fky+YmFqToIOA7E+h0maJwge7A=
X-Google-Smtp-Source: ABdhPJx3rjfZ3ReKh6ndp1Lzz9cv2Ty+CciyxFTF+Fx8HaMZu6V49PX1vOF4I6Hu+rx94t1HY4POCQ==
X-Received: by 2002:a17:906:a42:: with SMTP id
 x2mr12430617ejf.125.1643019189752; 
 Mon, 24 Jan 2022 02:13:09 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id c25sm6363677edt.0.2022.01.24.02.13.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 02:13:08 -0800 (PST)
Message-ID: <4d1faab0-cef8-6f59-3e84-844db1bfbce1@redhat.com>
Date: Mon, 24 Jan 2022 11:13:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 5/7] x86: Add AMX CPUIDs enumeration
Content-Language: en-US
To: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20220124075523.108875-1-yang.zhong@intel.com>
 <20220124075523.108875-6-yang.zhong@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220124075523.108875-6-yang.zhong@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x429.google.com
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
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index caf1388d8b..25d26a15f8 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -1765,7 +1765,8 @@ int kvm_arch_init_vcpu(CPUState *cs)
>                   c = &cpuid_data.entries[cpuid_i++];
>               }
>               break;
> -        case 0x14: {
> +        case 0x14:
> +        case 0x1d: {

Should this include 0x1e as well?

Paolo

>               uint32_t times;
>   
>               c->function = i;


