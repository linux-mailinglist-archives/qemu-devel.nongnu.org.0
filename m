Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A305612C5F
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 20:07:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opDdw-0003zO-Li; Sun, 30 Oct 2022 15:06:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1opDdr-0003xm-GB
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 15:06:43 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1opDdq-00028o-1E
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 15:06:43 -0400
Received: by mail-yb1-xb31.google.com with SMTP id z192so11658162yba.0
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 12:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rrrRCdzYM9GaieYdplQKq+hnAG6qc0eUbK9TcU5Les4=;
 b=EgZsoMWbE6DPbJdFO8w3jwUMY6fFq/PoKnKNs6P9OTQ0QWU3Wr/Um5fp0gdaDESA0A
 rVgYdSMYWF9Qa0PrTKUOYU/CJQuiE7gGenOM/qnWzRgR/8GFQkiIKKV7dsrefDXiSI2M
 ICdCHWEfDFyQG9Iv06HW8aowbvAH2NA5kNgMtRzHqdwYvM6uC4tkRHrwKg6rlL+IreHf
 RNNZEM7FTDp3y3hiwDuIS+REt3y2L26SyMoyT+0M1dJD7OK13PaBMpJe+UiA7f/o5V4/
 KHNjPmvMA4OQvkh7TroYXHCbdxjeNm7Y1z52sfxugCbOjDH4ZyOqYujN20UfwopxNNYv
 ylIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rrrRCdzYM9GaieYdplQKq+hnAG6qc0eUbK9TcU5Les4=;
 b=69grVtFu5WrJrVgtezXK7cegWjQ3VLu/n6Qmf2ocoycMfx6hXLSxi+wCRTwKKLIHLc
 ZM764rEVrNGohqWFg0SOq4y5LcWpStnzuKBBPtHrSbGpqEqviZhEokq3kzuFJ9OQJIxm
 Xjl9vdPOe+z3wVF5jMTogBbkQvuEUHeB3R7/GnV7gxzKB7eRTC8+tbo4CL7vnRgEErix
 MSzHE3lnSDemafzFRWkW+NqT2RSr2iynUmKzpPileYr0/wf0DHBSfB0KUl6m7X0iYQG0
 bRIqkHxUg5vi8TCZVHupH8dOd1o7yrnQ8NxJICPhXaFCob0Ev/mVio/O2SAKhdUcWMGh
 U9Ew==
X-Gm-Message-State: ACrzQf0V9KezI8++k0+EOWwTRUeis24BNoqFhBq6BR65C7GhWFSFivcp
 V5v7yxYrhTVQ1Y5AuyQk+vkLLnOKUAJEH/QaJG0=
X-Google-Smtp-Source: AMsMyM6Ufm8Dm8x7XliaMy58EiFG41w18YWAc5zwJssRyTv+LiVMNm9WmjXLGKNRzYvM4sXHNMnQxG+2HHtThzsbDeg=
X-Received: by 2002:a25:bfc2:0:b0:6c0:fec7:ae64 with SMTP id
 q2-20020a25bfc2000000b006c0fec7ae64mr8455706ybm.366.1667156800873; Sun, 30
 Oct 2022 12:06:40 -0700 (PDT)
MIME-Version: 1.0
References: <20221026183532.487708-1-armbru@redhat.com>
 <CAJSP0QV0_jwZWU93VKNjycicD8ng2NPczzXmCU4QCNJm+nvB+w@mail.gmail.com>
In-Reply-To: <CAJSP0QV0_jwZWU93VKNjycicD8ng2NPczzXmCU4QCNJm+nvB+w@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Sun, 30 Oct 2022 15:06:29 -0400
Message-ID: <CAJSP0QWGrbtiudJmV1SOd1wvGxQ7Vkv0wmNWP=feRTpHDu=2cg@mail.gmail.com>
Subject: Re: [PULL v2 00/28] QAPI patches patches for 2022-10-25
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When you resend the pull request, please fold in this fix:

diff --cc audio/sndioaudio.c
index 7c45276d36,7c45276d36..6d4386af88
--- a/audio/sndioaudio.c
+++ b/audio/sndioaudio.c
@@@ -333,7 -333,7 +333,7 @@@ static int sndio_init(SndioVoice *self
      unsigned int nch;
      int i, nfds;

--    dev_name = opts->has_dev ? opts->dev : SIO_DEVANY;
++    dev_name = opts->dev ? opts->dev : SIO_DEVANY;
      latency = opts->has_latency ? opts->latency : SNDIO_LATENCY_US;

      /* open the device in non-blocking mode */

