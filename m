Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 019723E074E
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 20:13:09 +0200 (CEST)
Received: from localhost ([::1]:46346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBLO8-0002jI-0j
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 14:13:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mBJKh-0002aO-NB
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 12:01:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mBJKW-0004tJ-Uf
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 12:01:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628092866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Nksofj+gnzY+oFUFHdNaf/B8RXiZirTLa1zhAuBP3cA=;
 b=SK5p48GVfrNEKC7mWJdHTzGdcs7qpeNyTBJjLqTPTihUVQ5MnaGeK8Ev8Bi4Yw4xczp6mb
 +IcXU78iqg7MSxxvbJ87OwMes5sfCxuByOdxWJYmAdSNmCsjqY75H9YXfnKPw7FgvetqAb
 I/7V8R9O5jRLi8rbMQk6Z3gsOLqO2yg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-lblc4tlUORG4HPRxJg7eBw-1; Wed, 04 Aug 2021 12:01:00 -0400
X-MC-Unique: lblc4tlUORG4HPRxJg7eBw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32D3F1932482;
 Wed,  4 Aug 2021 16:00:59 +0000 (UTC)
Received: from redhat.com (ovpn-113-152.phx2.redhat.com [10.3.113.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E9A0E6091B;
 Wed,  4 Aug 2021 16:00:57 +0000 (UTC)
Date: Wed, 4 Aug 2021 11:00:56 -0500
From: Eric Blake <eblake@redhat.com>
To: Steve Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V5 12/25] cpr: QMP interfaces for restart
Message-ID: <20210804160056.c4k4hwbhewdy3lfg@redhat.com>
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
 <1625678434-240960-13-git-send-email-steven.sistare@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1625678434-240960-13-git-send-email-steven.sistare@oracle.com>
User-Agent: NeoMutt/20210205-687-0ed190
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 07, 2021 at 10:20:21AM -0700, Steve Sistare wrote:
> cprexec calls cprexec().  Syntax:
>   { 'command': 'cprexec', 'data': { 'argv': [ 'str' ] } }
> 
> Add the restart mode:
>   { 'enum': 'CprMode', 'data': [ 'reboot', 'restart' ] }
> 
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  monitor/qmp-cmds.c |  5 +++++
>  qapi/cpr.json      | 16 +++++++++++++++-
>  2 files changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index 1128604..7326f7d 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -179,6 +179,11 @@ void qmp_cprsave(const char *file, CprMode mode, Error **errp)
>      cprsave(file, mode, errp);
>  }
>  
> +void qmp_cprexec(strList *args, Error **errp)
> +{
> +    cprexec(args, errp);
> +}

Why do you need both qmp_cprexec() and cprexec()?  Can you just name
it qmp_cprexec() in cpr.c from the get-go, rather than having to add a
one-line wrapper in qmp-cmds.c?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


