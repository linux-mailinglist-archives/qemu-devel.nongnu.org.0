Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 411CF69E11E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 14:16:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUSTv-0002rr-A7; Tue, 21 Feb 2023 08:14:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUSTt-0002rT-BD
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 08:14:53 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUSTr-0004fT-Qn
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 08:14:53 -0500
Received: by mail-pl1-x636.google.com with SMTP id bh1so4969468plb.11
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 05:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=l90zrU1/0YQ4QGHgoiumnCyeC8zRe1Upc9BkI0n6A18=;
 b=wY8xv3dRRyesulrWeFasIulsEehCh4lD35ekXEQoFzbT4ntisBVV/raqc5CK/souI8
 g4DnlxGe2zPNmAOJrnfnipwk95bBk7pNv8x4Ee9psH2ADgMIgfDshht6MegduuJmV/fb
 VbqIrv9bV/GAj/e5IaOO9OfWgUDNzFTrITOJOOwII1GowineRn0cO7mGgBpuILnkZbyy
 tjp9jXYaWREspDaBKu/xnRJWCZ/UGFUzlRRrwwWXjgdzvwWrJ9QipGJGex19kXoCfseW
 2pHrPVJfLbp4w9XUHyJDHXaf9/FUxOJf2hN/pCh2b442+buzojQM2NyawUe38qWsJTaj
 1pXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l90zrU1/0YQ4QGHgoiumnCyeC8zRe1Upc9BkI0n6A18=;
 b=6hAevNxYk8tdWZ+lhF7ryxloHg8XWbPAsI9p4NLaMUXBd1rXLKuNq0TTeiVnDvk/D1
 27PkIRB+T2M+0AC9tGGWCJr1G5Lagnzt/A1C9YUHvG/dad1I0kFNnPp3Yf3jmMDyU/8j
 RhC46HX3n22ir5+AOi9DaPSncZgqL5t3WS/W8SaSwm1WFisIv/ASIdSKFD6xjVLFu8Zy
 PlotUSrD/uqTL4FSSjq6VHTHEKoKdfm0ZJAOp9McNf5D/V5cpXHVdfB/adEB0392OUCY
 X0Qyy8RYveonCtdzZ+R7I2c7rDtC1mtZwbatwr/d9kWIssnkgaIiWhNKUxQLddU9UnhK
 4Fqg==
X-Gm-Message-State: AO0yUKXHkT6xFOA0C9G6D75T42COtNZMf8BbZs5Wm3vALw0YOWhO1Wks
 xZndNOoVd5WXF+GcBWg8E5vkBtICA5IFlY5hUNgLe6je9tz0EQ==
X-Google-Smtp-Source: AK7set+yLSRq6KW5I9MRWLEohYIaWnPMzsIsrw+FkMWK0zcMOqMn65sf47wQ+CMZsK9WHxRh3v0phReybPQm3r4AK6M=
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr1730531pjb.92.1676985290880; Tue, 21
 Feb 2023 05:14:50 -0800 (PST)
MIME-Version: 1.0
References: <20230217054335.57595-1-jasowang@redhat.com>
In-Reply-To: <20230217054335.57595-1-jasowang@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Feb 2023 13:14:39 +0000
Message-ID: <CAFEAcA_W3KkYrJGfg0QWwCH5XV9grt4iKgk9P5Zkzyp33Q=Ozg@mail.gmail.com>
Subject: Re: [PULL V3 0/9] Net patches
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 17 Feb 2023 at 05:43, Jason Wang <jasowang@redhat.com> wrote:
>
> The following changes since commit 6dffbe36af79e26a4d23f94a9a1c1201de99c261:
>
>   Merge tag 'migration-20230215-pull-request' of https://gitlab.com/juan.quintela/qemu into staging (2023-02-16 13:09:51 +0000)
>
> are available in the git repository at:
>
>   https://github.com/jasowang/qemu.git tags/net-pull-request
>
> for you to fetch changes up to 525ae115222f0b0b6de7f9665976f640d18c200a:
>
>   vdpa: fix VHOST_BACKEND_F_IOTLB_ASID flag check (2023-02-17 13:31:33 +0800)
>
> ----------------------------------------------------------------
>
> Changes since V2:
> - drop patch hw/net/can/xlnx-zynqmp-can: fix assertion failures in transfer_fifo()
>
> Changes since V1:
> - Fix the wrong guest error detection in xlnx-zynqmp-can
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

