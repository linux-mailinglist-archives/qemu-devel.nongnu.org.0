Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6949B6757E4
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 15:59:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIspe-0002gr-Jp; Fri, 20 Jan 2023 09:57:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIspW-0002cq-Pp
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 09:57:23 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIspV-0003u0-3K
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 09:57:22 -0500
Received: by mail-pg1-x52c.google.com with SMTP id v3so4306791pgh.4
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 06:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=p3A5LNAG9jGQs2w3PmCkqMyTp3v/nlq5Y1/UkrK7S2Q=;
 b=yt9yG79iy+mdeCzRFAV44NyBbKxgwWTcn2OTCG631Ct6D3Ht64T+LbKUM5tLh3UNur
 bztx3bElwn+q2RMEZgdSm9dPJ4fdG5m0zOUG2SvoTc9DtVmqe0n12mIFwW+oS588B2ay
 T8failVIIhc3+udujaIj906WKgfnUXEVehh8rDwHp6OgtI+s12wKvuhhsbeIadhTpPEb
 ucRj9WedwapjNCpbJq7bEZwmUMGmgELFSwhjKRH2JnmDAbWhAYiH94hzryneG4q1Tdy5
 L29RuIqAz4l8f86VmuJ7YJp0U0gVjH5aM+4lVUJ3kZ3BvtVFYhLDRncMmzrL59A9y7GF
 zY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p3A5LNAG9jGQs2w3PmCkqMyTp3v/nlq5Y1/UkrK7S2Q=;
 b=fuPkjadbfCwImeiWL/JsdATGmzes2m+V5bRj6pQ17T8bNEjEcmvSDFYQDl4U//06Vu
 11WtqTX19L6eJGnGlFf7UFg+6EygeRSxqKjNAnKvnWH2HEqNEY0WarO8UoKGqIBR//ss
 BQjr1lIeB5KjGHk7Tzcxzi0z8vYm8ZFzskT49y5bwrz08D5Ui8alxlGMcAob9cbrEmDz
 zJq0YnY6IdS+teQreSdfA24H68BOlvSqga11FhTXktPW4VkpZVKX9ky21VrW8ZXyuTr+
 dJrtH0IpWCdLJ1sSmMf0SR4uLXVqcVcVsPBphNjVm1zj7uUltxYpafe5EebrNl7hh8tK
 YH9w==
X-Gm-Message-State: AFqh2krsU+Ex/bnRUQinYoP3OHV5cUVN349EpVrjiVk9VxnyNBU1Qkw7
 EKqdETUR0AltgidWL2m2qhRfG6Zlm4Khh/d/16w2CDTpCL1tUjIw
X-Google-Smtp-Source: AMrXdXvh427g6XqRQKzzMTjmv1dWvfxCNzMdFFy9Q43ATvZ5vhJMt85qeBZZF4CS3ENf6ItUgu9ISq2/KKux6vU2EEI=
X-Received: by 2002:a63:31c8:0:b0:4cd:418b:3d2d with SMTP id
 x191-20020a6331c8000000b004cd418b3d2dmr1316572pgx.221.1674226639484; Fri, 20
 Jan 2023 06:57:19 -0800 (PST)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Jan 2023 14:57:08 +0000
Message-ID: <CAFEAcA8qX+9cZm2TgY5ziDV=VBQkiNYHTT44QBSoKMchJD+viQ@mail.gmail.com>
Subject: proposed 8.0 cycle freeze/release dates
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52c.google.com
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

Here's my proposal for 8.0 cycle freeze and release dates:

https://wiki.qemu.org/Planning/8.0

2022-12-14 : Beginning of development phase
2022-03-07 : Soft feature freeze. Only bug fixes after this point.
             All feature changes must be already in a sub maintainer
             tree and all pull requests from submaintainers must have
             been sent to the list by this date.
2022-03-14: Hard feature freeze. Tag rc0
2022-03-21: Tag rc1
2022-03-28: Tag rc2
2022-04-04: Tag rc3
2022-04-11: Release; or tag rc4 if needed
2022-04-18: Release if we needed an rc4

thanks
-- PMM

