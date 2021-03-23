Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9C8346825
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 19:53:22 +0100 (CET)
Received: from localhost ([::1]:43196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOm9Y-0006bo-Ss
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 14:53:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOlBF-0005Cy-1Y
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 13:51:01 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:43805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOlBC-00006i-9Q
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 13:50:59 -0400
Received: by mail-ej1-x629.google.com with SMTP id l4so28527511ejc.10
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 10:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d77LjMyO+Wuqre/EX0asjF8MClNksyTPV5anyjXMs9A=;
 b=n3Dg8C25jr2BSl9qYBloJN65K1rTlTwJMyE9KMX9pe6aHgR9Igzg6eAURr+fNlDuDp
 1Hju7hyNqlpwfTv2CCmVDW/rmBGhnOlxU6q/dpXG+3EH5y3SReTPloykrJmG6nSIXSsk
 T2NysWT3klt12QqVT4aAvFP8H3RBlaAU4DLdoYgTawqyERC4dsZE20hgHmJtw8YVRBau
 7JGOdEsgwjzgLsSKgAYznILbF6/0bLSTAFhvdxaJ+ZxbMYnVcJ3Sn5uckijdC0vKMsrl
 fUlbUpHv3rrJMcB8Ig86XNzW+cF3bFCC7TNf4DBAnXVJJpS0nhwgz7i0z0en80lPgkxZ
 7NrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d77LjMyO+Wuqre/EX0asjF8MClNksyTPV5anyjXMs9A=;
 b=PSytmrh2eIHytP+/9n2+mU1myJBO7RXPtLhMI7m014YtRl1oCVRARK/F0x09vIDC1F
 k4PhoTWoL800zPJrh6STFlKXCNDxak8uw7OnWzzKSqESAw0GX1fC5jnaicShkJvgLqpy
 7HYfsR1Lwsjde2AIp1SKR27WT+T+uPZ1wOHeZfGSIn5YkyCLoAeqOFKF3F+HhAsUrk80
 nNUpmIP542YoU3jK5we8gcTCRrr+7SaPgzMsPJFSq3qfBUQTWIwkEjptpoLGGZu9MQJC
 mPtZjimbFp+7sWQ0jkbuXTVx1cB8eRoNcZ5oz8ExigF9HYVZfVWYVIBKhe+AspFXIZ8u
 lb8w==
X-Gm-Message-State: AOAM530AMnQrv/R0kT+akdLmmlFttEDCNl4FwBXhyIjZUkyHqqbsSMu/
 4Nk23RSpiEDxkZCvadK37n5QRVmmKNRLrkoxj39dhA==
X-Google-Smtp-Source: ABdhPJxV7whTvVjJ1gMLnwmL1VHBNlmRG3WyZxL+I95FOHrMQ5kjBjChwyQ2apoyobjthFtwyKPwpwNDeBp6HLZurGg=
X-Received: by 2002:a17:906:bd2:: with SMTP id
 y18mr6157447ejg.482.1616521856336; 
 Tue, 23 Mar 2021 10:50:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1616519655.git.isaku.yamahata@intel.com>
 <dc9c8d2aa7bfcd82ba812f1ff5630a4cc0ffbbe7.1616519655.git.isaku.yamahata@intel.com>
In-Reply-To: <dc9c8d2aa7bfcd82ba812f1ff5630a4cc0ffbbe7.1616519655.git.isaku.yamahata@intel.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Mar 2021 17:50:26 +0000
Message-ID: <CAFEAcA83AgZ0QoyawPUgmeocGhnvRVYAU9KzWuDNDvWhTodidA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] pci: sprinkle assert in PCI pin number
To: Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: Peter Maydell <Peter.maydel@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 isaku.yamahata@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Mar 2021 at 17:26, Isaku Yamahata <isaku.yamahata@intel.com> wrote:
>
> If a device model
> (a) doesn't set the value to a correct interrupt number and then
> (b) triggers an interrupt for itself,
> it's device model bug. Add assert on interrupt pin number to catch
> this kind of bug more obviously.
>
> Suggested-by: Peter Maydell <Peter.maydel@linaro.org>
> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
> ---
>  hw/pci/pci.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index ac9a24889c..cb6bab999b 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -1450,6 +1450,8 @@ static void pci_irq_handler(void *opaque, int irq_num, int level)
>      PCIDevice *pci_dev = opaque;
>      int change;
>
> +    assert(0 <= irq_num && irq_num < PCI_NUM_PINS);
> +    assert(level == 0 || level == 1);

If you have these...

>      change = level - pci_irq_state(pci_dev, irq_num);
>      if (!change)
>          return;
> @@ -1463,7 +1465,13 @@ static void pci_irq_handler(void *opaque, int irq_num, int level)
>
>  static inline int pci_intx(PCIDevice *pci_dev)
>  {
> -    return pci_get_byte(pci_dev->config + PCI_INTERRUPT_PIN) - 1;
> +    int intx = pci_get_byte(pci_dev->config + PCI_INTERRUPT_PIN) - 1;
> +    /*
> +     * This function is used to setup/trigger irq.
> +     * So PIN = 0 (interrupt isn't used) doesn't make sense.
> +     */
> +    assert(0 <= intx && intx < PCI_NUM_PINS);

...you don't need this, because the assert in pci_irq_handler()
covers all the uses of pci_intx().

See also
https://patchew.org/QEMU/20210323164601.27200-1-peter.maydell@linaro.org/

thanks
-- PMM

