Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D301A29FDC7
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Oct 2020 07:23:15 +0100 (CET)
Received: from localhost ([::1]:52992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYNog-0006mB-Ey
	for lists+qemu-devel@lfdr.de; Fri, 30 Oct 2020 02:23:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kYNne-0006L3-Gi
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 02:22:10 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:45243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kYNnb-00059G-Cy
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 02:22:10 -0400
Received: by mail-pg1-x52b.google.com with SMTP id 15so4322463pgd.12
 for <qemu-devel@nongnu.org>; Thu, 29 Oct 2020 23:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zDYWi+U2HO2dUs+SLOezzyUzfvF0ygZp77bWRgCQvTI=;
 b=DcrSg9V0pnyzA6L9VVTmW3IDuFTHa3j934barI9zg1KnaWrMOAayybbAdQRwTUsdwB
 VfYuI94tl8p700IenKqufhlhNnVR1ldcNCrrW1AFztuVHXI7NWN8IpJOXlTfLTFaiSWX
 E32BLLMwANAtdI9apPcY9PXOYx/8eCNGWUZDgrN/FAKG5f1Imk0K2769dotwFP486wvW
 EegIcGE+bnkDRIpRiXFwfKGxa6mmZpHUHV5jj+Ik1tDhU5jtiaVZmT6aR2UGQ/MzyyGz
 ksQEH+zpmeGs216DivQey1SGmHH7aq6bHsbwSWkaNlnMnIqw9FcaNamfvSPZWe9aeYLd
 /tjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zDYWi+U2HO2dUs+SLOezzyUzfvF0ygZp77bWRgCQvTI=;
 b=oZ3BM4QztAPXbrasf/vRIbWz6b1er8K/tavod29UhfrT4KDzaD7yeb44KNNLpjpeBd
 EBZ0ZR8fMLrhFoVkSKzwtv1Pd+dmrSobHD9SbvJQ1QPwvaQdvoLP94v7Drgsk45mM/rC
 yKBypy5bQwSU2jyZuya7y26Y2r7SntynfRPqmU31YEbSvrVgPMfuckFUKx5GCjzmVRDc
 pFWzMsyxeGb60lI1iypspx9xZW2oi8yKzOcPSFIAoOU4YZRAlpe7vIpI8lRLDpfvpwer
 ufVyqDzGwdI3UfJKX/tM7zfG2iqNOcK3p12G85XFcnyp5cDfQUSp96zvc8tIpwdu1kj5
 xTnQ==
X-Gm-Message-State: AOAM5306rugTJTSjHzSlL0pXp/BwIPy5u6qtX794d7POvici3S6DwjE9
 4OQ7kCNoqo9pJeV7CCgfkrKiA0bEO457JHLLX2Q=
X-Google-Smtp-Source: ABdhPJwnT4KjUZSoj6zmInR9kpwvcDhFRXpnz3pUC874iEmmhMYXuYqw3ZB5iIueh9mTJC2OEcnEa51hoTwn+5v0/GA=
X-Received: by 2002:aa7:96d5:0:b029:162:16e3:db2f with SMTP id
 h21-20020aa796d50000b029016216e3db2fmr7699205pfq.71.1604038925877; Thu, 29
 Oct 2020 23:22:05 -0700 (PDT)
MIME-Version: 1.0
References: <20201027151400.GA138065@stefanha-x1.localdomain>
 <CAJSP0QWrmNN1Ci-M-4WDFZBOGHyeZvF71utg0w2ajCbOLtynJw@mail.gmail.com>
 <c4e5b631-1607-a0ec-ee88-6c5a9493e3de@redhat.com>
 <20201029083130.0617a28f@w520.home>
 <b85405de-d525-bf59-826c-737fa7bbdfef@redhat.com>
 <20201029094603.15382476@w520.home>
 <d4f7df42-7b02-6505-c2c7-245bf813b513@redhat.com>
 <20201029210407.33d6f008@x1.home>
In-Reply-To: <20201029210407.33d6f008@x1.home>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Fri, 30 Oct 2020 06:21:54 +0000
Message-ID: <CAJSP0QVto+xFEnWv-aj=-0mZ72SzfeAvg4q0RCoLGK-N7C-WEw@mail.gmail.com>
Subject: Re: Out-of-Process Device Emulation session at KVM Forum 2020
To: Alex Williamson <alex.williamson@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=stefanha@gmail.com; helo=mail-pg1-x52b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Janosch Frank <frankja@linux.vnet.ibm.com>,
 "mst@redhat.com" <mtsirkin@redhat.com>,
 John G Johnson <john.g.johnson@oracle.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Kirti Wankhede <kwankhede@nvidia.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Yan Vugenfirer <yan@daynix.com>,
 Jag Raman <jag.raman@oracle.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 Anup Patel <anup@brainfault.org>,
 Claudio Imbrenda <imbrenda@linux.vnet.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Roman Kagan <rkagan@virtuozzo.com>, Felipe Franciosi <felipe@nutanix.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Jens Freimann <jfreimann@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Liran Alon <liran.alon@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Halil Pasic <pasic@linux.vnet.ibm.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Christophe de Dinechin <dinechin@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, fam <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 30, 2020 at 3:04 AM Alex Williamson
<alex.williamson@redhat.com> wrote:
> It's great to revisit ideas, but proclaiming a uAPI is bad solely
> because the data transfer is opaque, without defining why that's bad,
> evaluating the feasibility and implementation of defining a well
> specified data format rather than protocol, including cross-vendor
> support, or proposing any sort of alternative is not so helpful imo.

The migration approaches in VFIO and vDPA/vhost were designed for
different requirements and I think this is why there are different
perspectives on this. Here is a comparison and how VFIO could be
extended in the future. I see 3 levels of device state compatibility:

1. The device cannot save/load state blobs, instead userspace fetches
and restores specific values of the device's runtime state (e.g. last
processed ring index). This is the vhost approach.

2. The device can save/load state in a standard format. This is
similar to #1 except that there is a single read/write blob interface
instead of fine-grained get_FOO()/set_FOO() interfaces. This approach
pushes the migration state parsing into the device so that userspace
doesn't need knowledge of every device type. With this approach it is
possible for a device from vendor A to migrate to a device from vendor
B, as long as they both implement the same standard migration format.
The limitation of this approach is that vendor-specific state cannot
be transferred.

3. The device can save/load opaque blobs. This is the initial VFIO
approach. A device from vendor A cannot migrate to a device from
vendor B because the format is incompatible. This approach works well
when devices have unique guest-visible hardware interfaces so the
guest wouldn't be able to handle migrating a device from vendor A to a
device from vendor B anyway.

I think we will see more NVMe and VIRTIO hardware VFIO devices in the
future. Those are standard guest-visible hardware interfaces. It makes
sense to define standard migration formats so it's possible to migrate
a device from vendor A to a device from vendor B.

This can be achieved as follows:
1. The VFIO migration blob starts with a unique format identifier such
as a UUID. This way the destination device can identify standard
device state formats and parse them.
2. The VFIO device state ioctl is extended so userspace can enumerate
and select device state formats. This way it's possible to check
available formats on the source and destination devices before
migration and to configure the source device to produce device state
in a common format.

To me it seems #3 makes sense as an initial approach for VFIO since
guest-visible hardware interfaces are often not compatible between PCI
devices. #2 can be added in the future, especially when VFIO drivers
from different vendors become available that present the same
guest-visible hardware interface (NVMe, VIRTIO, etc).

Stefan

