Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9D22F8D92
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 16:14:23 +0100 (CET)
Received: from localhost ([::1]:59478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0nHR-0006t3-P9
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 10:14:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l0nGC-0006Me-Na; Sat, 16 Jan 2021 10:13:04 -0500
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:45602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l0nGB-0004zv-6j; Sat, 16 Jan 2021 10:13:04 -0500
Received: by mail-yb1-xb2a.google.com with SMTP id u18so5813804ybu.12;
 Sat, 16 Jan 2021 07:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/SsEGjU/qMpLc11w6beFPoK1a3LRynOrJE9SBnON9Mc=;
 b=FBsByHof6Ng6KH5TZny/lcCMI24PmLDFCyrLENh6XBJLAu6EC2N6Fla9u+WtQheP1I
 9wmjLDAbzBeiF4S44fwBpLliBKN3KyI4eYsL9dwdoZczJpmjFVgZKWX45Hp7xYsE+Fbw
 V7Yripe03WTPbj2xQsXGzy3b8clgkCkJchqvb83opMxwD/v2iHPhx+NefgtIJwm57iv0
 Ecvm6ve1wr01bIiYXf4jSbv+mnYDaCNTiyM9buYHZanYBy/+9C1Dnye8/hcJ1sE1RF10
 qijnlu+7a9LrpSNEdIgmJQT3hggCFoS28QQikQMC7bi85tBJp1lYRM8BpC89twszLrVC
 AoDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/SsEGjU/qMpLc11w6beFPoK1a3LRynOrJE9SBnON9Mc=;
 b=MVnxSdyzoA59VuI0oVC8EIPTiGqbx0axqUJO/hq950MwrIkPQnJNb54JVW7uWB+lo4
 CQSJvJa03H/39ga3wvGJgeSgMUYIEsntzu/Wl8QUDGERpXa5g5YNrnUQNxdcVt9P0gdJ
 QNKfS9HEKUpXrq/WA7GR6H+56zo9/Oiar5zBGvUzFNisoyGMGOomqjxGs9E+xNxMvGtV
 ysZCuMe99/gZCBooKgqrWnpaW5W6BTm7n0jCpNFrvjIMJjNOP1fwnduItuibniDPqWx3
 aq5gdsE7WBZDjNMQQNWvikmx2GHrQHeL5cgy451wLnsk9kvTRvOjdjr9XH8RRC1qUuKR
 qoSg==
X-Gm-Message-State: AOAM532z/3wmNJCKT+vuNHIULXx53FTQ7oh1dRHLRrplT2MWmeAC/lE0
 p4+2gLAdPrWM4SOKcFi876+53UAPusmLubgJt44=
X-Google-Smtp-Source: ABdhPJxYoK/QSrH+o7Rar4RJEnDk6wMRgQKLfVNCpD6+UqyCYj4nx6gjpXDdSrpyqhgFzsGn/jChHiRsl/wS1UFmP2s=
X-Received: by 2002:a25:4d7:: with SMTP id 206mr26239728ybe.306.1610809981846; 
 Sat, 16 Jan 2021 07:13:01 -0800 (PST)
MIME-Version: 1.0
References: <20210115153049.3353008-1-f4bug@amsat.org>
 <CAEUhbmXVLKTqQ0GmoYSDtkeiYA96KkuickvLyFm_L6idTNJPkw@mail.gmail.com>
 <5993ce13-85fc-35b8-57e3-8a694a930f44@amsat.org>
In-Reply-To: <5993ce13-85fc-35b8-57e3-8a694a930f44@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 16 Jan 2021 23:12:50 +0800
Message-ID: <CAEUhbmUZ7J7JgXGvqz_P3HerH7CnNTTk2rhbsff-v8w4OKbeQQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/9] hw/ssi: imx_spi: Fix various bugs in the imx_spi
 model
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2a.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jan 16, 2021 at 11:07 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> On 1/16/21 3:03 PM, Bin Meng wrote:
> > Hi Philippe,
> >
> > On Fri, Jan 15, 2021 at 11:31 PM Philippe Mathieu-Daud=C3=A9 <f4bug@ams=
at.org> wrote:
> >>
> >> Hi,
> >>
> >> This is how I understand the ecSPI reset works, after
> >> looking at the IMX6DQRM.pdf datasheet.
> >>
> >> This is a respin of Ben's v5 series [*].
> >>
> >> Since v6:
> >> - Dropped "Reduce 'change_mask' variable scope" patch
> >> - Fixed inverted reset logic
> >> - Added Juan R-b tags
> >> - Removed 'RFC' tag as tests pass
> >>
> >> Based-on: <1608688825-81519-1-git-send-email-bmeng.cn@gmail.com>
> >> (queued on riscv-next).
> >>
> >
> > This series dropped my imx_spi_soft_reset() change that has the
> > imx_spi_update_irq() moved from imx_spi_reset(). May I know why?
>
> Because we don't need it. My comment without looking at the datasheet
> was incorrect: there is only one single reset on the block.

Oh, you must have missed Peter's comments.

See his comments here:
http://patchwork.ozlabs.org/project/qemu-devel/patch/20201202144523.24526-2=
-bmeng.cn@gmail.com/

Regards,
Bin

