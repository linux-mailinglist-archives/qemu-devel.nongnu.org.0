Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E068359E67B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 18:03:17 +0200 (CEST)
Received: from localhost ([::1]:51922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQWN2-00027u-IH
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 12:03:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQWHS-0005kT-4S
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 11:57:30 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:34649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQWHQ-0005UQ-9D
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 11:57:29 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-333b049f231so391555267b3.1
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 08:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=MMpkrV42wTuwz45N8c9G4lFfXbFhdbHicXanxxXtdJ0=;
 b=yG444jg50Bwiw5wTd7dIoow1fQID8MfvG+y4iJHBtH4OkWjYatZnYxx15SCumszJYJ
 e3p0yECqwZ6UftvjvcJenW+kns7R6OU+ut4dLDETKrter+ACFLMBKRogIQKt43AdpCM2
 YwpWBC/4i/VL00J06eOrrMONP6OpyLg7lKgfz6ilYUWeZmb+Vel6Ne/Pkd5a64V/MQRg
 nIECOmcgdrSxZC370W23tNEehigQ4VuslKPrmdVeWF4d6NWzZGFRrWA9+1RH5sTrQwO6
 eCuLoaFMe1AmGYwk396oxh4Sjcw/enqtI/hXH1s3UAjeNFS1MFGwz8yJzx3om5fnQcg1
 PKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=MMpkrV42wTuwz45N8c9G4lFfXbFhdbHicXanxxXtdJ0=;
 b=QGUHf1RMfbtuaxkhYlhLeQOmzjB2WAKRe8TQnrtVLMKF2xe0UOJQyZTb63scrWX1eZ
 JdJNpr1oSu9AbKdviFd8GgAddkIuQa7tj/2kiECSEXaWJe5NQY7m7SvbiANL3uNKQSHw
 t8lskKFKMpIzTy3B8ke7iUCrtj7IsTT7KlOcYQ9HMFeF2241V8F/4fE4l/kKY0xQoZOj
 2yClzab0czI1Oq+vC4/3Wuk5aE4kBGXK8vM3WbFnY4RQQ4xUeqa9/zM5VH8CkNjzRda5
 dguCMUA5GnmAjTr2fM9CvbpbkNEhPrgyn85MW/I1YoIkHOdC9hNjDEIAjDFP1BgO9/Hn
 OCkg==
X-Gm-Message-State: ACgBeo1DhmzKy7WE/mrhTEiFGXn/clbBeDSSmu1U4NSSOGqlRVj58LAK
 Zu+7zFXZlEY/v79yyp9FeIwmPqVywx8gc+8sN8rHqQ==
X-Google-Smtp-Source: AA6agR76zbuuPHE9GH7XVM/Lk16UogWYfyIvySvIFsKiHRqaaMdGXMN22icqbTDRdZODCsHM5KLlc1WeO1V0ciGCY0g=
X-Received: by 2002:a5b:7c6:0:b0:670:6ba6:d046 with SMTP id
 t6-20020a5b07c6000000b006706ba6d046mr24261447ybq.140.1661270246984; Tue, 23
 Aug 2022 08:57:26 -0700 (PDT)
MIME-Version: 1.0
References: <9bb3ec5d407a5278524d54d7ad53db830b35a74c.1661260622.git.quic_mathbern@quicinc.com>
In-Reply-To: <9bb3ec5d407a5278524d54d7ad53db830b35a74c.1661260622.git.quic_mathbern@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Aug 2022 16:56:45 +0100
Message-ID: <CAFEAcA9NPBS_dGuNL953iwi1Md-1Au2+GZ5A+NNJvBeMP5-gVQ@mail.gmail.com>
Subject: Re: [PATCH] gdbstub: only send stop-reply upon request
To: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org, f4bug@amsat.org
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

On Tue, 23 Aug 2022 at 16:07, Matheus Tavares Bernardino
<quic_mathbern@quicinc.com> wrote:
>
> The GDB remote serial protocol[1] specifies that the communication
> between GDB and the stub is driven by GDB:
>
>     The host (GDB) sends commands, and the target (the debugging
>     stub incorporated in your program) sends a response.
>
> This is further emphasized by Embecosm's "Howto: GDB Remote Serial
> Protocol" document[2], which says:
>
>     This is the only circumstance under which the server sends a
>     packet: in reply to a packet from the client requiring a
>     response.

That document is 14 years old and is not a reliable reference
for the protocol today...

In particular,
https://sourceware.org/gdb/download/onlinedocs/gdb/Notification-Packets.html
says:
"The GDB remote serial protocol includes notifications, packets that
require no acknowledgment. Both the GDB and the stub may send
notifications (although the only notifications defined at present
are sent by the stub)."

That said, the thing we're sending here isn't a notification, so
it's not like we're in compliance with the protocol. So I guess
I'm just saying the commit message could be improved.

(The notification mechanism does allow notification of "we just
stopped" if the stub implements non-stop mode, but we don't and
it would be a real pain to try, so that's a bit of a red herring.)

thanks
-- PMM

