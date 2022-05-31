Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A75C853910A
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 14:48:17 +0200 (CEST)
Received: from localhost ([::1]:38678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw1IG-0006po-O4
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 08:48:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nw0xC-0006of-TX
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:26:33 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:34404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nw0xA-0005zV-Ua
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:26:30 -0400
Received: by mail-ej1-x630.google.com with SMTP id q21so26349443ejm.1
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 05:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=c4krxatXpFTcHN0y0BQ0zrdclNU1UFphG6PdJDIgKSQ=;
 b=VJoWER2cOrKY2+XN/D3cU7kOVQ1SzJx1OdHCX1p6FyRAJPRyJjNhMFy5ExKSbddL36
 nN2IXH1sXosHj3itXNHjgqUpRXCqZcB/VDebM4gOKblvPBkdIVtZmECjRv3x1VmMEC60
 lpkW2sUKPu4ytK3GKoIsRf8Olk62xMoLOaHVwpkN+uPpOwYQB6K2RtSXs+ldWnYqcZAQ
 tRvaRIqRDSEINy7n4MY7psg7QxEFNWX4JpZmZqfC3mbCUSgU/m9W9uM8Y6ldgybZYf1l
 lmFNDiXQclL7IzW3vbzFfUXlBwWRU6OKpBhvBqT6HAu2ljZxKkcQbKSlaAW6l6YG2k5Q
 Heng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=c4krxatXpFTcHN0y0BQ0zrdclNU1UFphG6PdJDIgKSQ=;
 b=lMObaiTbdHL5CMGPvCXI9h/RP4U2OTZPftA4E9LoUJA0SU735O822Z3C4J3rUywxlm
 zK8PjOo262kfqI4vZ1ympeELX8Xt4qZpscwunVxySDCsdEJDajb8W/7WwNqhEf7biIIN
 69FKvNeTty/B5rtcnePOBsB5MZUze+Rr+z5r9PGsI4n6pUvZRTaF4VEzswA/9n8Ce20F
 bzlZJvYMgS6jeTLRiVll7Y3BVDELd1k3r2HIv3ZWYs+EttQ5nBvRr1/VULxcY9SFDMxM
 4oN4r4A8n9XxhNwj9vWN7sYFcbod+iENIOR+CZmG9g7sXLzGEoSqB8NlacqTYjo+tVDn
 zkqQ==
X-Gm-Message-State: AOAM532XsaujEVoFj+zh+S8QiLchvWwGE0mmZsrDwt+/uIFh0NsIVg3O
 FpgkS4KcKJn6YCe72KpU/2KNYBvQkWRreic6mkk9sw==
X-Google-Smtp-Source: ABdhPJwkJvTxoRmNLXFukmuIt1+vpSorpYb9KxZt10v2Zf/ZI01fyfCsOHByuKHh8ECAGLjuMctPllzmAEQuxnEGdAs=
X-Received: by 2002:a17:907:d1b:b0:6fe:b941:946 with SMTP id
 gn27-20020a1709070d1b00b006feb9410946mr45826488ejc.618.1653999984946; Tue, 31
 May 2022 05:26:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220531114707.18830-1-cfontana@suse.de>
In-Reply-To: <20220531114707.18830-1-cfontana@suse.de>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 31 May 2022 17:56:14 +0530
Message-ID: <CAARzgwx4BjPt7MxctMK9VJ6u+yPsyoFDZ1bQo+F-qE1LVJ4epw@mail.gmail.com>
Subject: Re: [PATCH] pci: fix overflow in snprintf string formatting
To: Claudio Fontana <cfontana@suse.de>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-devel@nongnu.org, 
 Dario Faggioli <dfaggioli@suse.com>,
 =?UTF-8?Q?Martin_Li=C5=A1ka?= <martin.liska@suse.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Dario Faggioli <DarioFaggiolidfaggioli@suse.com>, qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::630;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x630.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 31, 2022 at 5:20 PM Claudio Fontana <cfontana@suse.de> wrote:
>
> the code in pcibus_get_fw_dev_path contained the potential for a
> stack buffer overflow of 1 byte, potentially writing to the stack an
> extra NUL byte.
>
> This overflow could happen if the PCI slot is >=3D 0x10000000,
> and the PCI function is >=3D 0x10000000, due to the size parameter
> of snprintf being incorrectly calculated in the call:
>
>     if (PCI_FUNC(d->devfn))
>         snprintf(path + off, sizeof(path) + off, ",%x", PCI_FUNC(d->devfn=
));
>
> since the off obtained from a previous call to snprintf is added
> instead of subtracted from the total available size of the buffer.
>
> Without the accurate size guard from snprintf, we end up writing in the
> worst case:
>
> name (32) + "@" (1) + SLOT (8) + "," (1) + FUNC (8) + term NUL (1) =3D 51=
 bytes
>
> In order to provide something more robust, replace all of the code in
> pcibus_get_fw_dev_path with a single call to g_strdup_printf,
> so there is no need to rely on manual calculations.
>
> Found by compiling QEMU with FORTIFY_SOURCE=3D3 as the error:
>
> *** buffer overflow detected ***: terminated
>
> Thread 1 "qemu-system-x86" received signal SIGABRT, Aborted.
> [Switching to Thread 0x7ffff642c380 (LWP 121307)]
> 0x00007ffff71ff55c in __pthread_kill_implementation () from /lib64/libc.s=
o.6
> (gdb) bt
>  #0  0x00007ffff71ff55c in __pthread_kill_implementation () at /lib64/lib=
c.so.6
>  #1  0x00007ffff71ac6f6 in raise () at /lib64/libc.so.6
>  #2  0x00007ffff7195814 in abort () at /lib64/libc.so.6
>  #3  0x00007ffff71f279e in __libc_message () at /lib64/libc.so.6
>  #4  0x00007ffff729767a in __fortify_fail () at /lib64/libc.so.6
>  #5  0x00007ffff7295c36 in  () at /lib64/libc.so.6
>  #6  0x00007ffff72957f5 in __snprintf_chk () at /lib64/libc.so.6
>  #7  0x0000555555b1c1fd in pcibus_get_fw_dev_path ()
>  #8  0x0000555555f2bde4 in qdev_get_fw_dev_path_helper.constprop ()
>  #9  0x0000555555f2bd86 in qdev_get_fw_dev_path_helper.constprop ()
>  #10 0x00005555559a6e5d in get_boot_device_path ()
>  #11 0x00005555559a712c in get_boot_devices_list ()
>  #12 0x0000555555b1a3d0 in fw_cfg_machine_reset ()
>  #13 0x0000555555bf4c2d in pc_machine_reset ()
>  #14 0x0000555555c66988 in qemu_system_reset ()
>  #15 0x0000555555a6dff6 in qdev_machine_creation_done ()
>  #16 0x0000555555c79186 in qmp_x_exit_preconfig.part ()
>  #17 0x0000555555c7b459 in qemu_init ()
>  #18 0x0000555555960a29 in main ()
>
> Found-by: Dario Faggioli <Dario Faggioli <dfaggioli@suse.com>
> Found-by: Martin Li=C5=A1ka <martin.liska@suse.com>

I think Reported-by: is preferred.

> Cc: qemu-stable@nongnu.org
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  hw/pci/pci.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index a9b37f8000..6e7015329c 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -2640,15 +2640,15 @@ static char *pci_dev_fw_name(DeviceState *dev, ch=
ar *buf, int len)
>  static char *pcibus_get_fw_dev_path(DeviceState *dev)
>  {
>      PCIDevice *d =3D (PCIDevice *)dev;
> -    char path[50], name[33];
> -    int off;
> -
> -    off =3D snprintf(path, sizeof(path), "%s@%x",
> -                   pci_dev_fw_name(dev, name, sizeof name),
> -                   PCI_SLOT(d->devfn));
> -    if (PCI_FUNC(d->devfn))
> -        snprintf(path + off, sizeof(path) + off, ",%x", PCI_FUNC(d->devf=
n));
> -    return g_strdup(path);
> +    char name[33];
> +    int has_func =3D !!PCI_FUNC(d->devfn);
> +
> +    return g_strdup_printf("%s@%x%s%.*x",

I was experimenting with printf dynamic precision field with hex and
it was not quite working as expected. In particular, with precision 0,
I was still able to print a single hex digit. That is the following
still outputs 5 in stderr :

> fprintf(stderr, "%.*x\n", 0, 5);


> +                           pci_dev_fw_name(dev, name, sizeof(name)),
> +                           PCI_SLOT(d->devfn),
> +                           has_func ? "," : "",
> +                           has_func,
> +                           PCI_FUNC(d->devfn));
>  }
>
>  static char *pcibus_get_dev_path(DeviceState *dev)
> --
> 2.26.2
>
>

