Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BB12FBC20
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 17:12:10 +0100 (CET)
Received: from localhost ([::1]:51268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1tc2-0004xV-05
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 11:12:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1taW-00047P-TV
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:10:36 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:37484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1taU-00036m-PG
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:10:36 -0500
Received: by mail-ed1-x52e.google.com with SMTP id g1so21515810edu.4
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 08:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yhs4TcfGGLSfU+ID3JE3mh9ONyoKwslhEk+R+colieg=;
 b=lNh1ios9YQG3hBA6W7O0Zh591GFsmrt6dZgbJnMFZ3qAfSzS1LfoxWn4LFxSVAtwYr
 AYjHm58ijEeICgscPYUr92M1jFYVrC8aSfS5u6u4J9IfgcoccslEC8r9PCVWfaU76nRx
 aywRzRi+C4dvFq8+g7ck7HApLEdpj0Qhuy038UNvwFOG0yuec1N50WmlvLlD4XKxFTQZ
 1XHa4LyiaGwClV3rWVdmS4Zpb7Gp49mWVPn1uvGmGSFaHqSjfjsvSEFlmJFQkvahmIMx
 ujIKUP8Cqoa2DdewbizjmgMJ4PMMnhu1blyifkN9L/51iaxP2YosWLnO2WYSmLkEwkR9
 ACKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yhs4TcfGGLSfU+ID3JE3mh9ONyoKwslhEk+R+colieg=;
 b=FbRPokLuhdfO5VZIK1EmMGN0mvIdM/Mplr0mJjoaAZMEczoalnIf+c8n4X7mkRUGC/
 STIdgm5ckaJcanFu9C8DFjNHV/FH0GYR4SjlV+S+3kHb3WPxRGrDBz0Jkv7AZ86Y7lk/
 pqWKRiQxSL9YTik0haiK2EmJVXcb9bfFilrGLuLWcKXCzXpaI+9tkVqatBBgX0cbW3op
 JQVslw/2jxK67ViuUMWJQ9gycS/MKix/PimO4lJvwEeITPPBLrirv3Wm5VQOMgyVTN2C
 Hb8Bvhlh7z+L1eOv56NmOTcEfpZ3a2hQDGhxYWB4ZSBSodRBPZ5mvYCGwQAD0cYraXrK
 HPiA==
X-Gm-Message-State: AOAM531C/uHvuDEUYKraKUjm8WqGHR9mZkV1GfJyux28MPceNbcv4mBM
 1DxODCZmhbVvArZRhKQJyf4VNY2IQeUHLemCuV6rGDdyNS4=
X-Google-Smtp-Source: ABdhPJyJt4xaStE/IFheUn12jO22roepho+xxl2zTiIIstHjgYZYBIx0TJ5HiDF7qbe10PYNjeLp6RAsUld7yBelahQ=
X-Received: by 2002:a05:6402:1383:: with SMTP id
 b3mr3876065edv.100.1611072633044; 
 Tue, 19 Jan 2021 08:10:33 -0800 (PST)
MIME-Version: 1.0
References: <20210115210456.1053477-1-richard.henderson@linaro.org>
 <20210115210456.1053477-23-richard.henderson@linaro.org>
In-Reply-To: <20210115210456.1053477-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 16:10:21 +0000
Message-ID: <CAFEAcA-cw=XeY3=0F52UU=z482RngEjNR0Zbo889DfWcsy6bgQ@mail.gmail.com>
Subject: Re: [PATCH v2 22/22] tcg: Remove TCG_TARGET_CON_SET_H
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Jan 2021 at 21:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> All backends have now been converted to tcg-target-con-set.h,
> so we can remove the fallback code.
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

