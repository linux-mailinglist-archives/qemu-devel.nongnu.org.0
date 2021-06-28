Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E10B73B5AA8
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 10:47:01 +0200 (CEST)
Received: from localhost ([::1]:60032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxmuz-0001kN-0c
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 04:47:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxmte-0000Kh-Rh
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 04:45:40 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:35747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxmtc-0008FT-V0
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 04:45:38 -0400
Received: by mail-ed1-x536.google.com with SMTP id df12so24679302edb.2
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 01:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=ABHeBk5ZzQcCsJg3O6eznLnMFv7C0HwfQNvqm42e+wo=;
 b=n03lJWlpn1TuVY0hxss389BKCORVkjbp4QpjQj9+1cCEyjBz6HqMdCZSoboECuTHCR
 mLmMxsqohKDin8OArha2DOFpdr5t6tAKYMb2T4W7my28iBGBbjT7INUuR9Od1RuG2wP0
 QD3uBongWoj+I5FEzy/fz3Jn2R+Ih8mhxMb936phfr0wiFQ8ohB53mtjbSeA3gzTXZFI
 nZYM66/9Ie3ht7BGisMIvVjc+GVNnLdCyJYKL5YxRFSSn9fv1rocJa/dYwmc0NT5P33u
 vSTlp3llt9rfPyl6T/aSq413IizZxu+WttRpwicekEaJUnDvgHh5Ex6Nfdn76WlbaVdu
 P3NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ABHeBk5ZzQcCsJg3O6eznLnMFv7C0HwfQNvqm42e+wo=;
 b=hR7alsFITc1vYXHtCbFRxnA1lDq17p07VPpSXoyQ9N6GgblhMRCxzO8GZz4163tDOK
 Sj4xnKpGXR+vAPsI1Fto2PyX5hqYXgVqZ/fzsgcxvcs7uERzezS1r0rWxdka1EFJ6rbF
 xS2+m2VVp3X7GOSgzH/asbmjE5r/ntmZsS6dHbXZdURNhlu7ZKYAA+96Dkm3mEUMDza4
 je36Orf0584u3p+k2laQ8/HEcOw1rTmu192XiI7bqo1X7dY6rwWc5H2E6bd1VabIH91X
 PMUOddYEdxkedoXGdqFyJSDS0ypfIKtQ8y7c39rO6TRV/x3z7uozELC2tCDPtLYLsUEq
 hGEA==
X-Gm-Message-State: AOAM5323DElZ9WA1KVWKCA8Hs+TItwuenrr8bV94u+JgKp2Yz30oJ01X
 OrZap7cPgG2kx1hIb9z9bb+MEjN3TblbKqB+G+h1agmaKpxuaQ==
X-Google-Smtp-Source: ABdhPJz20wFcy9jfwJ9qdLcBnXr6p3iZCiLz7qE6pYffIC9aRafpthg/EyU0F98MIKRmvD8Z/ZnetuR0yYp1wzu6NYI=
X-Received: by 2002:a05:6402:848:: with SMTP id
 b8mr31201852edz.44.1624869934120; 
 Mon, 28 Jun 2021 01:45:34 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Jun 2021 09:44:57 +0100
Message-ID: <CAFEAcA-AQaS9DFVwMQJMNBWzmAGo3diHq2M4H=uopJgmkg59hw@mail.gmail.com>
Subject: reminder: softfreeze in a fortnight
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_40=-0.001, DKIM_SIGNED=0.1,
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

Early reminder that softfreeze will be on the 13th July, in just
over two weeks' time. Please make sure that any feature work for
the 6.1 release has made it into a sub-maintainer pull request on
the list by that time.

If maintainers could avoid all sending their pull requests on
the day of softfreeze that would also be helpful -- it takes
at least an hour for a merge and test, so the number of pullreqs
I can process in a day is obviously limited...

thanks
-- PMM

