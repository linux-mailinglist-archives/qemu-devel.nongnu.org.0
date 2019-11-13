Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8A1FB391
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Nov 2019 16:21:02 +0100 (CET)
Received: from localhost ([::1]:46316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUuS4-0004yn-S3
	for lists+qemu-devel@lfdr.de; Wed, 13 Nov 2019 10:21:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33450)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <sameid@google.com>) id 1iUuPk-0003Ie-VT
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 10:18:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sameid@google.com>) id 1iUuPj-0005th-Od
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 10:18:36 -0500
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743]:32871)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <sameid@google.com>) id 1iUuPj-0005t7-J0
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 10:18:35 -0500
Received: by mail-qk1-x743.google.com with SMTP id 71so2051906qkl.0
 for <qemu-devel@nongnu.org>; Wed, 13 Nov 2019 07:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cLHl917taxQ1i/FEcEAKpNc0iCQxSSrblU04g4ieHXQ=;
 b=jLdrz86WXtZ07zSpXcIZqv7OoVHWAfS+XPJ95aufa47lsxw6daDc5DHlpht9itf5cz
 ejnCdLvpch6yPe0IRA4PPRttLy4TuttS5OVvC11BhzPZtPxsQYKqbb3r/xslV8m0Shg9
 aYOO9QgpyMZUifkuIE7WW6QrAUYLH+ydJQoF61Huoht3zgQNgH2OPcAHcpCuUlTV15bt
 15xNoO/dpijNeyn/gTXx7s26xRr9G9Tl8B9r8AZ4mlzYUgwIWP6EXkngJJD9d37Bih6s
 JWwx6JLwk8cGGmroV+NV2CjhIiAEMEB0QWowsvXaoDmv+pMZomBUkigbIr3B2i7IEA1O
 ADWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cLHl917taxQ1i/FEcEAKpNc0iCQxSSrblU04g4ieHXQ=;
 b=cJaXToASCK6FkBJWpXktL4bdMmbz/janifx5Ff8BdhBg8dgb2H4bmiJ8iA3Cnz7eHR
 Hb8AkXscbXu6LiUGL15T11Mfq+JZ++jrKmiWlgKkd0N3TeZ/KVu3zMZP9/tYxsA5K/LY
 PHYK89LrWKuLcdLjsrlvoP2Ng0mKuaQjfXXMUapIosfO4djX/OURx2MmaC/UfdXsRxX4
 o2LB+4TFygKADJCuPhUXVBqE5pXd6CXjRxMs87qiFlBDLbxIDJJ6ksnuNmSELC+LhAS7
 6lcuHvEiSf4T2MsrpE+KpLYOo0zXvl8ds+FKMNSpjnhp4DGzcupeKuz+5i0FSxlftZxm
 asjg==
X-Gm-Message-State: APjAAAWO/KSERmWPqTbIFqMyIPgbWPWsQd+gnMhmVi0wo8ZoMhn1XmVd
 47P8PlHtEgFN9CAdp88GpPg6+MBblARWCIccRD9BlQ==
X-Google-Smtp-Source: APXvYqzfW/wxBllO0r9JVhwgfKv4d1RN1RfDKf7+EtGfjZQ4/dwSWalvCVU+xH8hM6MiVmMlA+WUugYig3nXklrykwY=
X-Received: by 2002:a37:72c3:: with SMTP id n186mr3056303qkc.166.1573658314345; 
 Wed, 13 Nov 2019 07:18:34 -0800 (PST)
MIME-Version: 1.0
References: <20191113091809.31365-1-kraxel@redhat.com>
 <84d3a1aa-bbb2-d831-0abc-fe1169f8a860@redhat.com>
 <20191113140057.2ocwfa3rqqfkbg3r@sirius.home.kraxel.org>
 <CAFr6bUn5W2-w3z4Ty9XD7mh+=kxVq2rQJ3ZUz5nXA13ZdxQtsg@mail.gmail.com>
In-Reply-To: <CAFr6bUn5W2-w3z4Ty9XD7mh+=kxVq2rQJ3ZUz5nXA13ZdxQtsg@mail.gmail.com>
From: Sam Eiderman <sameid@google.com>
Date: Wed, 13 Nov 2019 17:18:21 +0200
Message-ID: <CAFr6bUk6gc0vCB5K=PJjd7Ahto7fb0TM+PYW78P0xER131b3NA@mail.gmail.com>
Subject: Re: [SeaBIOS] Re: [PATCH] ahci: zero-initialize port struct
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Laszlo Ersek <lersek@redhat.com>, seabios@seabios.org, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::743
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

We should make sure drive.lchs is zeroed out for the following devices:

git grep "drive_s drive"

src/hw/ata.h:    struct drive_s drive;
src/hw/esp-scsi.c:    struct drive_s drive;
src/hw/lsi-scsi.c:    struct drive_s drive;
src/hw/megasas.c:    struct drive_s drive;
src/hw/mpt-scsi.c:    struct drive_s drive;
src/hw/nvme-int.h:    struct drive_s drive;
src/hw/pvscsi.c:    struct drive_s drive;
src/hw/sdcard.c:    struct drive_s drive;
src/hw/usb-msc.c:    struct drive_s drive;
src/hw/usb-uas.c:    struct drive_s drive;
src/hw/virtio-blk.c:    struct drive_s drive;
src/hw/virtio-scsi.c:    struct drive_s drive;

Sam


On Wed, Nov 13, 2019 at 5:03 PM Sam Eiderman <sameid@google.com> wrote:
>
> Hi,
>
> Does this fix a bug that actually happened?
>
> I just noticed that in my lchs patches I assumed that lchs struct is
> zeroed out in all devices (not only ahci):
>
> 9caa19be0e53 (geometry: Apply LCHS values for boot devices)
>
> Seems like this is not the case but why only ahci is affected?
>
> The list of devices is at least:
>
>         * ata
>         * ahci
>         * scsi
>             * esp
>             * lsi
>             * megasas
>             * mpt
>             * pvscsi
>             * virtio
>         * virtio-blk
>
> As specified in the commit message.
>
> Also Gerd it seems that my lchs patches were not committed in the
> latest submitted version (v4)!!!
> The ABI of the fw config key is completely broken.
>
>
> On Wed, Nov 13, 2019 at 4:02 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> > On Wed, Nov 13, 2019 at 10:35:03AM +0100, Laszlo Ersek wrote:
> > > On 11/13/19 10:18, Gerd Hoffmann wrote:
> > > > Specifically port->driver.lchs needs clearing, otherwise seabios will
> > >
> > > s/driver/drive/
> >
> > > Reviewed-by: Laszlo Ersek <lersek@redhat.com>
> >
> > Typo fixed & pushed.
> >
> > thanks,
> >   Gerd
> > _______________________________________________
> > SeaBIOS mailing list -- seabios@seabios.org
> > To unsubscribe send an email to seabios-leave@seabios.org

