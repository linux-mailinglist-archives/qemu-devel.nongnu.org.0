Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B125F7B3E
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 18:14:51 +0200 (CEST)
Received: from localhost ([::1]:47084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogpzu-0007hR-Qy
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 12:14:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ogp9H-0008UE-OO
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 11:20:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ogp9E-0005W2-QS
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 11:20:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665156019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j8jsb6GoKSwFsWJLZgyeXwepDHJjg04DBE9msAK8QXQ=;
 b=YS92QAoIiNcCpqpaOLpyrKI36rbGd6AzDBRPOnZbamNzvMdyuZXTpTkTJ0XtCTsHkbL+YS
 Y/fAiWsXCou3R4naPkgvmM7J8rTdjt6/NkQ6KTRGFwyaQcUyPPfdyryeWFOGwsLkhsX+Wp
 6cHOrFZNb/VRr4yfNxfwEoAtKMi22ms=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-241-KnSxdJubMTq8gpaqri7xNw-1; Fri, 07 Oct 2022 11:20:18 -0400
X-MC-Unique: KnSxdJubMTq8gpaqri7xNw-1
Received: by mail-pj1-f69.google.com with SMTP id
 kk6-20020a17090b4a0600b0020af381d1c4so4541575pjb.8
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 08:20:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j8jsb6GoKSwFsWJLZgyeXwepDHJjg04DBE9msAK8QXQ=;
 b=2V4LpJp1429rZPlZ+d041xXIop8taDR12yqfPABHZKFl19xEtGcNFwMQ9nCi16G1vr
 +6LUhRa1MaFF3qKBnRUQEUZFGX5Csk3hgJeGS8JcioT6Xzmtit+WsPBZ4isHjgm0Kaed
 r09so6IKQbs9ectenOCyIJc5MPegx9V7A/5QcHkW3jm4ZgDAnrJniaQpphsV+YetMYvn
 N4muGA2Qd7HORvbhaKBmHrpZlC+H/gih97zgLOSGf8UpAVvg4Is2X9cg03zOLD6u3jc7
 UGniIbJ+iFPy3xRBPRJTJPorSp4mtWGVPUTvgirqBuxYw0E2iV0hXG9FqXAiCEt1gTCj
 Y1dA==
X-Gm-Message-State: ACrzQf3y2RE0cNDuBNm9QrqYunh51v/Aumug2ZknB48c9foGEyhQZqQ4
 D6DFcN5g2Pi62gGZzK2vV4IjbH8mbHIbjoWQ21k7TpRfFK56VZr0n/HSkQJ1SFi7t3JL6kQeIGB
 HeQu8Lm5r/i1uXAlsml1Yh2zkYFl7F1o=
X-Received: by 2002:a17:902:ce8f:b0:176:e0b3:cf14 with SMTP id
 f15-20020a170902ce8f00b00176e0b3cf14mr5535587plg.153.1665156017350; 
 Fri, 07 Oct 2022 08:20:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Tbc72LN7CSNmnUBHz7S7yS1nvPviUqe6DW345yBw5mRAulUvxDfGE9LSl/yz5g4IXeMtSl0q2n7mpaYhfQLA=
X-Received: by 2002:a17:902:ce8f:b0:176:e0b3:cf14 with SMTP id
 f15-20020a170902ce8f00b00176e0b3cf14mr5535560plg.153.1665156017033; Fri, 07
 Oct 2022 08:20:17 -0700 (PDT)
MIME-Version: 1.0
References: <1664913657-3424-1-git-send-email-si-wei.liu@oracle.com>
In-Reply-To: <1664913657-3424-1-git-send-email-si-wei.liu@oracle.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 7 Oct 2022 17:19:40 +0200
Message-ID: <CAJaqyWdAJn4mW8NB7jAm9JmbPNJQpV7OTqXH45_eMU97UXnW-A@mail.gmail.com>
Subject: Re: [PATCH] vhost-vdpa: allow passing opened vhostfd to vhost-vdpa
To: Si-Wei Liu <si-wei.liu@oracle.com>
Cc: qemu-devel@nongnu.org, jasowang@redhat.com, eblake@redhat.com, 
 armbru@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

On Tue, Oct 4, 2022 at 11:09 PM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
> Similar to other vhost backends, vhostfd can be passed to vhost-vdpa
> backend as another parameter to instantiate vhost-vdpa net client.
> This would benefit the use case where only open fd's, as oppposed to

s/oppposed/opposed/ (realized by the mail client actually).

Also, not an English native, but is it correct to use "fd's" there?
Just "fds" or "file descriptors" sounds better to me, but I'm not sure
about it.

> raw vhost-vdpa device paths, are accessible from the QEMU process.
>
> (qemu) netdev_add type=3Dvhost-vdpa,vhostfd=3D61,id=3Dvhost-vdpa1
>
> Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>

Apart from the typos,

Acked-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

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


