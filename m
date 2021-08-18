Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDE43F0DF1
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 00:12:17 +0200 (CEST)
Received: from localhost ([::1]:59380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGTnE-0006pt-71
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 18:12:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGTlh-0005KG-Pj
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 18:10:41 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGTle-0001iF-Of
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 18:10:41 -0400
Received: by mail-wr1-x430.google.com with SMTP id k8so5829928wrn.3
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 15:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uwC/sPb20KeU/pwdxWGq3GzaSuLpHWqnfQPx/slpCzg=;
 b=YeYeIehhv9FsMFkjtK03SvJarDk+AlfnQWekCFE+ApkOeDQOX6bYquLd2pWpeFNlut
 51SiPlo1j6CDoGZPrOnF7wjbkmCdt7oohDwOtQ2CRe/S/utD37uBCqIUwcYn+HK4oW6G
 2fUDWrOnjYYpAP8UOfr5pSjHHTD6EV33NC+rpS8q+WSUbDcsKBrWXOuqSatCC611x+sP
 nbavVXNH0EP/qWRNxzoBdiwqkgm8mC4pIEDnt8i5FcHxMLjp6BTynF/M/Y3KwT74Mgvd
 25KBy2lHnOd7JpjMVAOdshZeSA68ghraUlprCnVnUjI1SymJKmLolL/C2t06o/eYkTdT
 HEJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uwC/sPb20KeU/pwdxWGq3GzaSuLpHWqnfQPx/slpCzg=;
 b=gyQTbGBLSGT/kIkUy83ZKNwytVlV28oRL9AdB8ZlXwJlbWm0AunxD7qF60AWAZM53s
 Wx+8v/+g70/w40so+Cj2FCE9NLRWm/kBZyQkhRjooRIfmDJcohJrgYBOTd7grnQxIA7a
 eiC55zcF1wyNhBld4z2oZCGXiWUPPCSZQy7VEdZDnCa7j1l6L4/1Beljp0ZdOkJdsxN9
 F43k59pcEXZ8ZFC7yNnF/gLJbuH126GdjH+PxNMjUTHYADwt1s9on44zwZ4CqdmUmNNw
 qVxp38WktUKV54ck+L6nCpLLf0p3JDI5QkLErIo2fdcI8trZ9+0/Usr38FwLsy4JZ1Z3
 GgSw==
X-Gm-Message-State: AOAM530SQfMEDra3Y60+8XuHqCdzpZRKR0gGxxkrw2Ty/cfyygyWGBon
 q2UeEN6/A6UQ362G/gR5udIFVYtJ1cQ=
X-Google-Smtp-Source: ABdhPJydiVN8akgfaIXUuG+eO9ODDRUJ86UOTZJoCiJ3OQaxpRIhSwB7yojAXrHmZMPNwQMFhmwf2g==
X-Received: by 2002:a5d:6a4e:: with SMTP id t14mr13420798wrw.41.1629324637051; 
 Wed, 18 Aug 2021 15:10:37 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id p14sm1081981wro.3.2021.08.18.15.10.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 15:10:36 -0700 (PDT)
Subject: Re: [PATCH v3 04/16] tcg/mips: Move TCG_AREG0 to S8
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210818201931.393394-1-richard.henderson@linaro.org>
 <20210818201931.393394-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6220f53e-dc79-33d7-c918-719eb4840292@amsat.org>
Date: Thu, 19 Aug 2021 00:10:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818201931.393394-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.961,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/18/21 10:19 PM, Richard Henderson wrote:
> No functional change; just moving the saved reserved regs to the end.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/mips/tcg-target.h     | 2 +-
>  tcg/mips/tcg-target.c.inc | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

