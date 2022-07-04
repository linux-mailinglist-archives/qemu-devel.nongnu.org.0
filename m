Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 475A05658A5
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 16:30:11 +0200 (CEST)
Received: from localhost ([::1]:53492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8N5W-0004b3-92
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 10:30:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8MMn-00013J-W5
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:43:58 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:41685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8MMm-0006lG-8n
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:43:57 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-31c8bb90d09so28840857b3.8
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PEuIi6nk1LbrQ97FDhD4UWz+V7GHvMZH0ooTdoAzQnE=;
 b=v6IDQwIpoSR4TAnEt4NNYvXqwhArxtYPKXM/lpWoKRFKyZOV/ax+AMYYLnyN73b5M0
 Ir7FXEzWz2pAbH+Yqa7LNSldPXpcdYTCKRtl3Hjzpf0l8kzKs+Id2eaHXUjsMaFQNhLD
 pCRBola3tbM0XfmLlrtEZ1mkozTCJmrKOXT52j3Ds11dGc5iB2an7TOcgPOEbJoHwRHD
 bDbIxmFRMInUd2+PUpZRK5oTPSqdU4mmCA2Evc2P+yFxopjG52J5eVSlfHMvXAfyczE1
 Bs6WgF/51nD59wlzjE39qorgyzzRaGMW9s+HWvqa1YqDjcJAA5TtOeUh+fmc6IjEC/YC
 IvCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PEuIi6nk1LbrQ97FDhD4UWz+V7GHvMZH0ooTdoAzQnE=;
 b=r4/NyGaR2HT0DRWfSd6Xnap6qCwykTEDlR1uv3MfYIdZR5JGYJRQ4+iaMJG6kBOgKs
 PwUCKBSnD51e9YlEqUuq0GgP67Dn1xu+jAKITCf9lP51GTKPJ3MemNGA1xGzQ0a/XrXI
 xeAQQmqFn2zW2hTlskqR8LYp/FLO+FfxUPsvLD9jcJEeFwPhkPCW5vGFHnU7NhjlISs4
 9lYW0/ZI05zkm7TeT+RXvyMRrjQ4uJKPSYP97EdvnRvm0O5lP+j9NR/NeM3LBCABXwJ5
 HcF0j4NYlZHJFFyRldrQrrxyamWBQ/XEUUn5xf4iLJyIIXzAQFEE6wTRdwfQDmeQXxea
 Xstg==
X-Gm-Message-State: AJIora/LUGyqdgmCRwmSgtuB+l7ef+jPRHP3sLaylqSdxsK33nBJ+Bul
 RwfGc9c/Dd8U0QwfPUhljIb/OhYDryNUNM8kn5P3Lg==
X-Google-Smtp-Source: AGRyM1uK0tFXn3/saV3qCXp3BAZYh+WhtgwaBJL5wTMBb30/di9Kpo8t2gurE6W58Av0b4c44qtoYRTA4uK2L5l6IV8=
X-Received: by 2002:a0d:eb83:0:b0:31c:8741:a033 with SMTP id
 u125-20020a0deb83000000b0031c8741a033mr10113559ywe.455.1656942235105; Mon, 04
 Jul 2022 06:43:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220702142519.12188-1-akihiko.odaki@gmail.com>
In-Reply-To: <20220702142519.12188-1-akihiko.odaki@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:43:44 +0100
Message-ID: <CAFEAcA9_+o7FZcuA1xojECD2zMUt3rJQmC+PFPLe20prwLoBRQ@mail.gmail.com>
Subject: Re: [PATCH v4] ui/cocoa: Take refresh rate into account
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 2 Jul 2022 at 15:25, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>
> Retreieve the refresh rate of the display and reflect it with
> dpy_set_ui_info() and update_displaychangelistener(), allowing the
> guest and DisplayChangeListener to consume the information.
>
> The information will be used as a hint how often the display should
> be updated. For example, when we run 30 Hz physical display updates
> it is pointless for the guest to update the screen at 60Hz
> frequency, the guest can spare some work instead.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

