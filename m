Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1165F69A5
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 16:33:26 +0200 (CEST)
Received: from localhost ([::1]:53024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogRwD-0001j6-Ts
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 10:33:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogRrj-0004d9-Fv
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 10:28:47 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:36530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogRrh-0006N0-WB
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 10:28:47 -0400
Received: by mail-pg1-x530.google.com with SMTP id s206so2037809pgs.3
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 07:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xD0NcjiitZycIyQjAKCk7fuemaQrVt4YXEvWt0vMYz8=;
 b=nJjTmkqXhhBtqn6TfI9nwqtVY3NRlY5lGQjjstIQ6A25lgUICqQI+KGl0RZXwFFR6g
 TjzOXxlSvHIvgnmLUit3psnJSsyjaWwpkE7/gvioqmB2JGt+Vno0Km7C2C6qCX5Ve1Mx
 Ory4y3neZJGmaaYRO5CAYISJku/IN6P0p6HyKbfcS5yHQzB0Ctpgo7OyO9o4Fp8BpdP+
 +DaGg8CojxZtftoTlR8syr53lddbgFrPpNF4gV0B3/sRLRKlpUNDnzp5fLAQCo2ePjYw
 vJdr0ASbxH3vNggMYFYhbiDR33zq74E5YE4DaHkPqq9drciLDCGlNAuhrIguWO9zm6FF
 TCRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xD0NcjiitZycIyQjAKCk7fuemaQrVt4YXEvWt0vMYz8=;
 b=CqKb4mes88tKzNSZ0xz8ZXDukMeKs3kBOGE6rPzo422/fgP3WjQTAPSwSbVNdTK23G
 xcrGItTlvz5A7YZqvpyn3pERDe3yCuKSeGzHPjKADuREhAY0VpUiVQpr2E9QDFjOuuft
 CSj60QYfnNEjFQyU57YpEAlJYwl6Zt6vpauprgvbVn59GlTc5M/Cz1xI6hqKVsogO3Fz
 21Eg5RA8XLbX/28TiZwFcL3ProXtvdDF9gnUZ++cfgoZn1/YCObvdLDjeCogM80G8n5O
 NLaeujHLtMKEdUCVbpTeiZ5uKe3N55saCrajkW45lukoo8QSg3F1PM4yKyS7TKpWmzmE
 RhJQ==
X-Gm-Message-State: ACrzQf2WaXUBPK2pWV30AtS0oFIVuQb+zq32T+S4xSi4JtC2j0S1YJSm
 P0OO0xdLcIGfHTs/vwg7a6L1sDddwtQdXb39Nnb8Tw==
X-Google-Smtp-Source: AMsMyM5NcnSX5AyRD0jVDrw+TS2NOrutgex+cDgDFpv4f3l4fJGcAx0eeRPWxEgMZMcJlvnSdEvEk8djSOPZOrkKngg=
X-Received: by 2002:a05:6a00:b4d:b0:561:b974:94b9 with SMTP id
 p13-20020a056a000b4d00b00561b97494b9mr34491pfo.26.1665066524615; Thu, 06 Oct
 2022 07:28:44 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-4-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Oct 2022 15:28:32 +0100
Message-ID: <CAFEAcA-onDRHW73mr=f1u28aff-037SXoo58nHn11TLb9Rw+Pg@mail.gmail.com>
Subject: Re: [PATCH v3 03/42] target/arm: Fix S2 disabled check in
 S1_ptw_translate
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Sat, 1 Oct 2022 at 17:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Pass the correct stage2 mmu_idx to regime_translation_disabled,
> which we computed afterward.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v3: Move earlier in the patch set.
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

