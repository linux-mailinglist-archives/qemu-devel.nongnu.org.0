Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4386E1EEE
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 11:03:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnFKw-0003Wb-PN; Fri, 14 Apr 2023 05:03:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pnFKr-0003WP-TV
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 05:03:14 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pnFKn-0001DS-3I
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 05:03:13 -0400
Received: by mail-ej1-x633.google.com with SMTP id qb20so43519741ejc.6
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 02:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681462986; x=1684054986;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pvphCMhe1Lq20Ao5H6BwntU+fb8+1XVXCNXrhrGrf9U=;
 b=XcgpSdrCJ2nzEINjpflaUYrw0sdFo2ts1iBVUNutsHpfWC44sWCZRWbEQNetZ6zGdB
 QGBUiKZkBBnG7y3CXrMHbD0HBuqS2vKYclh9PZ7LG3zb107Un871wwhXNxWRmifVHqJx
 p3QlO6x6gg8rOHB7dxjI74eQSoR/qmMGS9wENfaLsiuopzmGz3IsUbKe35ddZZTYLb4+
 JwH9SOlw2jOW1qpiEzWYrWq4oIF/Sz94horg5tRL7acC4VOTa8D4KMS9IeiUemB4qCDj
 84hvgJYP4/4Nnhkyu1YjMA9Ye1G5/joW/Kt2dS5s1RsG+X4pdp/W28V7ddknmaKh3gb/
 DhWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681462986; x=1684054986;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pvphCMhe1Lq20Ao5H6BwntU+fb8+1XVXCNXrhrGrf9U=;
 b=J0sO/cJkCmRl5agL6SqEbV6ANxxBk2Pq9lvMeM9kcOoy7H30xXEQvs/WQuRxbNLiBP
 SfDeucBq6UzylgFRvNdqnfwk81sfOZRMXqoAqq8UD+oVLiaBuq3Zu+FMvzmkz0UK3hrH
 w6BLJXadNQa/iO1QCw6z7gxMqEdzwWtzQ77ZAjpIYWz0wu0qLJ8WAmT76Kp2OqmWMiZE
 qxqYsaQsiSnwgYNpybvAEVoeHvo+hBqklueEGKgkxFCSgVUEA13Y9Ca1xIF2M2dOIqtM
 Z9jvM3DP0E/Ixn9D5KsgC+5pdADbhK4qPhbg2+oDSyUMHjuWhxgISDELcBNOyqiUPvQw
 naow==
X-Gm-Message-State: AAQBX9f6/3Unh3aoeDvFPFe55e4QzULfcXk/Dw05jPMeSc4eEhrRQ8Fs
 Tpm9mJx+rL7vkqRe1ERemldyEUNWWpiQ4vKUyl0xHg==
X-Google-Smtp-Source: AKy350ah8XZl3AyBUHxIeVpUIZ/QU0meCjGMH+CU3LZ0wcWiZoiRNAdTxeLwiflR41j9fvpGNGnhGKHeaPC2eP1XQ1I=
X-Received: by 2002:a17:906:2749:b0:94e:8d10:86ca with SMTP id
 a9-20020a170906274900b0094e8d1086camr2691500ejd.6.1681462986237; Fri, 14 Apr
 2023 02:03:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230414073432.36000-1-slankes@eonerc.rwth-aachen.de>
 <20230414073432.36000-2-slankes@eonerc.rwth-aachen.de>
In-Reply-To: <20230414073432.36000-2-slankes@eonerc.rwth-aachen.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Apr 2023 10:02:55 +0100
Message-ID: <CAFEAcA9CnA0Pxxr1Q5S25SFnQTJM4oBwGeXsaHgTpt+TvJuGOA@mail.gmail.com>
Subject: Re: [RFC 1/1] add support of `--initrd` for ELF-ARM kernels
To: Stefan Lankes <slankes@eonerc.rwth-aachen.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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

On Fri, 14 Apr 2023 at 08:35, Stefan Lankes
<slankes@eonerc.rwth-aachen.de> wrote:
>
> Currently, the flag `--initrd` is only support for Linux ARM kernels.
> However, also other ELF kernels could depend on an initial ramdisk.
> This PR loads also the initrd for ELF kernels and announce the
> location by the nodes "/chosen/initrd-start" and
> "/chosen/initrd-end" within the device tree.

What are these "other ELF kernels" ? Is there some defined
specification of bootloader you're trying to implement here?

Currently QEMU for Arm supports two things:
 (1) I am a Linux kernel, load me like the Linux kernel defines
 (2) I'm just a bare-metal image (ELF file or raw)

Adding support for some third type of loading would need a
pretty solid justification, eg that this is a very common kind
of image to load, that there is a well defined specification,
that it's supported by lots of other bootloaders, etc.
The bootloading code is too complicated already and I am
very reluctant to add more to it.

thanks
-- PMM

