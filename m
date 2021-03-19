Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4431D34202A
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 15:52:17 +0100 (CET)
Received: from localhost ([::1]:40082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNGU4-00029Y-9d
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 10:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lNGPC-0006O8-Jp
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 10:47:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lNGP2-0000bJ-Ph
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 10:47:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616165223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W+1TVF7lN9r1JYqsSyftNOre81JpWFCkK9Wgk1tFsbE=;
 b=Utm3PMAyuYiM4HCRi0YrlOy5IK9IdP9ZjOVif3T5YmasVnfdwjfQVYhafwQklq19bajQWz
 xrq0Tkcp2eymjU9qtcz7ZoPiTtQ4bmxTzJl907MU/9tXaMQidoX3u8LyEVi682Rq3hfl3F
 uhUpeB53APidxY1Yn7sBBiv7oNoc2Xs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-CKiMcJjeMr2yVh7KrqOtJg-1; Fri, 19 Mar 2021 10:47:02 -0400
X-MC-Unique: CKiMcJjeMr2yVh7KrqOtJg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E138219251B1;
 Fri, 19 Mar 2021 14:47:00 +0000 (UTC)
Received: from gondolin (ovpn-112-229.ams2.redhat.com [10.36.112.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5FB385D9E3;
 Fri, 19 Mar 2021 14:46:58 +0000 (UTC)
Date: Fri, 19 Mar 2021 15:46:55 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v2 3/6] blockdev: with -drive if=virtio, use generic
 virtio-blk
Message-ID: <20210319154655.44418034.cohuck@redhat.com>
In-Reply-To: <20210319132537.2046339-4-laurent@vivier.eu>
References: <20210319132537.2046339-1-laurent@vivier.eu>
 <20210319132537.2046339-4-laurent@vivier.eu>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 19 Mar 2021 14:25:34 +0100
Laurent Vivier <laurent@vivier.eu> wrote:

> Rather than checking if the machine is an s390x to use virtio-blk-ccw
> instead of virtio-blk-pci, use the alias virtio-blk that is set to
> the expected target.

One side effect: if we add a new architecture and don't define the
aliases for it, this function probably won't do the right thing; prior
to the patch, it would simply default to virtio-blk-pci. Probably not a
big deal, but we need to be careful to keep the alias defines up to
date, which previously wasn't such a big deal.

> 
> This also enables the use of virtio-blk-device for targets without
> PCI or CCW.
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  blockdev.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/blockdev.c b/blockdev.c
> index 5cc7c7effe9f..64da5350e3ad 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -969,11 +969,7 @@ DriveInfo *drive_new(QemuOpts *all_opts, BlockInterfaceType block_default_type,
>          QemuOpts *devopts;
>          devopts = qemu_opts_create(qemu_find_opts("device"), NULL, 0,
>                                     &error_abort);
> -        if (arch_type == QEMU_ARCH_S390X) {
> -            qemu_opt_set(devopts, "driver", "virtio-blk-ccw", &error_abort);
> -        } else {
> -            qemu_opt_set(devopts, "driver", "virtio-blk-pci", &error_abort);
> -        }
> +        qemu_opt_set(devopts, "driver", "virtio-blk", &error_abort);
>          qemu_opt_set(devopts, "drive", qdict_get_str(bs_opts, "id"),
>                       &error_abort);
>      }


