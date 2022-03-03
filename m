Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 293544CC3BF
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 18:29:59 +0100 (CET)
Received: from localhost ([::1]:34868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPpH4-0001OZ-8b
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 12:29:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nPpBG-00017D-7m
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 12:23:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nPpBC-0004XH-P5
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 12:23:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646328234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+yE0+nHw/gVdmYjQ/5GpiofLVku4SSyOF5sU8QpRaSo=;
 b=h+Ln0RJWT2NnT64JQgqbFVtBig8mV9UzS20P6IGGqdyWa0QeSBf/Hy/5rd+BeUkeV+IDKr
 5YqTU4y4BVG5XCXI5azEJMqsXuwA/XA9tOILgJqW2Cl6nmaOSJfv+udv+1JAPxxXnghVlG
 9ULlRpum99vO6pYCT3SWo8Eu8fx3qiw=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-PxlBGHuRNMiYjUBJ0lxHcQ-1; Thu, 03 Mar 2022 12:23:52 -0500
X-MC-Unique: PxlBGHuRNMiYjUBJ0lxHcQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 m22-20020a05620a221600b005f180383baeso3695766qkh.15
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 09:23:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+yE0+nHw/gVdmYjQ/5GpiofLVku4SSyOF5sU8QpRaSo=;
 b=UlM/HYdJajzDU5lAWKwXUBBPn5Xk+8qrXowRO2G5qSR6JLG+jRaBek5SEq/FOhSxza
 RSeGm/BThs7m0HUZdKWuK+I4rSAFkW1I21OxngLfDK4fjHUaNMBLKGtQ/D/ytx8c8Tj4
 ZogdX3aMCDsWaguP+MoHv/eZbbHkrAk6Z6LgXp9NLX0mcq/x924ElMC+BuwZXwt8mgqv
 r/6D+3VtBKVtxGB0spnTkNVXepx93seibAAh6Om1uBMvFCxYWPl8/xL7IhpgN3nzdpnf
 /bIlrVmY1PRuJ3wm3ttzHqaAsFN0B9ZceFYx2DPwXvezu2R5vKdmDOr5np1d5I3ZfNdb
 veeA==
X-Gm-Message-State: AOAM533SezEl3ETkldpHR9DGjM2YfIXiNcDlVXmCYhSTsDXcLluFn55C
 1Vzxqo8KsRz3v/YIMhvLVOv3D91Skx3FRN+Be3L8/OMQ3WihjQxZkQCyDkscn2BGP2GKzgHeTe1
 o+kQ8m0tkpOiDHQAcT5hJs4X4Dv0xyyY=
X-Received: by 2002:a05:6214:19ed:b0:42c:3b5f:cda6 with SMTP id
 q13-20020a05621419ed00b0042c3b5fcda6mr25033780qvc.70.1646328231930; 
 Thu, 03 Mar 2022 09:23:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzLNx0xYztx3CXJSWOcoziCgHehBAWULRQdw8Ba7r9ykgRyhaXA/dd/hMawMHQ0f+kiMH2YSGpbfXUNG35Meu4=
X-Received: by 2002:a05:6214:19ed:b0:42c:3b5f:cda6 with SMTP id
 q13-20020a05621419ed00b0042c3b5fcda6mr25033755qvc.70.1646328231645; Thu, 03
 Mar 2022 09:23:51 -0800 (PST)
MIME-Version: 1.0
References: <20220302203012.3476835-1-eperezma@redhat.com>
 <20220302203012.3476835-15-eperezma@redhat.com>
 <87ee3jeff1.fsf@pond.sub.org>
 <CAJaqyWfKQKWMs-tLRyuJ=C7VrsFUS8KHiXQVZHqfj_T5_zeBXQ@mail.gmail.com>
 <87bkyncklt.fsf@pond.sub.org>
In-Reply-To: <87bkyncklt.fsf@pond.sub.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 3 Mar 2022 18:23:15 +0100
Message-ID: <CAJaqyWfSkfV_FDOMD326SWBQAzK3=bxG+xfUZEmXeYudTG5cgQ@mail.gmail.com>
Subject: Re: [PATCH v3 14/14] vdpa: Add x-svq to NetdevVhostVDPAOptions
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Cindy Lu <lulu@redhat.com>,
 "Fangyi \(Eric\)" <eric.fangyi@huawei.com>, yebiaoxiang@huawei.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 3, 2022 at 1:00 PM Markus Armbruster <armbru@redhat.com> wrote:
>
> Eugenio Perez Martin <eperezma@redhat.com> writes:
>
> > On Thu, Mar 3, 2022 at 7:09 AM Markus Armbruster <armbru@redhat.com> wr=
ote:
> >>
> >> Eugenio P=C3=A9rez <eperezma@redhat.com> writes:
> >>
> >> > Finally offering the possibility to enable SVQ from the command line=
.
> >> >
> >> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >> > ---
> >> >  qapi/net.json    |  5 ++++-
> >> >  net/vhost-vdpa.c | 48 ++++++++++++++++++++++++++++++++++++++++-----=
---
> >> >  2 files changed, 44 insertions(+), 9 deletions(-)
> >> >
> >> > diff --git a/qapi/net.json b/qapi/net.json
> >> > index 7fab2e7cd8..d243701527 100644
> >> > --- a/qapi/net.json
> >> > +++ b/qapi/net.json
> >> > @@ -445,12 +445,15 @@
> >> >  # @queues: number of queues to be created for multiqueue vhost-vdpa
> >> >  #          (default: 1)
> >> >  #
> >> > +# @x-svq: Start device with (experimental) shadow virtqueue. (Since=
 7.0)
> >> > +#
> >> >  # Since: 5.1
> >> >  ##
> >> >  { 'struct': 'NetdevVhostVDPAOptions',
> >> >    'data': {
> >> >      '*vhostdev':     'str',
> >> > -    '*queues':       'int' } }
> >> > +    '*queues':       'int',
> >> > +    '*x-svqs':        'bool' } }
> >>
> >> Experimental members *must* be tagged with feature @unstable.  Their
> >> name *may* start with 'x-' to help human users, at the cost of renames
> >> when the member becomes stable.
> >>
> >
> > Hi Markus,
> >
> > Thank you very much for the warning. I'll add the unstable feature tag.
> >
> > If I understood correctly this needs to be done as x-perf at
> > BackupCommon struct. Could you confirm to me that it marks only the
> > x-perf member as unstable? Without reading the actual comment it might
> > seem as if it marks all the whole BackupCommon struct as unstable.
> >
> > # ...
> > # @filter-node-name: the node name that should be assigned to the
> > #                    filter driver that the backup job inserts into the=
 graph
> > #                    above node specified by @drive. If this option is
> > not given,
> > #                    a node name is autogenerated. (Since: 4.2)
> > #
> > # @x-perf: Performance options. (Since 6.0)
> > #
> > # Features:
> > # @unstable: Member @x-perf is experimental.
> > #
> > # Note: @on-source-error and @on-target-error only affect background
> > #       I/O.  If an error occurs during a guest write request, the devi=
ce's
> > #       rerror/werror actions will be used.
> > #
> > # Since: 4.2
> > ##
> > { 'struct': 'BackupCommon',
> >   'data': { ...
> >             '*filter-node-name': 'str',
> >             '*x-perf': { 'type': 'BackupPerf',
> >                          'features': [ 'unstable' ] } } }
>
> This tacks features to member @x-perf, i.e. they apply just to member
> @x-perf.
>
> Features can also be tacked to the struct type, like this:
>
>   { 'struct': 'BackupCommon',
>     'data': { ...
>               '*filter-node-name': 'str',
>               '*x-perf': 'BackupPerf' },
>     'features': [ 'unstable' ] }
>
> Now they apply to type BackupCommon as a whole.
>
> BlockdevOptionsFile in block-core.json actually makes use of both ways:
>
> { 'struct': 'BlockdevOptionsFile',
>   'data': { 'filename': 'str',
>             '*pr-manager': 'str',
>             '*locking': 'OnOffAuto',
>             '*aio': 'BlockdevAioOptions',
>             '*aio-max-batch': 'int',
>             '*drop-cache': {'type': 'bool',
>                             'if': 'CONFIG_LINUX'},
>             '*x-check-cache-dropped': { 'type': 'bool',
>                                         'features': [ 'unstable' ] } },
>   'features': [ { 'name': 'dynamic-auto-read-only',
>                   'if': 'CONFIG_POSIX' } ] }
>
> Feature @dynamic-auto-read-only applies to the type, and feature
> @unstable applies to member @x-check-cache-dropped.
>
> Questions?
>

Yes, that's right. I expressed my point poorly actually, I'll go the revers=
e.

qapi-gen.py forces me to write a comment in the doc:
qapi/block-core.json:2971: feature 'unstable' lacks documentation

When I add the documentation line, it's enough to add @unstable. But
there is no way to tell if this tag is because the whole struct is
unstable or if it's because individual members are unstable unless the
reader either checks the tag or the struct code.

I was mostly worried about doc generators, I would not like to make
NetdevVhostVDPAOptions unstable at this point. But I see that there is
no problem with that.

Thanks!


