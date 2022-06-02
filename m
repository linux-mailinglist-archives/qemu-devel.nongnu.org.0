Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A254353BE1F
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 20:37:42 +0200 (CEST)
Received: from localhost ([::1]:57380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwphV-0001X0-8g
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 14:37:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1nwpgd-0000rx-4e
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 14:36:47 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:44999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1nwpgb-0008Mh-B3
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 14:36:46 -0400
Received: by mail-ej1-x630.google.com with SMTP id f21so11568129ejh.11
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 11:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20210112.gappssmtp.com; s=20210112;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :cc:to; bh=LpDXm5Eo6FCKADdWtGJ2stbsEy1PA6UP8u4eD9y7h78=;
 b=K2iqm1++a46feE+saGuMqRb6octLllkZLejCGbdcOc3OfBElxLO0fjA+FaU1+/aLJ+
 qoCZcawScjozHMD+FdnSaqD8Xpm7Po7DKFYfvn13WHstMTkgHqxQdQCKW+yFJhFBw4nn
 CevZZ+XPUDvwJ3LnBhImtJQLef8Up2SYT/fLF12VGMZ+aDzCs4NOiXXJOQJE5+jA5cGT
 4s6e19KynfIvIOq9IewepOuK51Dpr364uO+XcUgKXdmHTVZE9HiiJ0bS5g/7f92ELZ5g
 vMP+zwlLP6ladkpfVyCUwAgjCh7RXsGFmUbBx3ZF98H2EcbDXNpWSkSFOmJ/0EBFJqu5
 ShCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:cc:to;
 bh=LpDXm5Eo6FCKADdWtGJ2stbsEy1PA6UP8u4eD9y7h78=;
 b=a0g+KvJNSNuKyyId1Cj62ZuQHT0BRsDDlOcoo1LYkGUwg9XyS4aCsgbH3/4KC+RLMi
 G50/DPzMnheEblisvggj3HA/JW5Z1YOyLM9cRThpRAfnBRrmwyyl83tv2OFxTmLIM28A
 SIBZv9dm3brWuHvDSETTwC7vKBUvYKiZTG8JbAHVBJy5OIy0S2remAjqKpvuITj8akQo
 +wRvXV+yYa8lqooc4RhuAhQpoGmN0AmD6nkxI6AF3R7JOuAHIkZ3YDGWw60Td3oiBJr6
 4sAg7QjI7P0YxShD6M55FxtRT8p8cgiOqt1reDAIkUVUM5z0hvRkPWCzUMNNculGn+9O
 uVBw==
X-Gm-Message-State: AOAM532Zvqf9iVi8Hs5BkgPTqy57SVKhX2HZQgDf1WPfH2xTYXtaJvXB
 UoKnZ7A2eJVMr9CALM/jK/zODEVc7vd7dixJ
X-Google-Smtp-Source: ABdhPJyGnQsBe9ozwfvBRWAAlvxp48ruLdHDoud7f0s5S2IK3TM5AjjtDsWR+7myuFeTTnkx2XVcsQ==
X-Received: by 2002:a17:907:7f0b:b0:6ff:4502:9c2f with SMTP id
 qf11-20020a1709077f0b00b006ff45029c2fmr5573768ejc.532.1654195001118; 
 Thu, 02 Jun 2022 11:36:41 -0700 (PDT)
Received: from smtpclient.apple ([86.121.23.37])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a170906488400b006fea2035036sm1974405ejq.86.2022.06.02.11.36.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 Jun 2022 11:36:40 -0700 (PDT)
From: Liviu Ionescu <ilg@livius.net>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Subject: TARGET_SYS_HEAPINFO and Cortex-A15 memory map
Message-Id: <8F58FBA7-17C8-44F6-9798-A65FD63E0E78@livius.net>
Date: Thu, 2 Jun 2022 21:36:38 +0300
Cc: Peter Maydell <peter.maydell@linaro.org>
To: QEMU Developers <qemu-devel@nongnu.org>
X-Mailer: Apple Mail (2.3696.100.31)
Received-SPF: none client-ip=2a00:1450:4864:20::630;
 envelope-from=ilg@livius.net; helo=mail-ej1-x630.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

I'm experiencing some issues with the startup code for an emulated =
Cortex-a15 machine I plan to use for running unit-tests.

I'm starting QEMU with:

.../qemu-system-arm  "--machine" "virt" "--cpu" "cortex-a15" =
"--nographic" "-d" "unimp,guest_errors" "--semihosting-config" =
"enable=3Don,target=3Dnative,arg=3Dsample-test,arg=3Done,arg=3Dtwo" -s =
-S


At 0x0 I'm loading the application that uses the newlib semihosting =
library and startup.


The application starts and I can use GDB to step into the code from the =
very beginning. In crt0 the first thing I see is a call to SYS_HEAPINFO, =
followed by setting the heap and stack.

The values returned are:

0x04000000 - heap base
0x08000000 - heap limit
0x08000000 - stack base
0x0 - stack limit

This sets the SP at 0x08000000, which I'm not sure it is a valid memory =
address, since writes to it seem ineffective, and in the first function =
called, when it tries to pop registers from the stack, everything is =
zero, and the program jumps to 0x0.

I'm not very familiar with the Cortex-A15 memory map and initialisation; =
if the memory below 0x08000000 is indeed valid for a stack, probably I =
need to enable something more during the reset sequence, to make it =
writable.

Any suggestion?


Liviu





