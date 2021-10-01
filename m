Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C81ED41EE85
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 15:27:23 +0200 (CEST)
Received: from localhost ([::1]:54096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWIZO-0008FV-JI
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 09:27:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mWIXa-0006y4-Kx
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 09:25:30 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:44768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mWIXX-0000cR-4i
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 09:25:30 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 m14-20020a05600c3b0e00b0030d4dffd04fso1448397wms.3
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 06:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SbkWvVUva+EPwfuumhKAz6iETPoG6rIuEiyZqSkrqmo=;
 b=PcGMXko17u4OcMXQMGdCUY3vGtDjFFVjrQZZvOzHJlXj41AU6u1kMnqbfBQSvxliVY
 5SdH6q3B6/liDCxgxFysevjHw9Q+StKhiduXNkeKd8p5GZpcIRhyFLZnQ2LU21bX4+Fa
 6rqUErhUYICUdtdeqQ+Usr3zsPTv/SdNFk65OhztAB4rRZOPyYsWRxuD0J0Fqpe3Q+6p
 LW0OGoPIrS5F2lpqR35Fb8CqDnUaVuTLS4qiH5MuyfHpZMKFlLiejFrFz9W8FRqVamd6
 1jwr8spDqncI8FRDedhx4PFZtruLoXhidl2w4EqpNmS3NwgC4d9FwjzqISWuEb/cmOw2
 o1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SbkWvVUva+EPwfuumhKAz6iETPoG6rIuEiyZqSkrqmo=;
 b=SUV29s8mE34//BuJABpzzpS0aIC5n7RLv9V0sEDWsVXix8In7gidmNRxLDTVazvJo4
 NYnvMJLOEipNWGTAfR3JWopPulvSAY6LsD1E0S72KqxWSe1qaFocmm0/Fn7zmcdPMZ5n
 ZYTl8GhsiIY76PskBXdUv8NxLDoEmVXFaKP4W1dkkGYnDLArpynjJtk8f+E1rsTrUqCl
 24AvFcdRQ6RFfPJNCqgFqypU3xXzjSwY75ebSjMhkaJrxcXexVlRqufZRTLBH27vVaIl
 t8vg3lokM+jwzzV0yYh0KypdE1Vq9YpnBOIeSWk+o4UBgO6MeW68+1SUHWssQx5VHhPv
 CaBw==
X-Gm-Message-State: AOAM533fj4Thv3L7ymiATeCY4nzUXPV9jPj/MOSupRyIyP5O1K8klUgx
 n22eaXap6l7pHE7A9PvrUsTO38rvkl+nCMfdiLStNg==
X-Google-Smtp-Source: ABdhPJxi6mQ/kzn5QlDT792Wp5Argaj/CfJFZwnH2/+uXP3CQWiQ9d9sOmcZe1eSmVmW/0/7FjCADq3OvqCJ1XayKcA=
X-Received: by 2002:a05:600c:d6:: with SMTP id
 u22mr4471430wmm.133.1633094725495; 
 Fri, 01 Oct 2021 06:25:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210927044808.73391-1-david@gibson.dropbear.id.au>
 <20210927044808.73391-5-david@gibson.dropbear.id.au>
 <18fa56ee-956e-ee2f-9270-82aa96dfde09@redhat.com>
 <df767942-be5f-c920-2924-a5221e9db2b3@csgroup.eu>
 <40cdb137-60c9-43fd-7b48-4858cbd9307c@redhat.com>
 <CAFEAcA82L5JiHXUmc0vt7EgiiyrYHyJ+qQ7pFHp+CsvJCPyKqA@mail.gmail.com>
 <6c2ff4e6-4bf4-d310-5e26-c8d2741177bc@redhat.com>
 <42e5a8c2-b8fa-b9e2-71f1-c8e5cd7f5cef@csgroup.eu>
In-Reply-To: <42e5a8c2-b8fa-b9e2-71f1-c8e5cd7f5cef@csgroup.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Oct 2021 14:24:31 +0100
Message-ID: <CAFEAcA-=XKCa5fkC_Xbn7tJzEC7SR11wQ1ggvmx+zUiKXPDeRw@mail.gmail.com>
Subject: Re: Deprecate the ppc405 boards in QEMU? (was: [PATCH v3 4/7]
 MAINTAINERS: Orphan obscure ppc platforms)
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, Thomas Huth <thuth@redhat.com>,
 dbarboza@redhat.com, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Greg Kurz <groug@kaod.org>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 1 Oct 2021 at 14:04, Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> I really would like to be able to use them to validate Linux Kernel
> changes, hence looking for that missing BIOS.
>
> If we remove ppc405 from QEMU, we won't be able to do any regression
> tests of Linux Kernel on those processors.

Do you (does anyone) have real hardware to test against? If the only
thing you have is QEMU's emulation, I wouldn't particularly trust it
to be bug-free enough to keep the kernel still working on real h/w...

-- PMM

