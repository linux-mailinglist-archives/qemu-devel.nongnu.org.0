Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C865F897F
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Oct 2022 07:46:05 +0200 (CEST)
Received: from localhost ([::1]:44572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohP8W-0001tJ-76
	for lists+qemu-devel@lfdr.de; Sun, 09 Oct 2022 01:46:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ohP6J-0000P7-HZ
 for qemu-devel@nongnu.org; Sun, 09 Oct 2022 01:43:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ohP6G-0004du-DR
 for qemu-devel@nongnu.org; Sun, 09 Oct 2022 01:43:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665294220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nRKHLYYi2irziAI06Kja7PtQlW9hPele5Bcod66Or+w=;
 b=Uy8UazdAHMcscRSOi8mJOsnfF7V9Yixw0BLQdhC7dVJ6hYDQ9uc+hjJdPq3SiNH8fbR9dw
 kKMfNg3RD9pxfC0tsdFl3dJ4q36Z1cwkC+vgL6Wk+65HkD47Vwq3sKd333OArJUUBUim3o
 O4w5fZggBDoQDNm4yTACUUl1Lag0KJQ=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-363-AoDyO2VKOdKcS0p__vQpKQ-1; Sun, 09 Oct 2022 01:43:39 -0400
X-MC-Unique: AoDyO2VKOdKcS0p__vQpKQ-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-13631a68551so1718927fac.22
 for <qemu-devel@nongnu.org>; Sat, 08 Oct 2022 22:43:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nRKHLYYi2irziAI06Kja7PtQlW9hPele5Bcod66Or+w=;
 b=KVjmiz6Nq1uZMVRR+lwQMZ6ElA4WdTGWa3xp1XV4Jo7YYsWqlJXWCf/w2p3Ykb1Kex
 RFD1+E8sr6DE3kL10YBEmsCkb9dSh4woYMnTLsBJ79LKRwaIOPgNaDlJaHZrLhBuwrU0
 mxBvYXTo/oLfNuigKtNL4fu5jPLQaC7zwtGu4pYp7SyW1s0v3VmD3e9vZHH+PToe25oY
 6IK156WNEicEeyIPhikrETahQg+UsO9KPZpyo3LI3R7ezj1SSbNB/w0fhXJUcfBsMFfd
 tVyPlEzQbLqCVQLl0+FfakKLtrVY9iHjsE+fav+V+a4XxUnGQ0/V3TlBYk2vso4hmsiz
 n0WA==
X-Gm-Message-State: ACrzQf1JHBrPi4bHr5B+QdknK4qf9cYo4XuoHAwJ6UyafTehWKz5FeGS
 zOQvwFBaRar2mvKnNPGDbQHtOO1fGODK3J8lTuoIpE7pCUnfIpReq2sAofwZdlN5aU1Tbam43aU
 hPVhidPk+ju+HK6axR8w3AdwkvECHj1k=
X-Received: by 2002:a4a:1101:0:b0:476:7b37:e379 with SMTP id
 1-20020a4a1101000000b004767b37e379mr4748053ooc.57.1665294218864; 
 Sat, 08 Oct 2022 22:43:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM51ZeKhCF9kUTLUARFk9cMu8mrhmwU8sSAlpbB1HjKcgJWj3odNd9HkS8dW9kL44XM6k4Mykws0SG9RX5n0mO4=
X-Received: by 2002:a4a:1101:0:b0:476:7b37:e379 with SMTP id
 1-20020a4a1101000000b004767b37e379mr4748042ooc.57.1665294218524; Sat, 08 Oct
 2022 22:43:38 -0700 (PDT)
MIME-Version: 1.0
References: <1665215938-24473-1-git-send-email-si-wei.liu@oracle.com>
In-Reply-To: <1665215938-24473-1-git-send-email-si-wei.liu@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Date: Sun, 9 Oct 2022 13:43:23 +0800
Message-ID: <CACGkMEuc3Kwjt8r7HsU_-s-AVsAiMXddYZ0Um0sAhN6igaMn7Q@mail.gmail.com>
Subject: Re: [PATCH v2] vhost-vdpa: allow passing opened vhostfd to vhost-vdpa
To: Si-Wei Liu <si-wei.liu@oracle.com>
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com, 
 eperezma@redhat.com, Cindy Lu <lulu@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

On Sat, Oct 8, 2022 at 5:04 PM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
> Similar to other vhost backends, vhostfd can be passed to vhost-vdpa
> backend as another parameter to instantiate vhost-vdpa net client.
> This would benefit the use case where only open file descriptors, as
> opposed to raw vhost-vdpa device paths, are accessible from the QEMU
> process.
>
> (qemu) netdev_add type=3Dvhost-vdpa,vhostfd=3D61,id=3Dvhost-vdpa1

Adding Cindy.

This has been discussed before, we've already had
vhostdev=3D/dev/fdset/$fd which should be functional equivalent to what
has been proposed here. (And this is how libvirt works if I understand
correctly).

Thanks

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


