Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CD039019E
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 15:04:50 +0200 (CEST)
Received: from localhost ([::1]:60054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llWjo-0006gw-Mp
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 09:04:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llWho-0004ky-Dn; Tue, 25 May 2021 09:02:44 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:56120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llWhm-0004SA-Od; Tue, 25 May 2021 09:02:44 -0400
Received: by mail-wm1-x32c.google.com with SMTP id b7so16107527wmh.5;
 Tue, 25 May 2021 06:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mcCYKpWWken7cp6c4R+QcrTIE9mvUTMs5dRk1Jjg0LU=;
 b=ZMsan0UcgSYTQb+X6LxH5slDYbwbq9bGGVcbS3uuauQH5eDjtwYm2tqw6zcA1i/4Fp
 248NygPtRzJIlrlCJcZGzo2e13YY3r2f5DVIgIsGHdCJ32pt2yrrFZ0S0Hy+ay7lJGBA
 cxmcknCIsUu5//9quhGQZrfWs3u+0NfgSK0ZLqggqFF0XmSij9R3xXQInr3l+f/iHg3b
 LmnjZjndpmcffPLLihnd9HvkYQ8PYdZz1SBw0jYjN187ZEetF9VuyFt76TE3iPHRt9iS
 FBodrMZtCnyrWK8QmBSWAuJ19o2A/vC7Wiw0090vuM3ryTsDxBlPcsTXB6wev/RStuZL
 76sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mcCYKpWWken7cp6c4R+QcrTIE9mvUTMs5dRk1Jjg0LU=;
 b=n+E61NpgU4SuzLR+UtoRMemCMW1khzVHksVje5ugZ1ouc1g3SfVjOqXvQq+P/2kcpi
 +f+6yTpPVnFkIu0ak3sq+3lElygXoXSAIm6r6TaJfdPlLRET7nCrdawPzHhMsYEJim4J
 fX6lBT3U8XqMyT5aYh+spu4Fw02pQTejO1TcBllEU0MczvRc+463kwiPYwW1keFhVXO8
 vGpvJg378v6akeKNzCavacwm3L0vWIl886Eyu7Vhy7SSzP7JEobmr2naIxy1lyxuDnLH
 chfLI23weRUjB/PSYJkwT8uhxIAjsO0ktaZzleecRjpXcTUO4CCEyDHRD5Kf2bKjSBzQ
 sqYg==
X-Gm-Message-State: AOAM530hqZ7j+9rvSVbyNIOIf2wJPUsI8OA4u+Dhl13nij2NpzHk5Mgo
 pSUeuXKOWLY6FJEeMk71jD8=
X-Google-Smtp-Source: ABdhPJw9T+0FXKNTGHcwD1mcMahiT7dqB9/GDx/qdtr0KdnVW0L3457Nzrjh4cXDnu/nrUnAPkF7lA==
X-Received: by 2002:a1c:49c6:: with SMTP id
 w189mr23684533wma.108.1621947760952; 
 Tue, 25 May 2021 06:02:40 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id l13sm1838499wrv.57.2021.05.25.06.02.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 06:02:40 -0700 (PDT)
Subject: Re: [PATCH v5 2/4] target/ppc: added ifdefs around TCG-only code
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210525115355.8254-1-bruno.larsen@eldorado.org.br>
 <20210525115355.8254-3-bruno.larsen@eldorado.org.br>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8e66bba4-96d1-db9e-5f21-156c41ff38ea@amsat.org>
Date: Tue, 25 May 2021 15:02:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210525115355.8254-3-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org,
 lucas.araujo@eldorado.org.br, luis.pires@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/25/21 1:53 PM, Bruno Larsen (billionai) wrote:
> excp_helper.c, mmu-hash64.c and mmu_helper.c have some function
> declarations that are TCG-only, and couldn't be easily moved to a
> TCG only file, so ifdefs were added around them.
> 
> We also needed ifdefs around some header files because helper-proto.h
> includes trace/generated-helpers.h, which is never created when building
> without TCG, and cpu_ldst.h includes tcg/tcg.h, whose containing folder
> is not included as a -iquote. As future cleanup, we could change the
> part of the configuration script to add those.
> 
> cpu_init.c also had a callback definition that is TCG only and could be
> removed as part of a future cleanup (all the dump_statistics part is
> almost never used and will become obsolete as we transition to using
> decodetree).
> 
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> ---
>  target/ppc/cpu_init.c    |  2 ++
>  target/ppc/excp_helper.c | 21 ++++++++++++++++++---
>  target/ppc/mmu-hash64.c  | 11 ++++++++++-
>  target/ppc/mmu_helper.c  | 16 ++++++++++++++--
>  4 files changed, 44 insertions(+), 6 deletions(-)
Please have a look at commit range 0a31c16c9ce..a2b0a27d33e
for the MIPS convertion.

>  #if !defined(CONFIG_USER_ONLY)
> +#ifdef CONFIG_TCG
>  void helper_store_msr(CPUPPCState *env, target_ulong val)
>  {

For example this one is similar to commit d60146a9389, you
could simply move this function to tcg/sysemu/msr_helpers.c
and modify the meson file, then when TCG is not available,
the file isn't built, without having to use #ifdef'ry.

