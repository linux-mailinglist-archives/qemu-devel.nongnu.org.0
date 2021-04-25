Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7D636A9C1
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 00:49:09 +0200 (CEST)
Received: from localhost ([::1]:33982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lanYp-0001wE-SW
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 18:49:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lanXw-0001WR-I6
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 18:48:12 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:46657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lanXs-0001Pd-CE
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 18:48:12 -0400
Received: by mail-io1-xd34.google.com with SMTP id b9so2133426iod.13
 for <qemu-devel@nongnu.org>; Sun, 25 Apr 2021 15:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FcnsxX98X6oa4rtX2jiFn8DXwtcMQ1+zdMO7pwikhFs=;
 b=jyZUJa82HWW1ChUBw8QCtVe6eb3yYn8BbYVGs1Pi/mSUG89VoSn0uoFUGj4T1dbSOA
 aa47tTKMnzr+N0ZOFS4FWansWb+EB8Th057+LuxUm0aj+b8pDZA9S66oKbiS6vGP8iIG
 K64XKas9ezRQPULG2jcZiHRo2eRbSmze87W78iewmPe5Vf6yjbKXyCZdc5SNyE6xzmR3
 jsJ21oVEeaTOvQOKXyQxmRTyY1HffXdDanxZQXdrfsHKAdyJQIr9jca2YhZoQgmhhv72
 xWaGJ5tKx1va6UlsZCZ4P0AVd4dBz/2gmWI/AmPkO+m9UTYFTjWkFGQ29p2O+MCKBplX
 8W0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FcnsxX98X6oa4rtX2jiFn8DXwtcMQ1+zdMO7pwikhFs=;
 b=NaFESkOoZey01+0ZFYsUErRp9TAMEuVXvzwDya1QH30+PyH2Zb1T1plrYaYd6c3c0N
 2BCDAxmP7iI/D+vDMKtYbTbzE7Z3yo1NbMLrNBpml1YyRFLJJ8nodW2AvOGhpItSI88/
 UlK14rTi3zeYBjSPDpLVAWMUXQlxdhQIITGa+KZSFT+HzlO6Q7EM+5hx+rwsTti2vGao
 V9R+/DTjnibEKPii7Fh+4cWpFbdPETPXQGCnmXlBCiASleoLBSLNn7Ox6ZDD3ihh7Ghr
 Fsk+T+6laXW1teClDz2K2B1+LmUPGGQmqKfil4gpD5nPCObX6qv9YqQTQ1nztftVogil
 BJiw==
X-Gm-Message-State: AOAM5329ob6OzRQ+zhIKVTIuSSp+WmrIrl74kpIRK89YyrbmDz2Ntkgy
 09nBDsf+ie4a5OLJVAfvZaawZoXdymzWJu13jDo=
X-Google-Smtp-Source: ABdhPJwyKalpo5dpc1nmp2SovumjU7DqVUdzpbwDHZTGZx22nTrBM4cvwiYvkZDuhyQbHUzxb5kQ68khh2igx2B3BPw=
X-Received: by 2002:a02:8788:: with SMTP id t8mr13300091jai.135.1619390886266; 
 Sun, 25 Apr 2021 15:48:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210425182124.3735214-1-f4bug@amsat.org>
In-Reply-To: <20210425182124.3735214-1-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 26 Apr 2021 08:47:27 +1000
Message-ID: <CAKmqyKP-w1w1pu97PbMDXZu3X51gg0PSdNDY1NHhx8905d3rnw@mail.gmail.com>
Subject: Re: [PATCH] hw/pci-host: Do not build gpex-acpi.c if GPEX is not
 selected
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Xingang Wang <wangxingang5@huawei.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jiahui Cen <cenjiahui@huawei.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Yubo Miao <miaoyubo@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 26, 2021 at 4:21 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Since its introduction in commit 5b85eabe68f ("acpi: add
> acpi_dsdt_add_gpex") we build gpex-acpi.c if ACPI is selected,
> even if the GPEX_HOST device isn't build. Add the missing
> Kconfig dependency.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> The gpex*.c files aren't covered by any MAINTAINERS section:
>
> $ ./scripts/get_maintainer.pl -f hw/pci-host/gpex.c -f hw/pci-host/gpex-a=
cpi.c
> get_maintainer.pl: No maintainers found, printing recent contributors.
> get_maintainer.pl: Do not blindly cc: them on patches!  Use common sense.
>
> Markus Armbruster <armbru@redhat.com> (commit_signer:2/2=3D100%)
> Paolo Bonzini <pbonzini@redhat.com> (commit_signer:2/2=3D100%)
> Alistair Francis <alistair.francis@wdc.com> (commit_signer:1/2=3D50%)
> "Philippe Mathieu-Daud=C3=A9" <philmd@redhat.com> (commit_signer:1/2=3D50=
%)
> "Michael S. Tsirkin" <mst@redhat.com> (commit_signer:14/8=3D100%)
> Jiahui Cen <cenjiahui@huawei.com> (commit_signer:6/8=3D75%)
> Igor Mammedov <imammedo@redhat.com> (commit_signer:4/8=3D50%)
> Gerd Hoffmann <kraxel@redhat.com> (commit_signer:2/8=3D25%)
> Yubo Miao <miaoyubo@huawei.com> (commit_signer:2/8=3D25%)
> qemu-devel@nongnu.org (open list:All patches CC here)
> ---
>  hw/pci-host/meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/pci-host/meson.build b/hw/pci-host/meson.build
> index 87a896973e7..d52dce77cbd 100644
> --- a/hw/pci-host/meson.build
> +++ b/hw/pci-host/meson.build
> @@ -3,7 +3,7 @@
>  pci_ss.add(when: 'CONFIG_PCI_BONITO', if_true: files('bonito.c'))
>  pci_ss.add(when: 'CONFIG_PCI_EXPRESS_DESIGNWARE', if_true: files('design=
ware.c'))
>  pci_ss.add(when: 'CONFIG_PCI_EXPRESS_GENERIC_BRIDGE', if_true: files('gp=
ex.c'))
> -pci_ss.add(when: 'CONFIG_ACPI', if_true: files('gpex-acpi.c'))
> +pci_ss.add(when: ['CONFIG_PCI_EXPRESS_GENERIC_BRIDGE', 'CONFIG_ACPI'], i=
f_true: files('gpex-acpi.c'))
>  pci_ss.add(when: 'CONFIG_PCI_EXPRESS_Q35', if_true: files('q35.c'))
>  pci_ss.add(when: 'CONFIG_PCI_EXPRESS_XILINX', if_true: files('xilinx-pci=
e.c'))
>  pci_ss.add(when: 'CONFIG_PCI_I440FX', if_true: files('i440fx.c'))
> --
> 2.26.3
>
>

