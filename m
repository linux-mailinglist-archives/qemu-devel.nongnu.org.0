Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B93DC5719BE
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 14:19:23 +0200 (CEST)
Received: from localhost ([::1]:44694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBErK-0007oN-TL
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 08:19:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oBEmN-0003cr-CR
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:14:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oBEmL-0003Hg-I5
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:14:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657628052;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H63/Tjpj0sDd4jinunQH7TIIHUth8F5+GMsho8jaR8U=;
 b=hJTy6XyxobYh4WPKd1cKH5iaZPTijYMk+jz3T7/glHeY1DkuX3X2maPh32YQuYmGuNq4cQ
 5ttKDDOPwj9BpqyVhBWzKxwVtcy8l9EK8/tclG33+SghzErAhDW+C5Lk+pe1oyh8d512AR
 Ee9aDFDwRLccIWr5+s91TOVLhCZiJuo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278-MIBVOs8wPCux1vTWo69PwA-1; Tue, 12 Jul 2022 08:14:05 -0400
X-MC-Unique: MIBVOs8wPCux1vTWo69PwA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 18F902803034;
 Tue, 12 Jul 2022 12:14:05 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 14A4140E7F28;
 Tue, 12 Jul 2022 12:14:03 +0000 (UTC)
Date: Tue, 12 Jul 2022 13:14:01 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/3] qsd: Unlink absolute PID file path
Message-ID: <Ys1liVGbmb1CdoKn@redhat.com>
References: <20220609122701.17172-1-hreitz@redhat.com>
 <20220609122701.17172-2-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220609122701.17172-2-hreitz@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 09, 2022 at 02:26:59PM +0200, Hanna Reitz wrote:
> After writing the PID file, we register an atexit() handler to unlink it
> when the process terminates.  However, if the process has changed its
> working directory in the meantime (e.g. in os_setup_post() when
> daemonizing), this will not work when the PID file path was relative.
> Therefore, pass the absolute path (created with realpath()) to the
> unlink() call in the atexit() handler.
> 
> (realpath() needs a path pointing to an existing file, so we cannot use
> it before qemu_write_pidfile().)
> 
> Reproducer:
> $ cd /tmp
> $ qemu-storage-daemon --daemonize --pidfile qsd.pid
> $ file qsd.pid
> qsd.pid: ASCII text
> $ kill $(cat qsd.pid)
> $ file qsd.pid
> qsd.pid: ASCII text
> 
> (qsd.pid should be gone after the process has terminated.)
> 
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2092322
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  storage-daemon/qemu-storage-daemon.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


