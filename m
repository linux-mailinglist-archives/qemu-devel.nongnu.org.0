Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E2E4A7D72
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 02:36:14 +0100 (CET)
Received: from localhost ([::1]:59986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFR2j-0003fK-1T
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 20:36:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFQti-0001jV-SK
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 20:26:55 -0500
Received: from [2607:f8b0:4864:20::42f] (port=41709
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFQtd-0007zC-Ev
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 20:26:53 -0500
Received: by mail-pf1-x42f.google.com with SMTP id i30so857595pfk.8
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 17:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Gy/wQenw7zrQXj989uJhhvM3PmbN190INllJ9w0WJpI=;
 b=rQjRhkysfIzI3p/NgF60jf13/z4X0kgS/hR5NXj9CRTMbVL+QZ4Wh+esD9ELMMJLVN
 tW22geu6A8DIgOol0azSCcQQnOg8+BUbQ7P7yWr3dJDlzi+Kow0FF8x3iQPmOQDdbEU9
 A+YjXuIq+qdrQ/ZnwzOHQGSyGfh7+nnqB/7pAmyK7WRYCHWfkxl1kuw88VWiC6+EsTBZ
 NMkU3xNeh/2pcjST0J7dBjPYXh9zlLhQAzPJ+QxRJ2xhJzjeYSuBu0VUvqukrCreFkoq
 aL785d3p1+ocdugNFySuoBauZYAEPO3iihEAtekGbgmPMIEzAgmgbpFt8TQL/8XvdJ9T
 usOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Gy/wQenw7zrQXj989uJhhvM3PmbN190INllJ9w0WJpI=;
 b=snnZhBNf6uDhmopp4YzJu9Wq0DpifMEzODDXUKO8+8iGWfuhNyVFxEUcP/zLK6OtCA
 bkAccxj/0ji3IOQDZFu/2nsGmgXCnrz4UNxjhbLvaUHnZdb5PUDumV8METomg7KGdofb
 0z1V2yQ072mqmCRtoF9Xl+ioLZC3oqVdZj7chVX2XpqZIKYcSE+PlQjDtsoScqqMPaHP
 WnK1KfOu1HhB99yRqHTdp3Q2ylqq67lhL9kcqwBYIqYvag7t4aZhJg93QO7b1YwPxK72
 JEpKGnUDEs3Prc6tVQcvraFUIeow0YrvGO6uW7wS8xdJXSxBgcHQv9VQA+68U3AhlvvR
 ri6w==
X-Gm-Message-State: AOAM5323hoE0AIPoE0of1cs1wrYCOQzoKQ1YChASgQRFM+kNjTqUWRzz
 OmMUBsuFUgonUOZ7kOlwez+tFA==
X-Google-Smtp-Source: ABdhPJzqZCC+iKcRBmDuHmKdk7ijQAhdblquYjMUNXPDBAiRoa2/GRnMOvQPftJhsSaHYlg4T7+zLA==
X-Received: by 2002:aa7:8c4a:: with SMTP id e10mr32256171pfd.43.1643851598673; 
 Wed, 02 Feb 2022 17:26:38 -0800 (PST)
Received: from ?IPV6:2001:8003:3a49:fd00:801:72a7:386c:deca?
 ([2001:8003:3a49:fd00:801:72a7:386c:deca])
 by smtp.gmail.com with ESMTPSA id l14sm420306pjf.1.2022.02.02.17.26.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 17:26:38 -0800 (PST)
Message-ID: <ee4077f0-ee9b-fc90-4608-14b3f8208fe8@linaro.org>
Date: Thu, 3 Feb 2022 12:26:32 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 11/20] tcg/i386: Implement avx512 immediate rotate
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211218194250.247633-1-richard.henderson@linaro.org>
 <20211218194250.247633-12-richard.henderson@linaro.org>
 <87wniduzko.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87wniduzko.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/22 01:05, Alex Bennée wrote:
> Is there any reason why gen_shift couldn't be pushed into a helper
> function so we just had:
> 
>      static void tcg_out_vec_shift(s, vece, insn, sub, a0, a1, a2) {
>          tcg_debug_assert(vece != MO_8);
>          if (type == TCG_TYPE_V256) {
>              insn |= P_VEXL;
>          }
>          tcg_out_vex_modrm(s, insn, sub, a0, a1);
>          tcg_out8(s, a2);
>      }
> 
>      ...
> 
>      case INDEX_op_rotli_vec:
>          insn = OPC_PSHIFTD_Ib | P_EVEX;  /* VPROL[DQ] */
>          if (vece == MO_64) {
>              insn |= P_VEXW;
>          }
>          tcg_out_vec_shift(s, vece, insn, 1, a0, a1, a2);
>          break;
> 
> Surely the compiler would inline if needed (and even if it didn't it the
> code generation that critical we care about a few cycles)?

Yes, I suppose I could pull out a helper or two.
Just one of those things where something used to be cleaner, and then the code grew.

r~


