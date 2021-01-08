Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8E72EF56A
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 17:03:49 +0100 (CET)
Received: from localhost ([::1]:58582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxuEu-0006Ne-Uc
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 11:03:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxuC8-00059z-EP
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 11:00:56 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:35982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxuC6-0003AO-8k
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 11:00:55 -0500
Received: by mail-ed1-x530.google.com with SMTP id b2so11712973edm.3
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 08:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T2Z3JJqh6lJ4+2UuFN+lpZ/yFsy8mzeTUPDi4ohDRp0=;
 b=cDMIOnPfIKfubaTtfn4xKksco14U2ABle0lZWXSr4YVdwfsB+sXYmM+7EGmcK72xth
 mbU+/KglcXSH51oxWG6749e/6OCu5idrAFvDask9vAdMKrxTtNFwb6ITwDXdP3D2ATu5
 X2wfTdyhcr8JP6/raPXQahawyM/zSqhw34ZqRcZ5nal8lBsFO0yTpJG4vFzd2UWVVvQj
 xVJa7c64cH5iRrxUjQnkAXVaITmbsJE3RYh1iFuaoR8rwzZ+NoFm88IR7dM4WSkqxb4z
 PC/TpJNuyKEoeUchnQLLklt/hg26RTUjUUnA5KCNcHEkzwkXJaIsf1GlIZRMdOhSBKPS
 wi2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T2Z3JJqh6lJ4+2UuFN+lpZ/yFsy8mzeTUPDi4ohDRp0=;
 b=e1hjdy2hzP5CPIjul8jszWOcjol+hW78FEjWEFDz8veiyycqauaGxO6Ez8lxM+h6TC
 UJ+DSTPPd+kwESe/YCgMflFyW9kJiJ43jqQlx6v5ufR90XIDV2AFDtUEcyEm45dSq6Qb
 F1WuGjc30JtZ1BdwtQ0dh3pggMtYgSUFbLsv0SqUifHIMQkaSYo39sBCIRXulCMusUi6
 AXL2wKgQ6CIcswzowH7htqpZI9EQGkKmn30EjuxnhQm7idSzRCtS5veh12deEfMACziN
 5xBqvmGIJMOJ82LWOJhGy3cY8OQXxg1SYKOATuaArSHuSpdNFXzHXIzx4h229KicRVUg
 GA8Q==
X-Gm-Message-State: AOAM533+zrNSxzUwXHEm8cx6QM8o5nN7/AaT2hQ/SPQQIPz1woeB3AeM
 dljAyocZElxZxhkE0hSSVzyI6+mskyQBihqUzLG6eA==
X-Google-Smtp-Source: ABdhPJx0RChmuYNnqZ8wVI9Rykary9rpIRRLdrs6053r8DXoAwd+ROoSSUTY6qniVDiUluOmkf9yibqXg+PY62foH1w=
X-Received: by 2002:aa7:cdc3:: with SMTP id h3mr5652445edw.52.1610121652158;
 Fri, 08 Jan 2021 08:00:52 -0800 (PST)
MIME-Version: 1.0
References: <20201202144523.24526-1-bmeng.cn@gmail.com>
 <20201202144523.24526-2-bmeng.cn@gmail.com>
 <CAFEAcA9weaHgHTZBmEeveOxaakpeQTAvqrKGG6pZAprr=DcpWQ@mail.gmail.com>
 <CAEUhbmVsjNAm+arSskKJx5LCCKbcpHyRJr+SO6wY_8mE-P37Og@mail.gmail.com>
In-Reply-To: <CAEUhbmVsjNAm+arSskKJx5LCCKbcpHyRJr+SO6wY_8mE-P37Og@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Jan 2021 16:00:40 +0000
Message-ID: <CAFEAcA_2Qe8PW3A-4Ff+HvbR+A5ACOg3upPUQvSMZ-GuQQg-rA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hw/ssi: imx_spi: Disable chip selects in
 imx_spi_reset()
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 8 Jan 2021 at 15:55, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Fri, Jan 8, 2021 at 10:40 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> > Calling qemu_set_irq() in a device reset function is a bad
> > idea, because you don't know whether the thing on the other
> > end of the IRQ line (a) has already reset before you or
> > (b) is going to reset after you. If you need to do this then
> > I think you need to convert this device (and perhaps whatever
> > it's connected to) to the 3-phase-reset API. (But you probably
> > don't, see below.)
> >
>
> Thanks for the review. What about the imx_spi_update_irq() in the
> imx_spi_reset()? Should we remove that from the imx_spi_reset() as
> well?

Yes, I think so.

thanks
-- PMM

