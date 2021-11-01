Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C09D2441CEB
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 15:55:28 +0100 (CET)
Received: from localhost ([::1]:58910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhYid-0000e7-Bz
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 10:55:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhYhD-00085b-Mk
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 10:53:59 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:42589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhYhB-0006Vm-J1
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 10:53:59 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so124269wmd.1
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 07:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=qeDtfNOk50b8zfKsoMU5UUCZejSLL6AzZ8VdyD/Gh7E=;
 b=UnUrGYT+7BXGc9/TfBpwldGuEzbMMMLhRULLftS7CGnXfGXuCMaoMpWlaJGQATgVtt
 fTLQONB3ojXdix7heEIplX8aWO4TlYPxoi8VwwyVmijDJIi5jSdraoPrEFgEUmrZZ5WN
 mPAqIQrWPWCsDDzG158CWnUOdzRH46jlQTiH6Edp9zg/SuOexjZt98qtT2TOsTMMpbxb
 RuzhNQ3J/nw8DHYOMLgIel1cPipO093+kvZIkEaHew+30ctR6XfViwBgPjMbR/imhMy4
 EqauJE19EpQxVvUErmUeukKH1YE67NC9whEJHVzzEZdgfi1DPcoulCEg2ejrxxsEpbgt
 Clww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=qeDtfNOk50b8zfKsoMU5UUCZejSLL6AzZ8VdyD/Gh7E=;
 b=bGMtW4vsrg5+fodqZKbv7KT42HSGYmvapNvFS8U5JZix1+lFhXL7oNGOFOLnjKa4QG
 o2h8XZlkD+b/VC4y+gyM4tWP/+BEvZiVEHmHI9Rv0wx6/u+FLO9CEWAV0Kdu6qyiH7dC
 R8nTQpcZPqq46iw/q3stPd4XEdenov7iYBquUdLphIlBBgYb+Y5F4yPqrYRbFsRj0UOo
 F6x25pMGpMqT26Li1qFBrnHrvoJpoKngRlOof2hgM7U3C5EtyOPOWnyBbLrdBESdVr42
 XMN/LxHnx8MEwxqnB1KJrLd3hEY4+GD4ucc7RASedC9+LB4gwyD+i2GMZW5abPBE3xol
 rdGA==
X-Gm-Message-State: AOAM532WDVw9G/fK/dMIjcpYYkhWAk5XWdU4ZbWA8BZW7X+yjZfD48vi
 lJjCVbbcGqKR4ScY2KfimMXw3xt5APcFPkfNj14hxwv8pJ5DtQ==
X-Google-Smtp-Source: ABdhPJzkGcv0VsO5hIHe36lkYilRpr+OK+1edOCcPuLAwnKE+wLKMT3cc5ZgsiSFH2KKGwvn8u951ZobiTZykp84maE=
X-Received: by 2002:a05:600c:198d:: with SMTP id
 t13mr39978305wmq.21.1635778435368; 
 Mon, 01 Nov 2021 07:53:55 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Nov 2021 14:53:44 +0000
Message-ID: <CAFEAcA_UiCrYEkv3uC_6VD9mY3jzKY+ziKTxSE4ydDbHd4U5vw@mail.gmail.com>
Subject: meson complains about "broken python installation"
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At some point in the last month a meson change landed, and now
when meson runs it complains:

 WARNING: Broken python installation detected. Python files installed
 by Meson might not be found by python interpreter.

There's nothing in the meson log here that says what it's
complaining about:


Build machine cpu: x86_64
Host machine cpu family: x86_64
Host machine cpu: x86_64
Target machine cpu family: x86_64
Target machine cpu: x86_64
Program sh found: YES (/bin/sh)
Program python3 found: YES (/usr/bin/python3)
WARNING: Broken python installation detected. Python files installed
by Meson might not be found by python interpreter.
Program bzip2 found: YES (/bin/bzip2)
Sanity testing C++ compiler: c++ -m64 -mcx16
Is cross compiler: False.

I didn't pass any --python option to configure, and this is
a fresh build in a newly created build directory. Host is
x86-64 Ubuntu 18.04.6 LTS (bionic). /usr/bin/python is
Python 2.7.17 (which we do not use) and /usr/bin/python3
is Python 3.6.9.

Any idea what meson is complaning about ?

thanks
-- PMM

