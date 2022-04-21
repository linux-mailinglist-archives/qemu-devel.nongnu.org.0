Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA6150A5E0
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 18:36:44 +0200 (CEST)
Received: from localhost ([::1]:46672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZnP-0005Nd-HJ
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 12:36:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhZ6H-0002ye-Uo
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:52:09 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:39665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhZ6F-0003XT-E4
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:52:09 -0400
Received: by mail-yb1-xb33.google.com with SMTP id r189so9508302ybr.6
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b1mXaliziQ4QK5PQFEfodQC8x08R4WWLdmuklnWImV0=;
 b=ESCEcmys7QjpxE9JvTPMLCv9hn8DVKTSueXLHhYh5TaJfNFB8lBS4+B2Soz4ZttdKx
 3urBiMQFp1d0feE3FiwSnHqHHFUusRvdZH6Gb/0FuS0W6tjn1tr5SRBCEJaJg9zld8XP
 V5rPQkQe6JctonyCGEOxbrqO5cyPXXRBzI0/yJZAm8NIZxVbTW3W8XzPUOR7kjl5FmpG
 2eIFofM4t0pg02PTAA8fpWlWcogMDKysrbXhK2baBBIARxJeMuP8q1Wlmzl+0VvLADAQ
 pVCtTjOBDbmhjEsl1mO4jUY9o81echhtEWpKL13VpTUo+PpmxRpWIUQpdXxECPJCyNH9
 UeRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b1mXaliziQ4QK5PQFEfodQC8x08R4WWLdmuklnWImV0=;
 b=1BIX6lufRL0W2t+deBoiq4TVjpY/u0kyBtWA4Z9yh81iowFOP5DqwetMWB9MXYBFQQ
 Gpz09rwYSSEIy8CQWBUtjGw1Te7Nde/BVWgy07lMZDiDbgz17qXcgrc4LKzipLfp20ev
 ZjkzzOAo7Iijng/IvoGDSAXRidEPz3CoBQsjZycixOAwsvaVc3YyQCU+DCHLm1oJFTiW
 GaG5I4a50oSQ1Nf+b/lC2fVTKe+IR/wqMUHHDaGnLJ46GYyNcj4TKULvZbKKvoIRMuZE
 Ts09IeYTK9ADYqYyKbXdeU8ZisEou+ksC/QRok+X3LP+sTIJpH9VBzwIGpF7ZrU73sMJ
 qb+Q==
X-Gm-Message-State: AOAM533CykCcX2iuh1ELNbW59EmpwPEaHA9jRWQSL6YMcw0/89TfTOJ7
 TcQ2GWkuO4GePRfpf78mJo7vyzXh4XQUgEaEIBv79w==
X-Google-Smtp-Source: ABdhPJyx0g/PGsALkiCn9SGbhRD9+UPHgxirv4jcN1Bc4yXBfwzmHqVURHIF/h6BR3WnVvM27apU05tswaywt/cYYME=
X-Received: by 2002:a25:cf4d:0:b0:645:755c:a5af with SMTP id
 f74-20020a25cf4d000000b00645755ca5afmr345447ybg.140.1650556326375; Thu, 21
 Apr 2022 08:52:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220330125639.201937-1-damien.hedde@greensocs.com>
In-Reply-To: <20220330125639.201937-1-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 16:51:55 +0100
Message-ID: <CAFEAcA-RW411mWCQOu03i=LaPHRm1F6R3Z9bquBDJPhv-ZxWGQ@mail.gmail.com>
Subject: Re: [RFC PATCH 00/18] user-creatable cpu clusters
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 mark.burton@greensocs.com, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, qemu-arm@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Vijai Kumar K <vijai@behindbytes.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 30 Mar 2022 at 13:56, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> Hi,
>
> This series add devices to be able to user-create (coldplug) cpu
> clusters. The existing cpu cluster dictates how cpus are exposed
> in gdb, but it does not handle the cpu objects creation. This series
> adds a new device to handle both issues and adds support for two
> architectures: arm and riscv.
>
> Please look at patches 2 and 3 for more details about the new device.
>
> Last part concerning the riscv is rfc as I do non-backward compatible
> updates. I'm not sure what migration (or other) constraints we have
> on these machines and I probably need to make some changes to cope
> with them.
>
> This series almost deprecates the cpu-cluster type as all uses
> but one are replaced.

I don't think we should have two different concepts which
are "a group of CPUs". It means we wind up with two different
ways to do something (which we have too many examples of
already), only one of which gets to use the nicer, more obvious
name.

The stated motivation is to allow user creation of CPU clusters,
but I'm not sure how this would work -- CPUs need a lot of
things wiring up like interrupt lines and memory regions, which
you can't do on the command line anyway. Do you have an example
of what the new code lets you do?

thanks
-- PMM

