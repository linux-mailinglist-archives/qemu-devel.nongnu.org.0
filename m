Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1BB29D1B6
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Oct 2020 20:34:16 +0100 (CET)
Received: from localhost ([::1]:51638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXrD4-0005DY-RC
	for lists+qemu-devel@lfdr.de; Wed, 28 Oct 2020 15:34:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kXrBc-0004Le-S1
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 15:32:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kXrBY-0001bi-AO
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 15:32:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603913556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j9Oj3NUyv1Fdn2Esk9wgs8kE2p+tG8WRRAdj6lrp5LM=;
 b=UfnCPE3LcU3JKdbVW3qD1ul3EWMByQ3X+sDwjyJx85UA6ClF3NDTKUWptPD1PszkHK6cd9
 ZoUmSomDYzTmKHQwM7PnVHtnuhuWTAl8Hs5ShwOvWGeYzeRwC2E1LBveRU9FCWt58UYzt6
 cM0Jj9KvktDfgYem35jhBnHR5gY1jzQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-ulpzf5fwNkSlp8do4GYzDQ-1; Wed, 28 Oct 2020 15:32:34 -0400
X-MC-Unique: ulpzf5fwNkSlp8do4GYzDQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4067CFF27
 for <qemu-devel@nongnu.org>; Wed, 28 Oct 2020 19:32:33 +0000 (UTC)
Received: from localhost (unknown [10.40.208.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DDA935D9EF;
 Wed, 28 Oct 2020 19:32:32 +0000 (UTC)
Date: Wed, 28 Oct 2020 20:32:31 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 04/29] vl: remove bogus check
Message-ID: <20201028203231.137095ff@redhat.com>
In-Reply-To: <20201027182144.3315885-5-pbonzini@redhat.com>
References: <20201027182144.3315885-1-pbonzini@redhat.com>
 <20201027182144.3315885-5-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/28 01:51:10
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 27 Oct 2020 14:21:19 -0400
Paolo Bonzini <pbonzini@redhat.com> wrote:

> There is no reason to prevent -preconfig -daemonize.  Of course if
> no monitor is defined there will be no way to start the VM,
> but that is a user error.

looking some more at the current code, this piece is currently
somewhat broken, so it would indeed exit but 'after' fork
and output error message to nowhere. It happens since
os_daemonize() where moved before it later on, given no
one actually complained since then we probably do not care about it.

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  softmmu/vl.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 7f39ebdfee..dbb72e621e 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -4027,12 +4027,6 @@ void qemu_init(int argc, char **argv, char **envp)
>      }
>  
>      if (is_daemonized()) {
> -        if (!preconfig_exit_requested) {
> -            error_report("'preconfig' and 'daemonize' options are "
> -                         "mutually exclusive");
> -            exit(EXIT_FAILURE);
> -        }
> -
>          /* According to documentation and historically, -nographic redirects
>           * serial port, parallel port and monitor to stdio, which does not work
>           * with -daemonize.  We can redirect these to null instead, but since


