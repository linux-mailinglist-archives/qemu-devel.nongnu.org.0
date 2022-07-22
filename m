Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 285D257E261
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 15:33:59 +0200 (CEST)
Received: from localhost ([::1]:39586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEsmz-0005OP-Uh
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 09:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oEsj6-0003mP-SE
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 09:29:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oEsj1-0006rO-08
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 09:29:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658496589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uOvbBgiWDEYtDr8PlPTDcbkI51T88eAF3eEYJft6p6A=;
 b=anshvS7jUAdN0Z0bP1IAIK01lohnNjGJQScjGFEFdxDN4JyR+jGFpiRVLYaXGc4cuYrxmo
 iFQy8/YxK9xDsPQPRwKkqin6lqXQW/PuekWR+GZMriqSY7vClUqNUQglJEPwrEJFQtu99/
 D1B/SBZ8yFYVUFFmJFBp36mhuaOGTEc=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-b0LIsJNsPEOvrFzLJaBARA-1; Fri, 22 Jul 2022 09:29:48 -0400
X-MC-Unique: b0LIsJNsPEOvrFzLJaBARA-1
Received: by mail-qk1-f197.google.com with SMTP id
 m8-20020a05620a24c800b006b5d8eb23efso3751160qkn.10
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 06:29:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uOvbBgiWDEYtDr8PlPTDcbkI51T88eAF3eEYJft6p6A=;
 b=7N6ywrUGtVjoo3ES8NNdkzk3It/jVkjmGQYPDshg3sjKBsRiFIXkr9C4sP78uhAEGg
 bdg2k6VXGDMDVvVUs/RCXHbv+rSwwrf7D28z5Fhmb22KSDkJOJoSnA1DI1fcBAlBTqXc
 yq8BIA5rHvL14ZPpHHtNCaVB/s/i/UxCjvjSQ/KD8+3FbMCYU2pqaNmyr8jRkh501hzN
 k2/vWqHKZQdL4LoOg/dZabiFLQPHiGN4wrntsLN4DTzw1A59rvXTJd7N1DHJUp+XNA+E
 1Zcyhsb0oniYPo3e3DOkQJAngYLfADUiQrzq8ybfZlc56PH2phtf8Pui1EsQrb+TI2VT
 e1hA==
X-Gm-Message-State: AJIora9+MtBcbi6Y/K+dSJSAgnBIJz8sOMuNzTMRsyeY4EDQK+1wwRcs
 UdqsJFHWcy7zYSdUCzN7+VOgPModvSBiUIr1n9crn640A/MetJz+wcJwrJsxEQq3F2CqN3Y571x
 rfI4DblEBHf8vgWlAaT7cU6Im24xF0o8=
X-Received: by 2002:ac8:5dca:0:b0:31e:85b8:8a18 with SMTP id
 e10-20020ac85dca000000b0031e85b88a18mr49249qtx.370.1658496588367; 
 Fri, 22 Jul 2022 06:29:48 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uTFtGFVDhEWWOdYH6JLLCwMhxTHXBwZZmwjGNPLicnrY+enT9QXSPeORT6OU2PO/4oMmj4ckbuhDPVC0SLabs=
X-Received: by 2002:ac8:5dca:0:b0:31e:85b8:8a18 with SMTP id
 e10-20020ac85dca000000b0031e85b88a18mr49234qtx.370.1658496588182; Fri, 22 Jul
 2022 06:29:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220714163150.2536327-1-eperezma@redhat.com>
 <20220714163150.2536327-19-eperezma@redhat.com>
 <CACGkMEsmSygJVtuXMZ_Fj4xgL-xb65UqGFXFOv1FE+wzbKeVHA@mail.gmail.com>
 <CAJaqyWcYWF8Q565XyvOSM6WfMK9kgnyqCd32tZpy2Tgx2UwxNQ@mail.gmail.com>
 <CACGkMEvr1eakhMEbTrCtEboThc+vJfuZDADuQnJgaMUWajSdSg@mail.gmail.com>
In-Reply-To: <CACGkMEvr1eakhMEbTrCtEboThc+vJfuZDADuQnJgaMUWajSdSg@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 22 Jul 2022 15:29:12 +0200
Message-ID: <CAJaqyWcMbZgjb=9zzUfORDtAZKZ4F=_9z6RtFGRgAchwvbjtHQ@mail.gmail.com>
Subject: Re: [PATCH v2 18/19] vdpa: Add device migration blocker
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Parav Pandit <parav@mellanox.com>, 
 Laurent Vivier <lvivier@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Eli Cohen <eli@mellanox.com>, Cindy Lu <lulu@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
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

On Fri, Jul 15, 2022 at 10:51 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Fri, Jul 15, 2022 at 1:40 PM Eugenio Perez Martin
> <eperezma@redhat.com> wrote:
> >
> > On Fri, Jul 15, 2022 at 6:03 AM Jason Wang <jasowang@redhat.com> wrote:
> > >
> > > On Fri, Jul 15, 2022 at 12:32 AM Eugenio P=C3=A9rez <eperezma@redhat.=
com> wrote:
> > > >
> > > > Since the vhost-vdpa device is exposing _F_LOG,
> > >
> > > I may miss something but I think it doesn't?
> > >
> >
> > It's at vhost_vdpa_get_features. As long as SVQ is enabled, it's
> > exposing VHOST_F_LOG_ALL.
>
> Ok, so this needs to be specified in the change log.

I tried to add the entry in the changelog but I don't have the
permission to do so.

Something like "Add new experimental x-svq option to migrate simple
vhost-vdpa net devices without CVQ"?

Thanks!


