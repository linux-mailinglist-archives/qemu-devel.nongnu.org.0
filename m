Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5467817CA37
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Mar 2020 02:15:34 +0100 (CET)
Received: from localhost ([::1]:44112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jAO3w-0005j7-Th
	for lists+qemu-devel@lfdr.de; Fri, 06 Mar 2020 20:15:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42619)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1jAO36-0005Hb-W7
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 20:14:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1jAO34-0005lr-Es
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 20:14:40 -0500
Received: from mail-yw1-xc43.google.com ([2607:f8b0:4864:20::c43]:39277)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1jAO34-0005kd-BO; Fri, 06 Mar 2020 20:14:38 -0500
Received: by mail-yw1-xc43.google.com with SMTP id x184so4105664ywd.6;
 Fri, 06 Mar 2020 17:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N5m4PwUiLpGLtIl1udm9QmP080l2La2lrTGrRw3FBLQ=;
 b=tZDHynh7Dm0HlthhlWqV2Zn3wNsFV7XKeLsHWgYxulrOmlA8lpuvxv5lF+V1VlQd9a
 0oP0ib61P59TsXLyyPBFr1+Qj4/LtGk0gZk91LBzBE+sqpbAIDIf4le0S7Wmn76D15DS
 SrYqQT1LIrsNJlG2/pgKZGiFXCeL0Xr8fUoLX2N3UC8a+MC/flXgQZlIwIabNU2SsTM4
 A51+bW7pfWT5Ws13Dn8mVk+nCyP+1BLi2xRbQwfbAiZyPSB2NwNGEMw8l79vLeCkQdY/
 oHr7n7K7PEVhKcGqx9LwwpT+gdNlVvGjx+ZU8dvtG8v4ZekngHqZlkRViLR1pC29o2fx
 w+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N5m4PwUiLpGLtIl1udm9QmP080l2La2lrTGrRw3FBLQ=;
 b=ZWOZqviuzYP1Y1KcicZ2ayF9zUGz+4ZnMO9NrntqKUtQW3NSk0bZhPB2B5VhS/9R7b
 feSqBTN7qwOWOS1H/XxyjctKc0S8uRp5jSAa6GGwAXqLZhKezsydDel8pRUcrKEtXFLb
 Ir9kApUGGp/23WS3I62D1bXqI9/Wl5oFly440e2hjIG7v04KNccYABW5IZ79rbIHGnWL
 32fKg7EQ8LJj4fizZKw9trQwcLzcSvlgdpDRfMIiz8ePcEBtAIE5xqigQIVclapOZ53p
 HRpkrGJrqCn838NYpt9R8D0+PUClicG/xkIdeWEcPOrmqCGAcNeICHTcDItOmuKHySep
 oEEA==
X-Gm-Message-State: ANhLgQ2ndMe9547Ak3GYf7dL8KYmQTVOvm2ofb51f2EQ2z/UNXtIsuzS
 PoRym8zsDzf7N6tHv330S+YJTyxwuRc8bW57QBg=
X-Google-Smtp-Source: ADFU+vvpHn5RMQP2aAREnG2pNixV6c+UlBtsmLhz0FJmR9sXSIB2c7j8xZj5GzSjY2Kc1TAlHB1DfT0Y5Ei6m9tgGFg=
X-Received: by 2002:a25:54d:: with SMTP id 74mr7175646ybf.490.1583543677474;
 Fri, 06 Mar 2020 17:14:37 -0800 (PST)
MIME-Version: 1.0
References: <cover.1583530528.git.alistair.francis@wdc.com>
 <b1b13c2243ecfe08e688240a38fec4ebe8794017.1583530528.git.alistair.francis@wdc.com>
In-Reply-To: <b1b13c2243ecfe08e688240a38fec4ebe8794017.1583530528.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 7 Mar 2020 09:14:26 +0800
Message-ID: <CAEUhbmXuB_zbex6pYMZd15J_5MyuG2GQFTUhw6vZRd5Rq3uA=Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] riscv/sifive_u: Fix up file ordering
To: Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c43
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Mar 7, 2020 at 5:44 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Split the file into clear machine and SoC sections.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/sifive_u.c | 109 ++++++++++++++++++++++----------------------
>  1 file changed, 55 insertions(+), 54 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

