Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CA22FBB8D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 16:49:28 +0100 (CET)
Received: from localhost ([::1]:35682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1tG2-0008Au-Sz
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 10:49:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1tBw-0006Jz-8s
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:45:12 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:38871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1tBu-0006GN-1W
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:45:12 -0500
Received: by mail-ej1-x633.google.com with SMTP id 6so29144499ejz.5
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 07:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ujqAu+qy705D++h5maGhyZgN9Hoxc5YpLe5sR8KbnZw=;
 b=lyvZTRm41cWCayQWdY4UTUp+hzIOby6zbZlto66HwxMuTXkT3OdebcDWOstAfBOXWl
 7ZbNINbuj9rtXSdkoVwbmlOJO2DlkxKcv5a/dcHTd3VJBea0bRX8rq1tA08O61AnYtK5
 OVKuCoRUUMAes52ApYNdDkNNKUvakZIXbxaU49Xs/+uhRQ1AvrTj+5dItPEdPN8KFi9h
 slMTjpRQwShn93JHNLcnjkEHbfkDGst5VmbXNy42X8jey4YWVzsOv/7t53BlNCHV8ASs
 Pv8+Z8TDrRG2isT0J7eCmvP4Hmw8jzEK5AXjVhkY/Z0S6ixBGfTSU3Jllck24Sq1Qlyb
 sOPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ujqAu+qy705D++h5maGhyZgN9Hoxc5YpLe5sR8KbnZw=;
 b=qF9hWo5fP2sQwVmCkoNZ18GI1MVhYi3MOd6ipQLtUijWK5hAxtV5GgaVowcXn5ZfAS
 G1Ysrht/alk35eqk4rng1MWhqHbzh+xsUYyS4jjbYVv5D5H40MiPCKuXs/WHNlTSM6cK
 Xho6cU2DDvSkTxpiKemRmhEmBZNlyPBIM2aGYkPqyLiModesdhCe7lTv9qWWHpAUjvoN
 CoCVvYnP3JGyOdErx+HhywOsG95Ur3AyuTffpQxTgcBvfPwNiIb4MEglaB9uq88VBLBf
 cmoviJbgA7Rhio91QZZTGq4N65PNZpq/cEuoWXt9sN3Mg3PzNl5Cej1LP9KO8/NOgbOK
 77Tw==
X-Gm-Message-State: AOAM532XqceilwRCWzL6Wu0cWWQ+sxeRu0IkEnFNJRG9nGV3rb0VuqA+
 NnMHrbrpjo9ePINoAjlC/daL2PZChcXzPmuhFgIuCg==
X-Google-Smtp-Source: ABdhPJweRjZ5ypc3rg+KaMaHgVWU+jEqpWbT44S586s5DNgFe2ENA9FmivtsaDGNPJy2TxHDN4GTM6wktXLEfdDUghM=
X-Received: by 2002:a17:906:4bc2:: with SMTP id x2mr3324875ejv.4.1611071108576; 
 Tue, 19 Jan 2021 07:45:08 -0800 (PST)
MIME-Version: 1.0
References: <1610735646-13313-1-git-send-email-mihai.carabas@oracle.com>
 <CAFEAcA-0J_kH5NMjQFOBMRFxVcjAzPy5iT16BkF20xPwb4hQVA@mail.gmail.com>
In-Reply-To: <CAFEAcA-0J_kH5NMjQFOBMRFxVcjAzPy5iT16BkF20xPwb4hQVA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 15:44:57 +0000
Message-ID: <CAFEAcA_-oGJwEU3SRjR5hiU6ermU4ZqoLuHurparzPVJ=QWd5Q@mail.gmail.com>
Subject: Re: [PATCH v3] Add support for pvpanic pci device
To: Mihai Carabas <mihai.carabas@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 19 Jan 2021 at 13:29, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 15 Jan 2021 at 19:21, Mihai Carabas <mihai.carabas@oracle.com> wrote:
> >
> > This patchset adds support for pvpanic pci device.
> >
> > v3 applied feedback:
> >
> > - patch 1: made pvpanic isa device available only for PC, compile pvpanic-test
> >   only when isa device is present
> >
> > - patch 2: fixed device id to 0x0011, used OBJECT_DECLARE_TYPE,
> >   PVPANIC_PCI_DEVICE, added VMSTATE_PCI_DEVICE, removed INTERFACE_PCIE_DEVICE
> >
> > - patch 3: fixed documentation
> >
> > - patch 4: add a qtest for pvpanic-pci
> >
> > Mihai Carabas (4):
> >   hw/misc/pvpanic: split-out generic and bus dependent code
> >   hw/misc/pvpanic: add PCI interface support
> >   pvpanic : update pvpanic spec document
> >   tests/qtest: add a test case for pvpanic-pci
>
> Since the only issue in this version was a minor thinko in
> the docs, I'm going to apply this to target-arm.next and
> make that s/device/bus/ docs fix there. (target-arm seems like
> a reasonable queue to use since the main reason for having
> this device is for the virt board.)

It turns out that the new pvpanic-pci-test fails for i386 targets:

Running test qtest-i386/pvpanic-pci-test
**
ERROR:../../tests/qtest/pvpanic-pci-test.c:46:test_panic: assertion
failed (qdict_get_str(data, "action") == "pause"): ("poweroff" ==
"pause")
ERROR qtest-i386/pvpanic-pci-test - Bail out!
ERROR:../../tests/qtest/pvpanic-pci-test.c:46:test_panic: assertion
failed (qdict_get_str(data, "action") == "pause"): ("poweroff" ==
"pause")

So I'm dropping it from my target-arm.next queue; could you investigate
the issue, please?

thanks
-- PMM

