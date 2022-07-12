Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFED95719DE
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 14:24:54 +0200 (CEST)
Received: from localhost ([::1]:52624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBEwf-0004yv-VL
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 08:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oBErr-0008O7-6L
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:19:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oBEro-00047v-Ux
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:19:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657628392;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=62pgUefB7XZW+xa28NS48N7awpXabKNFVSfQkMs0EC8=;
 b=NjUiAj6qI6h4u9VR7n4Qx0uRXBV3TWOl3ITejmLoQE09aFW1CohWejbBo0CRth7psCRuqX
 PFHi/RjLb22/SrrOjm3mJR7KZd4ne8a3c68Kwcic/0yNugJEDzTUAqcJLDPzRqRfqkoxGa
 Exe5DWnQ292eKqCHV2L63h6DBiWJej8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-602-lSXF9lDQMCmjTSSY0dG6wQ-1; Tue, 12 Jul 2022 08:19:51 -0400
X-MC-Unique: lSXF9lDQMCmjTSSY0dG6wQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AEDD1380114D;
 Tue, 12 Jul 2022 12:19:50 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 82357492C3B;
 Tue, 12 Jul 2022 12:19:49 +0000 (UTC)
Date: Tue, 12 Jul 2022 13:19:46 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 3/3] vl: Unlink absolute PID file path
Message-ID: <Ys1m4qPJLXbp5SSP@redhat.com>
References: <20220609122701.17172-1-hreitz@redhat.com>
 <20220609122701.17172-4-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220609122701.17172-4-hreitz@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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

On Thu, Jun 09, 2022 at 02:27:01PM +0200, Hanna Reitz wrote:
> After writing the PID file, we register an exit notifier to unlink it
> when the process terminates.  However, if the process has changed its
> working directory in the meantime (e.g. in os_setup_post() when
> daemonizing), this will not work when the PID file path was relative.
> Therefore, pass the absolute path (created with realpath()) to the
> unlink() call in the exit notifier.
> 
> (realpath() needs a path pointing to an existing file, so we cannot use
> it before qemu_write_pidfile().)
> 
> Reproducer:
> $ cd /tmp
> $ qemu-system-x86_64 --daemonize --pidfile qemu.pid
> $ file qemu.pid
> qemu.pid: ASCII text
> $ kill $(cat qemu.pid)
> $ file qemu.pid
> qemu.pid: ASCII text
> 
> (qemu.pid should be gone after the process has terminated.)
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  softmmu/vl.c | 30 ++++++++++++++++++++++++++----
>  1 file changed, 26 insertions(+), 4 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


