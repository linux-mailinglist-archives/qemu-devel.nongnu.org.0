Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2073243C929
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 14:04:26 +0200 (CEST)
Received: from localhost ([::1]:52258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfhfN-0004iy-4a
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 08:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mfhYP-0005yy-Q4
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 07:57:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mfhYM-0004q6-Em
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 07:57:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635335829;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=By/bTnck/3eeP0UjYtvBPNbsAZhiJckpqzeg4NqS+mk=;
 b=iHsGNZu4jmh/vZSyCBQBeRfK7CQZfIokHpQa5r/c4ps3ziyJvC/7d9x5EqTtIH5iEskvO5
 Lqena3d8ZZLsEzKMak+3WcD2ylelvSQj0+h52isj27E0NMaxdHuNjaRpn/03jAHHzjBLCH
 36UtZvVCY6OaZneB+w7aqrDZlOVeZtQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-5uxjePTfP-C-U4EEh3LQUw-1; Wed, 27 Oct 2021 07:57:06 -0400
X-MC-Unique: 5uxjePTfP-C-U4EEh3LQUw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC259101F000;
 Wed, 27 Oct 2021 11:57:02 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 69C0B60843;
 Wed, 27 Oct 2021 11:55:21 +0000 (UTC)
Date: Wed, 27 Oct 2021 12:55:18 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Jonah Palmer <jonah.palmer@oracle.com>
Subject: Re: [PATCH v8 0/8] hmp, qmp: Add commands to introspect virtio devices
Message-ID: <YXk+JvPuOglFoerz@redhat.com>
References: <1635334909-31614-1-git-send-email-jonah.palmer@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1635334909-31614-1-git-send-email-jonah.palmer@oracle.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: mst@redhat.com, qemu_oss@crudebyte.com, qemu-devel@nongnu.org,
 kraxel@redhat.com, si-wei.liu@oracle.com, joao.m.martins@oracle.com,
 eblake@redhat.com, qemu-block@nongnu.org, david@redhat.com, armbru@redhat.com,
 arei.gonglei@huawei.com, marcandre.lureau@redhat.com, lvivier@redhat.com,
 thuth@redhat.com, michael.roth@amd.com, groug@kaod.org, dgilbert@redhat.com,
 eric.auger@redhat.com, stefanha@redhat.com, boris.ostrovsky@oracle.com,
 kwolf@redhat.com, mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 27, 2021 at 07:41:41AM -0400, Jonah Palmer wrote:
> This series introduces new QMP/HMP commands to dump the status of a
> virtio device at different levels.
> 
> [Jonah: Rebasing previous patchset from Oct. 5 (v7). Original patches
>  are from Laurent Vivier from May 2020.
> 
>  Rebase from v7 to v8 includes an additional assert to make sure
>  we're not returning NULL in virtio_id_to_name(). Rebase also
>  includes minor additions/edits to qapi/virtio.json.]
> 
> 1. Main command
> 
> HMP Only:
> 
>     virtio [subcommand]
> 
>     Example:
> 
>         List all sub-commands:
> 
>         (qemu) virtio
>         virtio query  -- List all available virtio devices
>         virtio status path -- Display status of a given virtio device
>         virtio queue-status path queue -- Display status of a given virtio queue
>         virtio vhost-queue-status path queue -- Display status of a given vhost queue
>         virtio queue-element path queue [index] -- Display element of a given virtio queue

I don't see a compelling reason why these are setup as sub-commands
under a new "virtio" top level. This HMP approach and the QMP 'x-debug-query'
naming just feels needlessly different from the current QEMU practices.

IMHO they should just be "info" subcommands for HMP. ie

         info virtio  -- List all available virtio devices
         info virtio-status path -- Display status of a given virtio device
         info virtio-queue-status path queue -- Display status of a given virtio queue
         info virtio-vhost-queue-status path queue -- Display status of a given vhost queue
         info virtio-queue-element path queue [index] -- Display element of a given virtio queue

While the corresponding QMP commands ought to be

         x-query-virtio
         x-query-virtio-status
         x-query-virtio-queue-status
         x-query-virtio-vhost-queue-status
         x-query-virtio-queue-element


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


