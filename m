Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D333410A2
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 00:05:57 +0100 (CET)
Received: from localhost ([::1]:37512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lN1iG-0007sx-B2
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 19:05:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lN1gT-0006xK-E8
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 19:04:05 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:46901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lN1gQ-0006Jk-QR
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 19:04:05 -0400
Received: by mail-ej1-x635.google.com with SMTP id t18so6569513ejc.13
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 16:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nZY3+4hX2qFZjdu1CGI55VKk3r5Fjbp++Dut4DFLehA=;
 b=hhbYhOTjt0GmOCHX9k2Opc2nivuUMyVBWMzSS+yY/fo6W7NQY1puNFsWa+5UJIsFAr
 UFnGCEF60Y5OGSddfDiI6tkBDejbJsI75M0xsUMpGqP76WmLAsub7jiZojXxd/J6ARy0
 nek25J4acD76TbGV0dEtRn100yDI4IfvvhQqVJukOTVJyWaPOVFyxQ9mrq3PB1hQwhXL
 YBuOk5zeS7KEbF4Qnc6nZQOBcUV6BR6YyflO0Qk05WDxreZ8nUWtmmGd5rwzd/x4PgUD
 wgz3wXcUPQkeomjtlGDCd27eZuHUx7tVjxRPEZN57PsnS3CNkPc8mIQMshj04KNfzFEd
 617Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nZY3+4hX2qFZjdu1CGI55VKk3r5Fjbp++Dut4DFLehA=;
 b=SOnqCOaFdt3d+hRn49FJCSserhaZQSqInqZjAdRM3Jf6efoe71c8kjwMr8S0iD31pI
 c1I+4InvyJ7uDkHmNrv4Gy+3KxmonYlLlUil3kg/YM1tLRgG1EHKYAKxI7NoSjW7yrmH
 +2E2xeQHHoePcNDqYJWIXML4QfWZrHE00btj0lldyIU4hZbUHGomdfcok+Su98+PY6SW
 GLPIByAwTpglr10Yq4dbLAeLislzAlTA5YWupfkbf2/s/IPnXTnmRK+hITBoMOzLtekn
 aTaeozII4vhrcVF826TEffGtFlagAoqTaDXTYU0K2uIGRnVh0YIs3zw1g67ktib9+Adj
 2neg==
X-Gm-Message-State: AOAM530S7FvTtuEoxk/V24WNIfW8MqU3M9sHJ/6QY4v7hdl5VbJkDE2N
 U8vbJS00gajKk3v0lMTh78izRiKb7VLRiYq3fGiwqw==
X-Google-Smtp-Source: ABdhPJykH+J/NC4ezp1VHY+AldtVaKT5P4wM2jSuOO5h0OV9Kp/o6zrcsrdBT9A40G2mbRoFdIKWPBbDjhy+8YK9u4k=
X-Received: by 2002:a17:907:629e:: with SMTP id
 nd30mr982462ejc.407.1616108641019; 
 Thu, 18 Mar 2021 16:04:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210318115757.58923-1-its@irrelevant.dk>
In-Reply-To: <20210318115757.58923-1-its@irrelevant.dk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Mar 2021 23:03:36 +0000
Message-ID: <CAFEAcA8V-1xvWr6diFweqiUKBzu1HgmHJhOacYGC4uE15UA=iA@mail.gmail.com>
Subject: Re: [PULL v2 00/11] emulated nvme updates and fixes
To: Klaus Jensen <its@irrelevant.dk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Qemu-block <qemu-block@nongnu.org>, Klaus Jensen <k.jensen@samsung.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Mar 2021 at 11:58, Klaus Jensen <its@irrelevant.dk> wrote:
>
> From: Klaus Jensen <k.jensen@samsung.com>
>
> Hi Peter,
>
> The following changes since commit b12498fc575f2ad30f09fe78badc7fef526e2d76:
>
>   Merge remote-tracking branch 'remotes/vivier/tags/q800-for-6.0-pull-request' into staging (2021-03-18 10:05:37 +0000)
>
> are available in the Git repository at:
>
>   git://git.infradead.org/qemu-nvme.git tags/nvme-next-pull-request
>
> for you to fetch changes up to dc04d25e2f3f7e26f7f97b860992076b5f04afdb:
>
>   hw/block/nvme: add support for the format nvm command (2021-03-18 12:41:43 +0100)
>
> ----------------------------------------------------------------
> emulated nvme updates and fixes
>
> * fixes for Coverity CID 1450756, 1450757 and 1450758 (me)
> * fix for a bug in zone management receive (me)
> * metadata and end-to-end data protection support (me & Gollu Appalanaidu)
> * verify support (Gollu Appalanaidu)
> * multiple lba formats and format nvm support (Minwoo Im)
>
> and a couple of misc refactorings from me.
>
> v2:
>   - remove an unintended submodule update. Argh.


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

