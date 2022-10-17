Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E973260108D
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 15:53:40 +0200 (CEST)
Received: from localhost ([::1]:60062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okQYm-0004wB-2B
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 09:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1okQUI-0008SJ-96
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 09:49:02 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:39610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1okQUD-0006mi-2P
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 09:49:02 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 o17-20020a17090aac1100b0020d98b0c0f4so12908167pjq.4
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 06:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8/BGGq/QH0s2OVfDeopbmaZFz3D1KIp/wJ9aLF5GcOA=;
 b=b1MdygQ2evI4u4zmQ7zTPSF5MP//0koofFHlVYqGf1rYc9/a2wAkYordoEs8EwpxTy
 5jo95JHgr6WX1x0yCPpjIy2UeCsxQSAC7nWdn5OkD6gjyfoIRkPCbQ08wyz02RhZOy+p
 rvfNuHPsq6d8hUNAT32Y0pvXXXGp8AGFRq7+kdcQOPN2EHC8JTp6Ki0mGOjWYpZWv6z+
 rtBg/pFqjifCDXjxIkzK5eouhNBhRwMlJa713uCk684o/InH8nTeRXxYk1cJ7BJvUF7v
 bTalezpPvVQwyWT3ArYpPQOBOGUs8i8Nghu7S2Duy1EKbhaGXFgOW9ZLEC7FMp7D6Vpu
 QHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8/BGGq/QH0s2OVfDeopbmaZFz3D1KIp/wJ9aLF5GcOA=;
 b=xQExtMKEZsXpyLf/HE19QSEbvZ9r/njReX+AYPkryV7BOrlmWYTDtXr/iD/OsUHZOa
 IWm6O5l/8AMEfNmqtTY2v6+d5+97QG+zPx9EEVWPzPxZPAJ0DoFRHlcLXCgQn7byGgup
 FVpm7iCpdkS0kNWPaixbkeb+IAv/G2/cwL19YJS1a8fnMH01ztV9LWh1W/r8Pi0UOSlF
 1Y4aJ1DHFMACI8epFCbb6ppdDBtcbOi/OYWrNHGM4mt1o5AqYWJ5RQ90lOkaCWoFINXu
 UXriCjjxfeYEz5MkMFbC2+Spq+oAk/u0S6sg0rOumyXHnZN3zwuPaxGD3jtKebFECjwj
 kLrw==
X-Gm-Message-State: ACrzQf3v2JI6su+fvU80M2xm+2VmxiH3eACrJxeOIYyOGBXrXAcM32il
 gGaY7vKD9Xh6VFSBgjxDFcC1RXuJv7c7c6T3Pv/CVQ==
X-Google-Smtp-Source: AMsMyM731Upo0wqv8ADaXU1E+0UVwVBK2hYCFrXgbPxxey98V1k9h4gMJAP9mqhuD6sEo5J+3/Vll6300xzzP6Rlamc=
X-Received: by 2002:a17:902:7c97:b0:17f:5abf:9450 with SMTP id
 y23-20020a1709027c9700b0017f5abf9450mr11783402pll.19.1666014535602; Mon, 17
 Oct 2022 06:48:55 -0700 (PDT)
MIME-Version: 1.0
References: <20221016220932.274260-1-richard.henderson@linaro.org>
 <20221016220932.274260-10-richard.henderson@linaro.org>
In-Reply-To: <20221016220932.274260-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Oct 2022 14:48:43 +0100
Message-ID: <CAFEAcA9i6gXEcQ2F6=Yq70iCx_XiRdHRu0V8pTEurXYDotmA_w@mail.gmail.com>
Subject: Re: [PATCH v7 9/9] target/arm: Enable TARGET_TB_PCREL
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 16 Oct 2022 at 23:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


>  static void gen_goto_tb(DisasContext *s, int n, int64_t diff)
>  {
> -    uint64_t dest = s->pc_curr + diff;
> -
> -    if (use_goto_tb(s, dest)) {
> -        tcg_gen_goto_tb(n);
> -        gen_a64_update_pc(s, diff);
> +    if (use_goto_tb(s, s->pc_curr + diff)) {
> +        if (TARGET_TB_PCREL) {
> +            gen_a64_update_pc(s, diff);
> +            tcg_gen_goto_tb(n);
> +        } else {
> +            tcg_gen_goto_tb(n);
> +            gen_a64_update_pc(s, diff);
> +        }

Why do we need to do these things in the opposite order
depending on TARGET_TB_PCREL ? If there's an obscure dependency
then it would be worth commenting it, but it would be nicer
if the semantics of the functions were such that they didn't
need to be called the opposite way round for the two cases...

>          tcg_gen_exit_tb(s->base.tb, n);
>          s->base.is_jmp = DISAS_NORETURN;
>      } else {

thanks
-- PMM

