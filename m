Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9FB489671
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 11:34:47 +0100 (CET)
Received: from localhost ([::1]:35890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6s0j-0003Jh-VF
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 05:34:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1n6rzk-0001ws-6Z
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 05:33:44 -0500
Received: from [2a00:1450:4864:20::536] (port=39835
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1n6rze-0006Ab-Eu
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 05:33:39 -0500
Received: by mail-ed1-x536.google.com with SMTP id c71so40074785edf.6
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 02:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=OlsCv2pCNwMn/HscO6259ckh162XNIRWJD4xd2IjemM=;
 b=1oJI4FMjE9xAnhgPw6ktmyXpwWR2CBXi58angva9XlZmPoU4kwd4mccle2Q+mRlBNS
 NS6LKTZptnyLhZC7LjVfBDx9DaOB7OxVOnaz2Ogug/Ny+6KTf6bUI1B2h62KYCFOADAS
 qiwgu3dJEQ38Nh+chrb48tibYc7u92ESaOi9YNZE9L+bRyX/waQeRXu17QK0GMKgzf3w
 y/uN+T+DxehL4HMurb+CWh7PyW4V74B3wW4SAW05x780mN+qJK3tefT++eWDcnGtOahC
 rpqH0rC1ROXNaBOaxcQfzJkT4/rCeErI0QsPYeCUNWjmGsVFkbkdKvDRUrsfAdKidbMs
 Lqhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=OlsCv2pCNwMn/HscO6259ckh162XNIRWJD4xd2IjemM=;
 b=d7Ha/pUsAjINv2Q9k11s/K0UEu42/E7tLY8u7VDnkgz3AVnM1KgjxoWECcCv/UxLcr
 3nsQl5aSAE6raU0Ek9hHx1vKv433bDTYgMVp8cRexmrdPZ3PKd7EIq7Dec2IUmnNJgJM
 7NITaic5o0x9pz26vBhQrorJBuMeIXk0aX6luHnx18VsfNFwMHdMnMw//aPE1o+Gznff
 Oy2/BgH6G1JN0JW5SmbzdEch1BB5tr34Ty5A/x9cc73xc4wzt7TKo7zDuF/fidJDOqyx
 54fLGsl9/khOcv4KVmyVqrpNTRfmpTn2efswdtVU6OakN2rWgCf9xe6QB4IwH25+AOxf
 cgeA==
X-Gm-Message-State: AOAM5313KCWoiRKTbkGu5OVfBez1v0T5ZCip5jViKq8xF982VrAfki7x
 uUERRwjeoQld9meOR++MhrPXrg==
X-Google-Smtp-Source: ABdhPJxfIiGkVqOfRPH1kHNWgl6f39MrZUe5bCReTUKd9gtJJXf/Ry/XDnBTRyr3vBP9Ry9KyJiXcg==
X-Received: by 2002:a17:906:7314:: with SMTP id
 di20mr62262281ejc.187.1641810816764; 
 Mon, 10 Jan 2022 02:33:36 -0800 (PST)
Received: from smtpclient.apple ([79.115.178.1])
 by smtp.gmail.com with ESMTPSA id 20sm2268783ejy.105.2022.01.10.02.33.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Jan 2022 02:33:36 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: ui/cocoa.m compile error (Cocoa -> SDL)
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <F140E9AC-F44C-44A9-8670-F60E33046B83@livius.net>
Date: Mon, 10 Jan 2022 12:33:35 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <574D1950-B892-430B-A450-23262C258950@livius.net>
References: <586FEC07-844C-4E1B-88E0-93B97FFC9010@livius.net>
 <CAFEAcA_=jn1G==9R1=LuU7GF0=LWPz92f1Qx9xO7w+m+TqL1Tw@mail.gmail.com>
 <F140E9AC-F44C-44A9-8670-F60E33046B83@livius.net>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::536;
 envelope-from=ilg@livius.net; helo=mail-ed1-x536.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I now have successful builds on all platforms, including on macOS 11 =
with Apple Silicon and macOS 10.13 with Intel, but I had to disable =
Cocoa support, and enable SDL support.

The resulting binaries (qemu-system-arm/aarch64/riscv32/riscv64) start, =
but I could not tell if the lack of Cocoa in the macOS builds has some =
disadvantages or not.


Are there any emulated Arm/RISC-V machines that use graphics, so I can =
test my macOS binaries with?

Liviu

=20=

