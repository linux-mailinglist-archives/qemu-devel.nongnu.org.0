Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8996353918D
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 15:12:58 +0200 (CEST)
Received: from localhost ([::1]:51262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw1g9-0002bc-3R
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 09:12:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nw1ci-0008KH-D8
 for qemu-devel@nongnu.org; Tue, 31 May 2022 09:09:24 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:42542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nw1ce-0006r7-JX
 for qemu-devel@nongnu.org; Tue, 31 May 2022 09:09:23 -0400
Received: by mail-ed1-x532.google.com with SMTP id n28so8628098edb.9
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 06:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MyjBGhQ3dCdQ7D3AXlsWC1g0QlCCCKenV3s6g2Cgoj8=;
 b=omx7KCVj08feZ2skv1lVVYjZBCtfir3FCMS3LfvwTxQBE8+aVHwJQ2/6ikEk60Wpdz
 neG3Z+1BwIvtEZInecCfa/yYhlzRxt3wy68wDYp9blB8Rf+wcXec0mfvPcuerliVTxS7
 TPO2o6rex5LK40GoWBwfbQBtgSQKyq3y8HCowa/XrXEGVWQl+hrQXbYPuN6jLGa51rP/
 hni0AptSOBV2FaN+6Dkslg76U+6Hb0Psfthesd9N8UlGanqWixDimGlTj1TW/RLTNGKe
 qIhB1LOG4ylR4KwqmQ5cHI7AR7pDXYPQ1fC+zjSEerbNKCqljTqL/SDrU08aDvrx6nzW
 5h7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MyjBGhQ3dCdQ7D3AXlsWC1g0QlCCCKenV3s6g2Cgoj8=;
 b=VtE+K3N/gf647D0dkRwImNhw947+V/AL3+ybN5a0TApHF9g9bvthkdV0NBKTpUeMH7
 TniKZsigIAXUHVhwhGe5AUpYGVATACgtPw42Kp5rjjwUwxIcbLysIJVca/w7ksQ566VP
 nfhBH3LI6NdsjSEfm8hztu0sVgSGdfBkDvuqYGT9UCeY+7hdNdzR5gArNEO38p/K+B8m
 EPOjDoteo1jYYdCXItvily1zjdVIE1T2Ko0TG7OQMuSR1IhIuOXO86CTqe9KgiB028hc
 aZCzbFoedtm8XXEjsBM2CSdqwomfsNlzp0quN91m2AGYYDdqy9sjcBhS2+5SuDWQu7FO
 MpLg==
X-Gm-Message-State: AOAM5308TgQoYt/43VvHAdN9MM7l7PU4oLNnNAkXgZd5kqyRd1qIL1Jv
 Dn6x9QCQYYFSsL7cruLdiqw3t3oAtmVWPfvWME4JVw==
X-Google-Smtp-Source: ABdhPJwjHa3ciA9MFb1AgIWquO7nd52XjXDYMSpTwknDhiSTBuTTPqhMSLKGT90syAKIDs5d+J1vJEN24eVsMyERqUM=
X-Received: by 2002:a05:6402:3293:b0:42b:aef6:7d3 with SMTP id
 f19-20020a056402329300b0042baef607d3mr35569949eda.371.1654002558414; Tue, 31
 May 2022 06:09:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220531114707.18830-1-cfontana@suse.de>
 <CAARzgwx4BjPt7MxctMK9VJ6u+yPsyoFDZ1bQo+F-qE1LVJ4epw@mail.gmail.com>
 <4e51ce73-b1e9-8c64-d25f-71e363880681@suse.de>
In-Reply-To: <4e51ce73-b1e9-8c64-d25f-71e363880681@suse.de>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 31 May 2022 18:39:07 +0530
Message-ID: <CAARzgwwLewjv+MMjEuU++MfaanN0YyRLpDUhNqne78rmgFWNrQ@mail.gmail.com>
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
Received-SPF: none client-ip=2a00:1450:4864:20::532;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x532.google.com
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

On Tue, May 31, 2022 at 6:15 PM Claudio Fontana <cfontana@suse.de> wrote:
>
> On 5/31/22 14:26, Ani Sinha wrote:
> > On Tue, May 31, 2022 at 5:20 PM Claudio Fontana <cfontana@suse.de> wrot=
e:
> >>
> >> the code in pcibus_get_fw_dev_path contained the potential for a
> >> stack buffer overflow of 1 byte, potentially writing to the stack an
> >> extra NUL byte.
> >>
> >> This overflow could happen if the PCI slot is >=3D 0x10000000,
> >> and the PCI function is >=3D 0x10000000, due to the size parameter
> >> of snprintf being incorrectly calculated in the call:
> >>
> >>     if (PCI_FUNC(d->devfn))
> >>         snprintf(path + off, sizeof(path) + off, ",%x", PCI_FUNC(d->de=
vfn));
> >>
> >> since the off obtained from a previous call to snprintf is added
> >> instead of subtracted from the total available size of the buffer.
> >>
> >> Without the accurate size guard from snprintf, we end up writing in th=
e
> >> worst case:
> >>
> >> name (32) + "@" (1) + SLOT (8) + "," (1) + FUNC (8) + term NUL (1) =3D=
 51 bytes
> >>
> >> In order to provide something more robust, replace all of the code in
> >> pcibus_get_fw_dev_path with a single call to g_strdup_printf,
> >> so there is no need to rely on manual calculations.
> >>
> >> Found by compiling QEMU with FORTIFY_SOURCE=3D3 as the error:
> >>
> >> *** buffer overflow detected ***: terminated
> >>
> >> Thread 1 "qemu-system-x86" received signal SIGABRT, Aborted.
> >> [Switching to Thread 0x7ffff642c380 (LWP 121307)]
> >> 0x00007ffff71ff55c in __pthread_kill_implementation () from /lib64/lib=
c.so.6
> >> (gdb) bt
> >>  #0  0x00007ffff71ff55c in __pthread_kill_implementation () at /lib64/=
libc.so.6
> >>  #1  0x00007ffff71ac6f6 in raise () at /lib64/libc.so.6
> >>  #2  0x00007ffff7195814 in abort () at /lib64/libc.so.6
> >>  #3  0x00007ffff71f279e in __libc_message () at /lib64/libc.so.6
> >>  #4  0x00007ffff729767a in __fortify_fail () at /lib64/libc.so.6
> >>  #5  0x00007ffff7295c36 in  () at /lib64/libc.so.6
> >>  #6  0x00007ffff72957f5 in __snprintf_chk () at /lib64/libc.so.6
> >>  #7  0x0000555555b1c1fd in pcibus_get_fw_dev_path ()
> >>  #8  0x0000555555f2bde4 in qdev_get_fw_dev_path_helper.constprop ()
> >>  #9  0x0000555555f2bd86 in qdev_get_fw_dev_path_helper.constprop ()
> >>  #10 0x00005555559a6e5d in get_boot_device_path ()
> >>  #11 0x00005555559a712c in get_boot_devices_list ()
> >>  #12 0x0000555555b1a3d0 in fw_cfg_machine_reset ()
> >>  #13 0x0000555555bf4c2d in pc_machine_reset ()
> >>  #14 0x0000555555c66988 in qemu_system_reset ()
> >>  #15 0x0000555555a6dff6 in qdev_machine_creation_done ()
> >>  #16 0x0000555555c79186 in qmp_x_exit_preconfig.part ()
> >>  #17 0x0000555555c7b459 in qemu_init ()
> >>  #18 0x0000555555960a29 in main ()
> >>
> >> Found-by: Dario Faggioli <Dario Faggioli <dfaggioli@suse.com>
> >> Found-by: Martin Li=C5=A1ka <martin.liska@suse.com>
> >
> > I think Reported-by: is preferred.
> >
> >> Cc: qemu-stable@nongnu.org
> >> Signed-off-by: Claudio Fontana <cfontana@suse.de>

Reviewed-by: Ani Sinha <ani@anisinha.ca>

> >> ---
> >>  hw/pci/pci.c | 18 +++++++++---------
> >>  1 file changed, 9 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> >> index a9b37f8000..6e7015329c 100644
> >> --- a/hw/pci/pci.c
> >> +++ b/hw/pci/pci.c
> >> @@ -2640,15 +2640,15 @@ static char *pci_dev_fw_name(DeviceState *dev,=
 char *buf, int len)
> >>  static char *pcibus_get_fw_dev_path(DeviceState *dev)
> >>  {
> >>      PCIDevice *d =3D (PCIDevice *)dev;
> >> -    char path[50], name[33];
> >> -    int off;
> >> -
> >> -    off =3D snprintf(path, sizeof(path), "%s@%x",
> >> -                   pci_dev_fw_name(dev, name, sizeof name),
> >> -                   PCI_SLOT(d->devfn));
> >> -    if (PCI_FUNC(d->devfn))
> >> -        snprintf(path + off, sizeof(path) + off, ",%x", PCI_FUNC(d->d=
evfn));
> >> -    return g_strdup(path);
> >> +    char name[33];
> >> +    int has_func =3D !!PCI_FUNC(d->devfn);
> >> +
> >> +    return g_strdup_printf("%s@%x%s%.*x",
> >
> > I was experimenting with printf dynamic precision field with hex and
> > it was not quite working as expected. In particular, with precision 0,
> > I was still able to print a single hex digit. That is the following
> > still outputs 5 in stderr :
> >
> >> fprintf(stderr, "%.*x\n", 0, 5);
>
> Hi Ani, both the precision and the value need to be zero to omit the valu=
e,
> and this is what the patch relies on.

Ah ok. s/5/0 in the above fprintf does not indeed print anything.

>
> Ciao,
>
> Claudio
>
> >
> >
> >> +                           pci_dev_fw_name(dev, name, sizeof(name)),
> >> +                           PCI_SLOT(d->devfn),
> >> +                           has_func ? "," : "",
> >> +                           has_func,
> >> +                           PCI_FUNC(d->devfn));
> >>  }
> >>
> >>  static char *pcibus_get_dev_path(DeviceState *dev)
> >> --
> >> 2.26.2
> >>
> >>
>

