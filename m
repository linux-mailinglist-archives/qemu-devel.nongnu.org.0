Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1575308A1C
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 16:58:30 +0100 (CET)
Received: from localhost ([::1]:36864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5WAH-0007aF-QZ
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 10:58:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5W9D-00077b-4i
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 10:57:23 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:40267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5W9A-0007S2-Fo
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 10:57:22 -0500
Received: by mail-ej1-x630.google.com with SMTP id gx5so13705987ejb.7
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 07:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=2/w41F1zZcROWzzqplJ18/6WH43Ow+8RxnfOHHTuweE=;
 b=cqKoJkdCVyzyN5FNn6tmrxIgVYkpZtUx7CYSKLQSm2QezqqW/JHDVgZ8I8HTSpLw9u
 wil51kuHzADei6pXF7ejaBWgwN/1OpaSfRiEguogRRSJyf0LHDOYfe6NjO9EUQfjwOB1
 LVp7/lJoz1GTmoX1OFLYVrwK2oIBtou/tSF2memOfpNF9F+eJlb+pnfNp3rVhYhJOpAc
 Mf8mwME+SPiEkbkcYSS7C+yuXHuFilO97typ9V5QgA+qkaMPb5xM6HKQRCkVMqTy4L2u
 IqEVxFSYwkhgv72a1TIzGulEJO+rMSy0vbsqQV9V1NuXLHH/LQLSnF/3jSwW/RJ3VrXk
 65Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=2/w41F1zZcROWzzqplJ18/6WH43Ow+8RxnfOHHTuweE=;
 b=SoVjQ7gnFMEecJO2SKm1oAFL4v+sKX+EYWdLj4KXPGA6IpjfUH2kjvM0bNtk8iCnPt
 NJqzEreRgSdF9ZhH+IZkEywAQfwRHHmOi4SwHD2qeg2ydm2VEV1t0XIsH0OYKmSeNieU
 lrQ45ztp1WkYUf+ltGX+cpc37BRkQUt2V+BctIiBSO2zCHR10+sx975oetvbJaLBAQsl
 epuCnOK2pEKTLgsA4z75YD11nZJr7yMXqSx4/Sux4OO+Cwrv/YYSG5mf0pMa5BrqBpLD
 kA1umCwzsoZUIXNEv+4DTkdyK/A6+ekL9xbQLtLimcuj/4B40RDC1HyB3y+4uUBOno78
 gDKg==
X-Gm-Message-State: AOAM532ZsRnpbqEDC1OG9jF9V9Z+t2HpqHUf1wUSz+r+F+ftmMaWhN7Y
 uXvjCkRBuBqmrEdqx0mxE0GcXhFbE/zhiI/wRaB65LK2zx3eDw==
X-Google-Smtp-Source: ABdhPJy9IaA7iqcuHoEwPbykyhKzAC5257KMpiKZI/SK67SbnZF5/1+HETEegE/kYzfz+Qztdisa+rq1PU8WgBLjlrQ=
X-Received: by 2002:a17:906:3603:: with SMTP id
 q3mr5108897ejb.382.1611935838947; 
 Fri, 29 Jan 2021 07:57:18 -0800 (PST)
MIME-Version: 1.0
References: <20210129110012.8660-1-peter.maydell@linaro.org>
 <20210129110012.8660-22-peter.maydell@linaro.org>
In-Reply-To: <20210129110012.8660-22-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Jan 2021 15:57:08 +0000
Message-ID: <CAFEAcA-J+4pJ=dR+-o=3Oyat6t2_UT6u0+q+vbmMdnrfx0WJSQ@mail.gmail.com>
Subject: Re: [PULL 21/46] tests/qtest: add a test case for pvpanic-pci
To: QEMU Developers <qemu-devel@nongnu.org>,
 Mihai Carabas <mihai.carabas@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 29 Jan 2021 at 11:00, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> From: Mihai Carabas <mihai.carabas@oracle.com>
>
> Add a test case for pvpanic-pci device. The scenario is the same as pvpanic
> ISA device, but is using the PCI bus.
>
> Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
> Acked-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

This turns out to trigger the oss-fuzz build's leak-sanitizer:
https://gitlab.com/qemu-project/qemu/-/jobs/995177788

> +static void test_panic_nopause(void)
> +{
> +    uint8_t val;
> +    QDict *response, *data;
> +    QTestState *qts;
> +    QPCIBus *pcibus;
> +    QPCIDevice *dev;
> +    QPCIBar bar;
> +
> +    qts = qtest_init("-device pvpanic-pci,addr=04.0 -action panic=none");
> +    pcibus = qpci_new_pc(qts, NULL);
> +    dev = qpci_device_find(pcibus, QPCI_DEVFN(0x4, 0x0));
> +    qpci_device_enable(dev);
> +    bar = qpci_iomap(dev, 0, NULL);
> +
> +    qpci_memread(dev, bar, 0, &val, sizeof(val));
> +    g_assert_cmpuint(val, ==, 3);
> +
> +    val = 1;
> +    qpci_memwrite(dev, bar, 0, &val, sizeof(val));
> +
> +    response = qtest_qmp_eventwait_ref(qts, "GUEST_PANICKED");
> +    g_assert(qdict_haskey(response, "data"));
> +    data = qdict_get_qdict(response, "data");
> +    g_assert(qdict_haskey(data, "action"));
> +    g_assert_cmpstr(qdict_get_str(data, "action"), ==, "run");
> +    qobject_unref(response);
> +

I'm going to squash in the trivial fix, which is to add
    g_free(dev);
    qpci_free_pc(pcibus);

here and similarly in the test_panic() function.

> +    qtest_quit(qts);
> + }

thanks
-- PMM

