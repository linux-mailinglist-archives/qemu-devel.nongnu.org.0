Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 715433AD169
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 19:44:20 +0200 (CEST)
Received: from localhost ([::1]:37510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luIXT-0003i0-2I
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 13:44:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1luIW6-0002rG-EK
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 13:42:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1luIW3-00029w-U7
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 13:42:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624038170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eN5mdX3Uafj7Rjm7WlwhAmLawRIAQhsPamrZs0sEVLA=;
 b=D91RgkKyFuQ7151TuajVlz2sTsMVpP3uKWm6V0yJOAninsamZE/NtM6LG/0/Ncm24FVFYC
 jLDV+kNsbEQOgtAn6SYW1JjyRty9zagLZ+Y+PI9jr1r1liyukAVPSHCA4CNyeRQqD7uGKW
 3Vymu8joDhQ7uQbkwBOHbbXYG3iqjHY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-BnN2lwbbMXeUgaoN7B0F_A-1; Fri, 18 Jun 2021 13:42:47 -0400
X-MC-Unique: BnN2lwbbMXeUgaoN7B0F_A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7856D804302;
 Fri, 18 Jun 2021 17:42:46 +0000 (UTC)
Received: from redhat.com (ovpn-112-75.phx2.redhat.com [10.3.112.75])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C88AD607A1;
 Fri, 18 Jun 2021 17:42:45 +0000 (UTC)
Date: Fri, 18 Jun 2021 12:42:44 -0500
From: Eric Blake <eblake@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH 1/6] block: Drop BDS comment regarding bdrv_append()
Message-ID: <20210618174244.oeagwgpq7u47b7ns@redhat.com>
References: <20210617155247.442150-1-mreitz@redhat.com>
 <20210617155247.442150-2-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210617155247.442150-2-mreitz@redhat.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 17, 2021 at 05:52:42PM +0200, Max Reitz wrote:
> There is a comment above the BDS definition stating care must be taken
> to consider handling newly added fields in bdrv_append().
> 
> Actually, this comment should have said "bdrv_swap()" as of 4ddc07cac
> (nine years ago), and in any case, bdrv_swap() was dropped in
> 8e419aefa (six years ago).  So no such care is necessary anymore.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  include/block/block_int.h | 6 ------
>  1 file changed, 6 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


