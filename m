Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BF52994D2
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 19:06:49 +0100 (CET)
Received: from localhost ([::1]:49814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kX6tM-0006lc-JR
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 14:06:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kX6Ka-0008Kf-3h
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 13:30:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kX6KX-0001oY-Jc
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 13:30:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603733446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+vjTXe9xZk0KDIqG5ITJTGeg4lOhws0mil+Ji/UN2zc=;
 b=V+TkcWRJgy3z9NffKsgdmy8L2Wkzcen2t/34YpgF1rS/+JVY4SId8ByrqmR1RA/pDhz6i3
 bZ++r1hGOW2slfQ9Hk2WHHWsIRTuBLAS8a47bkLz1aU+eFvCtcmUJPLjz8EiWyOGWBLh0O
 GBh9J32J9eZmDHcP8jAJ9GyKlyy5sBM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-IbWxtS3zOXei3nhoJ47lNQ-1; Mon, 26 Oct 2020 13:30:44 -0400
X-MC-Unique: IbWxtS3zOXei3nhoJ47lNQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0E10108E1AF
 for <qemu-devel@nongnu.org>; Mon, 26 Oct 2020 17:30:43 +0000 (UTC)
Received: from work-vm (ovpn-112-208.ams2.redhat.com [10.36.112.208])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B713A19728;
 Mon, 26 Oct 2020 17:30:32 +0000 (UTC)
Date: Mon, 26 Oct 2020 17:30:30 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com,
 dinechin@redhat.com, virtio-fs@redhat.com
Subject: Re: [PATCH v4 0/5] virtiofsd xattr name mappings
Message-ID: <20201026173030.GE152260@work-vm>
References: <20201023165812.36028-1-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201023165812.36028-1-dgilbert@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/25 21:03:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Dr. David Alan Gilbert (git) (dgilbert@redhat.com) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> This is the 4th cut of an xattr name mapping option for virtiofsd.
> It allows the user of virtiofsd to define a fairly flexible mapping
> from the view of the xattr names the host fs has and the ones that the
> guest sees.
> 
>   The hope is this allows things like:
>     a) Different selinux attributes on host/guest
>     b) separation of trusted. attributes that clash on overlayfs
>     c) support for privileged xattr's in guests running with an
>        unprivileged virtiofsd.
> 
> There's no apparent standard for this kind of mapping, so I made
> it flexible by specifying a mapping rule in the option.
> 
> Prefix's can be added (selectively or globally), xattr's can be
> dropped in either direction or passed through.
> 
> v4
>   cleanups from Stefan and Vivek's reviews
> 
> Dave

Queued

> 
> 
> Dr. David Alan Gilbert (5):
>   tools/virtiofsd: xattr name mappings: Add option
>   tools/virtiofsd: xattr name mappings: Map client xattr names
>   tools/virtiofsd: xattr name mappings: Map server xattr names
>   tools/virtiofsd: xattr name mapping examples
>   tools/virtiofsd: xattr name mappings: Simple 'map'
> 
>  docs/tools/virtiofsd.rst         | 161 +++++++++++
>  tools/virtiofsd/passthrough_ll.c | 474 ++++++++++++++++++++++++++++++-
>  2 files changed, 632 insertions(+), 3 deletions(-)
> 
> -- 
> 2.28.0
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


