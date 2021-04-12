Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B171D35C375
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 12:13:32 +0200 (CEST)
Received: from localhost ([::1]:38078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVtZT-00021L-Qb
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 06:13:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVtY3-0001A2-4i
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 06:12:03 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:46936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVtXy-0005dE-Vd
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 06:12:02 -0400
Received: by mail-ej1-x62b.google.com with SMTP id u21so19281953ejo.13
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 03:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MPbCYU/SQDrf/1IaN1D+mG7hmp0BDoP8V9K713/va9w=;
 b=b3CwNVZDlrqnvzDIfvBlmeRkJJLdwTyEWQ1YRfljm24ImzrPKVLdyyzyasoUFFpktq
 Ix5WX47a0xFvcMt/b/tLO1vqqixz6YCVVyw0RQYg8NojjHszamrOTNq/mH7mWw0TJLC6
 oZRRZshK/sIfA4889qacluPP5L/Kplo2zu2ShZrVNgTRD7P4iGc15SAQXeybKL3Iuo1s
 HRMbMEp+ZQUmExXk+5xbEIWR0rUFihnt/JAbM31s6Wkj6UG6gDnYd2efjdXy5MnAenQN
 bn7uGs2e//LEdT0nWx4cMySLhrBJS7NX9BGEu7GY868OAVEYamzwzGZNv4z3CIe2XFsT
 ulpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MPbCYU/SQDrf/1IaN1D+mG7hmp0BDoP8V9K713/va9w=;
 b=Gy6gVsVB2Hk6hh47Y8cxaQF4QLNFDHDDXa2tEZH8eR0hMw5BTuXj/smvSrasjqbLzo
 w8JO/J8xYzckSNxb/08eDSMQc2wNyTglPn+tqOAlTvtF4Pdg+f/BglpdCqTsB0rgus7z
 VVPDND6eFMTTV5RYfVd/7lUtwaF6Zi7Wa7kdXJJMTDGNJ95NQaxUFpglVF00AIKkqWuI
 dy5xoXNwiC2aiti7/Kr4bzzNgbY8x2dGKNeRUHdnCzf1cp3JU6PBQRA2ZpCyJXkEzZZc
 jntBU1Mk/FtentBgUP0/hd6Na1j1NJ/JwLrwMWKgG/j4LgS5Cw4kpDvjGcw5leCdBH+y
 ylzQ==
X-Gm-Message-State: AOAM530tB2ttTa5sHCaeCG0ROlji1oTYXZiihHb4h4IsMfsLLjPbW5B1
 6eCOUPedHTR8D3vnFQXjGr7RBW2zzpM9FTCsUtVi9Q==
X-Google-Smtp-Source: ABdhPJxstbA4pQF5pxbcp+H+eRBH2KCUuEsrD0tSK2MpsvqpD63xZnR2TbV826pkqIl0gpvKTuoEncicWKRDswv4sfs=
X-Received: by 2002:a17:906:1dd3:: with SMTP id
 v19mr26396427ejh.4.1618222316058; 
 Mon, 12 Apr 2021 03:11:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210409062401.2350436-1-f4bug@amsat.org>
 <20210410131932.i6no5tvvaldyomvp@sekoia-pc.home.lmichel.fr>
 <09a63c3e-aa68-0d2d-b447-db9cd84dab09@amsat.org>
 <CAFEAcA9rqx97D_ZN7MzqqJtz9ajFNK=AAeQu9z65+g35SHD_NA@mail.gmail.com>
In-Reply-To: <CAFEAcA9rqx97D_ZN7MzqqJtz9ajFNK=AAeQu9z65+g35SHD_NA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Apr 2021 11:11:11 +0100
Message-ID: <CAFEAcA-5h5ZjXyX6WbdQ8n=pqNSXTHfrt3fQSQzp6EYJY_zXLg@mail.gmail.com>
Subject: Re: [RFC PATCH-for-6.1 0/9] hw/clock: Strengthen machine (non-qdev)
 clock propagation
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 10 Apr 2021 at 16:15, Peter Maydell <peter.maydell@linaro.org> wrote:
> I do wonder if the right fix to that would be to make TYPE_MACHINE
> be a subtype of TYPE_DEVICE, though -- machines not being subtypes
> of device has other annoying effects, like their not having reset
> methods or being able to register vmstate structs.

I wasn't quite right about this -- turns out that machines can
have a reset method, but it is a weird special case method
MachineClass::reset that isn't like device reset. (We use it
in a few machine types; if implemented, it is responsible for
calling qemu_devices_reset() to kick off device reset. Probably
MachineClass ought to implement TYPE_RESETTABLE_INTERFACE
instead.)

thanks
-- PMM

