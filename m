Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE04487A07
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 16:58:50 +0100 (CET)
Received: from localhost ([::1]:35998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5rdi-0004n8-1B
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 10:58:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5rWG-00047f-Fy
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 10:51:08 -0500
Received: from [2a00:1450:4864:20::42b] (port=35634
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5rWB-0006j6-To
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 10:51:08 -0500
Received: by mail-wr1-x42b.google.com with SMTP id e9so10339696wra.2
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 07:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DzSu9K7g1ox0AMjcvjJaldxShUbK/oaE7du71xebS9E=;
 b=CwKX4qlDYIlE3XOaRmBzM2RvLU+9NzGeHF6vFDjzv2SZEFUuQXIyN0l79Rv9kN3M93
 galYKrYwV7NU95UTFuw5vVQD0Nj+/NmM0pyNTdY9xhP1nxb/d5i2lWFXBMNh5NpqF7Db
 s/qGxjCtS6tg8bQi2TIWCucgNV7kYJENDv+zxxgWwwcqeS9+B3BWEzwT/2wJAE1nnY5A
 SWgJTO2FtPvZbicqUpR3RqAiE+5QqMvDxMxT8xb4EhLoZacPHy+zNjOh1DrUOUct3cDz
 uEe6s1xgDuSUPQJKEstM6DMW9T35OW3OdUZlZddOjWtrOm6c9TBismngZ8qPrc4LKPmX
 UX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DzSu9K7g1ox0AMjcvjJaldxShUbK/oaE7du71xebS9E=;
 b=bn3QUiVnJ5h5B4dQRdvf11SOXpWjbTu7xl3zVUE5Ui4dlIUDYf0aEr6rCGCTZUa+dN
 a4vX6kN7S120NWodUnmAhf+/aKElSkV0VzoonIS/vCzFI75XdZwXDkplwNDNhZMJq7mK
 2/CWl85WO5wEuLWGf+g+9SY2yWUxBepSPCOF8WVM+wYjOnGBLYSz35Renw/4h2Mqs6Ah
 ufBIWsuInmZWvF6J8Iep1irZYFk0PpodK39cdpI4yuigWSQYksk6V4mA1jAiFkbUTWJh
 ylJjTeDWcpsjbUw1eWly/DGYBjSNx4ioUPw3t1YW3/ziqOhDdNjyGV1Jnm/BnsZpmwW4
 pcYQ==
X-Gm-Message-State: AOAM533aVruJT64WNIl5Bl0+WyJZuhhoAwiSu4yhV9z+UyKf0qTjPv/j
 aVIn/IzSloOkdROup2fE3ArBGDQqv2zIdAjfpwKTkw==
X-Google-Smtp-Source: ABdhPJwAvD7RYXEag83LeFeWtfmDJgVLhrCvbkBv5+WYYGVE6GthT1gTZi2SpKa+yQcJ2vcW6URtIbhcLQmUF302m0A=
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr53807580wri.295.1641570659068; 
 Fri, 07 Jan 2022 07:50:59 -0800 (PST)
MIME-Version: 1.0
References: <20211214110354.21816-1-francisco.iglesias@xilinx.com>
 <20211214110354.21816-2-francisco.iglesias@xilinx.com>
In-Reply-To: <20211214110354.21816-2-francisco.iglesias@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Jan 2022 15:50:48 +0000
Message-ID: <CAFEAcA_yeCU4+jbXxGObmQt5yruiR0KVManaCOsRTBXN=d29gQ@mail.gmail.com>
Subject: Re: [PATCH v5 01/12] hw/misc: Add a model of Versal's PMC SLCR
To: Francisco Iglesias <francisco.iglesias@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, qemu-devel@nongnu.org, alistair23@gmail.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 14 Dec 2021 at 11:04, Francisco Iglesias
<francisco.iglesias@xilinx.com> wrote:
>
> Add a model of Versal's PMC SLCR (system-level control registers).
>
> Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  hw/misc/meson.build                        |    5 +-
>  hw/misc/xlnx-versal-pmc-iou-slcr.c         | 1446 ++++++++++++++++++++++++++++
>  include/hw/misc/xlnx-versal-pmc-iou-slcr.h |   78 ++
>  3 files changed, 1528 insertions(+), 1 deletion(-)
>  create mode 100644 hw/misc/xlnx-versal-pmc-iou-slcr.c
>  create mode 100644 include/hw/misc/xlnx-versal-pmc-iou-slcr.h


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

