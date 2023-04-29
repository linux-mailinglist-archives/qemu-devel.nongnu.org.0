Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C4A6F23DC
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 11:28:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psgrd-0008FM-1l; Sat, 29 Apr 2023 05:27:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1psgrb-0008FA-Pe
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 05:27:31 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1psgra-0004VU-90
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 05:27:31 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-94ef0a8546fso113522966b.1
 for <qemu-devel@nongnu.org>; Sat, 29 Apr 2023 02:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682760448; x=1685352448;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/cDAz252GPAKpQpC7a9EbcvKTOg9159Mv0K7VgF+vZ0=;
 b=bapAhV6NK9xyEXWXGuaTD9OfnBELhlIgJYOdBH1s6gvhFofFWbSokAaOA59G2rWXT8
 fxM+oTTlJ0dU8Oft7awohcVu8f9fERKc/lSlVIg5djEqexiF63Ff1BC8lTtVhMoB6sEo
 ZTlclOQt9WAPv2kQq/NPzXUPmiNsa0YIxY+kVEgu8j3m7zxfbLprVLA2EShnqvNoP7kO
 R4p3CcaQbSW4J272hUIEaVRoqic9OiDlQrTIXStNpklRF6bySoXKN2BPCY8HzX4a2Hig
 tdOybmwZXkh+VK4OcPeokUXlbrjdZs/IRo+dsxpsOsHtGx3T4RTfaExXKFnBbgVwO/iO
 liZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682760448; x=1685352448;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/cDAz252GPAKpQpC7a9EbcvKTOg9159Mv0K7VgF+vZ0=;
 b=T6ZB/5RCs2qlw9zrUvc02SZWTY8yLkJ0sONY6rHJ+8EhNRSRAydJjWwNBOdtEyK3Wm
 SfRWdvMg+CsWFJknNepmtedk59x8FwADxNMhlxZ2v4RjtCFWgbyITc7m2BP7a1bjGsTc
 5XuKF6orZDhntO1Adtw1nYPAO3XWFJowpXKleueapqULze6IeUC01+CHAjbRSyc4l2RZ
 9Nn8cOs56CSROsqQg5D2idHjfdY8NTg13o7fsKkJRnsQ7ifVl+cWPWRPx+2Z5PuCToHo
 FGKtFPTBlF0nVgEqYM6kZKQw7j1YnB73P44tLQQHUY+2hX8uHzAQUDM9TrNwIO066rKU
 Yqug==
X-Gm-Message-State: AC+VfDx3EwYXFl1R8DHmA0oPubj1wk0iUe6hGOdM3ElX4IlPk6YDr9gZ
 ZZxpmLhkUFsZ+2izMsZIBvNyQkVDR5nfEXONISuz5g==
X-Google-Smtp-Source: ACHHUZ5hqrQBNUD9qnr2rT1RkhgyJ9WhLNMjT7zUneUenYjxX59UukhEOBGjAMJZG4zARvBdWOOu/N8/A0UEH+iG6uw=
X-Received: by 2002:a17:907:318b:b0:94f:61b2:c990 with SMTP id
 xe11-20020a170907318b00b0094f61b2c990mr8089428ejb.25.1682760448082; Sat, 29
 Apr 2023 02:27:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230428204411.1400931-1-tsimpson@quicinc.com>
In-Reply-To: <20230428204411.1400931-1-tsimpson@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 29 Apr 2023 10:27:16 +0100
Message-ID: <CAFEAcA-EG33Ak0S===j8uh0wXEDcNPx7R+GAxF5ad8ptpNZGzQ@mail.gmail.com>
Subject: Re: [PATCH v2] target/hexagon: fix = vs. == mishap
To: Taylor Simpson <tsimpson@quicinc.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, richard.henderson@linaro.org, 
 philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, 
 quic_mathbern@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 28 Apr 2023 at 21:45, Taylor Simpson <tsimpson@quicinc.com> wrote:
>
> From: Paolo Bonzini <pbonzini@redhat.com>
>
> **** Changes in v2 ****
> Fix yyassert's for sign and zero extends
>
> Coverity reports a parameter that is "set but never used".  This is caused
> by an assignment operator being used instead of equality.

The commit message says it's fixing yyasserts, but the
new changed code doesn't seem to be fixing yyasserts?

> Co-authored-by: Taylor Simpson <tsimpson@quicinc.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>  target/hexagon/idef-parser/parser-helpers.c | 2 +-
>  target/hexagon/idef-parser/idef-parser.y    | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/target/hexagon/idef-parser/parser-helpers.c b/target/hexagon/idef-parser/parser-helpers.c
> index 86511efb62..0a01ec39b7 100644
> --- a/target/hexagon/idef-parser/parser-helpers.c
> +++ b/target/hexagon/idef-parser/parser-helpers.c
> @@ -1123,7 +1123,7 @@ HexValue gen_extend_op(Context *c,
>                         HexValue *value,
>                         HexSignedness signedness)
>  {
> -    unsigned bit_width = (dst_width = 64) ? 64 : 32;
> +    unsigned bit_width = (dst_width == 64) ? 64 : 32;
>      HexValue value_m = *value;
>      HexValue src_width_m = *src_width;
>
> diff --git a/target/hexagon/idef-parser/idef-parser.y b/target/hexagon/idef-parser/idef-parser.y
> index 5444fd4749..2561f0ebb0 100644
> --- a/target/hexagon/idef-parser/idef-parser.y
> +++ b/target/hexagon/idef-parser/idef-parser.y
> @@ -685,7 +685,7 @@ rvalue : FAIL
>               yyassert(c, &@1, $5.type == IMMEDIATE &&
>                        $5.imm.type == VALUE,
>                        "SXT expects immediate values\n");
> -             $$ = gen_extend_op(c, &@1, &$3, $5.imm.value, &$7, SIGNED);
> +             $$ = gen_extend_op(c, &@1, &$3, 64, &$7, SIGNED);
>           }
>         | ZXT '(' rvalue ',' IMM ',' rvalue ')'
>           {
> @@ -693,7 +693,7 @@ rvalue : FAIL
>               yyassert(c, &@1, $5.type == IMMEDIATE &&
>                        $5.imm.type == VALUE,
>                        "ZXT expects immediate values\n");
> -             $$ = gen_extend_op(c, &@1, &$3, $5.imm.value, &$7, UNSIGNED);
> +             $$ = gen_extend_op(c, &@1, &$3, 64, &$7, UNSIGNED);
>           }
>         | '(' rvalue ')'
>           {
> --
> 2.25.1

thanks
-- PMM

