Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE9C406568
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 03:49:32 +0200 (CEST)
Received: from localhost ([::1]:57368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOVfX-0007kF-UT
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 21:49:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mOVeH-0006Pl-Gq
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 21:48:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mOVeA-0004RB-0T
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 21:48:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631238481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8aw5U3BnQfMce47X/SFnBqwhwqku5XQiKLbskpIjol4=;
 b=Znn72PKK9JpCtt9Rve3lwLsoA45u9xNugWdfTGpY7gkgBVGXJiVkAUtMxb/TggoDg5F+zJ
 kTH8kXtYXwQVjp7FEgreVgluIwI2rK75VAICvDiULCmMQ0w87WidKAXb+KDb+tfuGIEvwL
 vpn5aNv/O67bKod/3AzEWphWO5521gE=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-0V85nbogPbCbTg4aeKg3mA-1; Thu, 09 Sep 2021 21:48:00 -0400
X-MC-Unique: 0V85nbogPbCbTg4aeKg3mA-1
Received: by mail-lj1-f199.google.com with SMTP id
 w28-20020a2e161c000000b001ba14fc0cd4so160993ljd.10
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 18:48:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8aw5U3BnQfMce47X/SFnBqwhwqku5XQiKLbskpIjol4=;
 b=O2YUg1MKU3PTMXbok1gIUYxNbzuhLZy/ruvHV4GZ6b3jncnVLA9pIncDTr94poaZG6
 RdptC/VYxwgiWJPzrj29Sd0GCVinC+HZ5FpVuToHs4PjOeSTKi9Dz474OS8KwcU8kIdM
 8fgiipcpaeN8Oy3AwK2VScllltZ6t1uFBqJBPalppeIGFLjZM52SC1DHwuQDa+MnqAYD
 RJB1+nE4ahcb+Nvzvi2QuN7x59SbSznPQk1zpsUEKpr8xOHTdhJ3XQsPecSSK67WlMRj
 ryXgJ54M4DtCTysuX0mGibTLkQw7T5rEutJf4XtEuuRRrUr2mv/ml20MjKjOfR6pn5Kz
 FP2g==
X-Gm-Message-State: AOAM531Uned6W09prtU0B/n1RDhTTQTNIJlSCIzNoGOcSBxLReZ0bBcK
 3sWGIa4iryAGOe+4FCgLFw2BDzhyTcdaiKNjLSWJxlSSz5qV8spaAzXEc4AoRlTx4y80w29FDZw
 KnVidyqDS0jSZk4cvtLzcParlq7GA9Uo=
X-Received: by 2002:a05:6512:2001:: with SMTP id
 a1mr2030753lfb.498.1631238478765; 
 Thu, 09 Sep 2021 18:47:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMAYE/e1wlNwv4CIXCFrIU5cNugIg2KSKa2WYypKILKsHhP0IjBTF2Sok7ANhuvws0o5x02hbkh3TugVZvCUA=
X-Received: by 2002:a05:6512:2001:: with SMTP id
 a1mr2030743lfb.498.1631238478607; 
 Thu, 09 Sep 2021 18:47:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210907090322.1756-1-jasowang@redhat.com>
 <20210907090322.1756-6-jasowang@redhat.com>
 <BN0PR11MB57572F0723DCFCB9C9C703619BD59@BN0PR11MB5757.namprd11.prod.outlook.com>
In-Reply-To: <BN0PR11MB57572F0723DCFCB9C9C703619BD59@BN0PR11MB5757.namprd11.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 10 Sep 2021 09:47:47 +0800
Message-ID: <CACGkMEvgamOBTSHtEtDqMPn9aC623FnxRf7_xMJxvGKA8_pjfg@mail.gmail.com>
Subject: Re: [PATCH V3 05/10] net: introduce control client
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

On Thu, Sep 9, 2021 at 11:46 PM Zhang, Chen <chen.zhang@intel.com> wrote:
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
> > Subject: [PATCH V3 05/10] net: introduce control client
> >
> > This patch introduces a boolean for the device has control queue which can
> > accepts control command via network queue.
> >
> > The first user would be the control virtqueue support for vhost.
> >
> > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > ---
> >  include/net/net.h |  5 +++++
> >  net/net.c         | 24 +++++++++++++++++++++---
> >  2 files changed, 26 insertions(+), 3 deletions(-)
> >
> > diff --git a/include/net/net.h b/include/net/net.h index
> > 5d1508081f..4f400b8a09 100644
> > --- a/include/net/net.h
> > +++ b/include/net/net.h
> > @@ -103,6 +103,7 @@ struct NetClientState {
> >      int vnet_hdr_len;
> >      bool is_netdev;
> >      bool do_not_pad; /* do not pad to the minimum ethernet frame length */
> > +    bool is_datapath;
> >      QTAILQ_HEAD(, NetFilterState) filters;  };
> >
> > @@ -134,6 +135,10 @@ NetClientState
> > *qemu_new_net_client(NetClientInfo *info,
> >                                      NetClientState *peer,
> >                                      const char *model,
> >                                      const char *name);
> > +NetClientState *qemu_new_net_control_client(NetClientInfo *info,
> > +                                        NetClientState *peer,
> > +                                        const char *model,
> > +                                        const char *name);
> >  NICState *qemu_new_nic(NetClientInfo *info,
> >                         NICConf *conf,
> >                         const char *model, diff --git a/net/net.c b/net/net.c index
> > 52c99196c6..f0d14dbfc1 100644
> > --- a/net/net.c
> > +++ b/net/net.c
> > @@ -239,7 +239,8 @@ static void qemu_net_client_setup(NetClientState
> > *nc,
> >                                    NetClientState *peer,
> >                                    const char *model,
> >                                    const char *name,
> > -                                  NetClientDestructor *destructor)
> > +                                  NetClientDestructor *destructor,
> > +                                  bool is_datapath)
> >  {
> >      nc->info = info;
> >      nc->model = g_strdup(model);
> > @@ -258,6 +259,7 @@ static void qemu_net_client_setup(NetClientState
> > *nc,
> >
> >      nc->incoming_queue =
> > qemu_new_net_queue(qemu_deliver_packet_iov, nc);
> >      nc->destructor = destructor;
> > +    nc->is_datapath = is_datapath;
> >      QTAILQ_INIT(&nc->filters);
> >  }
> >
> > @@ -272,7 +274,23 @@ NetClientState
> > *qemu_new_net_client(NetClientInfo *info,
> >
> >      nc = g_malloc0(info->size);
> >      qemu_net_client_setup(nc, info, peer, model, name,
> > -                          qemu_net_client_destructor);
> > +                          qemu_net_client_destructor, true);
> > +
> > +    return nc;
> > +}
> > +
> > +NetClientState *qemu_new_net_control_client(NetClientInfo *info,
> > +                                            NetClientState *peer,
> > +                                            const char *model,
> > +                                            const char *name) {
> > +    NetClientState *nc;
> > +
> > +    assert(info->size >= sizeof(NetClientState));
> > +
> > +    nc = g_malloc0(info->size);
> > +    qemu_net_client_setup(nc, info, peer, model, name,
> > +                          qemu_net_client_destructor, false);
> >
>
> Except for the "is_datapath", it looks the same as "qemu_new_net_client ".
> Why not extend the original "qemu_new_net_client " with a "bool control" field?

Either is fine. I think it's a trick to reduce the changeset,
otherwise we need to modify all the 13 callers.

Thanks

>
> Thanks
> Chen
>
> >      return nc;
> >  }
> > @@ -297,7 +315,7 @@ NICState *qemu_new_nic(NetClientInfo *info,
> >
> >      for (i = 0; i < queues; i++) {
> >          qemu_net_client_setup(&nic->ncs[i], info, peers[i], model, name,
> > -                              NULL);
> > +                              NULL, true);
> >          nic->ncs[i].queue_index = i;
> >      }
> >
> > --
> > 2.25.1
> >
>


