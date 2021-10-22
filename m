Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE04C4378FD
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 16:23:20 +0200 (CEST)
Received: from localhost ([::1]:37512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdvS3-0004Mw-U8
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 10:23:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdvLr-0004GP-B6
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 10:16:55 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:38467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdvLp-0006QL-6I
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 10:16:55 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 a20-20020a1c7f14000000b003231d13ee3cso3559516wmd.3
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 07:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gsBUTpEy3Htxw1IM389GaLXxAxUZ0L2cghKY7PgvTHk=;
 b=FRFi1k653KDHK5ozsU4jDRthch76lGdZpB1RT/IGZnHzORm+cOjMBTPw/UpGOZ9XaB
 y5LskU4AlHKZhm2boKw8nHDkfCBPHUQWnG1PIWAOl9y78PwXBmtR+vD3Owv4aCZ4Mpjc
 P+ictNmRjzVz+BgfLU0fkLZehNRnAL9wwUXHARLqid0OPHiA9yp7ZU8oAt18zsZORDUV
 058TuyRvPIR629ZCwslIi0+/IBqILl7YaN+Z2FxFfkcNA+5G04uN66wP7LH5qOHX5+CK
 XV91Pyqg89Qd4YeIY780+Gdj2/MnwEa+yB7nQAoQjUCD1NtJV31IxLOOPQvZ3Z2BlHXK
 FDHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gsBUTpEy3Htxw1IM389GaLXxAxUZ0L2cghKY7PgvTHk=;
 b=c+ntp5tDINy01xsnVnbedyNRerLxGtmy/q+n378ai5iiHpWniNG+rfXa6BoaYtr9YC
 ktmWecgVKsc9xDw2bQ/+h3WnCQ+MjiOpKImdxT2q2ZpxJnIqtuIYpjqd9boF4E5gv+62
 EK7fq+/bBbjqZH/q06ma5Vc+71B4pYBUiAXKiY4uR6AgAygSRARWBajaEzy/W4XRUwnK
 loQsVVIH+xufLehuAPAU2Jf+StFOcoOXvr/yKcUkOp53mN+ZIr0dLUMmXvGw43EjCEyb
 x4s2x1MCeUxti28C7iowvXHMR7I5M8deAGuS+D9rgqrHRp4n2tT9SeW2MpjB1IrZRQ8i
 faig==
X-Gm-Message-State: AOAM532ZfPSOpDA3yXc5qkt0C66LXHQM6ItWwEqZzTe3zmY8r6r8d9UZ
 am7JgcaVIu1qy6JFa4u36uU=
X-Google-Smtp-Source: ABdhPJyswTx1A+mFaIBEUMmsJDPDsvgeP1luW2Lzv9/yx7JrPMt37rRaAOle4ySa36VoY7qPBP6XYw==
X-Received: by 2002:a1c:f712:: with SMTP id v18mr33052wmh.104.1634912211755;
 Fri, 22 Oct 2021 07:16:51 -0700 (PDT)
Received: from [192.168.50.34] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id d9sm7777151wrm.96.2021.10.22.07.16.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 07:16:51 -0700 (PDT)
Message-ID: <4ef5fb69-f226-6ac1-f6ca-bfe6978a622f@amsat.org>
Date: Fri, 22 Oct 2021 16:16:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 39/48] tcg/optimize: Expand fold_mulu2_i32 to all 4-arg
 multiplies
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-40-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211021210539.825582-40-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.742,
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 23:05, Richard Henderson wrote:
> Rename to fold_multiply2, and handle muls2_i32, mulu2_i64,
> and muls2_i64.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 44 +++++++++++++++++++++++++++++++++++---------
>  1 file changed, 35 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

