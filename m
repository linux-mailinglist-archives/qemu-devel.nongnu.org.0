Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 404B9321E34
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 18:37:27 +0100 (CET)
Received: from localhost ([::1]:60710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEF9C-0001ea-87
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 12:37:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lEExn-0006dH-LA
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:25:41 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:45842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lEExj-0006wf-O3
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:25:39 -0500
Received: by mail-ed1-x530.google.com with SMTP id p2so22974949edm.12
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 09:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=txFR1sCu06rffZ4xYGpywRLWqZ1NaZwb/Mp2TigCQAQ=;
 b=L0SBQLVwE4R23K0o8W7CsKpTJsDVdskCO22/tVws9XR5q/Xyrx6SalQfgadeSFGmDd
 kOyOzGi+GOcNxkq866WPX6vJga6zhZhECZsnuTQ3dDc/aKirru1KJ7c0EZaJbawlwpOI
 +qgDua2RQ5cn0o6Wnzgqhjq2frjVk19Ek1osYwO+MgPTJQNI7Pzwj01CEtz0VZwMU8rX
 4/9S1XMg18VoPM2WBK0u701G0BUCjtYpZpF+qejVj+3n8zSv8abYVnfiRF+4w5pKGode
 ktS9GoZfX+inY4xZm1NpL0dXpE78CcttexyKLJtE+9Gn8+xdLKxW3sHCx+zcK+0UihC9
 XyXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=txFR1sCu06rffZ4xYGpywRLWqZ1NaZwb/Mp2TigCQAQ=;
 b=jcfKwHBQQFwfE9jGPX7b7uAXnuZTDcP9llVH2M5vwCivevh6DT49KeDJAK4c8wrkMi
 4h3oGD21ZFFX/gzSFXUBPSg5rZNP44QZ0t9RCcJLKnaqyivBOMxmwEdHo3IENPCF76CD
 Jgj6CXlAhSb/89Vin9uw0zZxWxFIYIMf+FLrTmD2/590zHlK8s27OOw+gqS1fDY8SQu2
 A2LcwcSlUL/szYkQIAJoC4DoviTzOu1i23wgF7D3vqwVd+waZNElutNTkB8VLi8k/FFE
 vRbWRH4G9chHGKgSlkW8TUBIL15ahfNpE3WWPrmWaEsvK7bsD9Nql/mhOgfkr30Vrmr5
 QjEQ==
X-Gm-Message-State: AOAM532P85wyMQgd+Cz2Fcz5y6AXcPMVyy+7AmL54boM+X198rNr8VkQ
 dWPXNzhBdMoFd7CRIE+XnSGPuVyrlPUPA4y18AzLCMmBwlk=
X-Google-Smtp-Source: ABdhPJz7KFaxU96QB4FDUq2fNoN0KPlxleXTSjCNPDmanrd4P7NdY9qwyobzjJUZWnTakXs+5+TOBUskOscz22K+roU=
X-Received: by 2002:a05:6402:541:: with SMTP id
 i1mr23463518edx.36.1614014732114; 
 Mon, 22 Feb 2021 09:25:32 -0800 (PST)
MIME-Version: 1.0
References: <20210222083324.331908-1-edgar.iglesias@gmail.com>
In-Reply-To: <20210222083324.331908-1-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Feb 2021 17:25:21 +0000
Message-ID: <CAFEAcA8fuO8X67yzthvyxssNAQQiXQxsdmSbnwX1XOrDcO2hvw@mail.gmail.com>
Subject: Re: [PULL v1 0/3] CRIS queue
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
 QEMU Developers <qemu-devel@nongnu.org>, stefans@axis.com,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 22 Feb 2021 at 08:33, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> The following changes since commit 00d8ba9e0d62ea1c7459c25aeabf9c8bb7659462:
>
>   Merge remote-tracking branch 'remotes/philmd-gitlab/tags/mips-20210221' into staging (2021-02-21 19:52:58 +0000)
>
> are available in the Git repository at:
>
>   git@github.com:edgarigl/qemu.git tags/edgar/cris-next-2021-02-22.for-upstream
>
> for you to fetch changes up to fd52deea52d79192c43a1a7a0240a3cabbc55e80:
>
>   target/cris: Plug leakage of TCG temporaries (2021-02-22 09:04:58 +0100)
>
> ----------------------------------------------------------------
> CRIS PR 2021-02-22 v1
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

