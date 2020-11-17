Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9362B70CB
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 22:20:23 +0100 (CET)
Received: from localhost ([::1]:39434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf8Oj-0006iq-Ph
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 16:20:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kf8N6-00061Q-W8
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 16:18:41 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:36535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kf8N5-00024a-Cw
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 16:18:40 -0500
Received: by mail-ed1-x542.google.com with SMTP id m16so9138549edr.3
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 13:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DT1B096iyxChoXvdwbls7Vs2UfnuwKeCJcHlsGvuCx8=;
 b=e095rqKGwmeHT9rP3iwks8zoUP3MIKfOGijrCXN7znG659cm21WBIrGcnf7XTgc4To
 rReia0EZ+6uiTCtl6Xm8Hishv/R8L6C06I0XmjQW626aAA3s65geaMF9pkkRFDBrl2GB
 8492Hb560xCbMA0mhHttXorXvtVe5tvwArlnDeGUrkmXgc6eNlfiJxQLfMOUQlHaFpGM
 RRmtun2F+6n4dzfc0L214rGYjWuUdCwSD38Ux38Vt/BPi2nkRbP40dRcSlG6lpjf1d/8
 gI9eOI21ZFhIrJfbHuYz93RwjdyXObLIdVMPqWEATiagY2Vks9Xbk0M4NLISeXOnRBOC
 5h+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DT1B096iyxChoXvdwbls7Vs2UfnuwKeCJcHlsGvuCx8=;
 b=bbzGzate6Bi0t7BNgdJ7SMJAnLkRA9oQqknKLDyzYhEJbr4MReEzeVjKhnLLhgcqQ+
 sLcnV+amOuqXR+XJ+eDdEO9dDUSXFJoxqjSPb3TIv8j5EEgWgnKI8YUkxleyYLY3EWQs
 SUmycR6KCYDBWEPAZr//ulxsKbXlRqCSLSP/Lr6taKqd6nmtveMSqWNqiY5jwMhVR0sT
 s0jR9tnVT+6c++UqCKK3Q01RQchA7md3feMAA2681MlGwX6M/jcnvBm9lX5UDx4+Zb/N
 CB7laS74TN0b5deUUW50zc/vu85zLfskED73Of7FcWwM/lsKQwxgMQRjgQrgJvLHQSZt
 RgVQ==
X-Gm-Message-State: AOAM532R3+sLNaI5ueJ8xs/XPOUFbEJW2z1jrv7bOEq/wFHzsBGAqw53
 FntVY9bsTlAD6cSSNYM6MvuYQwqT12uE2PeW3UNb1A==
X-Google-Smtp-Source: ABdhPJw2sjlGodULDhgWB3fudK4uaHKv3jpyoSoGQzJegDxvZ7Sr4zfuyk2vYjl+FKFdCZyvR1a09W/HCTldMV/+nok=
X-Received: by 2002:aa7:db8a:: with SMTP id u10mr23219975edt.204.1605647917718; 
 Tue, 17 Nov 2020 13:18:37 -0800 (PST)
MIME-Version: 1.0
References: <20201116160831.31000-1-peter.maydell@linaro.org>
 <20201116160831.31000-7-peter.maydell@linaro.org>
 <d5cf2b31-0eb5-8147-2104-93b0c4c54b9b@linaro.org>
In-Reply-To: <d5cf2b31-0eb5-8147-2104-93b0c4c54b9b@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Nov 2020 21:18:26 +0000
Message-ID: <CAFEAcA_0mb5S0KG_sXv9vWXznE9H_uLEcQbtpuLyrw4n7k19aw@mail.gmail.com>
Subject: Re: [PATCH 06/15] target/arm: Enforce M-profile VMRS/VMSR register
 restrictions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 17 Nov 2020 at 19:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 11/16/20 8:08 AM, Peter Maydell wrote:
> > -        if (a->rt == 15 && (!a->l || a->reg != ARM_VFP_FPSCR)) {
> > +        if (a->reg != ARM_VFP_FPSCR) {
> > +            return false;
> > +        }
> > +        if (a->rt == 15 && !a->l) {
>
> Alternately, the parenthesis are just off:
>
>   if ((a->rt == 15 && !a->l) || a->reg != ARM_VFP_FPSCR)

Mmm. As you've probably discovered by now, the refactoring
in the subsequent patches means that this code gets moved
and changed anyway; I just wanted it in this separate
patch so the bugfix wasn't hidden in the refactoring.

thanks
-- PMM

