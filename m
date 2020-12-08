Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 771472D27D5
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 10:39:21 +0100 (CET)
Received: from localhost ([::1]:54000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmZSq-0002NO-1n
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 04:39:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kmZQv-0001w7-Gc
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 04:37:21 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:36073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kmZQt-0004bF-NO
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 04:37:21 -0500
Received: by mail-ej1-x642.google.com with SMTP id lt17so23735110ejb.3
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 01:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=H04qlmtb8GOVjHbIauAjHp3hL9z0pEZLzsG11VbZlh0=;
 b=dbSZqkFRwScVwXkqKBtCdq0l8wchyeL1jNiwWURQzX0ET32g2KLjJv9FnzY6Eg9DMg
 RdWQUAloKjkiMsK/bLUJx4w+25ypM4iUa5geUif7X5EKHkm2nxmj+iz4/WZYjd29b6vW
 E53uvmjJI32tgj+DBIvM2jWrJgZMLxpttRJw72TMpOs4iUTf56tGzCjYPxPZX7cKWXb5
 H92AcRpoTzotdovrGdPzL5wOrdspybZu5lQ0CTJzka2MAzWHBP3Wn0AEhd/EaiTtFEeO
 7yBcmLe/D7w1aROsuB97aDhI8ql+nc5KUXA6iEyzfe25f50N1EWV6yQNM9aA1CrnYqoH
 CgtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=H04qlmtb8GOVjHbIauAjHp3hL9z0pEZLzsG11VbZlh0=;
 b=GQ71xZFJq769ccEUH0WhohjexSnZGNPQAP7D1VFsxt5wzpvi+d1itNAoEhItl5XdwE
 evu7VCGDo93Q4+dy+hYsdEepiCsICDCKfCiAfIke2H6nB0VDUJ37v66Of1vTzHUdHfV2
 a13zJq7JlzcsjFBQNosBAV0z+Pxj30nNgd67tX+zpfdWWXD4fULFiYcWMdQqpYbh14jF
 lWOZV2eLb6tRHUfyDHQqs0e5m3RJdofQm/vxSDjSTzZnOVr86S4ESIaqEXfaFNtV1GQV
 3WDmwvWhC4EpOayXnv2JFHYhUj2QDXeBKwv2GgUewTN8An8PwBnBb4wWFG78HzBD7mHh
 smtA==
X-Gm-Message-State: AOAM5311up9AmNyUbVfUglKQ3cXgaTymU9iVio7j5WNB24QmtexmG+ME
 zP54WiRg6JXoKNukggRFKlw=
X-Google-Smtp-Source: ABdhPJxZVOdT5V/bGQkbT7kDiYMKS1OUX76aAlA687e08yXRtJiX1YkBPrTrqfOklwYbJY8kqXBsKw==
X-Received: by 2002:a17:906:c24b:: with SMTP id
 bl11mr22185341ejb.3.1607420238209; 
 Tue, 08 Dec 2020 01:37:18 -0800 (PST)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id bn21sm12914808ejb.47.2020.12.08.01.37.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 01:37:17 -0800 (PST)
Date: Tue, 8 Dec 2020 09:37:15 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: [RFC PATCH 00/27] vDPA software assisted live migration
Message-ID: <20201208093715.GX203660@stefanha-x1.localdomain>
References: <20201120185105.279030-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="je0mZywpqEo4t1RU"
Content-Disposition: inline
In-Reply-To: <20201120185105.279030-1-eperezma@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=stefanha@gmail.com; helo=mail-ej1-x642.google.com
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
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Daniel Daly <dandaly0@gmail.com>, virtualization@lists.linux-foundation.org,
 Liran Alon <liralon@gmail.com>, Eli Cohen <eli@mellanox.com>,
 Nitin Shrivastav <nitin.shrivastav@broadcom.com>,
 Alex Barba <alex.barba@broadcom.com>,
 Christophe Fontaine <cfontain@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Lee Ballard <ballle98@gmail.com>, Lars Ganrot <lars.ganrot@gmail.com>,
 Rob Miller <rob.miller@broadcom.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Howard Cai <howard.cai@gmail.com>, Parav Pandit <parav@mellanox.com>,
 vm <vmireyno@marvell.com>, Salil Mehta <mehta.salil.lnk@gmail.com>,
 Stephen Finucane <stephenfin@redhat.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Sean Mooney <smooney@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Jim Harford <jim.harford@broadcom.com>,
 Dmytro Kazantsev <dmytro.kazantsev@gmail.com>, Siwei Liu <loseweigh@gmail.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Michael Lilja <ml@napatech.com>,
 Max Gurtovoy <maxgu14@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--je0mZywpqEo4t1RU
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2020 at 07:50:38PM +0100, Eugenio P=E9rez wrote:
> This series enable vDPA software assisted live migration for vhost-net
> devices. This is a new method of vhost devices migration: Instead of
> relay on vDPA device's dirty logging capability, SW assisted LM
> intercepts dataplane, forwarding the descriptors between VM and device.

Pros:
+ vhost/vDPA devices don't need to implement dirty memory logging
+ Obsoletes ioctl(VHOST_SET_LOG_BASE) and friends

Cons:
- Not generic, relies on vhost-net-specific ioctls
- Doesn't support VIRTIO Shared Memory Regions
  https://github.com/oasis-tcs/virtio-spec/blob/master/shared-mem.tex
- Performance (see below)

I think performance will be significantly lower when the shadow vq is
enabled. Imagine a vDPA device with hardware vq doorbell registers
mapped into the guest so the guest driver can directly kick the device.
When the shadow vq is enabled a vmexit is needed to write to the shadow
vq ioeventfd, then the host kernel scheduler switches to a QEMU thread
to read the ioeventfd, the descriptors are translated, QEMU writes to
the vhost hdev kick fd, the host kernel scheduler switches to the vhost
worker thread, vhost/vDPA notifies the virtqueue, and finally the
vDPA driver writes to the hardware vq doorbell register. That is a lot
of overhead compared to writing to an exitless MMIO register!

If the shadow vq was implemented in drivers/vhost/ and QEMU used the
existing ioctl(VHOST_SET_LOG_BASE) approach, then the overhead would be
reduced to just one set of ioeventfd/irqfd. In other words, the QEMU
dirty memory logging happens asynchronously and isn't in the dataplane.

In addition, hardware that supports dirty memory logging as well as
software vDPA devices could completely eliminate the shadow vq for even
better performance.

But performance is a question of "is it good enough?". Maybe this
approach is okay and users don't expect good performance while dirty
memory logging is enabled. I just wanted to share the idea of moving the
shadow vq into the kernel in case you like that approach better.

Stefan

--je0mZywpqEo4t1RU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/PSUsACgkQnKSrs4Gr
c8gQ+gf+PZB8RHKqu3nzT0rmAbtlme76xGY3u9UIr5jckuQ1ZTVVztqZEneemNB+
Z4YWhLni7IRYc+vDZbv1gnch2+DCElbbQIq4loGpKp8QDuuOCZVrcFCMtHElPGoV
ND4eMy7TWVkUM1cVEDHxbwyfZAswrLg3Q2vpYw/ysMTX3E2ddjplSw6ILWRj0YYX
L0fy0Hkp2mB8QGa/tIpXLqBXyfj+L9GhOZZEoskfnyGTfAlZK3/NsosrLit/h/GL
5z/GkL/Yvx4jmu/v+FlubhLrJ1YZfiU8yOyuCxXIMdVFNWXS71/KBG+nXiV+DaLt
+tylyKz0CuSBHwe3TXpp29Y6bkGRcA==
=NkoN
-----END PGP SIGNATURE-----

--je0mZywpqEo4t1RU--

