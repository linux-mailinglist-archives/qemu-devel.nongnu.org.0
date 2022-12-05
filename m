Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6425464273F
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 12:11:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p29MD-0002zU-Rm; Mon, 05 Dec 2022 06:09:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p29MB-0002zG-Ac
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 06:09:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p29M7-0008FY-Th
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 06:09:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670238589;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YkXvDk1Ruk9Vnqb9EH7bzoZKS0Ci7GppiHsnEWrYTMk=;
 b=IUOHvQ1675XKkmZrGZqEqg3yb/7siBTstFiU/9FYB5k00uJU1ZURhZND+VDFkjJEarQ3AH
 I/KfNebvZAB55xiNdByPkzVjBSCkUd0OoTMB92hHn0Qnd++RJa/P7TpwdRR0Txfn0X5B1A
 ielc5teZ0eBs31vUVpCkKMN6lqs21hc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-186-5Kz9SuIKPgGoIxSMoZpndA-1; Mon, 05 Dec 2022 06:09:46 -0500
X-MC-Unique: 5Kz9SuIKPgGoIxSMoZpndA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1EC1038041E7;
 Mon,  5 Dec 2022 11:09:46 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C7872166B29;
 Mon,  5 Dec 2022 11:09:45 +0000 (UTC)
Date: Mon, 5 Dec 2022 11:09:41 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, kraxel@redhat.com, dgilbert@redhat.com,
 philmd@linaro.org
Subject: Re: [PATCH v2 03/14] ui/spice: Require spice-protocol >= 0.14.0
Message-ID: <Y43RdVf11jpLUrhu@redhat.com>
References: <20221202100512.4161901-1-armbru@redhat.com>
 <20221202100512.4161901-4-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221202100512.4161901-4-armbru@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Dec 02, 2022 at 11:05:01AM +0100, Markus Armbruster wrote:
> Version 0.14.0 is now old enough to have made it into the major
> distributions:
> 
>    Debian 11: 0.14.3
>    RHEL-8: 0.14.2
>    FreeBSD (ports): 0.14.4
>    Fedora 35: 0.14.0
>    Ubuntu 20.04: 0.14.0
>    OpenSUSE Leap 15.3: 0.14.3
> 
> Requiring it lets us drop two version checks in ui/vdagent.c.  It also
> enables the next commit.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  meson.build  | 2 +-
>  ui/vdagent.c | 4 ----
>  2 files changed, 1 insertion(+), 5 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


