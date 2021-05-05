Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE83373904
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 13:08:34 +0200 (CEST)
Received: from localhost ([::1]:50626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leFOL-0004id-GC
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 07:08:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1leFMs-0004I5-7i
 for qemu-devel@nongnu.org; Wed, 05 May 2021 07:07:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1leFMo-0007hv-0f
 for qemu-devel@nongnu.org; Wed, 05 May 2021 07:07:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620212816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gwPrrWtiye3ld1dgEXIblKBp4WehZerh2MuleGnZIXQ=;
 b=FNbN1NmGNWF3AwyirML61rtG4QCJRtJXBsOERe/I5T+1DeNvlvCQdGPr/fa7b10ApnlJUI
 BBwVsaW+GJ7Atb4Phz9B16gLu1vR4oZpJgMoOYtR2kwlZGJI1ug/fwqD8CcctRMU789pQh
 o4VA3cdI9JaucZ0JHRUMq4rIJEFVbhE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-r1yHro5QOaylNxqyhcqqQQ-1; Wed, 05 May 2021 07:06:54 -0400
X-MC-Unique: r1yHro5QOaylNxqyhcqqQQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AE7D801B12;
 Wed,  5 May 2021 11:06:53 +0000 (UTC)
Received: from work-vm (ovpn-115-97.ams2.redhat.com [10.36.115.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC25B10074E5;
 Wed,  5 May 2021 11:06:45 +0000 (UTC)
Date: Wed, 5 May 2021 12:06:42 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v3 01/26] virtiofs: Fixup printf args
Message-ID: <YJJ8Qs3a1tXWPODq@work-vm>
References: <20210428110100.27757-1-dgilbert@redhat.com>
 <20210428110100.27757-2-dgilbert@redhat.com>
 <YJFgDGYi93A27ZFa@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YJFgDGYi93A27ZFa@stefanha-x1.localdomain>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org, vgoyal@redhat.com,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Stefan Hajnoczi (stefanha@redhat.com) wrote:
> On Wed, Apr 28, 2021 at 12:00:35PM +0100, Dr. David Alan Gilbert (git) wrote:
> > @@ -3097,9 +3097,10 @@ static void lo_copy_file_range(fuse_req_t req, fuse_ino_t ino_in, off_t off_in,
> >  
> >      fuse_log(FUSE_LOG_DEBUG,
> >               "lo_copy_file_range(ino=%" PRIu64 "/fd=%d, "
> > -             "off=%lu, ino=%" PRIu64 "/fd=%d, "
> > -             "off=%lu, size=%zd, flags=0x%x)\n",
> > -             ino_in, in_fd, off_in, ino_out, out_fd, off_out, len, flags);
> > +             "off=%ju, ino=%" PRIu64 "/fd=%d, "
> > +             "off=%ju, size=%zd, flags=0x%x)\n",
> > +             ino_in, in_fd, (intmax_t)off_in,
> > +             ino_out, out_fd, (intmax_t)off_out, len, flags);
> 
> The rest of the patch used uint64_t. Why intmax_t here?

Because it seems to be the standard way of doing it for things that may
be off_t.

> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

Thanks.

Dave


-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


