Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 907AA35C452
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 12:46:57 +0200 (CEST)
Received: from localhost ([::1]:38206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVu5o-0007Aj-EJ
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 06:46:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVu4F-0006Xy-9r
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 06:45:19 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:39919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVu4B-0008BI-35
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 06:45:18 -0400
Received: by mail-ed1-x52f.google.com with SMTP id g17so13731749edm.6
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 03:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mzhlp9f1DfdUDQ5GH5cqdeZ4c1LfOrN3OsZnC2r6D6g=;
 b=ON0Qla+G8fyfqRtUYc5SnUNQVco/wCLx0D5Zo7YbJZVTCOhYFp9csEDL31o1UiPIMU
 IanalNhsM3Kj9XvimaoIkak7C4moBJQ5zKKJ1oG9udD0jLR6phfWTr482GVJLCsgiVBn
 VTcDWEmq8z6UsP6aPEMNlOqbUEDqtdYJwgofMzj3IoD9Sq7LDXFSEWXj9EOdD0HrB1SP
 l35px1byVU34SI3AsfShcbjbvZusLSfrZ5R+weiDusKjHJKNz8rUTlvKsob/5EPMPBhu
 ZxKpaT/1qJxnPTor9q7q+DS4ipp1OjdG+vguIl5+pqzCJnuFqKjNVx3YLjlLhl86crNN
 8BUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mzhlp9f1DfdUDQ5GH5cqdeZ4c1LfOrN3OsZnC2r6D6g=;
 b=ekshqvpuvP8clkGlcKY1Sue2VS5SXwudEbyrvQrPEhsczNOz85UUaiubpovGzhQkX5
 t52R/FiVo6WfmFJk55Utw7S9Fny/fB4OBLB8FtjrKzVxlncDBl1BFHXFVm3UI57vsswI
 nCVF4ltyOHFE7RoarkZF7L4e9ZlQqBApaM/FD7ZSLt3B6tJFA105j0VWwOxTjBnjN6pU
 JMz1U7a9oDKyZAcBqO3N7DFZCZfZRNFMnlN2A1UzB36nvnKgYTGdR8WcqhzzqLwQcxjX
 RgRDhsVBZc7yuKksxp3mgbRKGIuCgOuZ9G4K1qiTvjD0E383yndn3shE+dxpL0SxoMko
 k5wA==
X-Gm-Message-State: AOAM532fO2E8LRVxcB8qVdBs6STqofbR8DNaPQbD5OEvI7f6AjLuaghl
 xm5STcms/6r7687KgY2+heQQRVwa7khkqNWZW//uVg==
X-Google-Smtp-Source: ABdhPJxVjI3BcWQG3uttRzPogdXqgFW9GCwlePE39bx2KqPz3a6K9VOXefOuh4gbNZ+BabwTlLEGNFfS2einxR9MTBo=
X-Received: by 2002:a05:6402:c:: with SMTP id
 d12mr28402698edu.100.1618224313485; 
 Mon, 12 Apr 2021 03:45:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210409062401.2350436-1-f4bug@amsat.org>
 <20210410131932.i6no5tvvaldyomvp@sekoia-pc.home.lmichel.fr>
 <09a63c3e-aa68-0d2d-b447-db9cd84dab09@amsat.org>
 <CAFEAcA9rqx97D_ZN7MzqqJtz9ajFNK=AAeQu9z65+g35SHD_NA@mail.gmail.com>
 <CAFEAcA-5h5ZjXyX6WbdQ8n=pqNSXTHfrt3fQSQzp6EYJY_zXLg@mail.gmail.com>
 <ab8fcac0-eb15-3f59-1b14-ef6b4cba6e03@amsat.org>
In-Reply-To: <ab8fcac0-eb15-3f59-1b14-ef6b4cba6e03@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Apr 2021 11:44:29 +0100
Message-ID: <CAFEAcA-3o2qdssKezXdQY6f5oYSG8MKandXwsBOi1gXuqW2E6Q@mail.gmail.com>
Subject: Re: [RFC PATCH-for-6.1 0/9] hw/clock: Strengthen machine (non-qdev)
 clock propagation
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Eduardo Habkost <ehabkost@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 12 Apr 2021 at 11:31, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
> TIL MachineClass::reset().
>
> - hw/hppa/machine.c
> - hw/i386/pc.c
>
>   Used to reset CPUs manually because CPUs aren't sysbus-reset.

pc_machine_reset() is not resetting the CPUs -- it is
re-resetting the APIC devices, which looks like it is a
workaround for a reset-ordering or other problem. I'm not
sure where the CPUs are being reset...

-- PMM

