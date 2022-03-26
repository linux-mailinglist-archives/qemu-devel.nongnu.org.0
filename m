Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F334E7EB4
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 03:58:50 +0100 (CET)
Received: from localhost ([::1]:54958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXwdd-0006Gn-5O
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 22:58:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nXwcZ-0005FV-KU
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 22:57:43 -0400
Received: from [2607:f8b0:4864:20::334] (port=45826
 helo=mail-ot1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nXwcY-0001IA-5D
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 22:57:43 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 i11-20020a9d4a8b000000b005cda3b9754aso6810344otf.12
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 19:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=budJValEbFNmcczcSqcgN0tZdIW1a4VsXtGuC24lW94=;
 b=f5wwWekPrlkPrPzlzrRyqv/kie/T04qwEwSBre3Sq9rPVPkeNwAdMon1DLaGlOMfF+
 qr5dR5tyxz6Hcvxj9VaHXOn+//ytlk+JEwkp/ujkBZlnrGbohWYDO8SwF6d+ImFC4i12
 U6OjFnBhGLnQeW6d08nByIOaDpT33OdSGR43FvgrGCKz4JnG6Z+Wstyb43JK3SaAacPV
 jsIcM383+vTqkzdYd4W+k3JRfMb5/4mG0rrx1CsIw9b8jTgfAs4nEKIQtyT6hW9GwS+W
 abf0SI+tGipfTa3T032ZbSeTirOiCC5DH1qsPg3DZcEqpIj03DXk4uurf1WgxznGpGSL
 pbbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=budJValEbFNmcczcSqcgN0tZdIW1a4VsXtGuC24lW94=;
 b=5nFm4r2ad6O/QhPh1ibviNKT3vRANv/Bc2XYNcfup0ZcHNcSRhubim13z0sQz6pRhr
 19Se5RDxPTQYocDziqRe4nrTFDn9UJY1xFiA1kgalM52chQ6YtYLcZOtTipklCkihv0f
 S+1Gpuh0Ef3D1rl9Sn9TzsNH3nefGC1sA4VedTvmdACmn588zWyCQc6tkimWBS6luMrQ
 vjPtm+Gw+odhH1cvioqMOA9t6eiWCqoI9+8r/Q612xHkBd75sntJIhA0UkazPSDlT5u5
 n4NYLOZ0YExabUgx/0SXgeLk6IZWE8EcU/5W45bX9NXaEXjJ+IEjDHpSQPt6WLxNIq12
 NqjQ==
X-Gm-Message-State: AOAM530jaSEaY+mS0+uuTDzRRSNvCPMHnB5d0NaYE7UndmHB7ZJMZAN5
 J+EqzxtTvzqXLWwNqDPcR3l2oA==
X-Google-Smtp-Source: ABdhPJzYH9sSWqgAoUW3NGEPEJ7ah+SnGWXZ5RQMkRd4FHM88jmAWmUtEpPVhLfA2ewmbplNG5rm8Q==
X-Received: by 2002:a9d:4b19:0:b0:5cd:9d71:ebea with SMTP id
 q25-20020a9d4b19000000b005cd9d71ebeamr5875819otf.214.1648263460676; 
 Fri, 25 Mar 2022 19:57:40 -0700 (PDT)
Received: from [172.24.8.129] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 k14-20020a056830168e00b005b22c20b195sm3498385otr.45.2022.03.25.19.57.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 19:57:40 -0700 (PDT)
Message-ID: <7388bbc6-8a11-12e7-cf5e-8ec4d7f32809@linaro.org>
Date: Fri, 25 Mar 2022 20:57:36 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] target/ppc: Improve KVM hypercall trace
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org
References: <20220325223316.276494-1-farosas@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220325223316.276494-1-farosas@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::334
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x334.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/25/22 16:33, Fabiano Rosas wrote:
> Before:
> 
>    kvm_handle_papr_hcall handle PAPR hypercall
>    kvm_handle_papr_hcall handle PAPR hypercall
>    kvm_handle_papr_hcall handle PAPR hypercall
>    kvm_handle_papr_hcall handle PAPR hypercall
>    kvm_handle_papr_hcall handle PAPR hypercall
>    kvm_handle_papr_hcall handle PAPR hypercall
> 
> After:
> 
>    kvm_handle_papr_hcall 0x3a8
>    kvm_handle_papr_hcall 0x3ac
>    kvm_handle_papr_hcall 0x108
>    kvm_handle_papr_hcall 0x104
>    kvm_handle_papr_hcall 0x104
>    kvm_handle_papr_hcall 0x108
> 
> Signed-off-by: Fabiano Rosas<farosas@linux.ibm.com>
> ---
>   target/ppc/kvm.c        | 2 +-
>   target/ppc/trace-events | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

