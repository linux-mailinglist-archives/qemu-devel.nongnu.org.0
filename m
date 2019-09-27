Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2C9C00A9
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 10:07:19 +0200 (CEST)
Received: from localhost ([::1]:47742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDlHa-0006AO-A6
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 04:07:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40479)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1iDl81-0006hm-DR
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 03:57:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1iDl7z-0001Nf-BC
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 03:57:25 -0400
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41]:46873)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1iDl7z-0001M5-7E; Fri, 27 Sep 2019 03:57:23 -0400
Received: by mail-yb1-xb41.google.com with SMTP id t2so1590405ybo.13;
 Fri, 27 Sep 2019 00:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4VaYS1SjS0ZtzjLPzY313BI1M+Xgx4OMAfeftWBtHO8=;
 b=Oc0EQV0Wx6HBkiYrDYDkq1YFUC2znoskbS63MeDgVywH7EgP53Np0KeTYZLzV4Oafn
 4sNzZu6f3vylsZIVJl19Xz2lT3EsnZQY05HwRTx3rAoifvr5fHEXzGYJta8EcOWpX/Qp
 SxVFRdDZTH9xQ23dxqvWo9m+qb9BbF21CMlo/y6p826Ux0DFzOa3Feem9owemnZ6FgCR
 cS8xahidSQxxc9doMXG+btOWa5AEsIeCBiBzP2Ds5fcYyMMzISTAw2SDsLiaLQa7mEhj
 UdhCxP6L2ML2RGHFyKtepo0cJDnmwVBCr6JkslFLRjVRBAwIrFYSBdxpd/FF7PXuVpqj
 bd8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4VaYS1SjS0ZtzjLPzY313BI1M+Xgx4OMAfeftWBtHO8=;
 b=TyXxYnwTZokCdUlnBUto0GK6JhKp0aa8fdmvC4IGNEG0/PU9AVF7UPTrpcaex5hqvB
 b+fZegyJJBZshei2EtdJb6S764JICLbVFU2D+wVuj2ibPLKYoBIjUWnQgk8bnC/ebYoL
 1RyU/mtYQDaVMXcx4cWuO22zq2b1MNXMFL8FJGuF+V9uC7hMUz0PVMlmdmylpFwFn7hD
 e09WaRSSnpy4wiCPuNg+uh2sPQSCd+luLH7tdJrXXpJbvrd9F25Sm27+9WmfdBPk1Zcq
 e+nAjMTb5qu/EvRzn/Tt9yNHBpiVZB/L6ocCQBXdVpSpyY2Chv5qGiUDk4S6xifSMBU0
 6i7g==
X-Gm-Message-State: APjAAAWBxupdynQebK6N1VUDpIkqJkN5fvtTK5nCr7v9ICP4cAc3RiE5
 r2Ple8/OwGmKTJjhtZmNT/1ah5WDIV5XsQb9YU8=
X-Google-Smtp-Source: APXvYqxaxslmIVRCR+mbLPVCqiOsSVp+/mwaraI1CnhJlid1+6ntbbzDbdIpt5MLfecsW8YwMcD3eUxFj+GNSdaGRRU=
X-Received: by 2002:a25:b911:: with SMTP id x17mr4689605ybj.29.1569571042755; 
 Fri, 27 Sep 2019 00:57:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1569545046.git.alistair.francis@wdc.com>
 <c890a46c575894db0d06c2efeb7083f2f3b240a2.1569545046.git.alistair.francis@wdc.com>
In-Reply-To: <c890a46c575894db0d06c2efeb7083f2f3b240a2.1569545046.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 27 Sep 2019 15:57:10 +0800
Message-ID: <CAEUhbmUQVp18se8nqz5cyq0K4EMC18Cy0vBn9n9hZOQh=gVR1w@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] riscv/virt: Add the PFlash CFI01 device
To: Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b41
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
Cc: Alistair Francis <alistair23@gmail.com>, Palmer Dabbelt <palmer@sifive.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 27, 2019 at 8:57 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Add the CFI01 PFlash to the RISC-V virt board. This is the same PFlash
> from the ARM Virt board and the implementation is based on the ARM Virt
> board. This allows users to specify flash files from the command line.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/Kconfig        |  1 +
>  hw/riscv/virt.c         | 86 +++++++++++++++++++++++++++++++++++++++++
>  include/hw/riscv/virt.h |  3 ++
>  3 files changed, 90 insertions(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>

