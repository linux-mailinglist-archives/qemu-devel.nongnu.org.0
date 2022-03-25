Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9784E7576
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 15:53:55 +0100 (CET)
Received: from localhost ([::1]:35606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXlK6-0007pY-A4
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 10:53:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nXlFJ-0004Qx-2L
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 10:48:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nXlFH-0002wZ-Ld
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 10:48:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648219735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iNI61x3lRJqEsqNpoi5afkiZzL19KkhEUEgscfXZGJs=;
 b=V9T0w1jAere3DVfrgibIOamLveXWfBNw6vWjH3e5NGcxwr5TCBiN6Xvu/QXsx/ROLGvyo7
 nYNq7FESi/vwcbv4LM8xoijz0mgA1J+fxhI6+xOZ/D7Ptl2zUG3TbzWAERK+YhYGhHrRtL
 zbm9p2GknNGXqk8iYwfMqy/sdPGhQNk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-Y4m4BqGdODq9lNcDkfLxnQ-1; Fri, 25 Mar 2022 10:48:53 -0400
X-MC-Unique: Y4m4BqGdODq9lNcDkfLxnQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 37C4E954700;
 Fri, 25 Mar 2022 14:48:53 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.192])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B34DE2024CBD;
 Fri, 25 Mar 2022 14:48:48 +0000 (UTC)
Date: Fri, 25 Mar 2022 09:48:46 -0500
From: Eric Blake <eblake@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH] iotests: update test owner contact information
Message-ID: <20220325144846.rewqwaj3nlc57eym@redhat.com>
References: <20220322174212.1169630-1-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220322174212.1169630-1-jsnow@redhat.com>
User-Agent: NeoMutt/20211029-512-43304b
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 22, 2022 at 01:42:12PM -0400, John Snow wrote:
> Quite a few of these tests have stale contact information. This patch
> updates the stale ones that I happen to be aware of at the moment.

I would prefer we just drop the lines.  Git history and MAINTAINERS is
a better way to track this, and won't get as stale.

> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
> +++ b/tests/qemu-iotests/025
> @@ -20,7 +20,7 @@
>  #
>  
>  # creator
> -owner=stefanha@linux.vnet.ibm.com
> +owner=stefanha@redhat.com
>  

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


