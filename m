Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AA653660E
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 18:37:19 +0200 (CEST)
Received: from localhost ([::1]:48080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nucxi-0004Sp-Jh
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 12:37:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nucI9-0004vo-RR
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:54:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nucI8-0005kA-6t
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:54:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653666857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sS6odi8j/Wq38t+36jSVdETozn8+RoyqyTytejaudb0=;
 b=LGfxmAi4TZlB4MGRmwYoenFuiM05bDsuX0OiMj9EVHlV9+lEwsTgxy3jdFz3WHs85FDRVy
 30VsjlJwF+mb46Il9AGqNwBsp5TtQfM/Ph8DRk+wPF3FxLBVxiLXuiZnDORi7Xq6BcEP7v
 TfUZCvRDwdqBJdU40xERUqjW47n2fCc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-138-IqQs7r1XMUumlKn7ruFmhw-1; Fri, 27 May 2022 11:54:16 -0400
X-MC-Unique: IqQs7r1XMUumlKn7ruFmhw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB8021C06903;
 Fri, 27 May 2022 15:54:15 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.169])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DAB42026D64;
 Fri, 27 May 2022 15:54:13 +0000 (UTC)
Date: Fri, 27 May 2022 17:54:12 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Yongji Xie <xieyongji@bytedance.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Subject: Re: [PATCH] qsd: document vduse-blk exports
Message-ID: <YpD0JA69G2R6ZHkN@redhat.com>
References: <20220525121947.859820-1-stefanha@redhat.com>
 <CACycT3tEDW0ePvRRDuiUNA=5-OshL97WdJGpXsp5xBSkg6FROg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACycT3tEDW0ePvRRDuiUNA=5-OshL97WdJGpXsp5xBSkg6FROg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

Am 26.05.2022 um 13:36 hat Yongji Xie geschrieben:
> On Wed, May 25, 2022 at 8:19 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >
> > Document vduse-blk exports in qemu-storage-daemon --help and the
> > qemu-storage-daemon(1) man page.
> >
> > Based-on: <20220523084611.91-1-xieyongji@bytedance.com>
> > Cc: Xie Yongji <xieyongji@bytedance.com>
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

> > @@ -110,6 +111,26 @@ Standard options:
> >    ``allow-other`` to auto (the default) will try enabling this option, and on
> >    error fall back to disabling it.
> >
> > +  The ``vduse-blk`` export type uses the ``id`` as the VDUSE device name.
> > +  ``num-queues`` sets the number of virtqueues (the default is 1).
> > +  ``queue-size`` sets the virtqueue descriptor table size (the default is 256).
> > +
> > +  The instantiated VDUSE device must then be added to the vDPA bus using the
> > +  vdpa(8) command from the iproute2 project::
> > +
> > +  # vdpa dev add <id> mgmtdev vduse
> 
> Should it be:
> 
> # vdpa dev add name <id> mgmtdev vduse

Thanks, fixed this up (as well as a missing "\n" in the help output) and
applied to the block branch.

Kevin


