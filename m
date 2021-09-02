Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D04973FEC3D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 12:38:17 +0200 (CEST)
Received: from localhost ([::1]:51312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLk6q-0003Nc-VE
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 06:38:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLk5i-0002hg-Tj
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 06:37:06 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:46910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLk5g-0004s2-G8
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 06:37:06 -0400
Received: by mail-wr1-x436.google.com with SMTP id x6so2103190wrv.13
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 03:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=I/k2TCczcR5lDLIY20v63zm37NLeS0KATGySHM94PEw=;
 b=mR7tKR4RoBBrv5MkUy/l7HpFqg52fqBK7aGWPUa4w83i88zv0DiMYA52Es9Fhu1ubQ
 plhsAVtlcR7U/OoldTB6V7e911Bt48GVYx8u8QTGuIegwqTXSA48gL21dn12GkJhMHc7
 o77nUinVss8lCq5M71qLbMHmxYeCEaNJ1g0nriYmEBjJZTQhsDgmauW9UctIWKQqZ+xg
 k8Xr/DNButSZk1i0dqBAcbR+ktNFLbjMASfLtjb6qYtxSSeQsxZJwJTjyJcJ/wlx8o++
 URyO9Hb4iFPT7Av+7PaBtCAtgkI6zGuj/cvgq40k6OJV1vlFdlQyr+h1oKUmyPXj8Ml6
 aemw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=I/k2TCczcR5lDLIY20v63zm37NLeS0KATGySHM94PEw=;
 b=cg5NTMuVqNnEL4Me01hP/ZJ50KkwboeSt34GZy3LpIEsHz0Qe5MFamRdijijKBKfmm
 Y7XXunI4jfyz+0Mal8IvYW9MLRS4Y90APUkhE7NWqdMaqFO6fYUjPwbf5lnnUUjvSt4x
 r9d6dc0E2s69RvbJIfMdmf8zNodcCfKtOBjrakXwpJ2bwAhBtCOAdPdyE+J8z/iIW5UQ
 dwT2Btsawy3+RHCmPb8UF8wkuC+NqKitrpvtBMPCp3nX1u5aLwv6vSo1FZLnjjBzWjqh
 aymgQSBj+uk8p4Sq6cltkZfm8cfLs2x+g8iU7MAd8+ycbE1VlEMpYCRdtgx4+O3I/EtU
 u7TA==
X-Gm-Message-State: AOAM531quhiOyaeiqmSql8aw7U3ERY55gOv9wuDDaZF0ADU2wvZBBw05
 unvSNq0c4TIGgBedl/bx/wkHykdE+LNl/nNMaxrmDtp2GoOAJw==
X-Google-Smtp-Source: ABdhPJyBN31Tcew/d3O4H/5BMiLid1OXcT53AMzek05P8d32uG2hJ7+pbTfToSw14otZVZO2k2fBjLrCtiopsNhQL90=
X-Received: by 2002:adf:ebd2:: with SMTP id v18mr2997270wrn.248.1630579022716; 
 Thu, 02 Sep 2021 03:37:02 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Sep 2021 11:36:14 +0100
Message-ID: <CAFEAcA-W+cgapSFJ5+s8G-4VZiTWn-8pX_-ANJ+bWtTcH2Oziw@mail.gmail.com>
Subject: proposed schedule for 6.2 release
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Draft schedule for 6.2. This is just starting from "don't want
a possibly-late release to get too close to xmas holiday season"
and working backwards.

2021-11-02 Soft feature freeze. Only bug fixes after this point.
           All feature changes must be already in a sub maintainer
           tree and all pull requests from submaintainers must have
           been sent to the list by this date.
2021-11-09 Hard feature freeze. Tag rc0
2021-11-16 Tag rc1
2021-11-23 Tag rc2
2021-11-30 Tag rc3
2021-12-07 Release; or tag rc4 if needed
2021-12-14 Release if we needed an rc4

Opinions?

-- PMM

