Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF749210DD8
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jul 2020 16:36:21 +0200 (CEST)
Received: from localhost ([::1]:55262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqdqW-0004Ms-Qv
	for lists+qemu-devel@lfdr.de; Wed, 01 Jul 2020 10:36:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1jqdgr-0002IO-IQ
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 10:26:21 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:21849
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1jqdgo-0002Cz-Ra
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 10:26:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593613577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FfqS3n38s4WSKiiBFlt8zKqPPU/x+HfNfW5m8wTDl9I=;
 b=IsuAm5uKNZyhF+nDaX76QL2tYFwvIMPwEH6Ni8e7Pzrxynd3eTPX7j/0NRC+hsnQm1i31x
 P/cKb/UKQzpVatz97/Q/rgpwZ7tyHf3YKS/enHkLjQM1iNwAEfSruoAHiZpR8iyF7htIYz
 gXbQ2JgrxC2nTCVidHbWuJfU1u/JvEg=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-6vtStii_PBm-IHe-TegDuQ-1; Wed, 01 Jul 2020 10:26:16 -0400
X-MC-Unique: 6vtStii_PBm-IHe-TegDuQ-1
Received: by mail-pf1-f200.google.com with SMTP id r12so16651327pfr.16
 for <qemu-devel@nongnu.org>; Wed, 01 Jul 2020 07:26:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FfqS3n38s4WSKiiBFlt8zKqPPU/x+HfNfW5m8wTDl9I=;
 b=Lt5dbMuOeBCvpcZcaq4h2pu8RcxYnlqYHZi+zptBgUIq4rmScZxC1i6paOFl6Uh575
 nnlLB2goSG36a9wMbAYtcP4L2WGdnc4fDB915dvsEMIu/W/CM8rpWSt8cADKEJkrBVhA
 vkXCTU6oKNSEIcIK1ZeKl53vtMSLhlKEnq0GgAPeTELILabn4/noO1HwdgDs7j3YDcWH
 m91pkoVOqXbnGMoK3y9Qz60BxvrmYBOeFBGtMCaQoef0aDtgit4KXrAuTS4ZN99gxunf
 JnS1weNqOYXN8Cv9t5Z9pnBImatGNFRxndmPh1YMXiSuGLtuVaF/Ojdj1avrp3QtqI+4
 uOJg==
X-Gm-Message-State: AOAM531syRi63lmB+b2n6Kue0D1M3i0b/m1vlfMw9FnqtmlmX9ylzJN5
 k2WPZhVQ2F6uztLW4nZBOHMgFWfP1gT0ccW2aACY6jSALrrI197OlytI4O6r2l0nu7DiroabHMf
 c/VTqHVR7TzrQXIyP3EyKzDLcFi69XpM=
X-Received: by 2002:aa7:8b01:: with SMTP id f1mr25043851pfd.223.1593613575400; 
 Wed, 01 Jul 2020 07:26:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy64o8VyIptsgiMRBqS1TJFgl37sJc8vtFRz/oV21PWRT4lpFfwa5eZSnls/JrhPls0yCSLUxUAqrIP6HJ/4pU=
X-Received: by 2002:aa7:8b01:: with SMTP id f1mr25043810pfd.223.1593613575108; 
 Wed, 01 Jul 2020 07:26:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200630174937.25560-1-lulu@redhat.com>
 <20200630174937.25560-13-lulu@redhat.com>
 <cdac1230-77e8-336e-6b81-16cd382281a6@redhat.com>
In-Reply-To: <cdac1230-77e8-336e-6b81-16cd382281a6@redhat.com>
From: Cindy Lu <lulu@redhat.com>
Date: Wed, 1 Jul 2020 22:26:04 +0800
Message-ID: <CACLfguXacGQqMfxcS0c5-pQ088nuDAWjLiKxTsvvN+9Pkg7xYg@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] vhost-vdpa: introduce vhost-vdpa net client
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=207.211.31.120; envelope-from=lulu@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/01 01:29:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Cornelia Huck <cohuck@redhat.com>, Michael Tsirkin <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org, hanand@xilinx.com,
 Rob Miller <rob.miller@broadcom.com>, saugatm@xilinx.com,
 Markus Armbruster <armbru@redhat.com>, hch@infradead.org,
 Eugenio Perez Martin <eperezma@redhat.com>, jgg@mellanox.com,
 mhabets@solarflare.com, Shahaf Shuler <shahafs@mellanox.com>,
 kevin.tian@intel.com, parav@mellanox.com,
 Vitaly Mireyno <vmireyno@marvell.com>, "Liang,
 Cunming" <cunming.liang@intel.com>, gdawar@xilinx.com, jiri@mellanox.com,
 xiao.w.wang@intel.com, Stefan Hajnoczi <stefanha@redhat.com>, "Wang,
 Zhihong" <zhihong.wang@intel.com>, Tiwei Bie <tiwei.bie@intel.com>,
 Ariel Adam <aadam@redhat.com>, rdunlap@infradead.org,
 Maxime Coquelin <maxime.coquelin@redhat.com>, "Zhu,
 Lingshan" <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 1, 2020 at 10:24 PM Eric Blake <eblake@redhat.com> wrote:
>
> On 6/30/20 12:49 PM, Cindy Lu wrote:
> > This patch set introduces a new net client type: vhost-vdpa.
> > vhost-vdpa net client will set up a vDPA device which is specified
> > by a "vhostdev" parameter.
> >
> > Signed-off-by: Lingshan Zhu <lingshan.zhu@intel.com>
> > Signed-off-by: Tiwei Bie <tiwei.bie@intel.com>
> > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > ---
>
> > +++ b/qapi/net.json
> > @@ -428,16 +428,37 @@
> >       '*vhostforce':    'bool',
> >       '*queues':        'int' } }
> >
> > +##
> > +# @NetdevVhostVDPAOptions:
> > +#
> > +# Vhost-vdpa network backend
> > +#
> > +# vDPA device is a device that uses a datapath which complies with the virtio
> > +# specifications with a vendor specific control path.
> > +#
> > +# @vhostdev: path of vhost-vdpa device
> > +#            (default:'/dev/vhost-vdpa-0')
> > +#
> > +# @queues: number of queues to be created for multiqueue vhost-vdpa
> > +#          (default: 1)
> > +#
> > +# Since: 5.1
> > +##
> > +{ 'struct': 'NetdevVhostVDPAOptions',
> > +  'data': {
> > +    '*vhostdev':     'str',
> > +    '*queues':       'int' } }
> > +
> >   ##
> >   # @NetClientDriver:
> >   #
> >   # Available netdev drivers.
> >   #
> > -# Since: 2.7
> > +# Since: 5.1
>
> This should be:
>
> # Since: 2.7
> # @vhost-vdpa since 5.1
>
> since the enum has been around a lot longer than the latest addition to it.
>
Thanks Eric, will fix
> >   ##
> >   { 'enum': 'NetClientDriver',
> >     'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', 'vde',
> > -            'bridge', 'hubport', 'netmap', 'vhost-user' ] }
> > +            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa' ] }
> >
> >   ##
> >   # @Netdev:
> > @@ -465,7 +486,8 @@
> >       'bridge':   'NetdevBridgeOptions',
> >       'hubport':  'NetdevHubPortOptions',
> >       'netmap':   'NetdevNetmapOptions',
> > -    'vhost-user': 'NetdevVhostUserOptions' } }
> > +    'vhost-user': 'NetdevVhostUserOptions',
> > +    'vhost-vdpa': 'NetdevVhostVDPAOptions' } }
> >
> >   ##
> >   # @NetFilterDirection:
> >
>
> --
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3226
> Virtualization:  qemu.org | libvirt.org
>


