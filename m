Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCAE3F2DA5
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 16:05:56 +0200 (CEST)
Received: from localhost ([::1]:34636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH59e-0003eo-TT
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 10:05:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mH58E-0002ft-Os; Fri, 20 Aug 2021 10:04:26 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:38434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mH58A-0007F3-QF; Fri, 20 Aug 2021 10:04:26 -0400
Received: by mail-yb1-xb29.google.com with SMTP id a9so15580049ybr.5;
 Fri, 20 Aug 2021 07:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=8h7JjufK+JwrWnYaRBwZ+TfeavZ1tBzQ1buhLmNQFGM=;
 b=u2j2gXQbiWi+gg4UCU+mkqt1tWfi+BsM2PmZrv8xgV+qRG+wDgr/x6tih5UVV+Y08/
 /caeoduaEGv6cdj1KSjFwUdmPXrCFB5gaLqDGoxI/zZsF/Gk8WJOU6zfn+3ZnZOCEZuj
 xxiLrIwepa+FyTwXK1JdiOUzJqZVO+DAw1VlxUK9kFNTNdr0xFUkkaqMJMD8jWW0kqG/
 /TN5EV7nsicahSM4FBwS1J5vfeEtgrMinyx64jBMGAnYYKZBfu2bLclT6PY0SdE7jxtw
 fsCAg2+nJ+j/V1loMJ/u4bTJnOvqUm+4KqcPfqSmSKunHcPSpLZENBIBHhOnlnBqK7Hs
 1VZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=8h7JjufK+JwrWnYaRBwZ+TfeavZ1tBzQ1buhLmNQFGM=;
 b=tx85fHJlkhDFEWTW5g94xL9YGHSuIIbbI3Tzca8hfS2RRjd5/xk4F+GVpzQbbCyjn5
 wmC3RVIF4fQ4U0Okl8IgKB2KNVS3TwJsL8BYYXpgvLrm2p6vhkHrIEjoYP7RN9r+Srvl
 QpyvFmr2z2PZfCEEo7HvNYXkQAkss8Wk2DeuP2UGA/LZMActv5CwZR5xQ32hzUwLIqfh
 iaXGelCBLFG4jr5RicWfIXEJOgH3HyJ2Dm9u0Ka0oqUtau782BUk0cjcCueDQaJkkmVZ
 /YYl3mFx+dYLcqg8hDde8K/enb0TehhZEBlplvWa8ncQTJAnu/oQnLiRdQaa0fVWoJDr
 toeA==
X-Gm-Message-State: AOAM532ZDVDQlMZyfHlyPAtCTC319eLqGQ/okFQISBw0ybwbPD2uNbSF
 rIYiCvfLgbW3wAm9fpbCLr2uJ1/PnwXEQQNSe5E=
X-Google-Smtp-Source: ABdhPJxMp0fI8YNX4TkkJDapk2akz3kg2Rg2Ix/fQdzvrP6+9pa/7kSOZPKN+drIGecFHBJxchxS1ZZ7zSacTESxW/M=
X-Received: by 2002:a5b:304:: with SMTP id j4mr25132060ybp.314.1629468260261; 
 Fri, 20 Aug 2021 07:04:20 -0700 (PDT)
MIME-Version: 1.0
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 20 Aug 2021 22:04:09 +0800
Message-ID: <CAEUhbmUhKFFxSspve+t2BeppCGPegpb_Z5g-w8M5t-JMLy3Zsg@mail.gmail.com>
Subject: xilinx-zynq-a9: cannot set up guest memory 'zynq.ext_ram'
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Hi,

The following command used to work on QEMU 4.2.0, but is now broken
with QEMU head.

$ qemu-system-arm -M xilinx-zynq-a9 -display none -m 40000000
-nographic -serial /dev/null -serial mon:stdio -monitor null -device
loader,file=u-boot-dtb.bin,addr=0x4000000,cpu-num=0
qemu-system-arm: cannot set up guest memory 'zynq.ext_ram': Cannot
allocate memory

Any ideas?

Regards,
Bin

