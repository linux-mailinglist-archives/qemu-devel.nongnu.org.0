Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98336587CCA
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 14:59:48 +0200 (CEST)
Received: from localhost ([::1]:49642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIrUx-0008Vm-6Q
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 08:59:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oIrRf-0003N1-6Z
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 08:56:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oIrRb-0007ja-Lf
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 08:56:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659444978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aZeQftzeDudqNV6C91n8UzaezejRJyvkGLuRompR/+g=;
 b=gkbQlAGLdOzNubPFwWeBSCeRmwwQ8V66Is7kQi5U+nHGDTIIkxQ7kUt+dw7aJM+I1xPiU9
 wDQ/djjl3QrEx1xsR4NoIYZvxzNvLOtUEXHF/lHJoG5sDXULc2A9aRf+dvWJamUHf01uMn
 bsD53EewjOmD8HdUIlOO/zh4ekrADvA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-503-F5SV60VWPYaudSq7VazB-w-1; Tue, 02 Aug 2022 08:56:17 -0400
X-MC-Unique: F5SV60VWPYaudSq7VazB-w-1
Received: by mail-ej1-f71.google.com with SMTP id
 nb10-20020a1709071c8a00b006e8f89863ceso4118862ejc.18
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 05:56:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=aZeQftzeDudqNV6C91n8UzaezejRJyvkGLuRompR/+g=;
 b=hMQ5aLjU05htjnqCAAQxAobmF+jJSnF94ZIGbe/eZOWiGaIlX/e8KBb3Mp7igGhyfT
 tc+nJsVPunAevaSYpo9h697zZyEkAXBYgIbKrIfpblnzv0qddFXqEaYWXaj7HqY53WhQ
 cTvEKm6kMR2UGgSJKI/cPFn4ODiXKCAD3TJiFU75GJVszh6a/0ZNxc6Sv9M+zx66p9ma
 gTwAqWydTnLionhnK+zbFREXW8WWVPwR3Qa3piD1XtPEo1jRht/FqwaIak4cKy+Gc6B0
 s9PA6b4vHjU9Iwrf+3mYz2qn8CK4m4FXCWbhyKb3RyHlH9oi9DNFv+sFaN5yRY2FJINv
 GbDw==
X-Gm-Message-State: ACgBeo2rWwzqBfFLMPWfK+wkbbIOvv+X7YNDu/lw5RRwg7l4qDHonqZD
 1yv3u9zNQoVcMj6BO4TAyASTzFtt43EGekN0R+rSIXI5uhqZyk3X8iEItJnKU3e9nKLWn2n7w/s
 FIXFp6w1xeqh0GpY=
X-Received: by 2002:a17:906:9b09:b0:730:9480:9729 with SMTP id
 eo9-20020a1709069b0900b0073094809729mr5463908ejc.588.1659444975930; 
 Tue, 02 Aug 2022 05:56:15 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5/u+FToM2Zw/LZsnOVJJiLn5P6AmvUYwD7KroZS5Kex/Z8WjOHx+hkUCDVX6jFgKHBcaWtWg==
X-Received: by 2002:a17:906:9b09:b0:730:9480:9729 with SMTP id
 eo9-20020a1709069b0900b0073094809729mr5463888ejc.588.1659444975622; 
 Tue, 02 Aug 2022 05:56:15 -0700 (PDT)
Received: from redhat.com ([2.52.130.0]) by smtp.gmail.com with ESMTPSA id
 wc7-20020a170907124700b0072b55713daesm2470676ejb.56.2022.08.02.05.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 05:56:15 -0700 (PDT)
Date: Tue, 2 Aug 2022 08:56:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-trivial@nongnu.org, Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 1/2] vdpa: Fix file descriptor leak on get features error
Message-ID: <20220802085542-mutt-send-email-mst@kernel.org>
References: <20220802112447.249436-1-eperezma@redhat.com>
 <20220802112447.249436-2-eperezma@redhat.com>
 <aa7f3a8c-0f1d-8652-b574-48f824d2bd37@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aa7f3a8c-0f1d-8652-b574-48f824d2bd37@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Tue, Aug 02, 2022 at 02:07:04PM +0200, Laurent Vivier wrote:
> On 02/08/2022 13:24, Eugenio Pérez wrote:
> > File descriptor vdpa_device_fd is not free in the case of returning
> > error from vhost_vdpa_get_features. Fixing it by making all errors go to
> > the same error path.
> > 
> > Resolves: Coverity CID 1490785
> > Fixes: 8170ab3f43 ("vdpa: Extract get features part from vhost_vdpa_get_max_queue_pairs")
> > 
> > Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> > ---
> >   net/vhost-vdpa.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index 6abad276a6..303447a68e 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -566,7 +566,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
> >       g_autofree NetClientState **ncs = NULL;
> >       g_autoptr(VhostIOVATree) iova_tree = NULL;
> >       NetClientState *nc;
> > -    int queue_pairs, r, i, has_cvq = 0;
> > +    int queue_pairs, r, i = 0, has_cvq = 0;
> >       assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
> >       opts = &netdev->u.vhost_vdpa;
> > @@ -582,7 +582,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
> >       r = vhost_vdpa_get_features(vdpa_device_fd, &features, errp);
> >       if (unlikely(r < 0)) {
> > -        return r;
> > +        goto err;
> >       }
> >       queue_pairs = vhost_vdpa_get_max_queue_pairs(vdpa_device_fd, features,
> 
> Reviewed-by: Laurent Vivier <lvivier@redhat.com>
> 
> I can take this one via the trivial branch.
> 
> Thanks,
> Laurent

Not sure why it's appropriate for trivial but sure if you like

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>


