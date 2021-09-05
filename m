Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5357E4010C0
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 18:04:52 +0200 (CEST)
Received: from localhost ([::1]:49096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMudX-0000o9-Ci
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 12:04:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mMubX-0006eA-VZ
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 12:02:47 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:46606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mMubW-0008Le-AY
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 12:02:47 -0400
Received: by mail-yb1-xb30.google.com with SMTP id k65so8447855yba.13
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 09:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8JiFZyWesJ/cnZPHB6nkGV3ej4AEy8eADFUuYkjt8Uw=;
 b=QECPM744GFmBiuQnC5SPUVkrF+xcJnkW2qlrS/xwvzj0QvvsT2B6y/WUJPTgoTRcdT
 NhGvawegM4BUpn49SwquId+lUrEA+MgZNIJo4U2WQcofmNWTLPiPqn97MpTXwNmcAWah
 NaVropDGlyTn/zEx5OLJtACNijOicUkMrMttvwpitetNy2ukDKrVuySHaWHi7k9VlRA4
 arw0luW0WxFbO+tb/EUMza2ise5lbEMdhofdfD6kW8aWOAxetcKK2fprJXR3RFq5tOWh
 +TJHu7HkP4B1RnM40IA5rHg2PVRgUWIEfFRPTxFvvXP3JqeOILEGrzgWs65NgeJ5lbv3
 pnBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8JiFZyWesJ/cnZPHB6nkGV3ej4AEy8eADFUuYkjt8Uw=;
 b=hcE8Q8E9EDajQGMLpAJdwbcZhEOfSJ+Rp7/ZqpJ8Ql6RfYnb+VisDVUBlgCWiRBkHb
 xYJyUm0NToEwTxs3h99Rnll7XSXe+cqyoiOLij6IcanJdXm0r/Vl6OLN2dC4eGGaBGUp
 IivFuyz16D07YL6rWO3lTza9oXEnADiBjN+RKzkckjkH1D8Bpr3n6SsklXaKdT5N8Mw8
 rQyfAzSBYXZGYgr4PypcGld6A3mHZjG1aOGA2V/jaF8mTCFiAtqsWImEBqPzL1KbRd1K
 6w8mr9kR2kRBHaKNIhsSdvJwxbjFhqsudnFz4h6pnnj+cHf0xWMhagSh452KBM5ru5mw
 m7hw==
X-Gm-Message-State: AOAM533N3Pewc0L/pU/B4oaqeQgA7lbar46g+9MjtLQH7RbB2CGeDklv
 CxiK4fe0MK4T7h3c/JFK3aTXRcRn+8MISaH3ZMM=
X-Google-Smtp-Source: ABdhPJz8u1T/JOYKVOHBOHXDh8fMw3Ov43k7Ki294VVIMjWxCCcs++H9qIP8qzFPn6qHkkshs8WcLcI/QjHe1Iy6YNk=
X-Received: by 2002:a05:6902:120a:: with SMTP id
 s10mr9666243ybu.293.1630857765198; 
 Sun, 05 Sep 2021 09:02:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210905000429.1097336-1-f4bug@amsat.org>
In-Reply-To: <20210905000429.1097336-1-f4bug@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 6 Sep 2021 00:02:34 +0800
Message-ID: <CAEUhbmW6f+i825EuX6GFhDZc3XELthdSJW4rrU_AbX8awEo3Nw@mail.gmail.com>
Subject: Re: [PATCH] user: Mark cpu_loop() with noreturn attribute
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Sep 5, 2021 at 8:18 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> cpu_loop() never exits, so mark it with QEMU_NORETURN.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  bsd-user/qemu.h   | 2 +-
>  linux-user/qemu.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

