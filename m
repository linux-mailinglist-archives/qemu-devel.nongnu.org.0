Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FE21283B1
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Dec 2019 22:17:14 +0100 (CET)
Received: from localhost ([::1]:33584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iiPe4-0005A5-U6
	for lists+qemu-devel@lfdr.de; Fri, 20 Dec 2019 16:17:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42905)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iiPcl-0004Qf-Po
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 16:15:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iiPcj-0005wv-Ll
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 16:15:50 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:28918
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1iiPcj-0005pt-7i
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 16:15:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576876548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6YwlPvLKkmwsaDFGVvhzaX7ZeqjWU7mJPAhls62iI8A=;
 b=Pb+IY75JlH2VBgAhPu87BhbkgJinKLSOeczFIsz3xO9vzR4SmvqqXjTxCbLFcIUpFUlNyk
 unR/vRkIj7LXnwsV7VQwe7n2R9T0hJ055YgTIaaU3C/DK+Jako2kFGzjiU1jv27dB/lsMZ
 xtOV8xfcsDT4JUvSPJiWHqHrFzfq4Z8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-ro9RlhEkN9SciKb1cJsw3A-1; Fri, 20 Dec 2019 16:15:44 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD3561883520;
 Fri, 20 Dec 2019 21:15:43 +0000 (UTC)
Received: from [10.3.116.246] (ovpn-116-246.phx2.redhat.com [10.3.116.246])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B3301CB;
 Fri, 20 Dec 2019 21:15:43 +0000 (UTC)
Subject: Re: [PATCH 02/18] fuse: Allow exporting BDSs via FUSE
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20191219143818.1646168-1-mreitz@redhat.com>
 <20191219143818.1646168-3-mreitz@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <e4a0cb45-6de5-6ee9-94d2-598fc79a5aee@redhat.com>
Date: Fri, 20 Dec 2019 15:15:42 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191219143818.1646168-3-mreitz@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: ro9RlhEkN9SciKb1cJsw3A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 "Richard W.M. Jones" <rjones@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/19/19 8:38 AM, Max Reitz wrote:
> fuse-export-add allows mounting block graph nodes via FUSE on some
> existing regular file.  That file should then appears like a raw disk
> image, and accesses to it result in accesses to the exported BDS.
> 
> Right now, we only set up the mount point and tear all mount points down
> in bdrv_close_all().  We do not implement any access functions, so
> accessing the mount point only results in errors.  This will be
> addressed by a followup patch.
> 
> The set of exported nodes is kept in a hash table so we can later add a
> fuse-export-remove that allows unmounting.

Before I review this, a quick question:

How does this compare to the recently added nbdfuse?
https://www.redhat.com/archives/libguestfs/2019-October/msg00080.html

Or put another way, maybe we get the same effect by combining qemu-nbd 
with nbdfuse, but this new utility would cut out a middleman for more 
efficiency, right?


> +++ b/block/fuse.c
> @@ -0,0 +1,260 @@
> +/*
> + * Present a block device as a raw image through FUSE
> + *
> + * Copyright (c) 2019 Max Reitz <mreitz@redhat.com>


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


