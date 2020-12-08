Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3D02D2449
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 08:23:55 +0100 (CET)
Received: from localhost ([::1]:34230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmXLl-0005XU-Js
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 02:23:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kmXJ0-0004lO-Gv
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 02:21:03 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:36160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kmXIv-0000xY-2P
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 02:21:02 -0500
Received: by mail-ej1-x644.google.com with SMTP id lt17so23241756ejb.3
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 23:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/h2yFiiCakJYZ7C4aOv6n4E6nxXfNP5Jigi5iFmZn4o=;
 b=g9k9EHyyE1hyh4GREJGgliFEA0ACDBQoilZma7WSGUbkrSU12XsZRINIy0PAa2YAbm
 8jIwIAWXmroD/yp7Wlkwg7/4zkF7ReIlTm8yY6vr93wZHRzKNagE5iTQRjbWaWGsmgCx
 IhMXTNfbWrw66OJZzE7QgPlmBO9LxJ31OfPy/jG0lWT06o/3FHubxQoiOaj+M9r9R+q6
 Oi6z+6pP4X6slMLeu0dZCJV4XZ1RrvNaA4yLihSzjdJJJCRmjl02MRaKgVxzDTZbsy4x
 B1N/VhOh/ToqToiS7YxKuFtp5CiTasuTKJTuDUWDgnEkCZTt+4plmE15QfzZ+X1oPCEI
 NBDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/h2yFiiCakJYZ7C4aOv6n4E6nxXfNP5Jigi5iFmZn4o=;
 b=MT4U5D2ftzC5GwMGetpswOQ3ub31eQksCJCmR9gil+zlor+kZAXiEMpmx3AM/Ui0BX
 ZQU04pjJ/I/UfwcKkmckP5eCEVZIlwCWzKRRTfwJYuYpPisMJQqbYlJkiODs3Y1aS8Md
 /jSjH/kjsvZAUrS1l9T/Yjgd/ZMCxX7Qnkmf8qhh6F+ApUii/rDRWnpGzRfBGJj8wQAO
 g0cvqlB8QyN1TDBr8Fzwn7KWgDaWKfwbtWL4H7GQN65U4Iahl5mq/D0P/t1mrNPe2V5r
 /gdhAFJ3+bu7jUhHClRMOtUtlmulExXEdPWYgc5nkYprTuI7PPI4luaCSdWjv1DVhJVq
 xI3g==
X-Gm-Message-State: AOAM531+QRKo/2+dqwq7DCtzHhEAUs2mLdxe/E+luSwvHdYjc6VQReGX
 h683gHzSOQi1f8etaxiwL5g=
X-Google-Smtp-Source: ABdhPJz/JnR5N/NM+ralFbvuipmGWLzBttoSpakMqOYFYSR5Rk/CB0G8LXhZRJBRyhaegtzdavo3sA==
X-Received: by 2002:a17:907:2108:: with SMTP id
 qn8mr22101643ejb.127.1607412054128; 
 Mon, 07 Dec 2020 23:20:54 -0800 (PST)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id rl7sm13489164ejb.107.2020.12.07.23.20.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 23:20:52 -0800 (PST)
Date: Tue, 8 Dec 2020 07:20:51 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: [RFC PATCH 08/27] vhost: Add a flag for software assisted Live
 Migration
Message-ID: <20201208072051.GO203660@stefanha-x1.localdomain>
References: <20201120185105.279030-1-eperezma@redhat.com>
 <20201120185105.279030-9-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="keoAwTxaagou87Dg"
Content-Disposition: inline
In-Reply-To: <20201120185105.279030-9-eperezma@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=stefanha@gmail.com; helo=mail-ej1-x644.google.com
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


--keoAwTxaagou87Dg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2020 at 07:50:46PM +0100, Eugenio P=E9rez wrote:
> @@ -1571,6 +1577,13 @@ void vhost_dev_disable_notifiers(struct vhost_dev =
*hdev, VirtIODevice *vdev)
>      BusState *qbus =3D BUS(qdev_get_parent_bus(DEVICE(vdev)));
>      int i, r;
> =20
> +    if (hdev->sw_lm_enabled) {
> +        /* We've been called after migration is completed, so no need to
> +           disable it again
> +        */
> +        return;
> +    }
> +
>      for (i =3D 0; i < hdev->nvqs; ++i) {
>          r =3D virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), hdev->vq_in=
dex + i,
>                                           false);

What is the purpose of this?

--keoAwTxaagou87Dg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/PKVMACgkQnKSrs4Gr
c8g4MQgAuHhrnsIoIcFJBG8vM52Q4JFZAfZXRtw2rZr14BSUaoKLRLLesEpWWkwy
xguwLpUJihF1okcf7wSAioIiVkaWPy/+z2Q2Yus4JQGPpZEYCfficmeOVnb1Whxr
6BJKaDQdNEjd7rpKiaegscT9iIyIOOGZErGBZTVBCttrBDbmoYtdtwrvTr0m97Tn
+0O56WNnmRVHZbbFlYpDCp61oH9VQSQbqsRp4nshZVwiaRHptw5PotRSYa9v+SUj
gaJj0DyxrTaOo/PZRzJgfH6ByiePKWy2y41ZVFIeV64aNJWNfPdlYcXgnAyBk3gF
s1qYSxylD703VnKvaWBQTXO8PnJikA==
=1YKg
-----END PGP SIGNATURE-----

--keoAwTxaagou87Dg--

