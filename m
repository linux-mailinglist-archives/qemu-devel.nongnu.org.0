Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8943B56B848
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 13:18:41 +0200 (CEST)
Received: from localhost ([::1]:60722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9m0O-0004mb-FB
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 07:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o9ld8-0006ms-C9
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 06:54:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o9ld3-00015O-WC
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 06:54:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657277673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aNgZs6irygp42c18TSOe2U+iCxiWbT47ZvqZona2FYE=;
 b=Ytz3/jggSspIo+8rZZSb6A6rT9z2QF3DjtrvCWr6qd2wgkKz6hj+tP0csyWId89Ind44Xk
 Am/aGqDZoq8y8p8ei8hfA5SIyoN7M28Nfpgm6GxHd7FqOH5QD2rpi8SpiE3c38uKEzA61E
 j7NdOajaGi7KihLlZp5CUxXIgoyCvt0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-87RgJ_bmOmWqoB3ABVbnmg-1; Fri, 08 Jul 2022 06:54:32 -0400
X-MC-Unique: 87RgJ_bmOmWqoB3ABVbnmg-1
Received: by mail-qk1-f197.google.com with SMTP id
 bm2-20020a05620a198200b006a5dac37fa2so20642829qkb.16
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 03:54:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aNgZs6irygp42c18TSOe2U+iCxiWbT47ZvqZona2FYE=;
 b=fcyJ9VLsfJbd6YIT0dpUAeSs/LhfRZc8riW1sRX8RACoE8M/gvJGNIByf+kCNWNidL
 p9AqLgl0lZnhFFD4k3eburCEbkJVWgYlIStR0G2vl4KCYqlITNH5gfMRQMizKgQPtHSc
 WgNgURBRcZp1cvH3V1XxERE2YZyXSJ6BfVpoArrYxESPAjovsfPUDedx6HAvAu5IGFwW
 Yqbf7Q4Uz6HbunyhYeqH8+sv7R9egmSsI8CJWHCJfbJTKMw0dY0DZtBaAPUsFHD6fH9X
 tsohbQULTBB0usecEXG1P+Rs95RL2SbJgq7n+bh5xi4GuTV/6ci1h/Q5hXO7UUOfRPtb
 T12Q==
X-Gm-Message-State: AJIora+4vKDkwSfYWFA0zZEWqf3zvFKXajE2jd2cNLqg/io3fxt7EVJt
 SW+P5cGIvQ63wuqyVM6hsSRsTYKQBsXAtb+cW32UCPAUmcePMHt4YKxF7z+U0sXkkdzVRdlLaw1
 dlTAIlRW7ri0+koppcVxdhto/Rc1u2OM=
X-Received: by 2002:a05:620a:1344:b0:6af:597:37a8 with SMTP id
 c4-20020a05620a134400b006af059737a8mr1641943qkl.193.1657277672042; 
 Fri, 08 Jul 2022 03:54:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sqO7oP6zFIIa+fOEp6Mb9moNMbr3lNABa+7a1iXYbmkL+Bck8WZq3FUKyVQFyBDRg/bdAWPmr+xHHpdk8JJBA=
X-Received: by 2002:a05:620a:1344:b0:6af:597:37a8 with SMTP id
 c4-20020a05620a134400b006af059737a8mr1641926qkl.193.1657277671828; Fri, 08
 Jul 2022 03:54:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220706184008.1649478-1-eperezma@redhat.com>
 <20220706184008.1649478-24-eperezma@redhat.com>
 <87ilo9igph.fsf@pond.sub.org>
In-Reply-To: <87ilo9igph.fsf@pond.sub.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 8 Jul 2022 12:53:55 +0200
Message-ID: <CAJaqyWff6kfi6UAwvU64vj-q6CuncYBQnE4=P_3cGAGeL-rNVg@mail.gmail.com>
Subject: Re: [RFC PATCH v9 23/23] vdpa: Add x-svq to NetdevVhostVDPAOptions
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Eric Blake <eblake@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>, 
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 7, 2022 at 8:23 AM Markus Armbruster <armbru@redhat.com> wrote:
>
> Eugenio P=C3=A9rez <eperezma@redhat.com> writes:
>
> > Finally offering the possibility to enable SVQ from the command line.
>
> QMP, too, I guess.
>

Hi Markus,

I'm not sure what you mean. Dynamic enabling / disabling of SVQ was
delayed, and now it's only possible to enable or disable it from the
beginning of the run of qemu. Do you mean to enable SVQ before
starting the guest somehow?

Thanks!

> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  qapi/net.json    |  9 +++++-
> >  net/vhost-vdpa.c | 72 ++++++++++++++++++++++++++++++++++++++++++++++--
> >  2 files changed, 77 insertions(+), 4 deletions(-)
> >
> > diff --git a/qapi/net.json b/qapi/net.json
> > index 9af11e9a3b..75ba2cb989 100644
> > --- a/qapi/net.json
> > +++ b/qapi/net.json
> > @@ -445,12 +445,19 @@
> >  # @queues: number of queues to be created for multiqueue vhost-vdpa
> >  #          (default: 1)
> >  #
> > +# @x-svq: Start device with (experimental) shadow virtqueue. (Since 7.=
1)
> > +#         (default: false)
> > +#
> > +# Features:
> > +# @unstable: Member @x-svq is experimental.
> > +#
> >  # Since: 5.1
> >  ##
> >  { 'struct': 'NetdevVhostVDPAOptions',
> >    'data': {
> >      '*vhostdev':     'str',
> > -    '*queues':       'int' } }
> > +    '*queues':       'int',
> > +    '*x-svq':        {'type': 'bool', 'features' : [ 'unstable'] } } }
> >
> >  ##
>
> QAPI schema:
> Acked-by: Markus Armbruster <armbru@redhat.com>
>
> [...]
>


