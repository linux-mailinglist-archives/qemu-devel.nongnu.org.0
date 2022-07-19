Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8600057978C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 12:21:06 +0200 (CEST)
Received: from localhost ([::1]:45396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDkLh-0005z6-Ma
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 06:21:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oDk6T-0003W9-H1
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 06:05:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oDk6R-0006UA-5v
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 06:05:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658225118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=go7Sql70GmnIs3cXMQcb78xEN82oFlHV5Kstc4xGGh4=;
 b=SzNEGTHOi6/7V62Oa95CDKfL+7Hej8CBBJGYn+v2hiEFHRPc6pnNHWSLRfxedeAskFq/qz
 O5Wk9I490D8lvkKVgon/kWR+vweRArZr6IG97zhiaaOzMW/L2JaT3/8OewDTVxnYFE9Hsi
 gZ4BGTrV5flFE/JQcv5GEECv7jrtl/o=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-PdlxMcSJOoutPftoXfrAew-1; Tue, 19 Jul 2022 06:05:11 -0400
X-MC-Unique: PdlxMcSJOoutPftoXfrAew-1
Received: by mail-qv1-f72.google.com with SMTP id
 q4-20020a0ce9c4000000b00473004919ddso7109117qvo.16
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 03:05:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=go7Sql70GmnIs3cXMQcb78xEN82oFlHV5Kstc4xGGh4=;
 b=0PFT6yuaZVW9gkefBK6orXXlZ3vlBaRCiSe7hSBOlL3wxgBwPRCif9/0i6gldw1TVs
 BwGmGNR8xV+gnQX8CNu9C+1GGfGzn4yTbCIvCvy7QuEKvwPpq5kpiM1xeJYPU2wAGng3
 Q4eFJhd2MCuwU4PItrnPr0zkSgYp+94ftYyxF76YdbuRN4uIjtgnH+kgCQ8ET3V7UALg
 2IXfiip14siMhcwYlq4STKTM/dlhB7t5u2UidbNe8lJ8vwPyznF6t94HuX4dgwBCB0Ln
 rDgvd9gt0dHlV6n+mCmJfmDP2X0+4jLAclZmJsUVdyYTv5AqQUxIplno4Pavk+JPxHQk
 68fQ==
X-Gm-Message-State: AJIora+mxqREx/hh4XDuHIUL5V6VHlJeHU9qkLTIFh2VX8gURGuJPG41
 a4RbCjj9SsbH915yFm420rWnNY7STC1TNtmHSy/Hdf/DotGFdfW+WMn+Fl1SSQ/P98Gm59eb3ZI
 Rr3ypWb0ebrXr+jQOb3eJZCETmoEHFsI=
X-Received: by 2002:a05:6214:5085:b0:472:e878:866a with SMTP id
 kk5-20020a056214508500b00472e878866amr24359881qvb.2.1658225111095; 
 Tue, 19 Jul 2022 03:05:11 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tn43toKq4yrWFsWs5A8PDF1H+Rqqu61vXzHhPaUsOt35hqrcKgh2DPmerP5Wg64sg4qUu91jrVUeW2fxFqvek=
X-Received: by 2002:a05:6214:5085:b0:472:e878:866a with SMTP id
 kk5-20020a056214508500b00472e878866amr24359855qvb.2.1658225110886; Tue, 19
 Jul 2022 03:05:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220719095629.3031338-1-eperezma@redhat.com>
In-Reply-To: <20220719095629.3031338-1-eperezma@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 19 Jul 2022 12:04:34 +0200
Message-ID: <CAJaqyWf1p4yFVZ2=BqG=5qsmm=N7uu1Y7RgCOO8Y2dq2ThAahw@mail.gmail.com>
Subject: Re: [PATCH v5 00/20] vdpa net devices Rx filter change notification
 with Shadow VQ
To: qemu-level <qemu-devel@nongnu.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Cornelia Huck <cohuck@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Eric Blake <eblake@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Eli Cohen <eli@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, Jul 19, 2022 at 12:01 PM Eugenio P=C3=A9rez <eperezma@redhat.com> w=
rote:
>
> Control virtqueue is used by networking device for accepting various
> commands from the driver. It's a must to support advanced configurations.
>
> Rx filtering event is issues by qemu when device's MAC address changed on=
ce and
> the previous one has not been queried by external agents.
>
> Shadow VirtQueue (SVQ) already makes possible tracking the state of virtq=
ueues,
> effectively intercepting them so qemu can track what regions of memory ar=
e
> dirty because device action and needs migration. However, this does not s=
olve
> networking device state seen by the driver because CVQ messages, like cha=
nges
> on MAC addresses from the driver.
>
> This series uses SVQ infrastructure to intercept networking control messa=
ges
> used by the device. This way, qemu is able to update VirtIONet device mod=
el and
> react to them. In particular, this series enables rx filter change
> notification.
>
> This is a prerequisite to achieve net vdpa device with CVQ live migration=
.
> It's a stripped down version of [1], with error paths checked and no migr=
ation
> enabled.
>
> First ten patches reorder and clean code base so its easier to apply late=
r
> ones. No functional change should be noticed from these changes.
>
> Patches from 11 to 15 enable SVQ API to make other parts of qemu to inter=
act
> with it. In particular, they will be used by vhost-vdpa net to handle CVQ
> messages.
>
> Patches 16 to 18 enable the update of the virtio-net device model for eac=
h
> CVQ message acknowledged by the device.
>
> Last patches enable x-svq parameter, forbidding device migration since it=
 is
> not restored in the destination's vdpa device yet. This will be added in =
later
> series, using this work.
>

As a suggestion, maybe it is better to omit patches 18 to 20 if we
don't merge the CVQ start code, same as with SVQ base. Part of the
code is meant to be reverted (migration blocker, actual x-svq
parameter), we can develop start and ASID code on top of 01-17.

Thanks!


