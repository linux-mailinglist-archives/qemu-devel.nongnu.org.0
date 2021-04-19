Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BFD364610
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 16:27:18 +0200 (CEST)
Received: from localhost ([::1]:37650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYUrt-0002C7-LZ
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 10:27:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYUpk-0000Mv-Fb
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 10:25:04 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:44705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYUph-0005x0-MP
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 10:25:04 -0400
Received: by mail-ed1-x52b.google.com with SMTP id z5so4452626edr.11
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 07:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iXXZWAhOOrpJ8BYjcBkRZ0IFA2CqQ4SmTJKguoltUyU=;
 b=yqiQtJlx+9xXKNceGg53yWnBlb1VGkmXdqSn5LB7NVRgXz4dDAnjDqbmNTCQSpF+MT
 JUnd2x/pNe9/JMIhzhPVZOYqTqpb2b7RvTqZi0CzTDxbJYkKgU5hIM4FSGuWtMzRrkpP
 nCNAr6i7h084HaZQacV+cJw5lrzd2bjh93jgzZ3yy8dnEcGuNQlda4MQkFtv1KcvX/mg
 dyAA91DsceIexNDi8JJGzfcPmMcL2s3XJ83oz5iedMPmh10Q95jV6Uq+N5Umqpgc0py1
 PdD4gMGe8YUEnXOqvBdAF0Vv3GwrfOAszLPRhdghCN2g7uvpqsSlpTyrqBgSCVo520Q3
 ELrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iXXZWAhOOrpJ8BYjcBkRZ0IFA2CqQ4SmTJKguoltUyU=;
 b=Y1YQu2nnAb/sddWgUnCWbvC05qvONPP3tFSUbLYlVTli87FAn11VULBds+5kZr+Xvo
 uiIqIU6gXOm/X7q9wpz5Y6WjLyyDTEmIBK+hlJQo72IdPXVkf9Qfyqc+YWrKttiGGEt3
 Di+iLJ99i5kkWkkKj8RKoNszmoNa8rnKefHHrpZ/a7+nxBQMkMcMbcAojqC818L/1UJR
 eJcL96me1sbPKJqPA5vgEUJNWExNlHwxhEJLEF0sojilCUhlfwygOenM6rvAS77l9A5U
 CVxFON7J8ShsiYkxr9hEBkP2JZ3WO5tXBB+ZDqKtXp1z01E0sAZc57ZGamgoD8nkwJ9C
 77iQ==
X-Gm-Message-State: AOAM531Lam36VhICYJazXcY3w8oQ1ttYdYNAszF1HbMAkmslmAgCxzo2
 SLHrKYDrK19IpJT8DH97KJJb4KiLfIz1iaO3QwBN9g==
X-Google-Smtp-Source: ABdhPJwEk9H5GRCBp+v+rRTfTohQoi75W65RfvfYp41PT0COqX85M7DRWUabbdlzO7apexb/pD/AI4DKRuAzFb+0sgY=
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr25943089edt.36.1618842300147; 
 Mon, 19 Apr 2021 07:25:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210409062401.2350436-1-f4bug@amsat.org>
 <20210409062401.2350436-8-f4bug@amsat.org>
In-Reply-To: <20210409062401.2350436-8-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Apr 2021 15:24:08 +0100
Message-ID: <CAFEAcA_-qNzAnEQv3PW2bxNWXxtV5AZRP+mv+vBVJ6dX=nm_XQ@mail.gmail.com>
Subject: Re: [RFC PATCH-for-6.1 7/9] hw/misc/bcm2835_cprman: Feed 'xosc' from
 the board
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Eduardo Habkost <ehabkost@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 9 Apr 2021 at 07:24, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> The XOsc signal isn't a part of the CPRMAN, but comes from a
> crystal oscillator external to the SoC.
>
> Create the oscillator on the board, and propagate it to the
> CPRMAN.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

