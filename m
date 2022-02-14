Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE214B4C94
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 11:46:27 +0100 (CET)
Received: from localhost ([::1]:42650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJYsE-0001bu-C8
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 05:46:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nJYpf-0008S9-NP
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 05:43:47 -0500
Received: from [2a00:1450:4864:20::432] (port=40958
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nJYpd-0001L2-Fb
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 05:43:47 -0500
Received: by mail-wr1-x432.google.com with SMTP id j26so15232150wrb.7
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 02:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fAwQVllNV5REZ4fzUCZkGXQqHEDF3X80TRKMBRFFhW8=;
 b=jeMJhL8P1X74MCOHJutC+SJKEG6Q1pCWtJyPj1zkIRR/dbRwRZLxUInT0wx8X6tTyC
 QgOXzstGHIglNAGGqtETq6wCnv4HJsqB9SyiTeUGGFlTdCdDPWpNL//Kcmy6eCmzTHcx
 BSE8mimSawPUz8/7Is+46jG3BOY17fPUSuygw/UjR0CDEVjpEG/lDLGf/7dvOT8wXJ4N
 lzG3qlJn8AR1A2m8+lF93zSlH6egB4ioK9QGVVGHOHdON7LImC/yg8FqibGMxJdcfFul
 wcMRkQrG9D7eb0dsextSWktjb/WX5WPdZxFUHlz7mjjdMrJb0CSyjv5bWJ3mewE+2x+G
 KcxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fAwQVllNV5REZ4fzUCZkGXQqHEDF3X80TRKMBRFFhW8=;
 b=A8hQe1yWjIHdTKrcuhWeifC/eXPkapfAIICMZXXnjZU4S8x5Xos20UzF09mveKo4C/
 t+j/Rcx8bL5ciVCu96oXF3k7hfgfFHzhHDyFgfTdZb7xTJBqTz6AjFpU2KHP16GLwWZa
 s9UY9q4505pNbvixY5VBR8MvtANVq2pdtlXZkSu7q72oI08tVAnAAWPibDSKvdyj3HGQ
 dJa9Qc6F5KuIbfYbcppN27Jz2RVWigVpv7q6rjJujASK1uPuFJDwgEEIdY3CaKlkrs0L
 NFgqI6GlXGdp2ddLlhRn50ATlU3bkjHGPM+aBP1fYkBm//+si6kccU8aLTv4N9rWzyp1
 QqTw==
X-Gm-Message-State: AOAM531n7ODUw53nDny7M0pMlagtp/v1Wq8YkwmMVGMfwodftTLU38aL
 ZrTsirx8ADOtOtXK/hbOlT51wahNBaXNNwEfIuhS6Q==
X-Google-Smtp-Source: ABdhPJxLbNQXtIyZKEy26GQ41q8HYv/Zsw0O1lqxjqvI8pRHB6NFOGhOKINAPpD6Jf0DE2g9qwuMYzu0+qMdyqhPN6o=
X-Received: by 2002:a5d:4ac7:: with SMTP id y7mr11041703wrs.521.1644835423344; 
 Mon, 14 Feb 2022 02:43:43 -0800 (PST)
MIME-Version: 1.0
References: <20210616141910.54188-1-akihiko.odaki@gmail.com>
 <CAFEAcA8LFt5NpsVTE1dYpA3rW0RsjS1Nf9Q3iS307kaHjVS=1g@mail.gmail.com>
 <20220214102704.fjnb4v55l6tcjajk@sirius.home.kraxel.org>
In-Reply-To: <20220214102704.fjnb4v55l6tcjajk@sirius.home.kraxel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Feb 2022 10:43:32 +0000
Message-ID: <CAFEAcA_P19jbTLOtBGgNPZUaP8aGTsOWHnyH6RcpdMTD=WnHpw@mail.gmail.com>
Subject: Re: [PATCH] ui/cocoa: Set UI information
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.785, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Feb 2022 at 10:27, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> > (2) A question for Gerd:
> > Is it safe to call dpy_set_ui_info() from a non-QEMU-main-thread?
>
> No.

Is it OK to do so if the other thread is holding the iothread lock?
(This is how we do a lot of the other "need to call a QEMU function"
work from the cocoa UI thread.)

thanks
-- PMM

