Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE63372371
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 01:09:52 +0200 (CEST)
Received: from localhost ([::1]:43874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldhhH-0003QT-UM
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 19:09:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldh6s-0006cV-RO; Mon, 03 May 2021 18:32:14 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:35650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldh6r-0000yD-6r; Mon, 03 May 2021 18:32:14 -0400
Received: by mail-wr1-x435.google.com with SMTP id a4so7231600wrr.2;
 Mon, 03 May 2021 15:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zJ2d9H1LF1mL9NKS1R3/V3+FTR9U2VJHC8nbCc62Qrg=;
 b=MUEEax8pRMIHKyf/ABQsmu/6MPMw4zdHh0tt2U2CE2ssISrYg5BXJxMJrKpL6NW57V
 Zkk+fntGyp8KlrkUdRL4ZX379m53RgXMIwG4wuUIZZExJ0dQuGdtcumwj//mSQCmP+Ex
 0SjlaJU0rhl27jxV0nJTeJ4eNk/i10U6hm3SmIJXANAvsPAJoBuf2YdC53976bWXDfXH
 /eT9EmPNzuMxfu+On2X1Ugt0Vndwtt9UZfbO3LRqqbGbrvzCojYj0EEouCMHfNrGRMQD
 SbKPxsHnZcRNwuXCu800Zw94aTr55zFsghpgQH9IeRdx4gh9dZLklAAGU8Axtk7UOVT3
 9lcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zJ2d9H1LF1mL9NKS1R3/V3+FTR9U2VJHC8nbCc62Qrg=;
 b=GZm/mjLSFYkR71H8FmDabhkrLX3XaqBA5e+H6U9HtxEti1o2RTtqDtkmha9RWdUsDG
 ldgw1IKiv/vh7/9xLa6BWsPlsGs4Nhf335kqswHx9S0ErSrjl9gRkFywLiLk1TdA3B8e
 ZG6Ke+bE+nPC2YBzUO2NpQ06J/+rzkCAfHNA/eIzlp9YvMiwUU/lrJZcB/xUpQrAcC2G
 8Wm7Ci3HeDxTbqOobMFCafBfFjgLVi/SWwCA7np/M0oKE5oXos6WAWqV6eCp+D7oqM1D
 rozkHGmXkJHIMfz88jjsEdtqewe/KWZX/eVuks3+FHeGT466K0zcUNGye5ub2FFW6GEV
 OvsQ==
X-Gm-Message-State: AOAM5302MH7o8nGHHme8UD2TLyNmN0Qk3tejr5ytkz22LZya5qg99cLP
 WAxWFf8jTn3v9mHTLqw8Bok=
X-Google-Smtp-Source: ABdhPJyfhlVUYPpBEu/EjVwpXu5GtWSmwUctNM6lsZyO5hppSL679hg22IL0jHZapXaXbmsCTHQ6ew==
X-Received: by 2002:a5d:6687:: with SMTP id l7mr28228513wru.235.1620081131361; 
 Mon, 03 May 2021 15:32:11 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id 3sm775240wma.45.2021.05.03.15.32.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 15:32:10 -0700 (PDT)
Subject: Re: [PATCH v3 01/30] decodetree: Introduce whex and whexC helpers
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
 <20210430011543.1017113-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c6f28c4f-48a8-699d-7e88-3b13f89aadf7@amsat.org>
Date: Tue, 4 May 2021 00:32:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210430011543.1017113-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: luis.pires@eldorado.org.br, qemu-ppc@nongnu.org, lagarcia@br.ibm.com,
 bruno.larsen@eldorado.org.br, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/30/21 3:15 AM, Richard Henderson wrote:
> Form a hex constant of the appropriate insnwidth.
> Begin using f-strings on changed lines.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  scripts/decodetree.py | 66 +++++++++++++++++++++++++------------------
>  1 file changed, 38 insertions(+), 28 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

