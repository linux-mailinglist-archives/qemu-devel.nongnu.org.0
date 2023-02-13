Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 984D7694A58
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 16:07:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRaP6-00044R-7x; Mon, 13 Feb 2023 10:06:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pRaP3-000446-UK
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 10:06:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pRaP2-0001nv-Hj
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 10:06:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676300759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1pa0RMOmbuadB/XCrR0DFfFMS4uYhviS58mkfmuT8u4=;
 b=AquB3x7V0VsmGBWE7Ykd0YWPNk3G3qnCkcbbh3gNi6kMOz9r80traBeIZA6LtdzWs6iarl
 rojsWXPMn0s96mcPJMqK5OZQ8J6w0cLliYvVRPkBgs7R4fMotRlexrT52P2UYaVIBxbZ2a
 uIkGNqcdm9kz0b4/5dNjS7c3Yn5rLdg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-4gMo8anYPBCTOPN_9yjDYw-1; Mon, 13 Feb 2023 10:05:56 -0500
X-MC-Unique: 4gMo8anYPBCTOPN_9yjDYw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ADA581C07540;
 Mon, 13 Feb 2023 15:05:55 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.217])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 298E218EC5;
 Mon, 13 Feb 2023 15:05:55 +0000 (UTC)
Date: Mon, 13 Feb 2023 09:05:53 -0600
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, michael.roth@amd.com, jsnow@redhat.com,
 marcandre.lureau@redhat.com
Subject: Re: [PATCH 1/2] docs/devel/qapi-code-gen: Belatedly update features
 documentation
Message-ID: <20230213150553.ronttibejqp532fr@redhat.com>
References: <20230213132009.918801-1-armbru@redhat.com>
 <20230213132009.918801-2-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230213132009.918801-2-armbru@redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Feb 13, 2023 at 02:20:08PM +0100, Markus Armbruster wrote:
> Commit 013b4efc9be "qapi: Add feature flags to remaining
> definitions" (v5.0.0), commit 84ab0086879 "qapi: Add feature flags to
> struct members" (v5.0.0), and commit b6c18755e41 "qapi: Add feature
> flags to enum members" (v6.2.0) neglected to update section
> "Features".  Make up for that.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  docs/devel/qapi-code-gen.rst | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


