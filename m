Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BC341983A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 17:49:32 +0200 (CEST)
Received: from localhost ([::1]:42588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUssk-0003QY-EO
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 11:49:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUsqB-0000d2-4X
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 11:46:51 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:44896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUsq9-0007TQ-23
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 11:46:50 -0400
Received: by mail-wr1-x429.google.com with SMTP id d6so52604187wrc.11
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 08:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nhzsQ4P9M/UVf0EdEr4phK4AOpgIFR5ehRHTQe1IBw4=;
 b=icRFkUf9xz+Sv35UzSGJ2PaXmkCWmKCqmCXd/uRKy6bmUd37Y6gsZZcafzqnnBrhb9
 HAcCGhT+owQx5dQYCKuaqXHVknLqV4+yhMaB76zXlOCAZnGMDAxLPzOeACAiDkwhUZ/y
 qmOAoUH4hQdKiOG9/9dWgik276HLQEOiv0eIQEVULEXS2onjvI70d0T0j2Ro6JKYPEap
 qytv4BC9es5TgLfjMGegdeGcUMpKEY+slEY4pZF9lLOhzQaIFz6rXZZoWIjsfNA4qBVK
 Pfq5dt8cMrh3MmZhl46rQ1fWt9d7P7o8B8s2zMpESC7/JnDYkDfibrUEerbY2u3nye/Q
 zq6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nhzsQ4P9M/UVf0EdEr4phK4AOpgIFR5ehRHTQe1IBw4=;
 b=3zGnZmnni9/tLHLkgVljJCUMwVSsRaOgLvyKhXfEsRXlyJizFQidlFg4SmvFMVYP9x
 3S3vdIYRr8+8FjxGjnX5NXNtA7jX1vVHaNVM0UwRpWMIAhJZgNI+Vsv7rhSqJZt4JCa3
 HGudIUZaiTiN+LR1Eo/LfBDUXKV60OHYJVRU8xWB5D6bAAnjlR0X3xPmmtW6RBGqhxU5
 v8JtX80Un1o9ouTIJgENbV5tGpWtdZ/g62seEQplKiQwhgNCo6DDrS5DhBFoll7rsPg5
 dCHYDRikv1iWadjSWNkyRK8CxSNSEf+E+kvPNNCUUKJftdYLQ8PB7pEXldQ7Y6dGTwLM
 S0hg==
X-Gm-Message-State: AOAM53087sikbJpEhQhahwDSm25pWJpaIOlPqUgH71Sa10vQlnazWqtk
 kIx6L138WiBuH378oblNHwrhmtnSZkd9QRDBRwXXGA==
X-Google-Smtp-Source: ABdhPJzy9qw+tzHF3YEaq6plnTQIpnash0SIwhb6uvq+2Tv+I6VVXeZer0jTgp1CoOpievHkXSC0YjZ2xeBUp7HOLug=
X-Received: by 2002:adf:ee48:: with SMTP id w8mr590268wro.263.1632757607229;
 Mon, 27 Sep 2021 08:46:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210926183410.256484-1-sjg@chromium.org>
 <CAFEAcA8S2=7rOKxeqcW+kw0BVPO3PUJGSUH-ioN7=c=U7zQxvg@mail.gmail.com>
 <CAPnjgZ2NCRVxKULWR1JjZU+D9saJ7fbZ=yHmWTSr3ufHxLYg-g@mail.gmail.com>
 <CAFEAcA9n+2JDFv8BezeEMA4e2Zhr0ENAvzLjBS6YXRoW9P-JXQ@mail.gmail.com>
 <CAPnjgZ1AO8575LYbwmuouNR5=dgNam6EFDC1_bai=8xAHdw7-Q@mail.gmail.com>
In-Reply-To: <CAPnjgZ1AO8575LYbwmuouNR5=dgNam6EFDC1_bai=8xAHdw7-Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Sep 2021 16:45:53 +0100
Message-ID: <CAFEAcA8FsPcBELEZxiRMuFbKtmKTFgDHABePQ33hdxYRq0C0ig@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Allow additions to the generated device tree
To: Simon Glass <sjg@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 27 Sept 2021 at 16:18, Simon Glass <sjg@chromium.org> wrote:
> On Mon, 27 Sept 2021 at 02:48, Peter Maydell <peter.maydell@linaro.org> wrote:
> > So what is missing in the QEMU-provided DTB that it needs?
>
> Quite a lot. Here are some examples:
>
> U-Boot has limited pre-relocation memory so tries to avoid
> binding/probing devices that are not used before relocation:
>
> https://u-boot.readthedocs.io/en/latest/develop/driver-model/design.html#pre-relocation-support

It's up to u-boot to decide what it wants to touch and
what it does not. QEMU tells u-boot what all the available
devices are; I don't think we should have extra stuff saying
"and if you are u-boot, do something odd".

> There is a configuration node (which is likely to change form in
> future releases, but will still be there)
>
> https://github.com/u-boot/u-boot/blob/master/doc/device-tree-bindings/config.txt

I think u-boot should be storing this kind of thing somewhere
else (e.g. as part of the binary blob that is u-boot itself,
or stored in flash or RAM as a separate blob).

> Then there are various features which put things in U-Boot's control
> dtb, such as verified boot, which adds public keys during signing:
>
> https://github.com/u-boot/u-boot/blob/master/doc/uImage.FIT/signature.txt#L135
>
> More generally, the U-Boot tree has hundreds of files which add
> properties for each board, since we try to keep the U-Boot-specific
> things out of the Linux tree:
>
> $ find . -name *u-boot.dtsi |wc -l
> 398

If any of this is actual information about the hardware then you
should sort out getting the bindings documented officially
(which I think is still in the Linux tree), and then QEMU can
provide them.

> Quite a bit of this is to do with SPL and so far it seems that QEMU
> mostly runs U-Boot proper only, although I see that SPL is starting to
> creep in too in the U-Boot CI.
>
> So at present QEMU is not able to support U-Boot fully.

My take is that this is u-boot doing weird custom things with
the DTB that aren't "describe the hardware". You should be able
to boot u-boot by putting those custom DTB extra things in a
separate blob and having u-boot combine that with the
actual DTB when it starts.

-- PMM

