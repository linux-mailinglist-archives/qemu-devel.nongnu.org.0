Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7E3315238
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 15:59:17 +0100 (CET)
Received: from localhost ([::1]:48730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9UU0-0003I2-5E
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 09:59:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9UO1-0006sr-5T
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 09:53:05 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:40918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9UNy-0005mX-1u
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 09:53:04 -0500
Received: by mail-ej1-x636.google.com with SMTP id i8so31976718ejc.7
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 06:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g9JH1ISlL1Fmrn8AmmGaSgJAziEoBnl4btEAdyDvdV0=;
 b=X9W2T+RnyBSEuq7xU2p24cY6nGcyPqLNAQaT+lpGWovE9qZyxA9TlRc+IrxXLqL0UK
 4AWH1/+qpKNyazrdrLf+KDDTkvJsnginZ9IDqqLuueYFwVjEPaYBU2q/olrjwKxnU5GH
 C4TPriJbUAc4+aPrTDY9gxtUjirN6ma21OKud0ogr7MOkcNcDrH1RrWihc894QQarGjk
 2wFjcIhrx29gzTGxswBwCWFPK9xVqmzneyF+35MLpnWocw2WsyBzf03zdpxTApgDrqKo
 gC8OLd8ot/nx+hZZxtDCHCPxtn4ptPT7fpZAOEwX9eeoa6nET+Q0cxy/RZI2HxdKKuth
 GoJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g9JH1ISlL1Fmrn8AmmGaSgJAziEoBnl4btEAdyDvdV0=;
 b=AeGBw8+gVN1voMyetG0rjNhqJ50V27gDXKjfhTih1/4cHdhBaiNyUjuRnAli6wziUb
 C1dtWr45/B15qsqzOHwjywaIYFwItvHHeFiSHH+aMXhTJ3fZhOI3PUjENU9dgbdjJwI3
 gw+0XU/EmF9KLiqJy4Y7/NVg4ljcSc4ySOa2NysBL1OvGJ85x9idctqnGJT0NwWdPkhu
 i+75vC7J2c2aVSY72OfzQhVS7aybphVaQBv44/yT8cue4bYtNWJ+iQoGe3hl23AduO1E
 KTKLFjA2YjLv26pWdsa1p+rbrYQmlMccB1oPPZeuYy3KQHdBfjbA4j5W8jRtIqB6SQEB
 YJ+g==
X-Gm-Message-State: AOAM533C69NNzts5DF5sBCMhQcHYZi9mKdE+KovOKgZ+zYkIWNn5E3yE
 LoypPNUJmTCyHt5TjPXo2a4IOD/CGRQlFMvaYh/ixg==
X-Google-Smtp-Source: ABdhPJwq7Xgiyfgw0lU0MFGFJt5nA3MgvEaSe42MX3CoNrCWE9fgPo9mLxUCjqHqUJTFYB7Aj720IzrkpFucruD90v0=
X-Received: by 2002:a17:906:2e4f:: with SMTP id
 r15mr22807784eji.407.1612882379505; 
 Tue, 09 Feb 2021 06:52:59 -0800 (PST)
MIME-Version: 1.0
References: <20210209073101.548811-1-its@irrelevant.dk>
In-Reply-To: <20210209073101.548811-1-its@irrelevant.dk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Feb 2021 14:52:48 +0000
Message-ID: <CAFEAcA8m4nVuO1ZXgA6YiVHMOJQzUXzvt_74gb9DUj0aJgOSaw@mail.gmail.com>
Subject: Re: [PULL 00/56] emulated nvme patches
To: Klaus Jensen <its@irrelevant.dk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Klaus Jensen <k.jensen@samsung.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Feb 2021 at 07:31, Klaus Jensen <its@irrelevant.dk> wrote:
>
> From: Klaus Jensen <k.jensen@samsung.com>
>
> The following changes since commit 4f799257b323e1238a900fd0c71c2057863e0308:
>
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2021-02-08' into staging (2021-02-08 16:12:21 +0000)
>
> are available in the Git repository at:
>
>   git://git.infradead.org/qemu-nvme.git tags/nvme-next-pull-request
>
> for you to fetch changes up to 3e22762edc74be3e1ecafc361351a9640d114978:
>
>   hw/block/nvme: refactor the logic for zone write checks (2021-02-08 21:15:54 +0100)
>
> ----------------------------------------------------------------
> Emulated NVMe device updates
>
>   * deallocate or unwritten logical block error feature (me)
>   * dataset management command (me)
>   * compare command (Gollu Appalanaidu)
>   * namespace types (Niklas Cassel)
>   * zoned namespaces (Dmitry Fomichev)
>   * smart critical warning toggle (Zhenwei Pi)
>   * allow cmb and pmr to coexist (Andrzej Jakowski, me)
>   * pmr rds/wds support (Naveen Nagar)
>   * cmb v1.4 logic (Padmakar Kalghatgi)
>
> And a lot of smaller fixes from Gollu Appalanaidu, Minwoo Im and me.
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

