Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 572A44A028D
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 22:07:49 +0100 (CET)
Received: from localhost ([::1]:60256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDYTD-000246-F6
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 16:07:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nDYGW-0000zh-Hc
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 15:54:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nDYGU-0004qQ-T2
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 15:54:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643403278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g5cZ+sGGeykxfnw4kXmUVHrLmEGd4rxuhsyjK9tzQzw=;
 b=VoedkWOHg23R2D+AHqgbmLadWLNvEDWZ4UujiHkwxTJmdYdhS327NunYTpLgyT3txY2Oi/
 fRU76UXeuFM8F6UYrTUIPGVaGZ4AyEAElqJOFsCquFeDLYoSbuNtoXrl/qSwzGcEcV71tN
 QEPoyrFseCk89mXMzDKmaCoNk1t1pX4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-s9j0Px9jMd6tvoVJaXgdJQ-1; Fri, 28 Jan 2022 15:54:35 -0500
X-MC-Unique: s9j0Px9jMd6tvoVJaXgdJQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B62E81083F65;
 Fri, 28 Jan 2022 20:54:33 +0000 (UTC)
Received: from redhat.com (unknown [10.22.32.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DA506A22D;
 Fri, 28 Jan 2022 20:54:32 +0000 (UTC)
Date: Fri, 28 Jan 2022 14:54:30 -0600
From: Eric Blake <eblake@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH] qapi/block: Cosmetic change in BlockExportType schema
Message-ID: <20220128205430.ispmytuw2vrpar4g@redhat.com>
References: <20220119121439.214821-1-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20220119121439.214821-1-f4bug@amsat.org>
User-Agent: NeoMutt/20211029-256-77b59a
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIMWL_WL_HIGH=-0.167, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 19, 2022 at 01:14:39PM +0100, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daude <f4bug@amsat.org>
> 
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The doubled From: looks odd here.  I'll double-check that git doesn't
mess up the actual commit once I apply the patch.

> 
> Fix long line introduced in commit bb01ea73110 ("qapi/block:
> Restrict vhost-user-blk to CONFIG_VHOST_USER_BLK_SERVER").
> 
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Acked-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  qapi/block-export.json | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/qapi/block-export.json b/qapi/block-export.json
> index f9ce79a974b..f183522d0d2 100644
> --- a/qapi/block-export.json
> +++ b/qapi/block-export.json
> @@ -278,7 +278,8 @@
>  ##
>  { 'enum': 'BlockExportType',
>    'data': [ 'nbd',
> -            { 'name': 'vhost-user-blk', 'if': 'CONFIG_VHOST_USER_BLK_SERVER' },
> +            { 'name': 'vhost-user-blk',
> +              'if': 'CONFIG_VHOST_USER_BLK_SERVER' },
>              { 'name': 'fuse', 'if': 'CONFIG_FUSE' } ] }

Reviewed-by: Eric Blake <eblake@redhat.com>

Happy to queue this through my NBD tree (as it is tangentially related...)

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


