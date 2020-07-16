Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AA12220FD
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jul 2020 12:54:27 +0200 (CEST)
Received: from localhost ([::1]:46206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jw1X0-0005hu-70
	for lists+qemu-devel@lfdr.de; Thu, 16 Jul 2020 06:54:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jw1W8-0005H5-4s
 for qemu-devel@nongnu.org; Thu, 16 Jul 2020 06:53:32 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:42913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jw1W6-0007pH-Cr
 for qemu-devel@nongnu.org; Thu, 16 Jul 2020 06:53:31 -0400
Received: by mail-ot1-x335.google.com with SMTP id g37so3817594otb.9
 for <qemu-devel@nongnu.org>; Thu, 16 Jul 2020 03:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=YWDoMgHNaVYeHJcJaTCk8pBb2XWtIFpW1YzUaCrZHpw=;
 b=iekLW93tKxV547XiB8YGI03JNQbxI0OD+ayXR3Aws5Mo4Wa1ELfL+eOyXoSEsVSp31
 aG2EwyDJyIbLgu54ajz5UIoAUaTgFM2mAeA3QGNcXv2mzEoMSmJRgcU1Hz6I/eDEuToh
 FR/CHgTdBP6N3032zKO1oK0fKBLOXhUqXSHbBSIJyTkb0dl2P7cNZA9zgHZhyggEPCaM
 2Ze3KIixVr0k3pIyr+AW4oe5gHci+w+J1cnBKfuPquED+SaDGuNYZ2ZAGv1vy+zdRZMJ
 XRaZ8F+a5SvBmpiKncWNnSviLzjimgmhHRVTW6xrkCoY7TGS/2+VLbC396dRZCV6ffiL
 knXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=YWDoMgHNaVYeHJcJaTCk8pBb2XWtIFpW1YzUaCrZHpw=;
 b=XN4gyaMfnWY4a0+eg00wbpLbj+bwMXxroptG7rhAOIHM2wiLdtfdbwobcovBAS0c43
 zrc61JYlFzH6DWFEZ4BLvbFGJIlZ4E2fxQ12bV2HWHR3BtWn3NNBdVjKKfF491Fqdp1B
 j8eP2lD00YR7T+Bkaw536Zv1LdYFCNZN3Cuyd0HnQp8uGzseI0P+wAWgMEkbz+cE6ZJQ
 gjW7VPn+tE8MAJc0ff78BUATxF+ifgymiWTUNrblnAb0EOhwjGl/Jt0662d5Z5jHLCHe
 OPbc9TAMwLQs4ndmOy0s6fjFuiH1ENAv3hdMpZ4WdWKJmXkcXUJsyo+4yPsjwidiYTEK
 OWmA==
X-Gm-Message-State: AOAM530NScm5Tukl/ha3/SC3Y7nAFWcwlIc09u57OsCsvS0N/luCt5sm
 kTver1BGO6/OWyd7tqUKN2K6iDFPwshxiLCw8/iN7Qm95Wk=
X-Google-Smtp-Source: ABdhPJx8s6r/yJoYB2P+LMOhLKpowINKuPejjSbiyEEbnCrGaEIzim8ro5159dbLANW+WDkTI/ws9oGfUSFjBdSYdUI=
X-Received: by 2002:a05:6830:1bd3:: with SMTP id
 v19mr3794997ota.91.1594896808696; 
 Thu, 16 Jul 2020 03:53:28 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Jul 2020 11:53:17 +0100
Message-ID: <CAFEAcA-reu8gKpBMgEffStTRA+M02OWj75riXqBYXjgtOh5Z_A@mail.gmail.com>
Subject: qemu test-qga failure on mergebuild after VERSION file change:
 dependency issues??
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x335.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The first merge I tried to process after bumping VERSION for rc0
failed on test-qga like this:

MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
tests/test-qga -m=quick -k --tap < /dev/null | ./scripts/tap-driv
er.pl --test-name="test-qga"
PASS 1 test-qga /qga/sync-delimited
PASS 2 test-qga /qga/sync
PASS 3 test-qga /qga/ping
**
ERROR:/home/petmay01/linaro/qemu-for-merges/tests/test-qga.c:303:test_qga_info:
assertion failed (version == QEMU_VERSION): ("5.0.9
0" == "5.0.50")
ERROR test-qga - Bail out!
ERROR:/home/petmay01/linaro/qemu-for-merges/tests/test-qga.c:303:test_qga_info:
assertion failed (versio
n == QEMU_VERSION): ("5.0.90" == "5.0.50")
Aborted (core dumped)
/home/petmay01/linaro/qemu-for-merges/tests/Makefile.include:659:
recipe for target 'check-unit' failed

Looking at timestamps on files, tests/test-qga.o never got rebuilt,
even though config-host.h has been updated (and so has the new
QEMU_VERSION). Any idea what's gone wrong here?

Also weird: this build tree has no .d files in it.

thanks
-- PMM

