Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC244379AC
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 17:14:18 +0200 (CEST)
Received: from localhost ([::1]:43000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdwFN-0007FU-8I
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 11:14:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdwDo-0006Xn-Rq
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 11:12:40 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:42693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdwDl-0000vu-Db
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 11:12:40 -0400
Received: by mail-wr1-x430.google.com with SMTP id v17so1225347wrv.9
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 08:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+eNA8viy34SjCQcS/Qv+0Hf5IEE+odai3crq6sOBkNA=;
 b=EnbF54KwGKoXBES93tjM6jOkpTTyH/eFkXY9VwdbvAqHI7HRfstA/Q2Fbc26myzzVH
 J4pDeDCmNNOSXYZqRRHxE1MW+IpJtPR+WbW5g1zA3+gaFppjOw21hQ9N5EqHvpW28xYW
 FT8w3sP1QnwANCR8kGz+FKUHfDWZ7Hk2ibkqTpx3WiQ3XEY1jqT7gIgNtImsVa8ahbgW
 IR5ov/99wgjPvuPaITuSPqghVsqWaY2AbTO0DdXg2SHnLG63jiS4E+ZfL5Ccq2GWlkkz
 xrzFv34U0XMvPjod8EnShyacrHyK7B48pDxT7tsj+2x+stDsIxh34UhrrtfZ9NT3HoGy
 v+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+eNA8viy34SjCQcS/Qv+0Hf5IEE+odai3crq6sOBkNA=;
 b=UwjV8TODrE7jreo4c+M8prO8I6NzlrVPBYdIkAMrbRTp2cy7SswtiDW/DYGncHcHrd
 TAL+mB1e3XsmvF9bjN/jf30po59eeDghMRByS03SGbaavXBNYRRRRoMgqJ+vC1psYNKA
 plmQ+zX4gWB6DhDVnPW3v9iuQsyyR9drRRApwO8NXBqJSCvCxi0Oi/LSe6bAxNdLaITP
 N30gqD4h7jp6v/QsqPujmx6WL+NkvStpUzNYccWsXNfHeBCEwRlX8BuVJVyfJOjm14hp
 NLLA0A07gwdu4meM9HVSWmm5b2wUwCvwLI6CJHDQ5yj0wE2yXHb8EvN84JLcuPzp/kF4
 kREA==
X-Gm-Message-State: AOAM530yWRWT7tbs7jfbbIFk7FB33/fcM4hI8erDnnTNzP12L2XK1PWe
 Zt17pSkVMgJwQD3jTm2Fh2w=
X-Google-Smtp-Source: ABdhPJy+FcPkPpMljS2ozoEd7i1bIoqVj3S5R8+8AAKlQGiSgTr4t4wq+Zz2CNEnBUCUTfGXoJ/APg==
X-Received: by 2002:adf:a1d4:: with SMTP id v20mr583033wrv.168.1634915555877; 
 Fri, 22 Oct 2021 08:12:35 -0700 (PDT)
Received: from [192.168.50.34] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id f6sm7613070wmj.28.2021.10.22.08.12.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 08:12:34 -0700 (PDT)
Message-ID: <a7ff651d-92c3-1670-aeb5-cc34f843eef3@amsat.org>
Date: Fri, 22 Oct 2021 17:12:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 03/48] tcg/optimize: Remove do_default label
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211021210539.825582-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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

On 10/21/21 23:04, Richard Henderson wrote:
> Break the final cleanup clause out of the main switch
> statement.  When fully folding an opcode to mov/movi,
> use "continue" to process the next opcode, else break
> to fall into the final cleanup.
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 190 ++++++++++++++++++++++++-------------------------
>  1 file changed, 94 insertions(+), 96 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

