Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB34344FFC
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 20:38:12 +0100 (CET)
Received: from localhost ([::1]:52472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOQNP-0007Lj-EQ
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 15:38:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lOQJu-0005Nz-IO
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 15:34:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lOQJm-0002lm-K6
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 15:34:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616441663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eKnkuS3Bs8G29sZmlYDWu5Zel1LEgNyOOyut38B4r1Q=;
 b=ENeaETdYPXPIQQw/fL5UGWPF1FowcXGte0GVDxfQ0h/Ri6fyag1KhC/z2ka8AuC1msmzcZ
 aDwRMaqjX/XY5sEWbLPQuOTmIvnqdNTM6uKUvh9zcfzmKh2lJHsMYIdu3oEISdcto0dK44
 vOOtxiR1UETCvyQCf725f/0GPigg2rA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-kBi_M__qO6yQIu5mQQEDiw-1; Mon, 22 Mar 2021 15:34:21 -0400
X-MC-Unique: kBi_M__qO6yQIu5mQQEDiw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABCBB10866A0
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 19:34:20 +0000 (UTC)
Received: from horse.redhat.com (ovpn-114-132.rdu2.redhat.com [10.10.114.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 88D4B5C1A3;
 Mon, 22 Mar 2021 19:34:16 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id C476A220BCF; Mon, 22 Mar 2021 15:34:15 -0400 (EDT)
Date: Mon, 22 Mar 2021 15:34:15 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Connor Kuehl <ckuehl@redhat.com>
Subject: Re: [Virtio-fs] [PATCH] MAINTAINERS: add virtio-fs mailing list
Message-ID: <20210322193415.GG446288@redhat.com>
References: <20210318154157.1357224-1-ckuehl@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210318154157.1357224-1-ckuehl@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 18, 2021 at 10:41:57AM -0500, Connor Kuehl wrote:
> General discussion and patch reviews take place on this list for both
> virtiofsd (tools/virtiofsd/*) and the guest kernel module.
> 
> Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 25fc49d1dc..8921bc2119 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1917,6 +1917,7 @@ F: tools/virtiofsd/*
>  F: hw/virtio/vhost-user-fs*
>  F: include/hw/virtio/vhost-user-fs.h
>  F: docs/tools/virtiofsd.rst
> +L: virtio-fs@redhat.com

Reviewed-by: Vivek Goyal <vgoyal@redhat.com>

Vivek
>  
>  virtio-input
>  M: Gerd Hoffmann <kraxel@redhat.com>
> -- 
> 2.30.2
> 
> _______________________________________________
> Virtio-fs mailing list
> Virtio-fs@redhat.com
> https://listman.redhat.com/mailman/listinfo/virtio-fs


