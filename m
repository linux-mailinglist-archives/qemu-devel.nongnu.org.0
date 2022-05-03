Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C153C5189D6
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 18:26:08 +0200 (CEST)
Received: from localhost ([::1]:45570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlvLj-0001GH-R0
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 12:26:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nluz2-0007IM-BR
 for qemu-devel@nongnu.org; Tue, 03 May 2022 12:02:40 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:41945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nluyz-0002RV-Nq
 for qemu-devel@nongnu.org; Tue, 03 May 2022 12:02:39 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2ebf4b91212so184883447b3.8
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 09:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NUfaEa2keNLK+OHuF8tjYDm/pNXCbqGn/NigOG8BKwI=;
 b=ck2EJOeBp7X5K/bidTlayveOtu7M+/ozGX1vdro707Soikkov3R7rq9eJqAfZUbXU/
 NVGuYTBhmQjWkUymsfbdxVBTPWByqPHvTcKA9f1ylpDTiu7ykiacYjW95ydEKycYgtSw
 4clDEwb54okiuSNc4on12MNSX5fuTEh7Io4oz03hYWhp5FiMhKEGfahAPpEnj5CI9ZQs
 FuCvOT9HJIgnjwD4VdeZ8rSessOzXgQy9k+AHDK+JDl4sM0H2hzBxHOQ1vH7Zc42BTM6
 Wy++p2FSmX3FPUMiZpviklduK7M6GVMZysFM6HF9TtZNw0m/HzkudS0lK0Yvpb3RDwEE
 YvJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NUfaEa2keNLK+OHuF8tjYDm/pNXCbqGn/NigOG8BKwI=;
 b=Z6topM8NubWETZwOC4L/fOrEz+vHikO83v3PlPLyBSYyQnoMyaAHwfxTFhC7AjbEP1
 2gwtKY2ShMo206caOmtWmsVhtPoUMesAh513sRjcavWUHCv/R7HNHNZ4dMO9EGEAIFkp
 3yZxpapVrib/Uu6m02ydyvKlpfIhrXgpuAfTAjaSgh5Q3MOqIfIZlV6kSxfCIgcT3glW
 kSs+PH5IJKSCIi9zCSutSzqGqVBrVp92aUPH1XmcHysoR8JNwFOkOfo6ZQPBOpNw85CI
 WBGeOv0SwT0iaQFTY+at8KA8qsGyIKMlqUN2SB9FThqi9binQ2CjT7C66e+1UVznBh3V
 zNjw==
X-Gm-Message-State: AOAM532TwJsFE/LQpc7EiwHus1n6TViTg7e4nUwZFVJRz3ENvlMSHIsX
 wTke/fehBOWcB/q7VLN42iNSWj+rOuXaNu+3nq4r+w==
X-Google-Smtp-Source: ABdhPJxbleBwAYs1R6ao4FbcitDVf/oHXbd5wSyAmrThX5PhMcKZFVGE5yv31JVambf+BXQhtmAB08BFnvZAzpqZ70s=
X-Received: by 2002:a81:6cc1:0:b0:2f8:bb31:143b with SMTP id
 h184-20020a816cc1000000b002f8bb31143bmr15382454ywc.64.1651593756468; Tue, 03
 May 2022 09:02:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220501055028.646596-1-richard.henderson@linaro.org>
 <20220501055028.646596-12-richard.henderson@linaro.org>
In-Reply-To: <20220501055028.646596-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 May 2022 17:02:25 +0100
Message-ID: <CAFEAcA8n1WXdoFaiGytxdoSP0S3MTFjrRaG=qRRfW6_u=M97Ag@mail.gmail.com>
Subject: Re: [PATCH v4 11/45] target/arm: Store cpregs key in the hash table
 directly
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Sun, 1 May 2022 at 07:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Cast the uint32_t key into a gpointer directly, which
> allows us to avoid allocating storage for each key.
>
> Use g_hash_table_lookup when we already have a gpointer
> (e.g. for callbacks like count_cpreg), or when using
> get_arm_cp_reginfo would require casting away const.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v4: Adjust usage of functions to match new note above.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

