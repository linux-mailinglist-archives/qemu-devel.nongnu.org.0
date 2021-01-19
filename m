Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 843512FBA9C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 16:01:12 +0100 (CET)
Received: from localhost ([::1]:35830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1sVL-0001Qo-Ju
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 10:01:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sTE-0000Af-Nv
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:59:00 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:38206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sTD-0007aw-59
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:59:00 -0500
Received: by mail-ej1-x635.google.com with SMTP id 6so28916271ejz.5
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 06:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V9ZxeR6vapGVAVoSqb1bvdN9u4baEMUb9I7apFygoJw=;
 b=CWEv2abCPA05xuwJ7V5BMVASfbs7gPbrWY7h89ee9zws/21SliCPTXklCC1rVWC2qj
 dzCFZa23Uumo8jmMbhWFuRY54yuFXs++CfiB2bKCE1BIFuGjuUmPZQ+q2UTa03o7iLfu
 xpOK5GiqHNgXz78VHGRmwWFnqGRTxAKgq2m4vEdLRVh5QdvsxtWiIxlfGAFrTjIXR5QD
 +I3HpuF44HCFsa/2hWRjxgSCzLp/TJd3kYG5X2IIKFtcyKrqhkK2GO6PisFbQEzM2V2j
 FkE2OuZwYoxW+xM2L86LXoJ0L+B2PmZGimHXvSXe7RxaysWa1VKiOUa/+rot6MQjKMKf
 +m8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V9ZxeR6vapGVAVoSqb1bvdN9u4baEMUb9I7apFygoJw=;
 b=TA1FrI5qDNkKkGs+F7AZLjofaRTnQMeagmzziRNyp05gwNIIHfnlBWiqOEENsszf5I
 8ZJyz9QLfOMByYzgvx628TC6F8f8ETuXPSbTskobQ2WxgANwMPO6cliecxF7MUKjMgAA
 UR2z/jeJWB29j9aFJ1viVS/NbvhfPhLShdanT9hxE9l+NeHCRB6oVrTeoaQcbkeHel70
 YmJAQMa+qSiYPaJsOvjCg2xSOqDeeeJlos6UcfANIrewL1Op2odm1VM9Z08FI7UxaMwU
 tshX/gZK1p2hKryZWVFvwXQRyvd2bmZrP7U/BxnJo2LdRkjMsYxD2K1O+cfCeo6hzlX1
 BWYQ==
X-Gm-Message-State: AOAM531NqvqItcrgqoo6b7ZapLFL5sPTwkfqyOxMuXDJ7bjNqMvU4ALh
 m4UdHFiSiGpMGJ9KOWeoO62yckp0Kt5iDJ9IjPGf09VV9V0=
X-Google-Smtp-Source: ABdhPJzqEangUwfdEM03Ljo+VkSiJFJWEBK8oMzK6LetQevIggM40xVGLIELFxkV0qAukzQYxXlHSQlDIqlAFfVVy9A=
X-Received: by 2002:a17:907:1b10:: with SMTP id
 mp16mr337970ejc.482.1611068337717; 
 Tue, 19 Jan 2021 06:58:57 -0800 (PST)
MIME-Version: 1.0
References: <20210115210456.1053477-1-richard.henderson@linaro.org>
 <20210115210456.1053477-13-richard.henderson@linaro.org>
In-Reply-To: <20210115210456.1053477-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 14:58:46 +0000
Message-ID: <CAFEAcA-uL5w=0r03tVA94MV+MSb6nrx+avmaYBnrAG1912OUxg@mail.gmail.com>
Subject: Re: [PATCH v2 12/22] tcg: Remove TCG_TARGET_CON_STR_H
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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

On Fri, 15 Jan 2021 at 21:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> All backends have now been converted to tcg-target-con-str.h,
> so we can remove the fallback code.
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

