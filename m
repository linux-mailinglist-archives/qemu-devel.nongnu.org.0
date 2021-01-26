Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC223043E7
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 17:37:21 +0100 (CET)
Received: from localhost ([::1]:43742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4RLD-0000NQ-Ss
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 11:37:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l4RGV-00064M-Bk
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 11:32:27 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:44568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l4RGP-0001tZ-FY
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 11:32:26 -0500
Received: by mail-ej1-x62f.google.com with SMTP id w1so23777665ejf.11
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 08:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=3J/chufRmZp8VECJCQvW7UZ9qC4lgxMUFuAoJogsZes=;
 b=BWPTrK69UW32oCiPEC98ztmwufhUgzMpGsCBE3UemROkmN1q+GM68WaGSST0tiF7/a
 NoOcThEsnsKj7DkRanVCKHm9KY6hh1/gGKs20V2Eq21qRLiOQjy2ZTXtJyifarqe2zfB
 L010Dl82ZdPBf3J2Fkso4QI/0Y0H7/yfhlLoT1ouKJbJzITgabOygNM+eHMqWnKQMw8E
 3Vij5pzZOTDYTQhj5d5oELYNCdZMR6V4dZJ+Kuap8S6mI4SNbVBeZPoIkQO1nmXKFpwa
 f2+0GbbHg4R7J4GBH/qSlNf77/+Y2NJTPpI6K3BJ63tiO5VGPpnZ9H59sOnqbPOCWN8o
 RQ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=3J/chufRmZp8VECJCQvW7UZ9qC4lgxMUFuAoJogsZes=;
 b=OyzFNJfXmKOqlOuwBCLMcddEcKZ6LweFhlEIYPzltQLvGYhi8TOeqlV/ZrH4cCoVV+
 R+RxNF1UlQtwv5cZ+qaNjyMojVgNYiCaL/IikrqGglogEZ6voCkbz9ne1lLTG3T+xdxS
 ipSPYKCHiAPi8gA8nUBZJ1k5nHy/gj2L+ocvfC9jMttDiTnX8Ba9Oc/BtG2vbQdwPStt
 FAeKL3kaId6pzhjIxUaRyKpkkD0GaHmyAsWV1h66T1LqEbJfdb6SYmFNlGc9eIWEvWXP
 IfAUrDAcRV9wXL4cldeI0dj0VozfN/QQyz3yOWdlQxEjAlLyl5/H5wGpjU/EYUg/S0LN
 oixw==
X-Gm-Message-State: AOAM530/MWgyZaCOEFttD9fYvbISjo/hLv0FvGiczqaED8GMtQotHYZd
 pRaRpG2jaUubXJkYkWXhM2CEJy5xuL499mlEnChmc/Mn7BhEuw==
X-Google-Smtp-Source: ABdhPJyWgwEBky7TIRWATLSA1a2qOlX+bk5DKMIsd2p3yHy7Hp+0tD3JEylLaTZoA+0Ij7pvch/9v1vZUJMuwcoleAQ=
X-Received: by 2002:a17:907:3d92:: with SMTP id
 he18mr4038400ejc.85.1611678739094; 
 Tue, 26 Jan 2021 08:32:19 -0800 (PST)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Jan 2021 16:32:08 +0000
Message-ID: <CAFEAcA-bafTaHajkvYQw1rfGP1MgKmeY-wmO6LY=fj2oY87HFQ@mail.gmail.com>
Subject: macOS (Big Sur,
 Apple Silicon) 'make check' fails in test-crypto-tlscredsx509
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: Alexander Graf <agraf@csgraf.de>,
 "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

My Big Sur/Apple Silicon system fails "make check" in
test-crypto-tlscredsx509:

MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
G_TEST_SRCDIR=/Users/pm215/qemu/tests
G_TEST_BUILDDIR=/Users/pm215/qemu/build/all/tests
tests/test-crypto-tlscredsx509 --tap -k

** (tests/test-crypto-tlscredsx509:35180): CRITICAL **: 16:23:34.590:
Failed to sign certificate ASN1 parser: Value is not valid.
ERROR test-crypto-tlscredsx509 - Bail out! FATAL-CRITICAL: Failed to
sign certificate ASN1 parser: Value is not valid.
make: *** [run-test-70] Error 1


Does this failure ring any bells for anybody?

Here's the crypto part of the meson-log:

  Crypto
                     TLS priority: "NORMAL"
                   GNUTLS support: YES
                        libgcrypt: NO
                           nettle: YES
                              XTS: YES
                     crypto afalg: NO
                         rng-none: NO
                    Linux keyring: NO


thanks
-- PMM

