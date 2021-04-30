Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D14DD36F803
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 11:38:50 +0200 (CEST)
Received: from localhost ([::1]:39058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcPbl-000172-VJ
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 05:38:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lcPZ8-0008Ng-5Z
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 05:36:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lcPZ2-0000NH-LI
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 05:36:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619775359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gzMxr9LOCzsw9T2se/f2hX+qeH1QxglRTNnGjGDHN1s=;
 b=EUaCE83pMczYy9x4zLMnIbBQGB6XDaAee8a1q3A7csFxM99OTIS0k/payWQF2X6oCOqFhM
 i8HhQjZ8RjgHQ+bOO2/aR9i2LVlgmS6ZmhGvMUeF2z+Biyo/NO3ozkp9pFMbNxZLrrnOnr
 2QbwLT3y2ZUK4Jdtd1WBS8pq4JzXwkg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-iXgSRg_CMMqFWeH7Y8Ju0w-1; Fri, 30 Apr 2021 05:34:40 -0400
X-MC-Unique: iXgSRg_CMMqFWeH7Y8Ju0w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28972107ACF5;
 Fri, 30 Apr 2021 09:34:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-203.ams2.redhat.com
 [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 541041007624;
 Fri, 30 Apr 2021 09:34:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CB12C1800380; Fri, 30 Apr 2021 11:34:33 +0200 (CEST)
Date: Fri, 30 Apr 2021 11:34:33 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
Subject: Re: [RFC PATCH 01/27] virtio-snd: Add virtio sound header file
Message-ID: <20210430093433.4a5uwlhgg6b7gkvz@sirius.home.kraxel.org>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
 <20210429120445.694420-2-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210429120445.694420-2-chouhan.shreyansh2702@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 29, 2021 at 05:34:19PM +0530, Shreyansh Chouhan wrote:
> Added device configuration and common definitions to the header
> file.
> 
> Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
> ---
>  include/hw/virtio/virtio-snd.h | 97 ++++++++++++++++++++++++++++++++++

This is the place for the data structures used by qemu internally.

The structs and #defines for the guest/host protocol should go to
include/standard-headers/linux/ instead.

There is a script (scripts/update-linux-headers.sh) to sync the files
with the linux source tree content.  As far I know the linux guest
driver is scheduled for merge in the 5.13 merge window, so once 5.13-rc1
is out of the door this should start working.

Syncing against a development tree is possible too as temporary stopgap,
but some extra care is needed then to avoid unwanted changes to
non-virtio-sound files slipping in.

Possibly it makes sense to also sync other linux header files that way
(for hda jacks maybe?).  We also import the input headers to get all the
KEY_* #defines for example.

take care,
  Gerd


