Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 760643062A6
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 18:52:19 +0100 (CET)
Received: from localhost ([::1]:59132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4ozK-0002Om-IU
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 12:52:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l4ovF-0001Qo-7D
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 12:48:05 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:35694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l4ovD-0001a2-Ao
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 12:48:04 -0500
Received: by mail-ed1-x531.google.com with SMTP id j13so3498828edp.2
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 09:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JvJcjsp97GNmWZeAjZ2OQmVU2hY2JIuCbmgVft5xza0=;
 b=KF7jgWEvW0JsTh5uVMmb3GbFQfohpDfTZF1yhFEsbdcfPbA59uki6Xfu5qF3sEIID0
 NFaY/gmMm5LC+NedaLpYYyA1Mbdj1n103YjdRQnc/vQsfJ8JW6vvwuaO+BNTIgv5ib9K
 mGJQjZ1pyfzjxKlGj350XEo5Saqply7WFb1vAQE38JXo9h5+nVDP4keS3hsPUyjVw84x
 cdYQY/XXB87d/FjnKDwVMq6G5e76PykNkPK47xoao5dRSbroyGrSyjdDs53wrQbxdlI7
 XU9FykSqanjH/DiALSc9HnRa3g7nLFZW7dvc1ukMrgJQQ+DDvhmzYzuk3n4Zr4km4ZUv
 +bSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JvJcjsp97GNmWZeAjZ2OQmVU2hY2JIuCbmgVft5xza0=;
 b=gBAs8ddxXm7PfCSTU4A39Uv881u3w3nkbaS76lhBEdIzHvuSW4d+amTLjzl6zs2MIE
 07mmBuj5pFcGQpDwDqCoIlNiCbtCeSaoocUFl1czx8NTLMsFsJNIyuXbyGbu3r1GoKSJ
 EN/j1GYhg+KUn6d376puTudNzs1YeRzJV0Y+a5TodOaI4zJCDbOIuBPckoA3IAR6vZqQ
 8epcfbRwTEvC6hCHHfhfjvg94WcfNr36mCgUFrMdqVytM1p+LtHHYiVoouvi/z+Ol2VN
 6j84+bJvNyIulR42tWrUeVlaxkhvD9EJuKJI0TvFCvZCHmddZxmgao4ddSCDSzqx4rco
 pDJw==
X-Gm-Message-State: AOAM533ot3G9oqzZpF8wq8OBzQkYy/KL9ybKCiXJw/cvYmsAYaMjObHJ
 eh9yHmnXNlRP5y8Fue+16jvVsb9UIahjA7MzxYwgKg==
X-Google-Smtp-Source: ABdhPJx9yPqLAgVDAbd7LXVvbL8+u9lkZULRI1OfET25htVO7AJRI1+f0qAgzyB8XdL0OCalwNB6lmTpjPvJ+mFYn34=
X-Received: by 2002:a05:6402:1701:: with SMTP id
 y1mr9856556edu.251.1611769681592; 
 Wed, 27 Jan 2021 09:48:01 -0800 (PST)
MIME-Version: 1.0
References: <1611759570-3645-1-git-send-email-mihai.carabas@oracle.com>
In-Reply-To: <1611759570-3645-1-git-send-email-mihai.carabas@oracle.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 27 Jan 2021 17:47:49 +0000
Message-ID: <CAFEAcA9SBX-sT983TsiRu9TSBWrZDWe=LM5cAJNxmHxa5ud0pw@mail.gmail.com>
Subject: Re: [PATCH v6] Add support for pvpanic pci device
To: Mihai Carabas <mihai.carabas@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Cc: Yan Vugenfirer <yvugenfi@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 27 Jan 2021 at 15:46, Mihai Carabas <mihai.carabas@oracle.com> wrote:
>
> This patchset adds support for pvpanic pci device.
>
> v3:
> - patch 1: made pvpanic isa device available only for PC, compile pvpanic-test
>   only when isa device is present
> - patch 2: fixed device id to 0x0011, used OBJECT_DECLARE_TYPE,
>   PVPANIC_PCI_DEVICE, added VMSTATE_PCI_DEVICE, removed INTERFACE_PCIE_DEVICE
> - patch 3: fixed documentation
> - patch 4: add a qtest for pvpanic-pci
>
> v4:
> - added Rb/Ack on patches
> - modify test case to include -action parameter that was recently added and also
>   to be on par with the pvpanic ISA device testing
>
> v5:
> - added subsystem_vendor_id and subsystem_id needed for MS WHQL tests
>
> v6:
> - removed subsystem_vendor_id and subsystem_id as they are filed out by default
>   if empty
> - do not compile pvpanic-pci-test for ppc64 as we our tests do not support that
>   platform

Why doesn't the test work on PPC ?

thanks
-- PMM

