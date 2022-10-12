Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E76095FBF6F
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 05:12:07 +0200 (CEST)
Received: from localhost ([::1]:41682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiSA9-0003Bz-Uo
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 23:12:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oiS8H-0000Xi-LG
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 23:10:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oiS8D-00004t-Go
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 23:10:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665544204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OevJCXXogZtwWe/ZjvBkZVtTNyUSTwJZl+YdRYM5y1c=;
 b=Hb00RxFqwbgj1tGixpHw0CPghLOjZpqiS5iMflsiIJM7QbXmF3mBNr9G7zHT5zD5VADbUz
 JIAvYywHoHQ8ejIShSonNI2+lA/9bwuWyZcWTAj4n96tE/RoQzQP7qaNmcgGqSq940bKEs
 akOUeM/fqLPrstXcyJZXtbBI8b7HMWc=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-104-gAlXTmGJMDu2bjEJuJ7dGA-1; Tue, 11 Oct 2022 23:10:03 -0400
X-MC-Unique: gAlXTmGJMDu2bjEJuJ7dGA-1
Received: by mail-oo1-f70.google.com with SMTP id
 u27-20020a4a6c5b000000b0047f91b7b4bfso8627091oof.3
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 20:10:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OevJCXXogZtwWe/ZjvBkZVtTNyUSTwJZl+YdRYM5y1c=;
 b=P09dKAatzdFw0g7fkbrgixUKY3EJ2pZl7yAw7TSv7MFlbUSEWnCKmf+HYuIyLW4KQF
 9UiV3MaPyEiKqp4SNOFcFWvkwnHjYhXflMAh1Ocuvxh/4eEgp/4UZu8qeMdR6bEtgFDY
 oOhVErZ+xoMJHwJQX1aov+T1mM5zlA4twEesUMBSXVPJuhbXDGUqzlADbgZkzpiy5Z25
 /ludeOtIqNjJDqJL5kR+cle8hVaF8PwgcjrtFyuzvSqK4lStg5jV9MVrZTcfLP8kO+NT
 QXAda9txnsrWHbf7qd2FP8ZZsPoTN3bfJkHItOyH68H6u5EaDeJEXTvR9HH2Ezxo87PI
 ezfw==
X-Gm-Message-State: ACrzQf2s64D7aS0/kzHCSo4i6Fnj695NFffdi+sNOyhaR+YRD9c5+VQP
 7Sr9VHP+qrvLs7wcE5Z9vmf5JQ3/MLtJm1eITYNc03Yi99uX9dzgnJdeYfIwBMmBNCt0b8VBXt2
 G1SU2EF/5E1ed4+B/i7CylqQi2c9wMLU=
X-Received: by 2002:a9d:12a8:0:b0:661:a06f:33d7 with SMTP id
 g37-20020a9d12a8000000b00661a06f33d7mr5235589otg.237.1665544202378; 
 Tue, 11 Oct 2022 20:10:02 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7v2zeBaor+0uMEYiESCEw1zZtqWAOm7921Q2+3m/sjFHCa2bQR/Wk6ZjywJUlryrf5qHsaw32Sa0T7l2FqRVY=
X-Received: by 2002:a9d:12a8:0:b0:661:a06f:33d7 with SMTP id
 g37-20020a9d12a8000000b00661a06f33d7mr5235581otg.237.1665544202119; Tue, 11
 Oct 2022 20:10:02 -0700 (PDT)
MIME-Version: 1.0
References: <1665215938-24473-1-git-send-email-si-wei.liu@oracle.com>
 <CACGkMEuc3Kwjt8r7HsU_-s-AVsAiMXddYZ0Um0sAhN6igaMn7Q@mail.gmail.com>
 <fff559ab-ce66-5830-f5da-e0d9e61adf59@oracle.com>
In-Reply-To: <fff559ab-ce66-5830-f5da-e0d9e61adf59@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 12 Oct 2022 11:09:51 +0800
Message-ID: <CACGkMEu6h5kHX1isY7GaVGySjE+2+hkM0pMXmdUTmC7HkoFg-Q@mail.gmail.com>
Subject: Re: [PATCH v2] vhost-vdpa: allow passing opened vhostfd to vhost-vdpa
To: Si-Wei Liu <si-wei.liu@oracle.com>
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com, 
 eperezma@redhat.com, Cindy Lu <lulu@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Oct 11, 2022 at 1:18 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
>
>
> On 10/8/2022 10:43 PM, Jason Wang wrote:
>
> On Sat, Oct 8, 2022 at 5:04 PM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
> Similar to other vhost backends, vhostfd can be passed to vhost-vdpa
> backend as another parameter to instantiate vhost-vdpa net client.
> This would benefit the use case where only open file descriptors, as
> opposed to raw vhost-vdpa device paths, are accessible from the QEMU
> process.
>
> (qemu) netdev_add type=3Dvhost-vdpa,vhostfd=3D61,id=3Dvhost-vdpa1
>
> Adding Cindy.
>
> This has been discussed before, we've already had
> vhostdev=3D/dev/fdset/$fd which should be functional equivalent to what
> has been proposed here. (And this is how libvirt works if I understand
> correctly).
>
> Yes, I was aware of that discussion. However, our implementation of the m=
anagement software is a bit different from libvirt, in which the paths in /=
dev/fdset/NNN can't be dynamically passed to the container where QEMU is ru=
nning. By using a specific vhostfd property with existing code, it would al=
low our mgmt software smooth adaption without having to add too much infra =
code to support the /dev/fdset/NNN trick.

I think fdset has extra flexibility in e.g hot-plug to allow the file
descriptor to be passed with SCM_RIGHTS. It would still be good to add
the support.

>
> On the other hand, the other vhost backends, e.g. tap (via vhost-net), vh=
ost-scsi and vhost-vsock all accept vhostfd as parameter to instantiate dev=
ice, although the /dev/fdset trick also works there. I think vhost-vdpa is =
not  unprecedented in this case?

Yes.

Thanks

>
> Thanks,
> -Siwei
>
>
>
> Thanks
>
> Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
> Acked-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
>
> ---
> v2:
>   - fixed typo in commit message
>   - s/fd's/file descriptors/
> ---
>  net/vhost-vdpa.c | 25 ++++++++++++++++++++-----
>  qapi/net.json    |  3 +++
>  qemu-options.hx  |  6 ++++--
>  3 files changed, 27 insertions(+), 7 deletions(-)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 182b3a1..366b070 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -683,14 +683,29 @@ int net_init_vhost_vdpa(const Netdev *netdev, const=
 char *name,
>
>      assert(netdev->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
>      opts =3D &netdev->u.vhost_vdpa;
> -    if (!opts->vhostdev) {
> -        error_setg(errp, "vdpa character device not specified with vhost=
dev");
> +    if (!opts->has_vhostdev && !opts->has_vhostfd) {
> +        error_setg(errp,
> +                   "vhost-vdpa: neither vhostdev=3D nor vhostfd=3D was s=
pecified");
>          return -1;
>      }
>
> -    vdpa_device_fd =3D qemu_open(opts->vhostdev, O_RDWR, errp);
> -    if (vdpa_device_fd =3D=3D -1) {
> -        return -errno;
> +    if (opts->has_vhostdev && opts->has_vhostfd) {
> +        error_setg(errp,
> +                   "vhost-vdpa: vhostdev=3D and vhostfd=3D are mutually =
exclusive");
> +        return -1;
> +    }
> +
> +    if (opts->has_vhostdev) {
> +        vdpa_device_fd =3D qemu_open(opts->vhostdev, O_RDWR, errp);
> +        if (vdpa_device_fd =3D=3D -1) {
> +            return -errno;
> +        }
> +    } else if (opts->has_vhostfd) {
> +        vdpa_device_fd =3D monitor_fd_param(monitor_cur(), opts->vhostfd=
, errp);
> +        if (vdpa_device_fd =3D=3D -1) {
> +            error_prepend(errp, "vhost-vdpa: unable to parse vhostfd: ")=
;
> +            return -1;
> +        }
>      }
>
>      r =3D vhost_vdpa_get_features(vdpa_device_fd, &features, errp);
> diff --git a/qapi/net.json b/qapi/net.json
> index dd088c0..926ecc8 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -442,6 +442,8 @@
>  # @vhostdev: path of vhost-vdpa device
>  #            (default:'/dev/vhost-vdpa-0')
>  #
> +# @vhostfd: file descriptor of an already opened vhost vdpa device
> +#
>  # @queues: number of queues to be created for multiqueue vhost-vdpa
>  #          (default: 1)
>  #
> @@ -456,6 +458,7 @@
>  { 'struct': 'NetdevVhostVDPAOptions',
>    'data': {
>      '*vhostdev':     'str',
> +    '*vhostfd':      'str',
>      '*queues':       'int',
>      '*x-svq':        {'type': 'bool', 'features' : [ 'unstable'] } } }
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 913c71e..c040f74 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2774,8 +2774,10 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
>      "                configure a vhost-user network, backed by a chardev=
 'dev'\n"
>  #endif
>  #ifdef __linux__
> -    "-netdev vhost-vdpa,id=3Dstr,vhostdev=3D/path/to/dev\n"
> +    "-netdev vhost-vdpa,id=3Dstr[,vhostdev=3D/path/to/dev][,vhostfd=3Dh]=
\n"
>      "                configure a vhost-vdpa network,Establish a vhost-vd=
pa netdev\n"
> +    "                use 'vhostdev=3D/path/to/dev' to open a vhost vdpa =
device\n"
> +    "                use 'vhostfd=3Dh' to connect to an already opened v=
host vdpa device\n"
>  #endif
>  #ifdef CONFIG_VMNET
>      "-netdev vmnet-host,id=3Dstr[,isolated=3Don|off][,net-uuid=3Duuid]\n=
"
> @@ -3280,7 +3282,7 @@ SRST
>               -netdev type=3Dvhost-user,id=3Dnet0,chardev=3Dchr0 \
>               -device virtio-net-pci,netdev=3Dnet0
>
> -``-netdev vhost-vdpa,vhostdev=3D/path/to/dev``
> +``-netdev vhost-vdpa[,vhostdev=3D/path/to/dev][,vhostfd=3Dh]``
>      Establish a vhost-vdpa netdev.
>
>      vDPA device is a device that uses a datapath which complies with
> --
> 1.8.3.1
>
>


