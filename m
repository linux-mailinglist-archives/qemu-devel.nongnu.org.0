Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9474C04D1
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 23:44:21 +0100 (CET)
Received: from localhost ([::1]:47012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMdtM-0005ke-P9
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 17:44:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMds3-0004IV-Sk
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 17:42:59 -0500
Received: from [2607:f8b0:4864:20::436] (port=39784
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMds1-0002Sw-GG
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 17:42:59 -0500
Received: by mail-pf1-x436.google.com with SMTP id y11so13539495pfa.6
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 14:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=NJP9g+gBmTvxbAOumvrmvMu6Id9YfesSE3lTS9dl6Fg=;
 b=VONH9qaw/bfIKEx5IlRJvGDLSGXrNEAuKOYJQJQNeayvqMVsPIg74e83sjEMEGT+oO
 s9YAp8ecETVdBzgXMfSShdwWWqcdSaqI040Uf7D2XLadpDNO9MEDoXbGraaxDJrvzJR5
 jSCBXADCEt1+w9Bo1mhjB0RmTkRKJaCwbiTCJUXP/DA1J5MBXLoT7XGucRauubA6lUeK
 QuHfdX97EtgsFMzc8TuF+CigsHbUs56oqRcvMlSNXD8XiTc11oL9ttJkaB3Xj31MkW5X
 xRShaB2mdqDf8HKPX0dw7hv4LiH/gjdvXt59plckUra83sm/N7g1JyKHG4kLZqQbcqgw
 FHRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NJP9g+gBmTvxbAOumvrmvMu6Id9YfesSE3lTS9dl6Fg=;
 b=eOozZPg7N76gqSj8pu5zFnPePVXlMuWPOutuUhC3fq2Io1urHoVKLi2zhu6Fww3phT
 MdPaAQndbGRiDYeIyXlWM1eahIOBJEMkwylZXefcSesLOxuzc1L8Krb9GTVjQ6LZdLH0
 pxQKip1EQWK0vmeU1S6Sczt7dh5ku4UkF2RdZcjgwi9yRMgLg0tku29EpJrSX3DW45af
 Pgn/Ygilwg+9Mj7qJKHmEBCWWCvIo0lMVMWA251DG3irW0JYZFdE/f8uoPaZap4Ez7mG
 cagMefj5RehXMNupSJ1k71FGCRPpUtCnphfkrh0xJtvqJcXCsLKHFlvjW4QOt4Ode8Qe
 pRSQ==
X-Gm-Message-State: AOAM531pNiNQUYMuSdLJst3ZSRSpTEbfHdGngaNaTrhiUaI6BB6y4byB
 zyVjvsEFTNMEePJFZIAyYXs3zQ==
X-Google-Smtp-Source: ABdhPJxNR6ulqFuQWlWWApO6CqG53bhEBIQRjDpKDrVDYQ7oaUIZbh3Z85GqxSZ5Wq6tueoALS9SgQ==
X-Received: by 2002:a62:e317:0:b0:4ca:25ee:d633 with SMTP id
 g23-20020a62e317000000b004ca25eed633mr26661616pfh.23.1645569764004; 
 Tue, 22 Feb 2022 14:42:44 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id p14sm13493191pgs.46.2022.02.22.14.42.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 14:42:43 -0800 (PST)
Message-ID: <80c14cf3-c2bd-d1cd-650c-e4c50c28b848@linaro.org>
Date: Tue, 22 Feb 2022 12:42:40 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 29/47] target/ppc: Move xxpermdi to decodetree
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-30-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220222143646.1268606-30-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
>   target/ppc/insn32.decode            |  4 ++
>   target/ppc/translate/vsx-impl.c.inc | 71 +++++++++++++----------------
>   target/ppc/translate/vsx-ops.c.inc  |  2 -
>   3 files changed, 36 insertions(+), 41 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

