Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C59D3D0C77
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:35:31 +0200 (CEST)
Received: from localhost ([::1]:39922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69Za-0006OL-G8
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:35:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m69Bt-0000LX-VY
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 06:11:02 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:42884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m69Br-0004x4-TP
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 06:11:01 -0400
Received: by mail-ed1-x529.google.com with SMTP id k27so1684670edk.9
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 03:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=goGGV9LuCZ/Wvpog24Mtk7jQMJ/SBlsaR9taa6opg3A=;
 b=vz0/OX9os+mkyzaCUptWLPiVnx7xIMUiHcCpuS/lxkIk+ycVR721i3qDINbRHqFQOS
 +lbYpRDGM3Ro3jUjR1JBjymg0Tfu82pR+VcS0/S1WnZz+o6xt3tw76d6gLmteUarHSkS
 cJBpzGG7EUANvg/RAcf8dJon5HMjSTipuH+GVYkYE7DAr9huZ/BKOe0rAGMSAbIhY7SP
 T6pDM7AK6iUE+lE5ecwj1M28cQy0MwWJP3onPB8kSRqNLMKKfDf80cLdnrqZ05B0pn9T
 6xzmf5kNHgEN6w7fsWxMnPKzV6ybfqM/SrhdkJ0Ek3TCzN807QqE/RDM3wtB7UvOKxIN
 G/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=goGGV9LuCZ/Wvpog24Mtk7jQMJ/SBlsaR9taa6opg3A=;
 b=fuZ2bsOUKsuYJtmEmSb4pRLiq3lusRh1xyWn0jSW10LOFeS+WEAbTSrNbapEhmFuD5
 C0+c1hmIEuWsRdsaYn4e2mxYLqqTHrsj+8uPFmxpSXpKhn0VeuLw9PaKCWLftTkWF7HP
 aOMc+bXDHYi12NemQqHk4XEGqPHTIUSLDfJt3tfdfyI3PvAIaDruBmAfimx9hjtVm8mP
 II2P0El99SPDBkpXfSr3kTix1MUkBQ0g2Cx2mAso2MrVPfYbr/td9UKqOkcxBsV6wE9n
 xuIg/nt26NxaqerGnIhl21tv5gKZ5niaeXD5uZJgj/P7Afuebybv+t/Fo9XBWzcdEwQp
 B62Q==
X-Gm-Message-State: AOAM530qDhlQrZlCk0lNGAlyXdiABnJ/KzZs1O5TwdOKzMj7osak4Yfp
 J/hF6yFSTSK9fuCTiCrxT9qj/FmScBbhySiDCeX3Ng==
X-Google-Smtp-Source: ABdhPJyVM7q4WaXsjx+MsFhZu8WBVXP5zbOp2f93J5iOO7jkkOAwIZd2fmfSlEwRVP8vxnl8CE6UzP5ME7Ag8chh0Ns=
X-Received: by 2002:a05:6402:35c7:: with SMTP id
 z7mr47498275edc.36.1626862258053; 
 Wed, 21 Jul 2021 03:10:58 -0700 (PDT)
MIME-Version: 1.0
References: <1626824220-19415-1-git-send-email-ishii.shuuichir@fujitsu.com>
In-Reply-To: <1626824220-19415-1-git-send-email-ishii.shuuichir@fujitsu.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 21 Jul 2021 11:10:17 +0100
Message-ID: <CAFEAcA98FSBzQOWfhsS6JwErFaGQosWg5rw4=7=stPYCSzWYbQ@mail.gmail.com>
Subject: Re: [PATCH] This is a test mail
To: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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

On Wed, 21 Jul 2021 at 00:53, Shuuichirou Ishii
<ishii.shuuichir@fujitsu.com> wrote:
>
> This is a test mail to check the behavior of my mail
> because it is not listed in the ML of qemu-devel.
> I may send several test mails.
>
> I apologize and thank you for your patience.
>
> Shuuichirou Ishii (1):
>   This is a test mail to check the behavior of my mail because it is not
>     listed in the ML of qemu-devel.     I may send several test mails. I
>     apologize and thank you for your patience.

FWIW, this mail seems to have been accepted by the qemu-arm list:
https://lists.gnu.org/archive/html/qemu-arm/2021-07/msg00341.html
but it didn't get to the qemu-devel list.

-- PMM

