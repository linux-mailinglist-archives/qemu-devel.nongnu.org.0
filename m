Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B82972F7E1B
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 15:26:16 +0100 (CET)
Received: from localhost ([::1]:46414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Q3L-0005Ll-MP
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 09:26:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l0Pf2-0001OR-Gx
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 09:01:09 -0500
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:34957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l0Pex-0002ml-TY
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 09:01:08 -0500
Received: by mail-yb1-xb33.google.com with SMTP id 18so5124918ybx.2
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 06:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2woEW4l3eD6eFxp3olgsCG/K7D5oMg2shHgo0/pFSfY=;
 b=kvD0/GQzwpoy9CXkq/C/psZfhrb+X7sCsPdCW3upSAGRCg7e5S5Qxu2mhHXjVOYLcf
 F8K6TEcvJdaearQYyvBXRQwJaWnu+Rf8SmmiZjEon9W4e3Vd02igbQlKVrNaT8NwCyJq
 WipIyFsWO9tSJe7ivGHnURj/KUqTMP7Q28S6sE9OlUrcLU0V0Rk4NUv+9rCQmA/VsnTn
 0mNy2gNdzR2NlltGSqrQOQISPht4w9wLoZU1qTrPcWr1PqsWADCLtkOcPauNWSDKUTnF
 soqx0MBnVvjaIrFCgE3+/477zKc6DZ+iKh64AuNcrJhQIzk37BfFSid0zlTvWUVmsHFj
 Oe+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2woEW4l3eD6eFxp3olgsCG/K7D5oMg2shHgo0/pFSfY=;
 b=Hxl6G8W5eCdJUXnCrdoNBUqEYxmRp0G0N6ZMPLeLEw6rBhh3fu+hDP4LAUa9xTotIo
 o8ny+Vt0mRjZDQnmhtHbzKnIfk2IQTsoTuOtg00YbxpyZWHxklFT2HYLjkd/TicCrxQn
 Z1aOauDHElUNSJS94NMzd16QFw6wYLtQYl44oumTNnUdBZfjXgJKZ1lISybyCSafgcKm
 m96bnUXU+AXkgWNkF7e9TJAYJbUgn8qdNmwQJUJIhQ9nv9jhjDwk/7YYFarIGFysWoTJ
 vjLjttUm3bBCuwvMG+UvOUUX5yJOAPOIQxg8oR7bMTDf3/DyoKtS0RrWtJdKfeIYFkTl
 JRfw==
X-Gm-Message-State: AOAM531CefSrUEASSzMpamDrUga6pFKeizmT3ePK44vJE/ElyfrW01l0
 peJZebYtRxL4RnDvlwIUoA0rBdriwn+/5Tbcl1Y=
X-Google-Smtp-Source: ABdhPJx7a7WqDIFoLVyEGuPJji885ZPCtFx50xpfUi+45IAMLMrY/VWfpvqxqw2j6Il9urLHqhclOk4fUwRGY9C03tE=
X-Received: by 2002:a05:6902:210:: with SMTP id
 j16mr18945768ybs.122.1610719261656; 
 Fri, 15 Jan 2021 06:01:01 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA9GKLz67ybf6MO2naukmqB3PNHhe0wEgxE290ojryEJ2w@mail.gmail.com>
In-Reply-To: <CAFEAcA9GKLz67ybf6MO2naukmqB3PNHhe0wEgxE290ojryEJ2w@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 15 Jan 2021 22:00:50 +0800
Message-ID: <CAEUhbmXmc-ntNSrZSrBbD7MKgwyBR1U3fED-o5sTSOtih6P29A@mail.gmail.com>
Subject: Re: QEMU 6.0 release schedule proposal
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb33.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 15, 2021 at 9:52 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Hi; I've filled in some proposed dates for the 6.0 release cycle
> on the wiki page:
> https://wiki.qemu.org/Planning/6.0#Release_Schedule
>
> Summary:
>  * softfreeze: Tues 16 Mar
>  * Hardfreeze/rc0: 23 Mar
>  * rc1/2/3: 30 Mar/4 Apr/13 Apr
>  * release: Tues 20 Apr, or 27th if we needed an rc4
>
> (Easter weekend this year is the 2nd-5th April.)
>
> Any objections/alternatives?

Looks good to me. Thanks!

Regards,
Bin

