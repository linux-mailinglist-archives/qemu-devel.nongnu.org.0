Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4DB40656F
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 03:51:00 +0200 (CEST)
Received: from localhost ([::1]:59578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOVgx-0000nq-8w
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 21:50:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mOVfc-0008NA-8q
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 21:49:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mOVfa-0005Qb-KE
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 21:49:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631238573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C1g6NXiBi2HzpF6XfD0/eOcEtTxMimRZxrC/vQQ7bd0=;
 b=e5WwRRPzGFi6lv7/ZyWRfWfpGecH5Fvt67XkI38U/9vSjXZOLh9vz4IXEMobmyUA2oARl0
 Glv92VamflNR+MJFFLWJcwf78ZlNPjwaRLGoOHxzm6iw2T45ISDWWjKpAg26TSSjxWosbE
 23bFVO9UeSHSJwRLzy/bl1nQUJKZ40M=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-ftl2iKHPNU6TrJGIxN_Rqg-1; Thu, 09 Sep 2021 21:49:32 -0400
X-MC-Unique: ftl2iKHPNU6TrJGIxN_Rqg-1
Received: by mail-lf1-f69.google.com with SMTP id
 d2-20020ac25442000000b003e52a038afaso169766lfn.10
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 18:49:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C1g6NXiBi2HzpF6XfD0/eOcEtTxMimRZxrC/vQQ7bd0=;
 b=L2eXw4EV6wgImr0MyymY8Tsda2h3qyd5d15ttRH2RF5Qwj4BP+q+LKUB/TEvQa+mOp
 jmjhXG4N59UewMoSYuY/HZpJ4WO78EaXzLtHuGe70Ke/jdMdiZ3QpBTf/YXQrDYc0PDm
 AKYY8QVzFa4XmY+XSihJllPkKN/szKZs2F7orLc/eltVKKE/hSkd3Zrvvs32/1FjohIN
 FR6AVSYFUKjFtrlFlMucRBipbx4xMKMKUjUtXgRpqEjA3PHy/kZgrNYK/9b5d38L7NS4
 vSB19uMOpPwNZfd9eKYM5qTuI5Aak6Bc6T8Q5Su/llas553Lhvh6SsJeKmqmZ2wCc6v0
 U/4w==
X-Gm-Message-State: AOAM533zjbR3gYTc+XK9eqXxcg2oDoKvkH60bMuF+ZbqCrRcNwvqykV5
 Dk1tDsjc2A7ElW//gYcNOKLF9Ffc12+VzhUUkSCAZ4qab4D9v09juDpsR+rex8p+mIw1Z+CEWsq
 EACNzVqJ8Wv+Z2bwTs5stH0X8Ui464MU=
X-Received: by 2002:a2e:99d9:: with SMTP id l25mr2161121ljj.217.1631238571126; 
 Thu, 09 Sep 2021 18:49:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGjTUVEYQ+59QRmXPKxVNIWhz8KTpTpPALLv7T5VbJAiFCMEbv3XbyzthIEEsrakjtqVAVDm0EnfJKd8JmRC0=
X-Received: by 2002:a2e:99d9:: with SMTP id l25mr2161111ljj.217.1631238570984; 
 Thu, 09 Sep 2021 18:49:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210907090322.1756-1-jasowang@redhat.com>
 <20210907090322.1756-5-jasowang@redhat.com>
 <BN0PR11MB575775A2FFB4314AC0A4E99E9BD59@BN0PR11MB5757.namprd11.prod.outlook.com>
In-Reply-To: <BN0PR11MB575775A2FFB4314AC0A4E99E9BD59@BN0PR11MB5757.namprd11.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 10 Sep 2021 09:49:20 +0800
Message-ID: <CACGkMEtL=m3GDhbYCzSzrA1j1bTuhrD7NrzBzcDE+KKTdNJHBw@mail.gmail.com>
Subject: Re: [PATCH V3 04/10] vhost-vdpa: let net_vhost_vdpa_init() returns
 NetClientState *
To: "Zhang, Chen" <chen.zhang@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "lulu@redhat.com" <lulu@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "gdawar@xilinx.com" <gdawar@xilinx.com>,
 "eperezma@redhat.com" <eperezma@redhat.com>, "Zhu,
 Lingshan" <lingshan.zhu@intel.com>, "elic@nvidia.com" <elic@nvidia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 9, 2021 at 11:41 PM Zhang, Chen <chen.zhang@intel.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Qemu-devel <qemu-devel-
> > bounces+chen.zhang=intel.com@nongnu.org> On Behalf Of Jason Wang
> > Sent: Tuesday, September 7, 2021 5:03 PM
> > To: mst@redhat.com; jasowang@redhat.com; qemu-devel@nongnu.org
> > Cc: eperezma@redhat.com; elic@nvidia.com; gdawar@xilinx.com; Zhu,
> > Lingshan <lingshan.zhu@intel.com>; lulu@redhat.com
> > Subject: [PATCH V3 04/10] vhost-vdpa: let net_vhost_vdpa_init() returns
> > NetClientState *
> >
> > This patch switches to let net_vhost_vdpa_init() to return NetClientState *.
> > This is used for the callers to allocate multiqueue NetClientState for
> > multiqueue support.
> >
> > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > ---
> >  net/vhost-vdpa.c | 19 ++++++++++++-------
> >  1 file changed, 12 insertions(+), 7 deletions(-)
> >
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c index
> > 73d29a74ef..834dab28dd 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -155,8 +155,10 @@ static NetClientInfo net_vhost_vdpa_info = {
> >          .has_ufo = vhost_vdpa_has_ufo,
> >  };
> >
> > -static int net_vhost_vdpa_init(NetClientState *peer, const char *device,
> > -                               const char *name, int vdpa_device_fd)
> > +static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
> > +                                           const char *device,
> > +                                           const char *name,
> > +                                           int vdpa_device_fd)
> >  {
> >      NetClientState *nc = NULL;
> >      VhostVDPAState *s;
> > @@ -170,8 +172,9 @@ static int net_vhost_vdpa_init(NetClientState *peer,
> > const char *device,
> >      ret = vhost_vdpa_add(nc, (void *)&s->vhost_vdpa);
> >      if (ret) {
> >          qemu_del_net_client(nc);
> > +        return NULL;
> >      }
> > -    return ret;
> > +    return nc;
> >  }
> >
> >  static int net_vhost_check_net(void *opaque, QemuOpts *opts, Error
> > **errp) @@ -196,7 +199,8 @@ int net_init_vhost_vdpa(const Netdev
> > *netdev, const char *name,
> >                          NetClientState *peer, Error **errp)  {
> >      const NetdevVhostVDPAOptions *opts;
> > -    int vdpa_device_fd, ret;
> > +    int vdpa_device_fd;
> > +    NetClientState *nc;
> >
> >      assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
> >      opts = &netdev->u.vhost_vdpa;
> > @@ -211,10 +215,11 @@ int net_init_vhost_vdpa(const Netdev *netdev,
> > const char *name,
> >          return -errno;
> >      }
> >
> > -    ret = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> > vdpa_device_fd);
> > -    if (ret) {
> > +    nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> > vdpa_device_fd);
> > +    if (!nc) {
> >          qemu_close(vdpa_device_fd);
> > +        return -1;
>
> It looks like this patch needs to be merged with the 01/10 patch.
> Both related to the changes of " net_vhost_vdpa_init ".

Either is fine, but I prefer to keep the patch logical independent to
ease the reviewers.

Thanks

>
> Thanks
> Chen
>
>
> >      }
> >
> > -    return ret;
> > +    return 0;
> >  }
> > --
> > 2.25.1
> >
>


