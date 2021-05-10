Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6245F3790DA
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 16:33:15 +0200 (CEST)
Received: from localhost ([::1]:44250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg6y9-0000kx-V8
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 10:33:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg6w8-0008TQ-Cb
 for qemu-devel@nongnu.org; Mon, 10 May 2021 10:31:08 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:33487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg6w6-0004IL-Gz
 for qemu-devel@nongnu.org; Mon, 10 May 2021 10:31:08 -0400
Received: by mail-ed1-x52a.google.com with SMTP id b17so18989946ede.0
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 07:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WIzFAHthcyQ157TEmCWw9Yq0FBIQGdGKI3hoHcj7nC8=;
 b=uGtw4x/TXrughOo3M+8Ve8yLlDRTQgEm4hiVe6Vsf7NePWOBkmKLXmlTkOuDVaURBM
 Y8AdBSPP5cK23dMcaARmUQ0gO/wEn4dJoVpyjelokZjs7KgKVysnmFyxtU+jLwbdIN2g
 gfORLtodhzzmeLyrjm7hm3y+gZ4f4MQ9n2ktgM7nUCNdFTuoWGC7rGcNIBbiFqFKd8pD
 uvvBovKeWIrFNtUEQUQXcbSo+dr8gQR/j59/WtdOGb9A8kP946zxPt/K28N35Py2cfnS
 /VC7SfmH2UAyruaUL2RUdwq9t6/nFOuB+13T0UxHeafJr+NTHBlH9bJBCIxcSRB42iOu
 xDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WIzFAHthcyQ157TEmCWw9Yq0FBIQGdGKI3hoHcj7nC8=;
 b=eMcJ7Jfga1b0FkHbJ/SofagwVMQ5nUK6rZ3Dr5uLiBluu4Ddif6ntxQAeXw9k4pQ94
 khhd4w5E5/0kTLZlX/hkV641HlLS97P0+zMPAYzeZL7ggDQROPxacO8ssLapTtlCkKwx
 A/3LtTOnNctw+gnEx0FkZ8RUnUmzmprMxbtsBzJkMXWVtevilz1qGAfdYkZokl6CSk7Z
 crHromIt1WoYWD3XaCioxqB1tN/j5BqMAD154Z61VXn8zf6cqvBIWa1zDvTwcjr99zSa
 mKxu1k8Um6omhPlWLsTGud5aYEBASMWR8VlG+TGdAuCyP4r+eDSm7jyNtg4HAQzyjF0I
 JmDg==
X-Gm-Message-State: AOAM533vQFn5ynX8LrFiT5h99UFg/OJz/rOxQVgCFqNVuSMNWMsvCUJB
 cIxRd8Vog1HcZmks8AC2hulDxGoESD3s4TmSzKG6Mg==
X-Google-Smtp-Source: ABdhPJy4S+UKCsDQytO2sVlw5AsjMwdRTNLrIQWfTsg7DntYq+FJRvajoF0Q4BHGZRFawAXdZQesz1FZXeyTZ7oqIYk=
X-Received: by 2002:a05:6402:416:: with SMTP id
 q22mr29937049edv.204.1620657064527; 
 Mon, 10 May 2021 07:31:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210505073538.11438-1-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20210505073538.11438-1-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 May 2021 15:29:52 +0100
Message-ID: <CAFEAcA9a5Vyc5MoTJ1Oqq3j6YzPJp-367npeDfV5EVOogqfRuw@mail.gmail.com>
Subject: Re: [PULL 00/10] qemu-sparc queue 20210505
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 5 May 2021 at 08:35, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> The following changes since commit 3e13d8e34b53d8f9a3421a816ccfbdc5fa874e=
98:
>
>   Merge remote-tracking branch 'remotes/bsdimp/tags/pull-bsd-user-2021043=
0' into staging (2021-05-04 10:58:56 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/mcayland/qemu.git tags/qemu-sparc-20210505
>
> for you to fetch changes up to 10fb1340b161682d64320a5976f88f68472410bf:
>
>   hw/sparc*: Move cpu_check_irqs() to target/sparc/ (2021-05-04 22:45:53 =
+0100)
>
> ----------------------------------------------------------------
> qemu-sparc queue
>
> ----------------------------------------------------------------
> Philippe Mathieu-Daud=C3=A9 (10):
>       hw/sparc/sun4m: Have sun4m machines inherit new TYPE_SUN4M_MACHINE
>       hw/sparc/sun4m: Introduce Sun4mMachineClass
>       hw/sparc/sun4m: Factor out sun4m_machine_class_init()
>       hw/sparc/sun4m: Register machine types in sun4m_machine_types[]
>       hw/sparc/sun4m: Fix code style for checkpatch.pl
>       hw/sparc/sun4m: Move each sun4m_hwdef definition in its class_init
>       hw/sparc: Allow building without the leon3 machine
>       hw/sparc64: Remove unused "hw/char/serial.h" header
>       hw/sparc64: Fix code style for checkpatch.pl
>       hw/sparc*: Move cpu_check_irqs() to target/sparc/


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

