Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BAC400055
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 15:17:17 +0200 (CEST)
Received: from localhost ([::1]:47208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM94G-0005Ut-EX
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 09:17:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mM8vx-00079U-MO
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:08:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mM8vs-0001N3-Pb
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:08:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630674516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5LoyCRnjaMTUY4N1CLhYwnMjSkPFbAbD+xADD4IKNYM=;
 b=GlzSY49z9n8nJBOZdtJukCQ8loIB+lJmtgtg387pXARxlji/4ER2bPw3byqrBRjRb+XO29
 jawx0Sgkry4UEZ8ar59s74YKIywfNA+DkJHXoeYl4aH+EEzHAoIiSUxXkL4gclMg57wu4V
 BgakQmjd5qrzMDYSLM+jAzto6qBekIw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-y0IF7ToFOJ6szxRjv3oNQg-1; Fri, 03 Sep 2021 09:08:35 -0400
X-MC-Unique: y0IF7ToFOJ6szxRjv3oNQg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3311C107ACE4;
 Fri,  3 Sep 2021 13:08:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 64B6819C79;
 Fri,  3 Sep 2021 13:08:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 288D51138222; Wed,  1 Sep 2021 13:38:29 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Guoyi Tu <tugy@chinatelecom.cn>
Subject: Re: [PATCH] qapi: Set boolean value correctly in examples
References: <a21a2b61-2653-a2c9-4478-715e5fb19120@chinatelecom.cn>
Date: Wed, 01 Sep 2021 13:38:29 +0200
In-Reply-To: <a21a2b61-2653-a2c9-4478-715e5fb19120@chinatelecom.cn> (Guoyi
 Tu's message of "Fri, 27 Aug 2021 17:06:27 +0800")
Message-ID: <87bl5cbk5m.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued, thanks!


