Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AA044674A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 17:50:09 +0100 (CET)
Received: from localhost ([::1]:46186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj2Pl-0000Xm-GN
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 12:50:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mj2Li-0004Iy-PP
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 12:45:54 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:45783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mj2Lh-0005GF-Bk
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 12:45:54 -0400
Received: by mail-qk1-x72b.google.com with SMTP id n15so9237048qkp.12
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 09:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1RKwRpMno+J4/al8vMXV3aeu/XaPUoZkipk4agJk2vo=;
 b=cY1iw3JWaLVFpZZuaidItMU6YxoKEztqvUBYMRFIbDMFSgBVcYc5CEXj8/K3Cv3F15
 rgJZICmTpBgJr2GAG+lSkT+AJiBgw4YyxwEt9JA9Iydtvzp/HRjwAYWnNgLcg+jVDuk0
 X6Nlzz7ZmgiwlJMIJMVpsAPMDoWNCScZEBfEdZKqrftb2Cxwve/qJKYBcrNFhifABuVw
 eH8pKp5OljVh+ynZUWh75u027VVcyDCY3bEdYXOmrbEgyIJYrsFvhWaISxptDMtXVSxt
 sylwkARJ09UPM7N0mVwQJZvhegh9YM+AtBfU9H5HK4Zk+24BaTa69DFXZEkTg79pnEu9
 9BUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1RKwRpMno+J4/al8vMXV3aeu/XaPUoZkipk4agJk2vo=;
 b=gFX2cQFEbXChB41yr+LQY56FlprjPT8kwQ9dIicSoXDMN9VHloNqLmg+OjudiXonVb
 DAlElJ6hxR1L3FwStvf2plsL398WCCDjVqCaGyMkelK3fMPjA/Zei5gNTDp7u82KH+Tw
 lzTWRsa6bFhCL1TGPFRWQQloBc4oy1o8NJxCX5OFlNrRR5xxhZXjiBw8LqDH74hUJ+X1
 tJusuZKxjhR/KT/eEE1bjz3I5sU1A+VEIqFSF/Noc65Pe2y6y6skKhSLpeYyDLcakdnM
 HAYwW24WUkjIjH3qp88FJRhK5Mn5oNLFI7TSRJ2K8vA+MgUrWJny2SFdiIQwcEKvbziJ
 /fsQ==
X-Gm-Message-State: AOAM533HrllqCn0mtP5RlWcSgBTLo6hKsSvkM2t5hkE2+9z4k8Scf5hS
 nISdgPBZLyYSV9wLIrEh812TiA==
X-Google-Smtp-Source: ABdhPJznIS/H39rjYvqUtHgFS1cLMYbvIVJ4zm/pWLYhCyEgOudYqvwD9J9BN9ldZfYxPEPVRhb0Dw==
X-Received: by 2002:a05:620a:248f:: with SMTP id
 i15mr21029179qkn.23.1636130752283; 
 Fri, 05 Nov 2021 09:45:52 -0700 (PDT)
Received: from [10.200.5.34] ([38.66.81.217])
 by smtp.gmail.com with ESMTPSA id x8sm6252694qtw.84.2021.11.05.09.45.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 09:45:52 -0700 (PDT)
Subject: Re: [PATCH v4 35/36] bsd-user/freebsd/target_os_ucontext.h: Require
 TARGET_*CONTEXT_SIZE
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211105031917.87837-1-imp@bsdimp.com>
 <20211105031917.87837-36-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <90c72414-1695-fba8-6dcb-191f7faa54ff@linaro.org>
Date: Fri, 5 Nov 2021 12:45:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211105031917.87837-36-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72b.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.093,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/4/21 11:19 PM, Warner Losh wrote:
> Now that all architecutres define TARGET_[MU]CONTEXT_SIZE, enforce
> requiring them and always check the sizeof target_{u,m}context_t
> sizes.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/freebsd/target_os_ucontext.h | 2 --
>   1 file changed, 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

