Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2113D497BE3
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 10:25:00 +0100 (CET)
Received: from localhost ([::1]:59264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBvas-0000hv-Vz
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 04:24:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nBvXw-0007Ju-18
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 04:21:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nBvXe-0005yH-3v
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 04:21:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643016093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BVaCtGYaM8OQk2Xa0DqGNatX+Cfabzy4/jenjL88ygU=;
 b=DTuB6lH33byzlzdvM5Tlob3iEOyqkSV0ONx/i06hoM6N0dqxpdHdDZghGqSgYI1UUCFzgg
 31H6XinAvksxdR1QUoykqs7IiKKuva67oju8fbSB5rDMJr58gK7s/Icc8DGJuN1ee2AmnN
 rhf/8ip2X2gPAWJwiuFSL7Z1yQzo3R0=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-7s9KK9YHOVasaJk5VrTMDQ-1; Mon, 24 Jan 2022 04:21:32 -0500
X-MC-Unique: 7s9KK9YHOVasaJk5VrTMDQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 jq14-20020ad45fce000000b0041f389903aaso16971741qvb.18
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 01:21:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BVaCtGYaM8OQk2Xa0DqGNatX+Cfabzy4/jenjL88ygU=;
 b=P7C6gFb1TGtvliI123oYWAMij6LaFcy4CmZDGEjksrgP3tKMytBOb8JihsawNPqZPE
 B1DHCwxdN1O3sT+v8dKhtrx07Jecx4I+kmRmZMEO5suAr4GqpVLvlpG+ChNKBFvK/LPp
 Kai6J80zzhSuI8n6fLiueTgMiJbalrpyAYKZZNzOQO+JXHlvvme9oNxebl4I3jZzRVTr
 z5y9gIjx77ZS56+g7c/ddxyvkSPV5w3vYhUeIK7n9uR1YBbRh6rHOf/tVzQzgXDW0r93
 dDZhKAHPFdB1zCkkwZ6vVW3O7B4A/k/BRfzzI73215q1EFy+J4aBp6BEefmCbz3orbK8
 0ABQ==
X-Gm-Message-State: AOAM530HQVtL2+nWOPgmq67R8ZclemNih5ZxnPepZWAqrM2Sia5buBvr
 iDQJHy97Hmo5REd7zIqCkUTqr3Xgi8ad3LusAsjd4NgXD+tHdDSVrG0VeAfKoHbNR+RZp9x9EUZ
 5dFKAnKT+4oid6Dop/dfkgM0nDi8I8Hc=
X-Received: by 2002:a05:620a:4306:: with SMTP id
 u6mr10440988qko.406.1643016091634; 
 Mon, 24 Jan 2022 01:21:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyrl/ZbeSiZ3Ly9K/phx7peN5fGf/5q/ek5iw0RzqpvfX7raDmJTrE9RIrb3/IAKrnbbckDyx4lH/Dq2hx5V9s=
X-Received: by 2002:a05:620a:4306:: with SMTP id
 u6mr10440964qko.406.1643016091384; 
 Mon, 24 Jan 2022 01:21:31 -0800 (PST)
MIME-Version: 1.0
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-22-eperezma@redhat.com>
 <Ye4r7tKFhP9VaT5/@xz-m1.local>
In-Reply-To: <Ye4r7tKFhP9VaT5/@xz-m1.local>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 24 Jan 2022 10:20:55 +0100
Message-ID: <CAJaqyWf--wbNZz5ZzbpixD9op_fO5fV01kbYXzG097c_NkqYrw@mail.gmail.com>
Subject: Re: [PATCH 21/31] util: Add iova_tree_alloc
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eric Blake <eblake@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 24, 2022 at 5:33 AM Peter Xu <peterx@redhat.com> wrote:
>
> On Fri, Jan 21, 2022 at 09:27:23PM +0100, Eugenio P=C3=A9rez wrote:
> > +int iova_tree_alloc(IOVATree *tree, DMAMap *map, hwaddr iova_begin,

I forgot to s/iova_tree_alloc/iova_tree_alloc_map/ here.

> > +                    hwaddr iova_last)
> > +{
> > +    const DMAMapInternal *last, *i;
> > +
> > +    assert(iova_begin < iova_last);
> > +
> > +    /*
> > +     * Find a valid hole for the mapping
> > +     *
> > +     * TODO: Replace all this with g_tree_node_first/next/last when av=
ailable
> > +     * (from glib since 2.68). Using a sepparated QTAILQ complicates c=
ode.
> > +     *
> > +     * Try to allocate first at the end of the list.
> > +     */
> > +    last =3D QTAILQ_LAST(&tree->list);
> > +    if (iova_tree_alloc_map_in_hole(last, NULL, iova_begin, iova_last,
> > +                                    map->size)) {
> > +        goto alloc;
> > +    }
> > +
> > +    /* Look for inner hole */
> > +    last =3D NULL;
> > +    for (i =3D QTAILQ_FIRST(&tree->list); i;
> > +         last =3D i, i =3D QTAILQ_NEXT(i, entry)) {
> > +        if (iova_tree_alloc_map_in_hole(last, i, iova_begin, iova_last=
,
> > +                                        map->size)) {
> > +            goto alloc;
> > +        }
> > +    }
> > +
> > +    return IOVA_ERR_NOMEM;
> > +
> > +alloc:
> > +    map->iova =3D last ? last->map.iova + last->map.size + 1 : iova_be=
gin;
> > +    return iova_tree_insert(tree, map);
> > +}
>
> Hi, Eugenio,
>
> Have you tried with what Jason suggested previously?
>
>   https://lore.kernel.org/qemu-devel/CACGkMEtZAPd9xQTP_R4w296N_Qz7VuV1FLn=
b544fEVoYO0of+g@mail.gmail.com/
>
> That solution still sounds very sensible to me even without the newly
> introduced list in previous two patches.
>
> IMHO we could move "DMAMap *previous, *this" into the IOVATreeAllocArgs*
> stucture that was passed into the traverse func though, so it'll naturall=
y work
> with threading.
>
> Or is there any blocker for it?
>

Hi Peter,

I can try that solution again, but the main problem was the special
cases of the beginning and ending.

For the function to locate a hole, DMAMap first =3D {.iova =3D 0, .size =3D
0} means that it cannot account 0 for the hole.

In other words, with that algorithm, if the only valid hole is [0, N)
and we try to allocate a block of size N, it would fail.

Same happens with iova_end, although in practice it seems that IOMMU
hardware iova upper limit is never UINT64_MAX.

Maybe we could treat .size =3D 0 as a special case? I see cleaner either
to build the list (but insert needs to take the list into account) or
to explicitly tell that prev =3D=3D NULL means to use iova_first.

Another solution that comes to my mind: to add both exceptions outside
of transverse function, and skip the first iteration with something
like:

if (prev =3D=3D NULL) {
  prev =3D this;
  return false /* continue */
}

So the transverse callback has way less code paths. Would it work for
you if I send a separate RFC from SVQ only to validate this?

Thanks!

> Thanks,

>
> --
> Peter Xu
>


