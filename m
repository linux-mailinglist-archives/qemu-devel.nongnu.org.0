Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2294FAA6D
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 20:47:16 +0200 (CEST)
Received: from localhost ([::1]:41140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndG79-0002Ra-QK
	for lists+qemu-devel@lfdr.de; Sat, 09 Apr 2022 14:47:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndG5B-0001b5-TS
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 14:45:14 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:55013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndG5A-00048w-D4
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 14:45:13 -0400
Received: by mail-pj1-x102e.google.com with SMTP id md4so3231431pjb.4
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 11:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Pt2b4Luc6Epcg6gwS6/rMUZGoi/92P2I6r/SGKFyKGo=;
 b=I+IMcr6XgwwL43rQYobXtoyFWdmgCTk99k8fiobqXBa5E9IqnRNCLMekEz9eJS6Mrh
 QzSavaTUBj4VHRvserMe8T3fkHgFB3KV42qoniBYk+CrzqQlkuYBHiaE8DdC3xoWQGRr
 6480pjTVHgZeDindmtoeupZNw0mLTy2s7CTuy+4aP/FHdcyLt3g8bJFp8T0Yg6nmPKHg
 GSJqLkTHpuJ/XciKhJuYpRA9s/rrz72KRqg7tiQPisH8bH7VFv8NR3+VN+d1Nsbc2nbZ
 ng1feO6J5Xpp2lmQ/XuDUs2H8l35k9BLzWv0yPgEqZ+uHrcAomMUf6vlDdK31fVMsaZd
 QflQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Pt2b4Luc6Epcg6gwS6/rMUZGoi/92P2I6r/SGKFyKGo=;
 b=2bzZrliVQvMZn2rwpz7y18L/KTJhVS+XKe6UH8Ohx41PRAOq4m31CdKbTi0UzCvUtd
 LQiZ2jJgr/s1J5bFEQgZoZT0ILGFUGx3fNoXMa0U8HpE6OOan3i+pCOh6W9nQmWanGps
 RrFd4SMaZGic5Hx93sBh99FTN5cye0+gJzpaCN6XN/rOXmkqV2Uma0Zjch+0ij7kp4Pn
 s1HLWl8OzrvmF6FrtQmkzspeN2x87WaU6Lymn9pTb+oCP9enoWIgizrjX/sHgPgnfnAf
 /Qo+NbtohcfbMEbtnVbd1SWb7lWvBW3eleiNz2u3nIcDnsMckPE5DPIJhtVbvaCIkDIr
 zqEQ==
X-Gm-Message-State: AOAM532xV7d4hDVxXui1aHniHs9F6RTnMmLNxshM9tEUmDkNlQFL4UTw
 C4GhRmyfL8/6kHC88s3fCMtaty3+4hQlFA==
X-Google-Smtp-Source: ABdhPJzF87B2YrmrJ2r8DNiM04A//3jU5t1VXVlF90+dNsxanqn0EEu7RJrlD0OjV8gKrrIdjrPfAQ==
X-Received: by 2002:a17:902:bf04:b0:149:c5a5:5323 with SMTP id
 bi4-20020a170902bf0400b00149c5a55323mr25288928plb.97.1649529910844; 
 Sat, 09 Apr 2022 11:45:10 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a056a0022cf00b004fb32b9e000sm30611054pfj.1.2022.04.09.11.45.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 11:45:10 -0700 (PDT)
Message-ID: <fdc86b23-c8e0-99f3-cbb2-0c5e05bae5f9@linaro.org>
Date: Sat, 9 Apr 2022 11:45:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 24/41] hw/intc/arm_gicv3_cpuif: Split "update vIRQ/vFIQ"
 from gicv3_cpuif_virt_update()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-25-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-25-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/22 07:15, Peter Maydell wrote:
> The function gicv3_cpuif_virt_update() currently sets all of vIRQ,
> vFIQ and the maintenance interrupt.  This implies that it has to be
> used quite carefully -- as the comment notes, setting the maintenance
> interrupt will typically cause the GIC code to be re-entered
> recursively.  For handling vLPIs, we need the redistributor to be
> able to tell the cpuif to update the vIRQ and vFIQ lines when the
> highest priority pending vLPI changes.  Since that change can't cause
> the maintenance interrupt state to change, we can pull the "update
> vIRQ/vFIQ" parts of gicv3_cpuif_virt_update() out into a separate
> function, which the redistributor can then call without having to
> worry about the reentrancy issue.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/gicv3_internal.h  | 11 +++++++
>   hw/intc/arm_gicv3_cpuif.c | 64 ++++++++++++++++++++++++---------------
>   hw/intc/trace-events      |  3 +-
>   3 files changed, 53 insertions(+), 25 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

