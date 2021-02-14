Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E9A31B350
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 00:26:04 +0100 (CET)
Received: from localhost ([::1]:36030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBQmA-0003lC-UY
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 18:26:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBQgk-0007Iw-P2
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 18:20:28 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:34719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBQgd-0006It-Tl
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 18:20:24 -0500
Received: by mail-pg1-x532.google.com with SMTP id o7so3251357pgl.1
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 15:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XKiBfsGpA5UAxeCjk/N0lGekac77DnBgyIiE5symtJ4=;
 b=e8UZcOjDHycc23cI1DoObt8JJ6mnr336a1e8iOoO2/Rw1FVUnJUsXDjcC0o3GbeLtl
 I+sk6SsWzdVDcKt+/a2qJxzLI5eRO6GeMkre7Hub7taIZ1rIQqihIcowPorgEyfgdPHR
 N5Tb4+ZvWQ7nwpDdhXQwicGFpPct7zQdBplqdtQrSk7+ePxdlwNddtQzTPPKxMpIBvRk
 jzE+9C/7RESZ2HQSceQBE2f4VCqFHKKQnaICGYKhHni/5eGzvA+swL+EKfdBuhDZMslM
 77R83r+D+USnh1xMF3qkM4N1s38efmPj3Chi7nN40MmkZlGEFojh2rrDn6T0DVjR6tfH
 9yXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XKiBfsGpA5UAxeCjk/N0lGekac77DnBgyIiE5symtJ4=;
 b=F3Ask724ViNDsiCuk8aihUfeemi6q1nnmUpHLaX8thBumNp0mgmCr4oZ0ZgUtP4nz+
 fCXFlo+dfvgF9vLR62OWTZIsYsC5cQUJ+X8yDb9GbWIajFeqjPM9uZyH8KFrDpUXoNhS
 S691miuDZ09NlRCNs+KJzkvGs3eotOwYL0xZ56qCUfTUmBWPBLWBuJT/r/pYE+qXX5c6
 pg/CMyi69bccPn6vEdhhsF3shaFRUxy0Q4DSwpEdaTewvWi2QaoVtptQMFfXy6xR1X/+
 fXZteL4saYlRHTHUB+IeBeMw6KZCMrWHkOfpUfCbbcCuJibK5bsXxXgDNLfdtt8QgODS
 u8uw==
X-Gm-Message-State: AOAM532XzfK/NcQegq9BJdkoTyw8O8c/hQmnXQT64mkbqB2amfOHZVeu
 R656oopTD14eAUm6yMI03omsNw==
X-Google-Smtp-Source: ABdhPJy/8Vo5c2Vhzmf78yeNXjOB00wq0eEDlq8jsiCWAUCtFwwF336bNmSoKNsbIC2NFf2X/f4k1Q==
X-Received: by 2002:a62:7985:0:b029:1e1:1703:c2e7 with SMTP id
 u127-20020a6279850000b02901e11703c2e7mr12828032pfc.69.1613344817963; 
 Sun, 14 Feb 2021 15:20:17 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 x64sm15702633pfc.46.2021.02.14.15.20.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Feb 2021 15:20:17 -0800 (PST)
Subject: Re: [PATCH v8 20/35] Hexagon (target/hexagon) generator phase 2 -
 generate header files
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-21-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d5c3046f-f333-cc89-85c3-2483945dea74@linaro.org>
Date: Sun, 14 Feb 2021 15:20:15 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1612763186-18161-21-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: ale@rev.ng, alex.bennee@linaro.org, philmd@redhat.com, laurent@vivier.eu,
 bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/7/21 9:46 PM, Taylor Simpson wrote:
> Python scripts generate the following files
>     helper_protos_generated.h.inc
>         For each instruction we create DEF_HELPER function prototype
>     helper_funcs_generated.c.inc
>         For each instruction we create the helper function definition
>     tcg_funcs_generated.c.inc
>         For each instruction we create TCG code to generate call to helper
>     tcg_func_table_generated.c.inc
>         Table of function pointers indexed by opcode
>     shortcode_generated.h.inc
>         Generate a table of instruction "shortcode" semantics
>     opcodes_def_generated.h.inc
>         Gives a list of all the opcodes
>     op_attribs_generated.h.inc
>         Lists all the attributes associated with each instruction
>     op_regs_generated.h.inc
>         Lists the register and immediate operands for each instruction
>     printinsn_generated.h.inc
>         Data for printing (disassembling) each instruction (format
>         string + operands)
> 
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


