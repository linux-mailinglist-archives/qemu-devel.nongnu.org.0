Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D70A24326FD
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 20:58:59 +0200 (CEST)
Received: from localhost ([::1]:45278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcXqd-000608-0e
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 14:58:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcXoq-0004CJ-No
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 14:57:08 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:38460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcXop-00076o-95
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 14:57:08 -0400
Received: by mail-wr1-x42c.google.com with SMTP id u18so43318226wrg.5
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 11:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oExi1qRuZXZqk97bEMbVf+LQzQ597FmggsShY7s+Rs4=;
 b=E5Unr7litnasHwT4mNXumvRia2ODIao/6eyw0ns2udXZ1WI3Rr+Jp5RCAzUZrDCc1M
 NcE5iRpFFBti6OXHFME1Nt1Fgl2YviXUPAcZHQL79fpmEbTcNZ/x7ENuEzeR/XYIU7sM
 88AumnP7eUxqlLIkqkf2nrEij1kXdVm6gmYN4RehfQ7i7SK6Emx0DTHHYqLu0DJ9gmGq
 kgF9rEEOK0b+AxTlqCryHg8CbKtCRzfyHxCtjYihBdwAbCWyyhcGjlWBqsrATl5MrQ5X
 ORwdkmVxLu79G6bfenoMC+K4FKrb3kVP5ZIvZwK8L8gcstNvHlqBlpwiER5A35PZdQth
 EIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oExi1qRuZXZqk97bEMbVf+LQzQ597FmggsShY7s+Rs4=;
 b=PpsOaMboTkgQ3BsTHiZoxGAoLMFHzsFTPJaNavwRTXbA0VAuV387HmPGyWiWXPh49V
 etRll7HQYB6XHoAOOknbCIPL+eAiNeK341qbR509CfqHT9X7wOKrockYEpHjxXPxLQxA
 VSwevfztveXaEUddy4QR3oV9mptR4ZxebhQ9K3aYPWFZ+RujuZlY9VN+DtKY0WFXnlm/
 48HDkN03NXIPyrYNtDkr1evV+Yb5C+vdtifB8fXw0+eLh6wcJNXx7Yf7hWRiBRP+ETED
 SDpCOSe9bvXFsiA3uX3fntLdhKsZd0WKMcPDpuc1c+xW+ijQ4vY5gq48qbE+Z2Ses4pR
 3Wpw==
X-Gm-Message-State: AOAM533wzwiQTD6yfBx1hSNb7zSiuAW99QizglQNfiU4oryMTeAs2HJl
 6kN2A8F5B+R/wlcwdSAbMXw=
X-Google-Smtp-Source: ABdhPJwnRYAktR6MvZAZPMYJBnMvgVtWTMV6kHvcNrTv7zZ5YEg768R4g97MTyTf6vcMAzSGkXJO2w==
X-Received: by 2002:adf:bb8d:: with SMTP id q13mr38618900wrg.327.1634583425446; 
 Mon, 18 Oct 2021 11:57:05 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id v185sm232031wme.35.2021.10.18.11.57.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 11:57:04 -0700 (PDT)
Message-ID: <95bb07bb-d1ad-c166-8af4-b2ac9ae7dcdf@amsat.org>
Date: Mon, 18 Oct 2021 20:57:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v7 16/21] target/loongarch: Add disassembler
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 WANG Xuerui <i.qemu@xen0n.name>, Song Gao <gaosong@loongson.cn>,
 qemu-devel@nongnu.org
References: <1634561247-25499-1-git-send-email-gaosong@loongson.cn>
 <1634561247-25499-17-git-send-email-gaosong@loongson.cn>
 <f55bffde-64ec-d390-2942-4ec4b2bbedbc@xen0n.name>
 <9ba04d0a-44bb-1ebd-31f4-35c282842b4a@linaro.org>
 <75f4be9c-47b7-415f-4468-093b74130481@xen0n.name>
 <8e1da0c0-5f24-abca-78de-2304c1453904@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <8e1da0c0-5f24-abca-78de-2304c1453904@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, philmd@redhat.com,
 yangxiaojuan@loongson.cn, peterx@redhat.com, laurent@vivier.eu,
 alistair.francis@wdc.com, maobibo@loongson.cn, pbonzini@redhat.com,
 bmeng.cn@gmail.com, alex.bennee@linaro.org, chenhuacai@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/18/21 20:33, Richard Henderson wrote:
> On 10/18/21 11:18 AM, WANG Xuerui wrote:
>> On 10/19/21 01:29, Richard Henderson wrote:
>>> On 10/18/21 8:38 AM, WANG Xuerui wrote:
>>>>
>>>> For now any implementation would suffice, and I already saw one or
>>>> two bugs in the output during my TCG host work, but it surely would
>>>> be nice to switch to generated decoder in the future. The
>>>> loongarch-opcodes tables could be extended to support peculiarities
>>>> as exhibited in the v1.00 ISA manual and binutils implementation,
>>>> via additional attributes, and I'm open to such contributions.
>>>
>>> Perhaps it would be easiest to re-use the decodetree description?
>>> See e.g. target/openrisc/disas.c.
>>>
>> Indeed; I didn't thought of disassemblers in target/ instead of
>> disas/. That would be the most elegant way forward!
> 
> 
> The one quirk will be that so far using decodetree for disas is limited
> to the target, whereas you'll want this for host as well.  It shouldn't
> be a big deal, just a small matter of the correct build rules.

Oh, good to know. OTOH I expect very few developers to look at
host disas.

