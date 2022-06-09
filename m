Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B4C545388
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 19:54:36 +0200 (CEST)
Received: from localhost ([::1]:50192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzMMc-0000Dg-Sx
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 13:54:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzLFr-0002oZ-UR
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:43:32 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:43616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzLFq-0005oZ-DG
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:43:31 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id l204so42697631ybf.10
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 09:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bWpVv5rLTN4v9qWMc6P7eGvMlt4zoNP3Nqgbfd99WYg=;
 b=fuggfpV8eeypP9/ZHnfqoA1Z6BcPLCefrx7ftJ/41JE2bjTOO8fpyW3vr+guy61ZJc
 Vfal+x/j9/3S9mr1Rq93mbX6IfpFIqe6l3FlfrqX2H/h3ZzwjhwlolCFDhTx81FvEgLX
 B8E9ZOkbg+wbHdgF1QqBYI/tAdeaO1QGbWIf8E7G7FTy9iT2HqgO0DGQbDadmH+YfVeA
 twW8vBP3E4gUFSYXvkBWYwFs/TIt14Nm7/pCLWIGVtH/yN8WPWjjvYtdfadimKektdqK
 f8FeED3OUrYCE0+giNIsOQB+g0mfg0WjC3MAKjIJ+2hbXNl4tV4WAnciU8ItZTfAq3wC
 zuLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bWpVv5rLTN4v9qWMc6P7eGvMlt4zoNP3Nqgbfd99WYg=;
 b=tBoeZ1dAG7Fp3G7KB3DuhvddTUtQxT+E/YN6YG2qqeAwThXGwhby5Rv3LygFKzybwt
 Cp6XWPCenaoOONaFc13uNmKLUWnO8AWr0MoImaH+vQPMp51FOUpuZ2iaLhdWpLC71sDO
 drT3Rvt44MgvWZKBrbHQTTLdP23h8Lyl4rJlM4MrR7g5jl330spHqHMCTrqw4ZNsOcCJ
 w0JFY9q1eqKzTjUtinTinXeAumhmgcFxh4kTsnmv2u39JrUxBV1usOYnDXIuvXrgLCfr
 KwTj2HJ/mdP8S3CeQZNyTn8S/GekVVHSW7T4kD2rd+GRwg4EMDuz42JntQn6dMz91pgI
 EzgQ==
X-Gm-Message-State: AOAM530MXr3kQ/jxRyNag+595LYFGb4S+//dYQPRD1rQ5sbZF88/k+gH
 NcpoNMgEQ/UvekKOCjoh54qspdFUVwKNBnFKHEvA8A==
X-Google-Smtp-Source: ABdhPJxtly46K9MlsBHQjJR9E63EN4M68Jbb08EaYReY9STMdBcYOtIemqn0HV/vOe1Z5dLFpKmh1I3g5VHmWbo8808=
X-Received: by 2002:a25:1bc3:0:b0:65d:46e8:6322 with SMTP id
 b186-20020a251bc3000000b0065d46e86322mr38778089ybb.140.1654793009369; Thu, 09
 Jun 2022 09:43:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220607024734.541321-1-richard.henderson@linaro.org>
 <20220607024734.541321-22-richard.henderson@linaro.org>
In-Reply-To: <20220607024734.541321-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 17:43:19 +0100
Message-ID: <CAFEAcA9EAY9ZV8Djtd6-NrE++OnM8PTzOes8fcgV4fpogFz9Fw@mail.gmail.com>
Subject: Re: [PATCH v2 21/25] target/arm: Remove default_exception_el
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
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

On Tue, 7 Jun 2022 at 04:18, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This function is no longer used.  At the same time, remove
> DisasContext.secure_routed_to_el3, as it in turn becomes unused.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

