Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2630D5B064D
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 16:20:47 +0200 (CEST)
Received: from localhost ([::1]:39840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVvv3-0004Po-Mn
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 10:20:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oVvtI-0002On-KA
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 10:18:56 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:45952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oVvtG-0005pZ-VI
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 10:18:56 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id d189so19130363ybh.12
 for <qemu-devel@nongnu.org>; Wed, 07 Sep 2022 07:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=jOxs/Aq/kzUvzbbeTr/4AYemdL4TQeE4YRBDbl+PN3c=;
 b=en3asxkvttD83ou8Pf6e8FHabtmN5goxbOuzMuplOCuZ6KKAIRMsieey0N9P796pNq
 e1xVvtBcTpSCowNG/liae4bXLim4FUA5ho+/zfZHSplFOlfKVCccMtgAWlP1+LwfROSe
 nBc/FL31ULOI2RMQTmKQ/Zb//BBqiq/rdfYrXI8Ry8mRSQ5v9vTKS/KyDc5mZ9VRx+5I
 3ay2bYHHZW32BDRznf8IJql0mpYNuyX+Hyvozw+s/FMvl2cuugqvZ08e4M0yVva82lcC
 D07U2U0sICWR7Jj/XNytIGxYtzyLORDMR1vH7xO5qCDAmY8vDc9Yvodi9JyF17p7rAqH
 rnbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=jOxs/Aq/kzUvzbbeTr/4AYemdL4TQeE4YRBDbl+PN3c=;
 b=KH6KhUNTzoOQ0jQrLY+KbxmvgzVKe7y3mwjSNya9syNFB7UGGy+xdNfAY0rkIG7cjF
 wv9D1eMQpDJpKSVtBefX/Ynope2HvMMVFQC5PjHBuqBYr4d2f7mHZYJarVG0MLTnhEr8
 T0j3T/Y8UM2IKHEP1Jl4IvYDkMGQtPinp8KH+ZoC1QNPhmlboM1dJV9z6zh/TmlGrBKj
 Y3aLzgaNA7Wg7eZACrVzx4uP6ID6PDuTuP8oM+ZwUxytDBMkuFOvbobv0GrgPOu5P97W
 /xni9wCiqQ0efqeiGAsiSKyQ1V3WFNQ2E6z8Tz52iXyzX0QkN56B+DQt1oCK2aq0VeA8
 HbzA==
X-Gm-Message-State: ACgBeo0kG8ry77DUEoTMrXh9CPWt5juIK8L2kX89gNs3JFG0yOVLnFd1
 m7AGeTmahgZqF3JDKvrcNmiPAgm9xgl6ZPHWeaQ=
X-Google-Smtp-Source: AA6agR7GPKXrD3Dakr5r8TxFlEsw/fRGYcuEubVxq7u41R1RYe7tArAoPUDAN9Z2GW/vGw2pfb4u55uex+x5R7qbv6A=
X-Received: by 2002:a25:6c83:0:b0:6a6:8470:dc00 with SMTP id
 h125-20020a256c83000000b006a68470dc00mr3119714ybc.118.1662560333384; Wed, 07
 Sep 2022 07:18:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220907080353.111926-1-alistair.francis@wdc.com>
In-Reply-To: <20220907080353.111926-1-alistair.francis@wdc.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 7 Sep 2022 10:18:41 -0400
Message-ID: <CAJSP0QVyG73LZ50UJyPFanOKJ3tq27k6LJvvwQ30mJcuAzjDaQ@mail.gmail.com>
Subject: Re: [PULL 00/44] riscv-to-apply queue
To: Alistair Francis <alistair.francis@wdc.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, alistair23@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Wed, 7 Sept 2022 at 04:32, Alistair Francis via
<qemu-devel@nongnu.org> wrote:
>
> The following changes since commit 946e9bccf12f2bcc3ca471b820738fb22d14fc80:
>
>   Merge tag 'samuel-thibault' of https://people.debian.org/~sthibault/qemu into staging (2022-09-06 08:31:24 -0400)
>
> are available in the Git repository at:
>
>   git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20220907

Hi Alistair,
Please update .git/config to separate the push URL from the fetch URL:

[remote "github"]
        url = https://github.com/alistair23/qemu.git
        pushUrl = git@gitlab.com:alistair23/qemu.git

That way future pull requests will include an https URL that allows
fetches without ssh or a GitHub account. Thanks!

Stefan

