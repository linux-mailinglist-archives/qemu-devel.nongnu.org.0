Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D5B57D39E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 20:54:26 +0200 (CEST)
Received: from localhost ([::1]:34286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEbJY-00043j-SV
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 14:54:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oEbHd-0001T6-4n
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 14:52:25 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:36797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oEbHb-0004nA-8p
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 14:52:24 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-31e7ca45091so27065007b3.3
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 11:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yLku71WMXtxB/jHp3z7LvApSOOgtePL0FItv/pE8oSQ=;
 b=ReuaPFAmbVbsXWi8uvmQwOX10jhPN3anf1uPmJw0FmqBp+fS4M22cpk1Ff5JXKWuqH
 APVHTD5cC5tQvooDOj+l8ul9SIy3d2Sq/9Vt3fMtVdMbdRk0x0rZ5bU5vBKkqUaYdQKL
 SuqiY39LsEoivzvjSTaWh/98yaORvJ5CYFWR079p1UjFSajOK6Bgc27CiMXO5O5Pm256
 G6thNJlKt3dxs2RcP4PAcWbiyVklsVI2JoWQj5DEg+00FgAOVLf6spvRSB6o94eWPPVE
 oq+KUh5NRXI10aIBZTJWAcJEygRbYhO80i4/Ea8se0Pi7/AW6gTkVTI4ITEoun5Bag9i
 ehcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yLku71WMXtxB/jHp3z7LvApSOOgtePL0FItv/pE8oSQ=;
 b=d1zhY2sp2eHc9WxVnlNWLvnhuqK1pDWdLXHc0tjugNmTOh5nQCnehd5wPg2Krp+p2k
 y84Zq8sQ1/Fdm71ACHuET039l94THVW18MLNTSnetFELeijSXoODcOhWvoN7Ap84/8QD
 eRV+VEfwLQ608sxabnmc5bdW1856DNG9o8Bfykb7AnQWdSAk3wWU7aEYDWvT0cu+jy7Y
 D2QePn7n63XlaOATV4pM9iKtFwDti3DM1XQ5BJg9aIpyTpqjOVW9j0LiRZx0VPOiNiTn
 xtVspRoAWavZVTVqwXb25x7nHU68hN+JR5g1t83biJgGKJ/76gvL1lbp9CAojv+Kj4OR
 bX+A==
X-Gm-Message-State: AJIora+Pblxykr/vz0lVfAwwJSDsaCbF7MQ9R99e3DsVQHFLwRgDnqnm
 CEfiu/Le6lfDVGask2NrY7yrOit1QVAQKbo/nNX78Q==
X-Google-Smtp-Source: AGRyM1vxdrrm18cwNeRCWYdQeJXRHq5KY/YPsuYiYUD8N4zBaGvWFae0N3xmisJhV4HmFvbHdOnJ/gjurALs/XH2MvA=
X-Received: by 2002:a81:8d08:0:b0:317:a4cd:d65d with SMTP id
 d8-20020a818d08000000b00317a4cdd65dmr46534406ywg.329.1658429541930; Thu, 21
 Jul 2022 11:52:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220719075930.315237-1-aik@ozlabs.ru>
 <99d48009-8403-c868-9f04-c14ca8311369@gmail.com>
 <c76cf69e-8f6f-333f-e3fb-72c5f1649705@ozlabs.ru>
 <CAFEAcA8Kma2vGYwS_AwvqvDRiNoeLoS43x2GHtHkAV3QiUJvJQ@mail.gmail.com>
 <CAJSP0QWoeyXrzTTrJZu6OPp1DiuyvrecRMSFdLYLvNufxGwwBQ@mail.gmail.com>
In-Reply-To: <CAJSP0QWoeyXrzTTrJZu6OPp1DiuyvrecRMSFdLYLvNufxGwwBQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Jul 2022 19:51:42 +0100
Message-ID: <CAFEAcA88P5JyqTneiVi6c+ya1Q0A+NkuMjsVx=kj0k_BKa=19w@mail.gmail.com>
Subject: Re: [PULL SUBSYSTEM qemu-pseries] pseries: Update SLOF firmware image
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 qemu-devel <qemu-devel@nongnu.org>, 
 "qemu-ppc@nongnu.org list:PowerPC" <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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

On Thu, 21 Jul 2022 at 19:41, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> The SLOF repo was last synced automatically 6 days ago. I'm unable to
> start a new sync operation and maybe the current one is stuck (the web
> interface claims the sync is currently updating...).
>
> Peter: are you able to fetch https://github.com/aik/SLOF and push to
> https://gitlab.com/qemu-project/SLOF to manually sync the repo?

End-of-week for me, but I can look at it on Monday...

thanks
-- PMM

