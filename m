Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AF438764A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:17:25 +0200 (CEST)
Received: from localhost ([::1]:58566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwmy-0006qw-H8
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:17:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liwRc-0003vt-2E
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:55:22 -0400
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e]:43881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liwRQ-00085s-3r
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:55:19 -0400
Received: by mail-vs1-xe2e.google.com with SMTP id n1so3150897vsr.10
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=E6XRR5qcZvUerpSLNW5rFbUDdM3g9xxITynwgz9N/ZA=;
 b=SeNJ2R/rG5qRKvnpSsLDk2j5+ZqSRLyrT2mw89dsZyryrDSkQMIFg6oSjanF7PDAW3
 bm5aXRnmlgJlU8cXdsnPQ51rsM1fR1iI6lJa/qb0iouqH07gjYY3y0VPh9jOgn2RpOfp
 /KIo6Wp/WVJMY3Lr7O+bWXD+PlNkC9FO2ft/se+yYniUbk/aO7F4oEjEPk9MEX0EtSLo
 xDEWmRuhqeKuL3UeuiViIHxB4OzieTkc2NtBgGC2JgRJiYECmG1jCAas0/3F2Kz+fvEF
 4wyN1S46WVDkD4TyFMZAcbXILKw7lo4N8KrvNfpeBaSRNMod1wGlvy0wxr0R2/fnFTR6
 w0RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E6XRR5qcZvUerpSLNW5rFbUDdM3g9xxITynwgz9N/ZA=;
 b=mnH5rRQFJhNpqvRHA2dAk19otEa85We6BrQw+vmNXCQnkZi0xgMeS+DgzjVN/kFoJX
 LpEabV3zSUuaK2GMMcVJqxaA/c6XMwxox2hB6Xg+MMw/qOmRdXi2SVHgvU5ZWZI4E2dr
 LJJLBYd2bi9r80lFh9/vrcHwskTgYbNgqns8hUDcVTnS27LFBgte9L1GEcym1qN8qvwq
 CnV5oJ8aoIutcn7QcWyWTXnDaV/1oIQACaRtENXxXD4+KFomiyym77HbtkwAxPc/5/5q
 0zLeiHeWD0PqtKjOuLqi50y7UjaQvwMcGeRlpu0S/o2X/vDupYHbr9CePp3E/6NMtuTC
 XVwg==
X-Gm-Message-State: AOAM5339Lo6bqJH3GlbdBcGLZ7z2gnoMe9CYLHQTnzQ5XnG7tuOFlRf6
 kKS8hjzPvhZNfnyP60zdVmeMKw==
X-Google-Smtp-Source: ABdhPJywjaXN8h2E/XOI+cIvgoRYzqDmGIfxYBNh5QqUxTW3IrzouNRaQlKdXchJAnL+A0Von7u5ag==
X-Received: by 2002:a67:d09a:: with SMTP id s26mr5684878vsi.7.1621331707049;
 Tue, 18 May 2021 02:55:07 -0700 (PDT)
Received: from [172.16.22.144] ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id o35sm2793451uae.3.2021.05.18.02.55.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 02:55:06 -0700 (PDT)
Subject: Re: [PATCH v5 22/23] target/ppc: Move addpcis to decodetree
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
 <20210517205025.3777947-23-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0b3c53e4-47d3-9516-4568-94bd2f4cba4c@linaro.org>
Date: Tue, 18 May 2021 04:55:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517205025.3777947-23-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-vs1-xe2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 luis.pires@eldorado.org.br, f4bug@amsat.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 3:50 PM, matheus.ferst@eldorado.org.br wrote:
> +    tcg_gen_movi_tl(cpu_gpr[a->rt], ctx->base.pc_next + (a->d<<16));

Missing spaces around <<.

r~

