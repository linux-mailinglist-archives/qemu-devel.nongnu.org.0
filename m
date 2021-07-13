Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9543C6E9B
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 12:29:04 +0200 (CEST)
Received: from localhost ([::1]:35980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Fex-0005XB-Q7
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 06:29:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Fc8-0002MS-B9
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 06:26:08 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:38549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Fc3-0006r9-8T
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 06:26:07 -0400
Received: by mail-ej1-x636.google.com with SMTP id gb6so40533558ejc.5
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 03:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=47XZMV0+jxzSEWfmbk0jwRdFy6ySRl2rc4A51LOjOV8=;
 b=oUJaju3PESjEPkP+mI+UeA4sPwAIsEc9y8w0mEpZ8+4TwL/ZdQhtzS61mZ2rZeIcvf
 eQDLcUyRYFIkgWvgjuGHQurcFA/G0C7Cugg5EfSZ9KUw7q65VWsklJzr6DASq9H99XkP
 CulkjSf4uYg2iLCKlRzNhTbDhU2H+6a4OVYa3LK3w4/0UaqGJxsDRIeWPhw464A7eoml
 Ud1LGeVigMdoEDQLqdAdxhtLl5y7EOOL94gH+VTqWhUvVWoOi20VFjsanPn6Ws5FbgQG
 V1tGmOcaqjNC7fI8+CfAi4UQ9OVrTdCUPU1a/B2luV4jDX6aQFazuxYGqElJ63p79Wc/
 +d4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=47XZMV0+jxzSEWfmbk0jwRdFy6ySRl2rc4A51LOjOV8=;
 b=ItiHytSW/RYDedTwkrhpoCWw7qoTY2fMFf8DN6mu5cG2k4KOXlDX7GMS1rmk7IhWou
 6vomxPrMK1hERCiYzPA0cYekIAs3yXsZFMzRRDVKPRxptp5XLHZg4WnDe8iC65WPf4H5
 4GQPd3HJJW1iMeyE7tCa5W7LfZHU2RLERyp4FTTpHNaPDhF9lgWiXqJ2ZrBLY0LRbk2J
 wjNfC0F043TlJ+cVr3eIrKCWxffrQUgZizfgqBBNw756YFcpdwCdQvsUgWUZ/hnm1nwK
 Cz7RpBd96pny03CP9pri1IVq/G5dWp+3EbV4Gxk+F/RXzIulHPQI5rAndVz6fLlan3QY
 qEYQ==
X-Gm-Message-State: AOAM5302ypHThGeYFIfFIEX1r2r9wtj6QdCghf2QSEt4vSZwRamEACvo
 cVEEAV6VuDDFpQIpw1TPcsd+ML8wLE0KvAiaUEOLIQ==
X-Google-Smtp-Source: ABdhPJzDv/dxOicHpQOGFjDsfFTacoIsYkg09vjB3t0SBGgIa5DuaUOQMO3PeTbr73IkbHhxaCamPe5wMCaZOBXr/SA=
X-Received: by 2002:a17:906:924a:: with SMTP id
 c10mr4768722ejx.85.1626171961773; 
 Tue, 13 Jul 2021 03:26:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210712145630.2857814-1-philmd@redhat.com>
In-Reply-To: <20210712145630.2857814-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Jul 2021 11:25:21 +0100
Message-ID: <CAFEAcA8Epk4WKPj6fjFEPyYrT7FQzMRK1A8rf7hN8Buex6Xmng@mail.gmail.com>
Subject: Re: [PULL 0/4] OVMF patches for 2021-07-12
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: Dov Murik <dovmurik@linux.ibm.com>, Laszlo Ersek <lersek@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 12 Jul 2021 at 16:02, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> The following changes since commit bd38ae26cea0d1d6a97f930248df149204c210=
a2:
>
>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210710=
' into staging (2021-07-12 11:02:39 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/fw-edk2-20210712
>
> for you to fetch changes up to d1e79210457323b225c369fa00e97577e0d0da95:
>
>   MAINTAINERS: remove Laszlo Ersek's entries (2021-07-12 16:55:23 +0200)
>
> ----------------------------------------------------------------
> Patches related to EDK2/OVMF
>
> - MAINTAINERS: remove Laszlo Ersek's entries
> - Introduce X86_FW_OVMF Kconfig symbol
> - pc_system_ovmf_table_find: Assert that flash was parsed, document
>
> ----------------------------------------------------------------

So, even though this pullreq doesn't seem to be changing gitlab CI
config, I get a "yaml invalid" failure in the pipeline:
https://gitlab.com/qemu-project/qemu/-/pipelines/335995843

"'build-edk2' job needs 'docker-edk2' job but it was not added to the pipel=
ine"

Any ideas what that's about?

thanks
-- PMM

