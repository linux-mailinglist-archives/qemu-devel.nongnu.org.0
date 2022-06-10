Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D89546384
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 12:25:55 +0200 (CEST)
Received: from localhost ([::1]:48700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzbpZ-0003F5-52
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 06:25:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzaV0-0002n4-BI
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 05:00:12 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:43904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzaUx-0006fa-S3
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 05:00:09 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id l204so45922844ybf.10
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 02:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vYEC5ssCzCQq9KjzSHR4k5vVe2Of/Di9diaFlvbgsak=;
 b=XYqjTsP7Jj7qYqk7eTsvF8iimrf7UbPr4R5BW/S9U3y499Jbka8js9r493CFBqOOSw
 zX8VOX+i+p6Qy83LOMKsTfUbFtN32wBkq+iwHtRZ5Y5QtrhLg1bJFy6BydWv75zXZSJ+
 YM0547jySLteJxW+eAfeihlu6ejBtMZDxpm7KPyD4VmJvv0pQW2n8J46kwLWOe+ZTfte
 Gn+y11H/iPwF9XseNs4AvHqVZ32YLMW1EjnfbC08iGnIrvU673B/EzoqkQKfwSGvZ6S9
 wivXJJJKdTBvBD5Q/OuaSxy5opSpqcRAYnpwiH/MsRkeW6AFAu9VRdruWP6MNfGL+/se
 o5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vYEC5ssCzCQq9KjzSHR4k5vVe2Of/Di9diaFlvbgsak=;
 b=MjrR/W8WDnjd9HNE2sEFU1hrfwyULTDKwwDXtpuMSPBS7j+AidQvTw/PL3+ohN7o0O
 Gvr4FJk24fStYC84bRi6r4CHxPQfRTE9ixu1tOjU3K9T4BiBjwDaF3Dd22MhYwLznHRe
 t6BQT9AWu/5xz6tPXzU2xd5TANME4CioFWujo6KXVK0EM99PbTpMky5wJrQqcrqeGO+4
 zIM4p2bITqwaT6fwTm8AvydxaaX/z5W2oVLmtcoA1faMuS2Xp+GV+nv74n9q96PudmeP
 vt13bwv2OaIVyAHhzyS3OUdssXV9MABK03CpCOH2EIOnFWLwAwXv12Ej6vlO2Q3MhNns
 r0WQ==
X-Gm-Message-State: AOAM53095tZKbTIVAV6NOBRVSxIN+OJUIRI8cK47mIAQl9PvXukX7s/Y
 8JXed4fNBx32gO2Fx9/8/TyBSLkZvUA5ZuHMBbil9A==
X-Google-Smtp-Source: ABdhPJz1EXU+8e9TK9fjYJcYMVo6aV56k0bFjdSTZrRlqtTWo/V9mH3WsF30w3VBgRaHeBNqfLE14Q/7n+/8SBKttfs=
X-Received: by 2002:a25:b94:0:b0:663:e6e7:c5 with SMTP id
 142-20020a250b94000000b00663e6e700c5mr15565573ybl.85.1654851606578; 
 Fri, 10 Jun 2022 02:00:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220225174451.192304-1-wuhaotsh@google.com>
 <CAFEAcA8vcRme05raLOhtaxmvbbLhLrSZwEaz1BVk5uUYSdmL6w@mail.gmail.com>
 <CAO=notyz+SjAoomWGubV5pBuc4qSmNdJF5cmMBf7J8DevF9T4A@mail.gmail.com>
 <CAGcCb13k1RtJ7VVhp3goYhUrD61ScWMWrhGuARtuUOH17GozCg@mail.gmail.com>
In-Reply-To: <CAGcCb13k1RtJ7VVhp3goYhUrD61ScWMWrhGuARtuUOH17GozCg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jun 2022 09:59:56 +0100
Message-ID: <CAFEAcA9wmRZWiiZ99UHBOf2QwfoBC3CP_pPu1H_Kmo19UYW6+g@mail.gmail.com>
Subject: Re: [PATCH v5] tests/qtest: add qtests for npcm7xx sdhci
To: Hao Wu <wuhaotsh@google.com>
Cc: Patrick Venture <venture@google.com>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, Chris Rauer <crauer@google.com>, 
 Shengtan Mao <stmao@google.com>, John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
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

On Thu, 9 Jun 2022 at 22:26, Hao Wu <wuhaotsh@google.com> wrote:
>
> Hi,
>
> We did some experiments on this issue. It looks like the image size restriction is in firmware. So in qtest we can make it
> much smaller (e.g. 1MB) and the test still passes. We can send a patch with this change if necessary.

Yes, please send a patch.

thanks
-- PMM

