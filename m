Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FA428F8A7
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Oct 2020 20:31:51 +0200 (CEST)
Received: from localhost ([::1]:49900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kT82Y-0005we-2d
	for lists+qemu-devel@lfdr.de; Thu, 15 Oct 2020 14:31:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kT7zO-0003zq-Um
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 14:28:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kT7zL-00053B-8i
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 14:28:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602786508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Px2lKBO/nB1DSVYau6X+VH9dfvpF9et20KOnKZTt9q4=;
 b=a+kHm0PbjbPERivoTMPT4NNw9kFjaqVwWu0+CgfA9ThLySXW7EC0PwoKQD7u1Wlsw3OX4w
 CBtfzShP8Ic2u2mCrnaTl+Pt6maiW7X48lY72OVFXqpTXIsx/rkfB7Z5CPJrMRasJEQGqh
 mPlVusbNuPWkbaPWDUfYdMBdRydZyok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-PKHLwgXpMh2WrpJGpeVRFw-1; Thu, 15 Oct 2020 14:28:26 -0400
X-MC-Unique: PKHLwgXpMh2WrpJGpeVRFw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3EAD1020904;
 Thu, 15 Oct 2020 18:28:25 +0000 (UTC)
Received: from localhost (ovpn-66-44.rdu2.redhat.com [10.10.66.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 77BE376672;
 Thu, 15 Oct 2020 18:28:25 +0000 (UTC)
Date: Thu, 15 Oct 2020 14:28:24 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 0/5] qapi: Restrict machine (and migration) specific
 commands
Message-ID: <20201015182824.GG5733@habkost.net>
References: <20201012121536.3381997-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201012121536.3381997-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/15 02:38:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 12, 2020 at 02:15:31PM +0200, Philippe Mathieu-Daudé wrote:
> Reduce the machine code pulled into qemu-storage-daemon.
> 
> The series is fully Acked, but Markus wants it reviewed
> by the Machine core maintainers.

I've confirmed that all patches move QAPI schema code without
introducing any additional changes.

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

> 
> Since v1:
> - Added A-b tags
> - Rebased
> 
> Philippe Mathieu-Daudé (5):
>   qapi: Restrict 'inject-nmi' command to machine code
>   qapi: Restrict 'system wakeup/reset/powerdown' commands to
>     machine.json
>   qapi: Restrict '(p)memsave' command to machine code
>   qapi: Restrict 'query-kvm' command to machine code
>   qapi: Restrict Xen migration commands to migration.json
> 
>  qapi/machine.json      | 168 +++++++++++++++++++++++++++++++++
>  qapi/migration.json    |  41 ++++++++
>  qapi/misc.json         | 209 -----------------------------------------
>  accel/stubs/xen-stub.c |   2 +-
>  hw/i386/xen/xen-hvm.c  |   2 +-
>  migration/savevm.c     |   1 -
>  softmmu/cpus.c         |   1 +
>  ui/gtk.c               |   1 +
>  ui/cocoa.m             |   1 +
>  9 files changed, 214 insertions(+), 212 deletions(-)
> 
> -- 
> 2.26.2
> 
> 

-- 
Eduardo


