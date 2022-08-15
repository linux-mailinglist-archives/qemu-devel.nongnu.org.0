Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1873C5932D3
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 18:16:03 +0200 (CEST)
Received: from localhost ([::1]:37198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNckz-0003lf-K9
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 12:16:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oNcbf-0005xe-8i
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 12:06:25 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:38716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oNcbd-0003E1-Oc
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 12:06:23 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-3321c2a8d4cso30931497b3.5
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 09:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=xoWc+3HvfaaEHdTuDkEIAs927G8vvlZmq6bZs9vTpVg=;
 b=EUD4fOo3mcb+a15zYnzJwTY9L7F51LtpX967wVadmQqqVvqF/yNjEsof9vn0T7XkFP
 aRZLI5jstof3skgvbrbxUBnIIYKoJwuINbCBPPzT7qmv1w5vgvx/M6wIfvCEXTPjq2FQ
 hudtnQSIQvKJa2rbIMZIfqsLuzny6ssFiP2Uq0O6X3TanBa5AzkWhe0Q2rQErWp350Tx
 VeEVr5RnkfXv+QGGBvurb13HAP57ORmdD2KWr0q0jO4UovQvSr3eprFWZfzyI0s6YAzd
 5xJdYi1kIq6qHvH/3eFa7N+i9NMsEBzFkPNmrgOC2+3LmRQLzQKXAxb02gkn4cDOmFdG
 LsmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=xoWc+3HvfaaEHdTuDkEIAs927G8vvlZmq6bZs9vTpVg=;
 b=actfNJrD7wdWXB3m4ndoNTrkrtvWs3+8N/xDWp51x07/bahN2SCxP2supQXhUOb93t
 4xg7fldz9wQZjX5hjkygggpCN+00y0Rn2MsT5AcCryaVDi9XMWx91VCMXlhtwb3Mx8J9
 yxI/VK39EeGZwG9NK/HkF7OrjI7YHlyfmTyD9Igtxg5tKlBRIX+GAXlJxiHMpXT71TOW
 4f6j8D397lbOL4JVemRGNknDip2/6SC394Awn+OPCnJFj4+GxUJN4vrH3NrrGCRkQbXh
 icD3DoIlCD1s+eUW8DE1a9y16UY1DQ9Q1q9ZgjqfrDZUuUoSeb+GVb5T3AHVUoa6KL9i
 hbpA==
X-Gm-Message-State: ACgBeo0Of8dlp0CTO6/P09mKuIXumMkygvn2Po8jCZtBGiTW66LOWyeh
 u41JZq/zfsSsnyLbPHHTR2p/aSLe/MnycafNVufeww==
X-Google-Smtp-Source: AA6agR6GRp6p3fmcDw8BB1fJUC3wkBLzKD0qDGNvcFnzF+FZxVrXDPKCE5vjWheQoDDvJb+rPYZJREV8RIF8dzloJBk=
X-Received: by 2002:a25:55c2:0:b0:684:4159:38f4 with SMTP id
 j185-20020a2555c2000000b00684415938f4mr9170180ybb.288.1660579580445; Mon, 15
 Aug 2022 09:06:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAEcBaE1DOVtq+D1jh42ZO01guWo_zVRbFWoAOigpD2xm0YPSKQ@mail.gmail.com>
In-Reply-To: <CAEcBaE1DOVtq+D1jh42ZO01guWo_zVRbFWoAOigpD2xm0YPSKQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Aug 2022 17:05:39 +0100
Message-ID: <CAFEAcA9+UmPzjDeFQDEbq3DW_t-zUHeZaA-eY6S8baT0ko7uwg@mail.gmail.com>
Subject: Re: Bluetooth support in QEMU
To: vaishu venkat <vaishu071998@gmail.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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

On Mon, 15 Aug 2022 at 16:53, vaishu venkat <vaishu071998@gmail.com> wrote:
>
> Hi team,
>             We are currently required to use QEMU for virtualization of customized application. The application requires Bluetooth and Wi-fi support, as observed below warning,
> qemu-system-aarch64: -bt hci,host: warning: The bluetooth subsystem is deprecated and will be removed soon. If the bluetooth subsystem is still useful for you, please send a mail to qemu-devel@nongnu.org with your usecase.
>
>  Could you please help us with the support of bluetooth in QEMU.

You're rather late... Bluetooth was deprecated in 2018 for
QEMU v3.1 (hence that warning message), and was subsequently
removed entirely for QEMU v5.0, released in 2020.

The code in QEMU was, as far as we could tell at the time,
basically unused, unmaintained and also broken. It isn't
coming back, I'm afraid.

Do you have an existing application that runs and works with
the bluetooth functionality on the QEMU version you have,
or are you instead trying to get it working as a new thing?
If the former, the answer is "just keep using that old QEMU".
If the latter, the answer is "it never really worked anyway,
so don't bother trying".

thanks
-- PMM

