Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BB34248B1
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 23:16:21 +0200 (CEST)
Received: from localhost ([::1]:44890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYEGy-00060O-Mg
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 17:16:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mYEAb-00078e-3W
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 17:09:45 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:43566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mYEAZ-0003Ce-Ld
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 17:09:44 -0400
Received: by mail-wr1-x42f.google.com with SMTP id r7so12589557wrc.10
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 14:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DFpVAFrc/8cqJYnAjuAKB0A0SYweFYwhcDjk90GXGLE=;
 b=dZH/yyd/ZqoZCKQOho9w+wFpqhQ/UEVbqykoWn17tjdHW5y5ZB29d7xqXBGBSOTep7
 0XNe3QDublx3V5DddLE2wmWLXW469e4Q35SLVIy5SllkxA50RF48GMMEOnWbCG0Rgtee
 YGkpd7w2R/4wwuvDrujQXVYAfCz+jpT0u5Tci+yR141J6VmoeNhHj3QdiQZWnYhzAjxZ
 kDvxRSrziwdgl5W6i6cQq8rGsDZjtk6HJKWhD6t4joy0npDS9GVJ2YJ9lvaE2TPzgb0q
 rYgJbMRd5TmeGWSl7b8IQAZAZ71snraDI1CLMQPDfjo2GWU4ekfr3zNdyTmtXcN+QFiJ
 X0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DFpVAFrc/8cqJYnAjuAKB0A0SYweFYwhcDjk90GXGLE=;
 b=pUf6iCxZ2rE4fIH6/EuZfmHVYwdo2si9FP64XPED82B45DM7Yw+W3L6iYVkEH18rbX
 xhclPfVERS8/lTWR+ogVq+bRfUWx6zEtwtsI7YVR0aqPNfvHp2IdOcqRP/rp6NWbJBX2
 D8TVq3/fceE51tvFIb2VlEuI8iSPIPxvvDPNbE9pPEShl6HR9/8+x+M4L37BHhNmtQsC
 6Sd0EDwLJW+Q7q1ygR5l3tABRlvcaQWnQ6KMp6Mr+0ZjgMO9YtcI+5A+FAZSqbXIANl4
 KNQpAEJNroU0+RCTfGCQqavS2u+9mULrRs9FUL+W6dt7zaO0cB1X+DnAouHBgPb0fW8I
 qPiQ==
X-Gm-Message-State: AOAM5326gjy0A8erltqqHBYseJoBft0nC5eDd1m968ktI2GJZlUrJ2cs
 ATMRRxqF0ySnLmwnUp7dGwI=
X-Google-Smtp-Source: ABdhPJzdscbW3j4eKVBUmq//QNvqwXmyHOQTASjW1hao+1dIBFD+E+7PQYr7t7wze7O9e3Xe/l2adg==
X-Received: by 2002:adf:ab57:: with SMTP id r23mr452688wrc.199.1633554582216; 
 Wed, 06 Oct 2021 14:09:42 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id v185sm1790209wme.35.2021.10.06.14.09.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 14:09:41 -0700 (PDT)
Message-ID: <9a890c52-85df-d772-bc18-ee60c5b94bd2@amsat.org>
Date: Wed, 6 Oct 2021 23:09:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] hw/elf_ops.h: switch to ssize_t for elf loader return type
Content-Language: en-US
To: Luc Michel <lmichel@kalray.eu>, qemu-devel@nongnu.org
References: <20211006192839.17720-1-lmichel@kalray.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211006192839.17720-1-lmichel@kalray.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.964,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/6/21 21:28, Luc Michel wrote:
> Until now, int was used as the return type for all the ELF
> loader related functions. The returned value is the sum of all loaded
> program headers "MemSize" fields.
> 
> Because of the overflow check in elf_ops.h, trying to load an ELF bigger
> than INT_MAX will fail. Switch to ssize_t to remove this limitation.
> 
> Signed-off-by: Luc Michel <lmichel@kalray.eu>
> ---
>  include/hw/elf_ops.h | 25 +++++++++---------
>  include/hw/loader.h  | 60 ++++++++++++++++++++++----------------------
>  hw/core/loader.c     | 60 +++++++++++++++++++++++---------------------
>  3 files changed, 74 insertions(+), 71 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

