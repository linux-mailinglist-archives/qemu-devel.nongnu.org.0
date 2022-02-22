Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F32484C04CC
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 23:41:54 +0100 (CET)
Received: from localhost ([::1]:42864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMdqz-0002zb-SM
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 17:41:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMdoI-0000Pp-Jl
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 17:39:06 -0500
Received: from [2607:f8b0:4864:20::1031] (port=51026
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMdoF-0001ml-8Q
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 17:39:06 -0500
Received: by mail-pj1-x1031.google.com with SMTP id m22so1032457pja.0
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 14:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4qUU98WKgRqZ4Fu2JoSEGrH/vKFLMOS1vocNuQLatAE=;
 b=ZzyVk+fYizoe3PzmUD3O+LhlongTJ+ytwK6swHwiF0XGuLp7MzMWad8R4nssED++JY
 g+qhgpEC+tGSo1eXqFAqI8H+dq0UdeCqXZKV1PLRDeeey3OqWifOuJF1sNCTYupbf8vy
 f2bGCP7DSUnq8YaFbe4GEPbAKU2hQ27Q7Ef8Ke6IaVDk5Bzd2uggtyqL77ZO9nCGsadY
 y3EYvkMvCTBBw+ra/zFTkBimSWiC3QoOthgTA7vlVdsV40kVxybVbu1S2BMvSXZI1yqW
 oZyz7IrWqikAUCVLGbEnVClv9uiT23MAf8Yz5U7cSTn4fENqXmXMbHZxKkbzsp2txpLB
 BDWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4qUU98WKgRqZ4Fu2JoSEGrH/vKFLMOS1vocNuQLatAE=;
 b=P/GBKAY/V+pz/gT0RRNoMKWXEAfxHdw+WHB+6l73oAm0y87QAssh1jx+zGLzMYlV+t
 KizE2Fq+82/uMUTl5I1CkjZkvYEnLhbL7lPtxw0KrN3Lwhrlv/I9q9yd5NOh+QgqbIuQ
 3koI67QuHJtjc1K9P0P1+78lTSBa5NvU9TaUWASPCSzH2V001WpSON6KCwbTYJQV1iHQ
 mz8+te7/9T5wk4O4Ggo94ZJgwRFFk5/P9oJFUgssOPa0dQ9zqdxMzeLV974gr6e70DRt
 SKyPxAjsyKiGke+2QlqlkLd1T91AzNZp/1s/SW3O4OHwm52HW5QY0hpIrFEQsPM+1hD6
 NoPw==
X-Gm-Message-State: AOAM533boo944/fDa9nCOgodoVhX9gu2DLPa9D7RYMtqZIfcGpkXqSDh
 Z7yxl1Jkm+g8tkZj9+MJ3xmdS/JTP8QlvA==
X-Google-Smtp-Source: ABdhPJxGCEFhDVPjsb5NA6pgBxxJ2Tl72ZEY/6tDRg8cDjBpCYZQDIiZnLZbNYhbx4sLFbeC5ktV3w==
X-Received: by 2002:a17:90b:388d:b0:1b8:cc1b:3360 with SMTP id
 mu13-20020a17090b388d00b001b8cc1b3360mr6322291pjb.56.1645569541668; 
 Tue, 22 Feb 2022 14:39:01 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id u27sm809475pfg.171.2022.02.22.14.39.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 14:39:01 -0800 (PST)
Message-ID: <7f27d0d7-c41b-7ffb-9854-7537534c9c3d@linaro.org>
Date: Tue, 22 Feb 2022 12:38:58 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 27/47] target/ppc: Move xxsel to decodetree
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-28-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220222143646.1268606-28-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/22 04:36, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/insn32.decode            |  6 ++++
>   target/ppc/insn64.decode            | 24 ++++++++--------
>   target/ppc/translate/vsx-impl.c.inc | 20 ++++++--------
>   target/ppc/translate/vsx-ops.c.inc  | 43 -----------------------------
>   4 files changed, 26 insertions(+), 67 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

