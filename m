Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6873F9378
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 06:20:36 +0200 (CEST)
Received: from localhost ([::1]:35084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJTLx-0002cn-LL
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 00:20:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mJTL0-0001yJ-7n
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 00:19:30 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:37879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mJTKy-0007Is-Jg
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 00:19:29 -0400
Received: by mail-wr1-x432.google.com with SMTP id v10so8362197wrd.4
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 21:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PHL68ceedfPUDRHVn7lA+Ihv/9nJ23d6ik/7Iq/fDYI=;
 b=iYkq55jSF3LDnJOxnanJFHHflNxH2WGHKTuUGDXpjrQVas+JjKsLi7F2moyE03xX5f
 kW42lF+WFSizML9No4NcgDLeH1gNLRLfyAKmaYEPp0VpILkIaanAzFWlTrV3XTleEXDH
 SwQug4l1GPspQpNCwenKq6wQn3M1bsmS/UYj9uRVDDaAbwe+bp0FE+JFuTkBL5Trg/tK
 hHsEg8i1f2k2rVUqmjZRMqeZ8u2DytCmJMEDeC1Rj1ysoTsu5/98XOYJP0BMweUcHu54
 +R7S+ZCSdLew0UwNVwUtyWyr6OIonRgtlNZecsoxp0PoeI5jJN4fgCNXZJPDpJVO5wcV
 8TsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PHL68ceedfPUDRHVn7lA+Ihv/9nJ23d6ik/7Iq/fDYI=;
 b=k2vMeLSXTq3b5iG3b4d19FY+53x8Oc4BzMkKglpnAni1kDHFx7FlxmoQYmK6/Bs/Kt
 5dnHi0bUyeWOxF078Cs1Rm1fSWzOcKrcCEs/pwWayrnj9nir8T36eT7Mj1oey9JgyHJX
 nXXjA/urpd73P7t8Qjb1oE6yL41+9u63xRLWCKKzJjm6jnQmNZEZSJYF+NGAWK9pAARC
 tOhtJVNGNmgolykFVAJA+NDQwB3sc3vXI+fB69CRhJidwxXBfrk4aVJ0aeW4t7fk8PM6
 0M8GIWBF9rV2B+rdb0YYSPrK/gnzJUD1/e/s1OKTcYzBCA0YFkyYgA3FDpNjbIL3bmVK
 oAhA==
X-Gm-Message-State: AOAM532D+Z5qC9dV4mqg1XhR3qlza8kP7lQuo8PqsKJ4k5GHNgJccDz+
 yl/lS0ebVMXQtfjespOasYc=
X-Google-Smtp-Source: ABdhPJzDQEobBQVk7TDPm6BjL2JcokXYiMWamBFqmd1aIKky+DMpSEZ8Fkq/oUvfDePf5P1eoddxuw==
X-Received: by 2002:adf:c3d4:: with SMTP id d20mr7727805wrg.358.1630037966807; 
 Thu, 26 Aug 2021 21:19:26 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id h15sm3686798wrb.22.2021.08.26.21.19.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 21:19:25 -0700 (PDT)
Subject: Re: [PATCH v2 07/43] bsd-user: move arch specific defines out of
 elfload.c
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210826211201.98877-1-imp@bsdimp.com>
 <20210826211201.98877-8-imp@bsdimp.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <edb32fd4-023d-2111-d5ed-b02cdfebac82@amsat.org>
Date: Fri, 27 Aug 2021 06:19:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210826211201.98877-8-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/26/21 11:11 PM, imp@bsdimp.com wrote:
> From: Warner Losh <imp@bsdimp.com>
> 
> Move the arcitecture specific defines to target_arch_elf.h and delete

Typo "architecture"

> them from elfload.c. unifdef as appropriate for i386 vs x86_64

"un-ifdef" or untangle?

> versions. Add the copyright/license comments, and guard ifdefs.
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  bsd-user/elfload.c                | 81 +------------------------------
>  bsd-user/i386/target_arch_elf.h   | 76 +++++++++++++++++++++++++++++
>  bsd-user/x86_64/target_arch_elf.h | 64 ++++++++++++++++++++++++
>  3 files changed, 142 insertions(+), 79 deletions(-)
>  create mode 100644 bsd-user/i386/target_arch_elf.h
>  create mode 100644 bsd-user/x86_64/target_arch_elf.h

