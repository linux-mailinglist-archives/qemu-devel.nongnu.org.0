Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 165064421B0
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 21:32:57 +0100 (CET)
Received: from localhost ([::1]:46088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhdzD-0003Vc-L3
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 16:32:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kettenis@xs4all.nl>)
 id 1mhbtv-0000E5-4Y
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:19:19 -0400
Received: from sibelius.xs4all.nl ([83.163.83.176]:53746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kettenis@xs4all.nl>)
 id 1mhbts-0006XF-AG
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:19:18 -0400
Received: from localhost (bloch.sibelius.xs4all.nl [local])
 by bloch.sibelius.xs4all.nl (OpenSMTPD) with ESMTPA id c7a07be9;
 Mon, 1 Nov 2021 19:19:06 +0100 (CET)
Date: Mon, 1 Nov 2021 19:19:05 +0100 (CET)
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: =?utf-8?Q?Fran=C3=A7ois?= Ozog <francois.ozog@linaro.org>
In-Reply-To: <CAHFG_=X1DeBFkzwFBkirMkmHB0_OSa9OkQj+CvpG6dT5HZEWBA@mail.gmail.com>
 (message from =?utf-8?Q?Fran=C3=A7ois?= Ozog on Mon, 1 Nov 2021 09:53:40
 +0100)
Subject: Re: [PATCH 00/31] passage: Define a standard for firmware data flow
References: <20211101011734.1614781-1-sjg@chromium.org>
 <CAHFG_=X1DeBFkzwFBkirMkmHB0_OSa9OkQj+CvpG6dT5HZEWBA@mail.gmail.com>
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Message-ID: <d3caa60fcbd1a482@bloch.sibelius.xs4all.nl>
Received-SPF: softfail client-ip=83.163.83.176;
 envelope-from=mark.kettenis@xs4all.nl; helo=sibelius.xs4all.nl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, trini@konsulko.com, albert.u.boot@aribaud.net,
 yamada.masahiro@socionext.com, xypron.glpk@gmx.de, sjg@chromium.org,
 ilias.apalodimas@linaro.org, qemu-devel@nongnu.org, u-boot@lists.denx.de,
 vanbaren@cideas.com, morpheus.ibis@gmail.com, bmeng.cn@gmail.com,
 bill.mills@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> From: François Ozog <francois.ozog@linaro.org>
> Date: Mon, 1 Nov 2021 09:53:40 +0100

[...]

> We could further leverage Passage to pass Operating Systems parameters that
> could be removed from device tree (migration of /chosen to Passage). Memory
> inventory would still be in DT but allocations for CMA or GPUs would be in
> Passage. This idea is to reach a point where  device tree is a "pristine"
> hardware description.

I wanted to react on something you said in an earlier thread, but this
discussion seems to be appropriate as well:

The notion that device trees only describe the hardware isn't really
correct.  Device trees have always been used to configure firmware
options (through the /options node) and between firmware and the OS
(through the /chosen node) and to describe firmware interfaces
(e.g. OpenFirmware calls, PSCI (on ARM), RTAS (on POWER)).  This was
the case on the original Open Firmware systems, and is still done on
PowerNV systems that use flattened device trees.

I don't see what the benefits are from using Passage instead.  It
would only fragment things even more.

