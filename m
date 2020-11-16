Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D9F2B4C17
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 18:07:09 +0100 (CET)
Received: from localhost ([::1]:45450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kehy8-0005ye-PO
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 12:07:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kehvK-0003xT-Ev
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 12:04:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kehvG-0001eM-Tf
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 12:04:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605546250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nUt/gTa2dac9B0xkfQROf+jZpnpIxiACGMB8Yw4uC8E=;
 b=fNsX6gibQyajMI5lbJFTnwax+ZMORAwA05ScHewgJCdOhAMnK7lGe/EC78CFrYb5uqAce6
 EhzcO6fvr1FR852qwnYThaUROzfo3bSm64AvMR0f6S6wOQWyKPf36A2WMCOb4hUlj6OdPa
 hOjRdajE+g+1InddLSahtH8im8iXLb4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-EH2VEcCCOrS7qlpXX8tbdw-1; Mon, 16 Nov 2020 12:04:08 -0500
X-MC-Unique: EH2VEcCCOrS7qlpXX8tbdw-1
Received: by mail-qk1-f198.google.com with SMTP id z68so12108876qkc.4
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 09:04:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nUt/gTa2dac9B0xkfQROf+jZpnpIxiACGMB8Yw4uC8E=;
 b=iA0mKcrPh725GH55ZU/gSxyg2hsIogvBZLNDgJ1WE1aH3tFvn/i+YKmanKv07wqSB7
 9fI3HuxKG1mnL07fczoGdPhgrI7glF5zRO114zs28m0t2it1hC31dwrrWD01qUAVe7F9
 0netHns4PG5xn5M58mZAm3TrelGsT6P4AoOhrQQ1cZ8cXDzuE4VM5uRIvcuXXKukN805
 6uImB8BHagiM7tVcP7tsDxE4u0nl68zA2pO3fyVjp5+PQbZnIrrex+7DPhGbemTcjiDV
 ijuPq6e5JBENSPN3vkiNJwxcK8JZrqigHnJ+ZjmilWDf11aELdo5Or7nDXXMbgzHe/i2
 djzQ==
X-Gm-Message-State: AOAM530lSFJu1fV45wgUt+erLl2t6u0dBl/n8cmqycnex5+EBq69TCCz
 XE/v8BBeE2yUFryefyZv6spB2hiwNJ87+E3Uazg507fG4fpnRMhrirHJa8XJCFSdW8XR47OTjrj
 6U4WoHURZ2YM8x6p9fk8oUhwZZIivzKo=
X-Received: by 2002:a37:41d2:: with SMTP id
 o201mr14870962qka.425.1605546247816; 
 Mon, 16 Nov 2020 09:04:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxWT3mOv9ulFn4M6k70jJxe4d4lSgKrx8dm+bvv+WPDpZShH38iqZb9R7JPp7ZDqt4G41iZnRrbnGZpJwxU0bw=
X-Received: by 2002:a37:41d2:: with SMTP id
 o201mr14870930qka.425.1605546247486; 
 Mon, 16 Nov 2020 09:04:07 -0800 (PST)
MIME-Version: 1.0
References: <20201019104332.22033-1-eperezma@redhat.com>
 <20201019104332.22033-3-eperezma@redhat.com>
 <20201030064912-mutt-send-email-mst@kernel.org>
In-Reply-To: <20201030064912-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 16 Nov 2020 18:03:30 +0100
Message-ID: <CAJaqyWfFB-0BPE1q-mHqA_mpkkrQ0meEg66_btq1QDN3igkZ8A@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] memory: Add IOMMUTLBEvent
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-ppc@nongnu.org,
 Jason Wang <jasowang@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Avi Kivity <avi@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 30, 2020 at 11:50 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Mon, Oct 19, 2020 at 12:43:29PM +0200, Eugenio P=C3=A9rez wrote:
> > This way we can tell between regular IOMMUTLBEntry (entry of IOMMU
> > hardware) and notifications.
> >
> > In the notifications, we set explicitly if it is a MAPs or an UNMAP,
> > instead of trusting in entry permissions to differentiate them.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > Reviewed-by: Peter Xu <peterx@redhat.com>
> > Reviewed-by: Juan Quintela <quintela@redhat.com>
>
> Breaks s390:
>
> FAILED: libqemu-s390x-softmmu.fa.p/hw_s390x_s390-pci-inst.c.o
> cc -Ilibqemu-s390x-softmmu.fa.p -I. -I../qemu -Itarget/s390x -I../qemu/ta=
rget/s390x -Iqapi -Itrace -Iui -Iui/shader -I/usr/include/spice-1 -I/usr/in=
clude/spice-server -I/usr/include/cacard -I/usr/include/glib-2.0 -I/usr/lib=
64/glib-2.0/include -I/usr/include/nss3 -I/usr/include/nspr4 -I/usr/include=
/libmount -I/usr/include/blkid -I/usr/include/pixman-1 -I/usr/include/capst=
one -fdiagnostics-color=3Dauto -pipe -Wall -Winvalid-pch -Werror -std=3Dgnu=
99 -O2 -g -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 -m64 -mcx16 -D_GNU_SOURCE=
 -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredunda=
nt-decls -Wundef -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing =
-fno-common -fwrapv -Wold-style-declaration -Wold-style-definition -Wtype-l=
imits -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wemp=
ty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined -Wno-missing=
-include-dirs -Wno-shift-negative-value -Wno-psabi -fstack-protector-strong=
 -isystem /scm/qemu/linux-headers -isystem linux-headers -iquote /scm/qemu/=
tcg/i386 -iquote . -iquote /scm/qemu -iquote /scm/qemu/accel/tcg -iquote /s=
cm/qemu/include -iquote /scm/qemu/disas/libvixl -pthread -fPIC -isystem../q=
emu/linux-headers -isystemlinux-headers -DNEED_CPU_H '-DCONFIG_TARGET=3D"s3=
90x-softmmu-config-target.h"' '-DCONFIG_DEVICES=3D"s390x-softmmu-config-dev=
ices.h"' -MD -MQ libqemu-s390x-softmmu.fa.p/hw_s390x_s390-pci-inst.c.o -MF =
libqemu-s390x-softmmu.fa.p/hw_s390x_s390-pci-inst.c.o.d -o libqemu-s390x-so=
ftmmu.fa.p/hw_s390x_s390-pci-inst.c.o -c ../qemu/hw/s390x/s390-pci-inst.c
> ../qemu/hw/s390x/s390-pci-inst.c: In function =E2=80=98s390_pci_update_io=
tlb=E2=80=99:
> ../qemu/hw/s390x/s390-pci-inst.c:599:61: error: incompatible type for arg=
ument 3 of =E2=80=98memory_region_notify_iommu=E2=80=99
>   599 |             memory_region_notify_iommu(&iommu->iommu_mr, 0, notif=
y);
>       |                                                             ^~~~~=
~
>       |                                                             |
>       |                                                             IOMMU=
TLBEntry
> In file included from /scm/qemu/include/exec/cpu-all.h:23,
>                  from ../qemu/target/s390x/cpu.h:846,
>                  from ../qemu/hw/s390x/s390-pci-inst.c:15:
> /scm/qemu/include/exec/memory.h:1324:47: note: expected =E2=80=98IOMMUTLB=
Event=E2=80=99 but argument is of type =E2=80=98IOMMUTLBEntry=E2=80=99
>  1324 |                                 IOMMUTLBEvent event);
>       |                                 ~~~~~~~~~~~~~~^~~~~
> ../qemu/hw/s390x/s390-pci-inst.c:611:53: error: incompatible type for arg=
ument 3 of =E2=80=98memory_region_notify_iommu=E2=80=99
>   611 |     memory_region_notify_iommu(&iommu->iommu_mr, 0, notify);
>       |                                                     ^~~~~~
>       |                                                     |
>       |                                                     IOMMUTLBEntry
> In file included from /scm/qemu/include/exec/cpu-all.h:23,
>                  from ../qemu/target/s390x/cpu.h:846,
>                  from ../qemu/hw/s390x/s390-pci-inst.c:15:
> /scm/qemu/include/exec/memory.h:1324:47: note: expected =E2=80=98IOMMUTLB=
Event=E2=80=99 but argument is of type =E2=80=98IOMMUTLBEntry=E2=80=99
>  1324 |                                 IOMMUTLBEvent event);
>       |                                 ~~~~~~~~~~~~~~^~~~~
>

Sorry, will compile every target next time.

Sending v3 with s390x changes.

Thanks!


