Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A57142DD0F8
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 13:00:33 +0100 (CET)
Received: from localhost ([::1]:42214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kprxQ-0007wd-O9
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 07:00:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kprvx-0007MC-Rs
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 06:59:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kprvw-0005ii-9P
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 06:59:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608206339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KTqnw/JJGdtc0sdKJAS+TokTrUDDih2xc69mQYSIpD0=;
 b=F+cPYAwxkycDxZh4CslG9AKSeaiNIH6J08TSSAZbJ+89ZGBYA4wBG+QjaXOhHeZX0OiSa0
 MmAUbL6hP//2hSFrEEZQb+pwhnlU9LAXX7tgpTsDzh2JP427e5uZoaiuBLC4BQzwFP4cYF
 I+TSW6DekJhyltTsuV5XvWjvveBQbyE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-YcKzu5apPaayoc8iJe2miA-1; Thu, 17 Dec 2020 06:58:57 -0500
X-MC-Unique: YcKzu5apPaayoc8iJe2miA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 989F784A5EE
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 11:58:56 +0000 (UTC)
Received: from work-vm (ovpn-112-208.ams2.redhat.com [10.36.112.208])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A2E22C316;
 Thu, 17 Dec 2020 11:58:50 +0000 (UTC)
Date: Thu, 17 Dec 2020 11:58:48 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] docs/devel/migration: Improve debugging section a bit
Message-ID: <20201217115848.GD4117@work-vm>
References: <20201217071450.701909-1-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201217071450.701909-1-armbru@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Markus Armbruster (armbru@redhat.com) wrote:
> Fix typos, and make the example work out of the box.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Thanks,

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

and queued.

> ---
>  docs/devel/migration.rst | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/docs/devel/migration.rst b/docs/devel/migration.rst
> index 49112bb27a..ad381b89b2 100644
> --- a/docs/devel/migration.rst
> +++ b/docs/devel/migration.rst
> @@ -53,22 +53,23 @@ savevm/loadvm functionality.
>  Debugging
>  =========
>  
> -The migration stream can be analyzed thanks to `scripts/analyze_migration.py`.
> +The migration stream can be analyzed thanks to `scripts/analyze-migration.py`.
>  
>  Example usage:
>  
>  .. code-block:: shell
>  
> -  $ qemu-system-x86_64
> -   (qemu) migrate "exec:cat > mig"
> -  $ ./scripts/analyze_migration.py -f mig
> +  $ qemu-system-x86_64 -display none -monitor stdio
> +  (qemu) migrate "exec:cat > mig"
> +  (qemu) q
> +  $ ./scripts/analyze-migration.py -f mig
>    {
>      "ram (3)": {
>          "section sizes": {
>              "pc.ram": "0x0000000008000000",
>    ...
>  
> -See also ``analyze_migration.py -h`` help for more options.
> +See also ``analyze-migration.py -h`` help for more options.
>  
>  Common infrastructure
>  =====================
> -- 
> 2.26.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


