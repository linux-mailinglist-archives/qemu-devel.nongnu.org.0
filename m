Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA99503261
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Apr 2022 04:27:24 +0200 (CEST)
Received: from localhost ([::1]:41444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfY9j-0003Zd-B2
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 22:27:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nfY8v-0002vH-Ek
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 22:26:33 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:45715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nfY8t-0000DH-MR
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 22:26:33 -0400
Received: by mail-pg1-x533.google.com with SMTP id k29so9329143pgm.12
 for <qemu-devel@nongnu.org>; Fri, 15 Apr 2022 19:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=yZPoduawZrYwa7QmF+72eavNvlc739Z8LYlBGJuo8LI=;
 b=i6UNmOpVwjsQ26IvgTJjvtpfijMMnzC2oDI+CSGreZycE/jAr7NG3r3Qqy6jggqBSL
 Y22x7/dv2YtLqhf54xJsKk2v1Al9UPss8RL91YnKT2LbZA9vI9Np8kl1k968N/vIGYna
 miRJC/sfwQDOakX+M7QLZom44wE/PxaUVrUBjs7MWwkLYtKPRa+JAzia2Udd0LMJ8GWD
 +o6R4s2GFvOs6v1J1Vj8z9mgIQlJt8fQe4nE6bY72ESbRwAzrIiFzIH9Qc5D5I2E55+t
 8VBLOaxNRXRMhIYcMgwqvFUAZ7qk+/jpa478r6/m994974eEEKvJbEJCXtCG+TQTs2kg
 nokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yZPoduawZrYwa7QmF+72eavNvlc739Z8LYlBGJuo8LI=;
 b=PWznJlU6MQ30x93TXufmtSE+QL486SyjNj4k0TEfykOUurPJLxfdsc5RSE86Immd4P
 AlzLpVfZFgYPjwmTEmSReTjiQgb00IMGItIkK2AoTOcy2C7AAauYJLrKAUJca9CuGgdX
 lzM4bk81aVxN+qTH+37YgdHVu9r/7sqh4sQ76YKTPxaStR1HBQWPXNx0vilBKvBBhYZM
 fIA/pAunbqJUy455lMjAaa8WsOIstw3CCsIB7AjoKLvusHrmEffG118T0pFHX/fR4X8N
 gos0XZMQ9Zdz3lrjSFZ8AW14bwp4MAdGffxXZyG5k1k1I8BrM/B99wWW7Ofq/xpGd7o4
 yyqw==
X-Gm-Message-State: AOAM533/pFHR4TKyKJveAbVJcwACLO5gQ3p8AnklmBYppYSdaHL6GKIZ
 knSyf7xCulXVv8qQHgEzcYrTow==
X-Google-Smtp-Source: ABdhPJxAQtBo2TSdHR+fT0w7/0htT0QtA5fzTe1SM6jwEhKaOPo5O9yBfsIkTg+03WPVG4N2vX7YIA==
X-Received: by 2002:a05:6a00:2347:b0:505:b8ba:d89e with SMTP id
 j7-20020a056a00234700b00505b8bad89emr1670383pfj.5.1650075990023; 
 Fri, 15 Apr 2022 19:26:30 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 3-20020a17090a034300b001c779e82af6sm5758617pjf.48.2022.04.15.19.26.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Apr 2022 19:26:29 -0700 (PDT)
Message-ID: <7878fbf7-6352-fe32-1daa-272490fe8061@linaro.org>
Date: Fri, 15 Apr 2022 19:26:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 26/43] target/loongarch: Add LoongArch IOCSR instruction
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
 <20220415094058.3584233-27-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220415094058.3584233-27-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: mark.cave-ayland@ilande.co.uk, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/22 02:40, Xiaojuan Yang wrote:
> +static bool trans_iocsrrd_b(DisasContext *ctx, arg_iocsrrd_b *a)
> +static bool trans_iocsrrd_h(DisasContext *ctx, arg_iocsrrd_h *a)
> +static bool trans_iocsrrd_w(DisasContext *ctx, arg_iocsrrd_w *a)
> +static bool trans_iocsrrd_d(DisasContext *ctx, arg_iocsrrd_d *a)

You have all of these split apart, then pass an integer to a common routine...

> +uint64_t helper_iocsr_read(CPULoongArchState *env, target_ulong r_addr,
> +                           uint32_t size)
> +{
> +    int cpuid = env_cpu(env)->cpu_index;
> +    CPUState  *cs = qemu_get_cpu(cpuid);
> +    env = cs->env_ptr;
> +    uint64_t ret = 0;
> +
> +    /*
> +     * Adjust the per core address such as 0x10xx(IPI)/0x18xx(EXTIOI)
> +     */
> +    if (((r_addr & 0xff00) == 0x1000) || ((r_addr & 0xff00) == 0x1800)) {
> +        r_addr = r_addr + ((target_ulong)(cpuid & 0x3) << 8);
> +    }
> +
> +    switch (size) {
> +    case 1:
> +        ret = address_space_ldub(&env->address_space_iocsr, r_addr,
> +                                 MEMTXATTRS_UNSPECIFIED, NULL);
> +        break;
> +    case 2:
> +        ret = address_space_lduw(&env->address_space_iocsr, r_addr,
> +                                 MEMTXATTRS_UNSPECIFIED, NULL);
> +        break;
> +    case 4:
> +        ret = address_space_ldl(&env->address_space_iocsr, r_addr,
> +                                MEMTXATTRS_UNSPECIFIED, NULL);
> +        break;
> +    case 8:
> +        ret = address_space_ldq(&env->address_space_iocsr, r_addr,
> +                                MEMTXATTRS_UNSPECIFIED, NULL);
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }

... then have to split them apart again.  It would be cleaner to have 4 helpers, one for 
each size.

I'm concerned about the address adjustment.  My thinking is that this should be handled by 
the address space (via a MemoryRegionOps entry).  I say this because there is nothing 
about this adjustment in "LoongArch Reference Manual", but rather in the "LoongArch 3A5000 
Registers Technical Reference Manual".  Which means that baking this cpu specific 
behaviour into the generic architecture is incorrect.


> +void helper_iocsr_write(CPULoongArchState *env, target_ulong w_addr,
> +                        target_ulong val, uint32_t size)
> +{
> +    int cpuid = env_cpu(env)->cpu_index;
> +    CPUState *cs = qemu_get_cpu(cpuid);
> +    int mask, i;
> +    env = cs->env_ptr;
> +
> +    /*
> +     * For IPI send, Mailbox send and ANY send, adjust the addr and
> +     * val accordingly. The IOCSR writes are turned to different
> +     * MMIO writes respectively
> +     */
> +    switch (w_addr) {
> +    case 0x1040: /* IPI send */

Likewise.


r~

