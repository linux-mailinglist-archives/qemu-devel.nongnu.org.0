Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EB4333117
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 22:40:05 +0100 (CET)
Received: from localhost ([::1]:45316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJk5E-0001Ji-CD
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 16:40:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJjzV-0003Ov-Dh
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 16:34:09 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:33237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJjzT-00053J-Pn
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 16:34:09 -0500
Received: by mail-ej1-x62a.google.com with SMTP id jt13so32028078ejb.0
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 13:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OWJG17x5ZK91ZQJ4hhWL+vEvdO4nyOYczl3xcpjJLak=;
 b=sY5aqqV/d1+mA3njk/8CSGaXD+taS2QOpxQiJO4U8rBzmJqHCEu0RmT3qSv1HauSYC
 1vHLlyT/hNf9JhIz7WQoDO2nwZt7ROQ7efNs2O25goQLkVHtChzezemgW77G28ORCYAh
 EpTxq90OJyPi9zRInqu8dzNezUUP694in02y607bKY8h4FiYDflP9oG9SKsSZgTpptfa
 QqB/EaZ7auQF/KQCngMVrzXzF5WZ9nIX317pGId2UEr3l6iac0jDM+APBENph9OJ4OCt
 ZiIf7rQjOb4OeQ1jjphvGzf2x8p5VXOi7+pMun33DdjAZsoooA5y3GqtHWutV7Gwrp5Y
 aBQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OWJG17x5ZK91ZQJ4hhWL+vEvdO4nyOYczl3xcpjJLak=;
 b=fh6FNdBTO4GjCuCOONiCh6flKLVdUNDvWMIDd6iRwyERjsUlSQgzna2noXYYbqCIq+
 wDgGrNXg1XWeVILf06yhHA6MfGLUoPZlzrUy0qfhEb8JTcA7SowRbnm/LNViBAdG8Ep5
 SNpparNqZkVDmJuff5twLyXaJ8un/omfpfjkRgMzuohAo70oGnRC8ZB6k7ooaRHVeAR8
 ajBHrNFgVcC3JgSDAiiqr3tgFdaj2+Xq35gNaW4k+jmoi2dc9OVh4Xtg6V7jd0k6hDQc
 AcIV5r27apEsZrG7fypSv6EzgIr7Frg9ekHP5IIS3zebQHoEnxzoFcIiAK+vrJ9LMfKs
 pLew==
X-Gm-Message-State: AOAM5334BPRSx1RsUKfxYsLQz6xIoagPTTeRcy83atT2mwb+XJItas6e
 Yybv6Ku7thmGz0BrJl/xk/MXESoAk+FARAaAAhjV1Q==
X-Google-Smtp-Source: ABdhPJy/rKBtLhy+8nNBQGHkBGtNqHfjagKjg1a/h4e4Dr1B9ql738AiuQbhffaAdRkBYjTfT4JsUXM7Mcu2Mf22hK0=
X-Received: by 2002:a17:906:66cc:: with SMTP id
 k12mr101316ejp.382.1615325645949; 
 Tue, 09 Mar 2021 13:34:05 -0800 (PST)
MIME-Version: 1.0
References: <20210308135104.24903-1-alex.bennee@linaro.org>
 <CAFEAcA9d01LaFRW=NnqivAMCsxPUbRP8kqOuL0i=P3o42tSZEg@mail.gmail.com>
 <87ft148964.fsf@linaro.org>
In-Reply-To: <87ft148964.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Mar 2021 21:33:47 +0000
Message-ID: <CAFEAcA8tj+49WuJDVomt=cg8s=zo_SmrccL1Mftq3ZMuJAZrOA@mail.gmail.com>
Subject: Re: [PULL 00/18] testing, docs, semihosting move and guest-loader
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Mar 2021 at 18:38, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
> >
> > Fails on x86-64 trying to do something with docker:

> Hmm that's weird. What machine are you running on?

Ubuntu 18.04.5 LTS.

-- PMM

