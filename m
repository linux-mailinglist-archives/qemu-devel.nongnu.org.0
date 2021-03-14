Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B6333A87F
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 23:23:08 +0100 (CET)
Received: from localhost ([::1]:33684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLZ8d-00051D-2S
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 18:23:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lLZ6u-0004Yk-95
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 18:21:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lLZ6m-0006Q3-UH
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 18:21:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615760470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ndW/tSmMy8lxlYLaUsbv/RXT7/GLDNEPwVTcprxUp2M=;
 b=EOtJg3KN14w4NsgLwEAz5U4grDcb3jI6xCA2oH1p/5CYRnlU2l5uqPC/waV3bVOd2t6z7z
 Eg0UFtRT0OQ/cR1a2X07tjRlKOrOfKIq79ru2fiRP9kX0V9mGZ7DDZYUpQrZys/7kuVVIH
 lGQDi4z998QdTz1P0Rziu+CvX6noh18=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-QSjEqWBXOeOmpr4-YwUQFQ-1; Sun, 14 Mar 2021 18:21:08 -0400
X-MC-Unique: QSjEqWBXOeOmpr4-YwUQFQ-1
Received: by mail-wm1-f70.google.com with SMTP id l16so3990551wmc.0
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 15:21:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ndW/tSmMy8lxlYLaUsbv/RXT7/GLDNEPwVTcprxUp2M=;
 b=I3g6xcp2lI9T88syl9243V/sezlxS7kPelqY5XO5YiUKdqQ5HYyRcKw7Jdov+QHqyQ
 NIwUESkJcZVABhLhO5hmRLGujw9qFkg/5w2IHeQH/NmdTAxZwutcmhFbH28DgPZ1n6L5
 o14985YDSOhYvj8MUTnfNzZRHQiDC1XZxITmfOM4KMkBLVO1M/s+n97d/BLLyaTkOyd1
 /RjHWAPrytkzvW91dFdNbSsiN9UjPgMpyd4Ks0gYqXtEDRLHdBUVKTZEUfICocheSRN9
 zuausYlhogLuSuNV3AAifubzrNB25S71t/UF0owZrYTAAoF1goSrkqUWT2y4vwhln8iV
 xhiA==
X-Gm-Message-State: AOAM530U+YBKI7MFWMFzSiqBSYXD2+bphpZukpVKCPNLsFMDNswnJV1A
 j2ayM/cw8f67m45yW2WD/MHshi26GWs0EPLDXB/aVN++6JQaFv9ycDjElpZVF6PFLr3FQhwQcRa
 +JFtkZWRDiaGdY04=
X-Received: by 2002:adf:e3c9:: with SMTP id k9mr25662337wrm.308.1615760467679; 
 Sun, 14 Mar 2021 15:21:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYMLwoLzIikNfpJEI4vjAfSN8NEqnVZDmuUIqLIxvV11ohgtf6MIImW/TACErKGzvZcMx3MA==
X-Received: by 2002:adf:e3c9:: with SMTP id k9mr25662325wrm.308.1615760467452; 
 Sun, 14 Mar 2021 15:21:07 -0700 (PDT)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id r2sm16108894wrt.8.2021.03.14.15.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 15:21:06 -0700 (PDT)
Date: Sun, 14 Mar 2021 18:21:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [RFC PATCH 0/6] vhost-user: Shutdown/Flush slave channel properly
Message-ID: <20210314182048-mutt-send-email-mst@kernel.org>
References: <20210125180115.22936-1-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210125180115.22936-1-vgoyal@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: virtio-fs@redhat.com, marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 stefanha@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 25, 2021 at 01:01:09PM -0500, Vivek Goyal wrote:
> Hi,
> 
> We are working on DAX support in virtiofs and have some patches out of
> the tree hosted here.
> 
> https://gitlab.com/virtio-fs/qemu/-/commits/virtio-fs-dev

ping anyone wants to pick this up and post a non-rfc version?

> These patches have not been proposed for merge yet, becasue David
> Gilbert noticed that we can run into a deadlock during an emergency
> reboot of guest kernel. (echo b > /proc/sysrq-trigger).
> 
> I have provided details of deadlock in 4th path of the series with
> subject "qemu, vhost-user: Extend protocol to start/stop/flush slave
> channel".
> 
> Basic problem seems to be that we don't have a proper mechanism to
> shutdown slave channel when vhost-user device is stopping. This means
> there might be pending messages in slave channel and slave is blocked
> and waiting for response.
> 
> This is an RFC patch series to enhance vhost-user protocol to 
> properly shutdown/flush slave channel and avoid the deadlock. Though
> we faced the issue in the context of virtiofs, any vhost-user
> device using slave channel can potentially run into issues and
> can benefit from these patches.
> 
> Any feedback is welcome. Currently patches are based on out of
> tree code but after I get some feedback, I can only take pieces
> which are relevant to upstream and post separately.
> 
> Thanks
> Vivek
> 
> Vivek Goyal (6):
>   virtiofsd: Drop ->vu_dispatch_rwlock while waiting for thread to exit
>   libvhost-user: Use slave_mutex in all slave messages
>   vhost-user: Return error code from slave_read()
>   qemu, vhost-user: Extend protocol to start/stop/flush slave channel
>   libvhost-user: Add support to start/stop/flush slave channel
>   virtiofsd: Opt in for slave start/stop/shutdown functionality
> 
>  hw/virtio/vhost-user.c                    | 151 +++++++++++++++++++++-
>  subprojects/libvhost-user/libvhost-user.c | 147 +++++++++++++++++----
>  subprojects/libvhost-user/libvhost-user.h |   8 +-
>  tools/virtiofsd/fuse_virtio.c             |  20 +++
>  4 files changed, 294 insertions(+), 32 deletions(-)
> 
> -- 
> 2.25.4


