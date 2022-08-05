Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E6258AE87
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 18:57:28 +0200 (CEST)
Received: from localhost ([::1]:45552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oK0dc-0002qW-2R
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 12:57:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oK0c9-0001Ep-5c
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 12:55:57 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:38726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oK0c3-0006zc-Ti
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 12:55:56 -0400
Received: by mail-yb1-xb33.google.com with SMTP id i62so4668578yba.5
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 09:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=GIeZH2tQpbt489gA2BHIGPnaWHb7rrX6ryd3A8bTZPc=;
 b=lZV9B0R50uhzH/T3vmdqaYe5oGW6lfGMgzVqgSs36M8iCzlgnzDhvKLNlLDMmrSr87
 aBDhzaZVeGbuFaxPBLcXyORDQS3xNnTw1D7UxzeBkPD3pesM8K87NBtHQ5+SIjLvcq4B
 ++kziGlRtC4c5VpA8bWSpc3XUAHVvZY4jIIAbwRh1Xj5BsyOOOGz4VVl3MZE9MLej49B
 hWbQMeSA4beMh9Nj5hMsrKsmki/GlxweZ2XuA7BCGcXDv/dowZZHA+D2oK2D7z+28SFm
 EhFiqE2vpmmfBpwF5Jz5Ap+TT+n4SnwD8hiUCo0CGJsIJ72G7/4Ka3TS5dyAP0J0wz1L
 w/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=GIeZH2tQpbt489gA2BHIGPnaWHb7rrX6ryd3A8bTZPc=;
 b=mIo+osBhbWa9BWc+skYWyX4LeWh22RK/cHCxZUzyTeKWW3uAA3oOfOh7RRF9/0X+h3
 dsvKPizuCGjpQ45lWESYnynGI1rBfvoQbiRbW4ylO01lxbbRHISkMlYap3cbhfwe4VAj
 3+0kp9RDUk6Ya447rnSAsuwERpL1Cr6sIp0CvfjQjocIoiDIzgIA92bbaC+Mg5D6SyKs
 1XwCJLwiOUJBXfYVugNhNR4xaHQwMhMFR/RTiJfs7GohR0+U1+sUg3h7Al5ifqzYIYcs
 TOOPjY6HzE9k0Fl+wm07Olox4lUtXF5ppQ2VXLA4aPVFV9AqVnu3xuovZexj7OMUAxyk
 2APQ==
X-Gm-Message-State: ACgBeo1f59Rn7jEK5VRYH++5harZwQAzlD0k8M5iH6WIjvqu30Hwjq2Q
 I9N/8yj3OXClhWdYkd0FFLqCyZNoxw9PISk8BkYimQ==
X-Google-Smtp-Source: AA6agR4/M9NPAM65EEeAWudcLsYBF0Qan7xqc8Lj2QP5CaAk0Z+3JWwZBfd96PU14vpga5z6wzn4QDIat5D9wzNNVTs=
X-Received: by 2002:a25:d617:0:b0:671:79bd:69bf with SMTP id
 n23-20020a25d617000000b0067179bd69bfmr6224372ybg.85.1659718548750; Fri, 05
 Aug 2022 09:55:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220803132844.2370514-1-clg@kaod.org>
 <20220803132844.2370514-13-clg@kaod.org>
 <973576c1-deb8-3973-34e7-d038ca2200c2@gmail.com>
 <4885e6d0-8fff-4712-d032-c5afcac79ff7@kaod.org>
 <7b97e54b-4d80-6db9-af33-40a539827ddd@eik.bme.hu>
 <3b1bc6c5-a363-0a42-f0dc-eafc14376fe2@kaod.org>
 <1e6be2f3-4c7a-2432-5034-fa012c662df@eik.bme.hu>
 <7ecefd72-b799-8a8c-51fd-28730a12ebf1@kaod.org>
 <a3c2da20-c161-a6d2-6ed1-c0954991eff5@eik.bme.hu>
 <CAFEAcA-au_h+B05HriBQcGh9hsvmzksuHisqAx4cqGKAY8+8Dg@mail.gmail.com>
 <18dcac8a-d5e8-b6e-b9b-838cb1badb7@eik.bme.hu>
 <743ea55a-915e-5991-5d7c-ef00ee307ee9@kaod.org>
 <a992199c-b51d-6baa-b91b-4959ec4a46e8@eik.bme.hu>
 <CAFEAcA8qBMUY+an+-i7x2i98iATjMN7m89rGsSwEV90sH-iCdg@mail.gmail.com>
 <ceb063e-b796-a5b1-5bd1-4cd81c5ed2d@eik.bme.hu>
In-Reply-To: <ceb063e-b796-a5b1-5bd1-4cd81c5ed2d@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Aug 2022 17:55:37 +0100
Message-ID: <CAFEAcA_eTMV5DKVfe6wdPgbXPTp6aw7FoMjxPratgohMA5F+7Q@mail.gmail.com>
Subject: Re: [PATCH v2 12/20] ppc/ppc405: QOM'ify EBC
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "list@suse.de:PowerPC" <qemu-ppc@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
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

On Fri, 5 Aug 2022 at 17:50, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> This also
> allows to get the cpu without a link with something like:
>
> PPC4XX_MACHINE(current_machine /* or qdev_get_machine() */)->soc.cpu

...and now you have device code that's making assumptions about
the machine and SoC it's in.

Just do this the same standard way we do it elsewhere, please.

thanks
-- PMM

