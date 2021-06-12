Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8BB3A4E2B
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 12:23:13 +0200 (CEST)
Received: from localhost ([::1]:59760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ls0nI-00007h-L3
	for lists+qemu-devel@lfdr.de; Sat, 12 Jun 2021 06:23:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ls0m7-0007uw-OS
 for qemu-devel@nongnu.org; Sat, 12 Jun 2021 06:21:59 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ls0m6-00027U-2X
 for qemu-devel@nongnu.org; Sat, 12 Jun 2021 06:21:59 -0400
Received: by mail-wr1-x42d.google.com with SMTP id y7so8659188wrh.7
 for <qemu-devel@nongnu.org>; Sat, 12 Jun 2021 03:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=z66rETVd0kuXwpOERTR7udJYifHuvAKmYX+p3w+cfHc=;
 b=gSoCUE5BvEBOrsmxnsHsYkXZx4FlUtbDsexIyEJzrYFUGjdibyhnmgbUVnQv+PgojX
 O77BhZaMRYhYIzqOtrBlRvGE5UbOXOpLGcztyZHwY8jcErSnhlW4wLfKwnwNg5O3eouZ
 UUOlMff0CM0Kr+/Ihofmf+0gAa05ql5f9zE/2a9YuDlNlHfLVLVeGHFk5Q4sKWbCdpXJ
 2UioPRnbxssluXpmz1QDZwlyFLfFBHCGKkPtkM9PegwRG7dQ/15T5hJFJmr8ZYVrSToe
 do9hgjb8aj9X4prjI29HcS3J9b+lERIRYoqdhfTRBLz9+KU89pnEI7iiS6IwE1XBALse
 +ANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z66rETVd0kuXwpOERTR7udJYifHuvAKmYX+p3w+cfHc=;
 b=Srh/78IDP9ACP/n/LQPwMe5/e+Xb8X56WZ3am27Hlt3R9rJdwSkTToFZjTViqkPprP
 Hy9o6/ykpECVbDiUJ8Os4HNnZxbUu80NpPIEZowc7YUJTEXoSY5Et7mZRJpCZQ0Su43+
 VDew+8lk4Zx3vJzsa5AnvtdgZRxe3Nff2h+LKkJu8lKQppzOn8NTUeG6lCSAOd3zw0hX
 jrCOCPl979H5yu7IWd0uYZYu/UaITkbFbFA5DOKWSaamiy1N/zcV2wlkicfsc8Kaxpe2
 mb7fmhY8TEl9zEtzRgkS24o41hhFtz0XH+lxPiSfALqu6+sQucDxyziejbzmxFqfsXiT
 MlIg==
X-Gm-Message-State: AOAM531ggj+ZHkcDUyLNlmdXeXTsNCY78vJL0wcM1spdxWirisqBGsfl
 AxIwR5CP0QJGbxA23HOrAVkhL+YYNmbXog==
X-Google-Smtp-Source: ABdhPJyjOuDMenJ1wDorin1qPFhwx59hGYv4p51QWqAXLfORqAOGOnuqUcH/VTOt46DD2UDv7uQCow==
X-Received: by 2002:adf:ea4c:: with SMTP id j12mr8492704wrn.64.1623493316094; 
 Sat, 12 Jun 2021 03:21:56 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id n7sm14019436wmq.37.2021.06.12.03.21.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Jun 2021 03:21:55 -0700 (PDT)
Subject: Re: [PATCH v7 15/27] tcg/tci: Change encoding to uint32_t units
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210601150106.12761-1-richard.henderson@linaro.org>
 <20210601150106.12761-16-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <be90d7b4-cbf9-6ddc-60b8-f8a367697ad3@amsat.org>
Date: Sat, 12 Jun 2021 12:21:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210601150106.12761-16-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/1/21 5:00 PM, Richard Henderson wrote:
> This removes all of the problems with unaligned accesses
> to the bytecode stream.
> 
> With an 8-bit opcode at the bottom, we have 24 bits remaining,
> which are generally split into 6 4-bit slots.  This fits well
> with the maximum length opcodes, e.g. INDEX_op_add2_i32, which
> have 6 register operands.
> 
> We have, in previous patches, rearranged things such that there
> are no operations with a label which have more than one other
> operand.  Which leaves us with a 20-bit field in which to encode
> a label, giving us a maximum TB size of 512k -- easily large.
> 
> Change the INDEX_op_tci_movi_{i32,i64} opcodes to tci_mov[il].
> The former puts the immediate in the upper 20 bits of the insn,
> like we do for the label displacement.  The later uses a label
> to reference an entry in the constant pool.  Thus, in the worst
> case we still have a single memory reference for any constant,
> but now the constants are out-of-line of the bytecode and can
> be shared between different moves saving space.
> 
> Change INDEX_op_call to use a label to reference a pair of
> pointers in the constant pool.  This removes the only slightly
> dodgy link with the layout of struct TCGHelperInfo.
> 
> The re-encode cannot be done in pieces.
> 
> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/tcg/tcg-opc.h    |   4 +-
>  tcg/tci/tcg-target.h     |   3 +-
>  tcg/tci.c                | 541 +++++++++++++++------------------------
>  tcg/tci/tcg-target.c.inc | 379 ++++++++++++---------------
>  tcg/tci/README           |  20 +-
>  5 files changed, 384 insertions(+), 563 deletions(-)
[ ... ]

> +    case 0:
> +        /* tcg_out_nop_fill uses zeros */
> +        if (insn == 0) {
> +            info->fprintf_func(info->stream, "align");

"nop"?

Otherwise,
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +            break;
> +        }
> +        /* fall through */
> +
>      default:
>          info->fprintf_func(info->stream, "illegal opcode %d", op);
>          break;
>      }

