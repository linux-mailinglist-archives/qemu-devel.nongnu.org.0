Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB1A5657C3
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 15:48:39 +0200 (CEST)
Received: from localhost ([::1]:44024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8MRK-0005oV-Tl
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 09:48:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M54-0002hF-Bd
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:25:44 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:35683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M52-0003bt-NV
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:25:37 -0400
Received: by mail-yb1-xb35.google.com with SMTP id e69so10310002ybh.2
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eFAC+mzOTYHVl9WIcM4TJ3uGeKx6eFDgptHH7xMsRFU=;
 b=x0ISb5oZu5lscqDQVMCHOuaaK3EAsxmnAR7Z79cgOSl4le4q2rwUZF5vp1KvidLuo/
 aP6zQhAyKVB6aLEb0NtEdo1T7yB/6nRtu38MgHnrH3w38yO6BxZsRAGUjOpJxlGTo90i
 ZqJ4gOhTw01zKFXyie0VMwAnBSonfvrXqpmcNJ15VaIhkePC18MwQ12ernXcy9e2yZF1
 O8drHdzV2KtllQsbu+Lvwc33pwrHLcxS/wnGnqqrmIOoupmd6GUqcEaVUDL2pWbvhZFP
 dOCEWzXV1WvuNXqQX8Xf0tjKRuFye8F3vBcncNbi7/gcEUc4kGpKI4ZsgmLgDGRm/s5W
 OQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eFAC+mzOTYHVl9WIcM4TJ3uGeKx6eFDgptHH7xMsRFU=;
 b=R41ChWxEyAY9va9ZvbPhpmC5RUpjv4RCe3Z8wQaP/V1FsR6wG9IKv0z591WhVbr35G
 Ye6ejQ3LdICHrsPSHF1tZuI7aQJcCc8OWSlfVwazzH3CBM+wG9SxnYw1wfOVSxyWcxjK
 C/KCO5nO+g9OzB3q4aIwUoniw1DmoZ7qefckQRXYVlppRcYF4HCI721rvkFYLO4mHNF+
 KZ/u4Nd8EHRKrp96kTvwvlNN1P5snV+GXAk6wBi6IN3O4kQY00Ddja7VaUF9TRGryB3h
 5hbcDJFTiDgTHJo+GfJcVCnQBHEjVWvcVy/Ua+Xd5+yFzrE7vD9myemtpStEdivxSs0W
 1YKQ==
X-Gm-Message-State: AJIora+/V8pOFdlKzol7IrIwu6AJg03vLRaw3zx+Xvo/rZk54VDkrDpm
 Ou4BbhsMXaH22bU8ceXlJwKbG3qQotUt9lVDfe7qdQ==
X-Google-Smtp-Source: AGRyM1t/5Ge039aJEetVQMZAqDNmS5bfRqts4wAOJ1Feu3rf2NYvwLjZlRNs7nLBHdCH0ojERgG7xB99J3SZEvkjL3M=
X-Received: by 2002:a5b:dd2:0:b0:668:fc4a:9403 with SMTP id
 t18-20020a5b0dd2000000b00668fc4a9403mr30450312ybr.39.1656941134989; Mon, 04
 Jul 2022 06:25:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-22-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-22-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:25:24 +0100
Message-ID: <CAFEAcA9=8tNR1Li0XykFWYtFbwY_XOcLyr6FGUCR=Q+8orBODA@mail.gmail.com>
Subject: Re: [PATCH 21/40] lasips2: introduce lasips2_kbd_port_class_init()
 and lasips2_kbd_port_realize()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
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

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Introduce a new lasips2_kbd_port_class_init() function which uses a new
> lasips2_kbd_port_realize() function to initialise the PS2 keyboard device.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

