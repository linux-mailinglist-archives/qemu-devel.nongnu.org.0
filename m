Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE90702756
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 10:36:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyTgP-0005yx-1l; Mon, 15 May 2023 04:35:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1pyTgM-0005xY-09
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:35:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1pyTgK-0003BP-EN
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:35:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684139747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fDOJshZzuI9hBxi632iKI9Y18Qomk5pu6BeDUG4uAuo=;
 b=SYhEt0C1kloQLSQ5s/jfbZAQUHr5uFGYlSJqw4a3JNx9E/frP8H7AYRQSldZ0XasbgupR1
 T0TR3U0pDBiaW+XFOwcQgmtXCDGt1OsqLYjkBg8tYTd1HN54x7m3U9X51w7H1EM44DgQ4J
 AMrLa2tIZVSDnOfPe5+QgS/tp9oLfLY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-MXeUSc3pOA64Ho-CJq4N8w-1; Mon, 15 May 2023 04:35:44 -0400
X-MC-Unique: MXeUSc3pOA64Ho-CJq4N8w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CBD5B88D012;
 Mon, 15 May 2023 08:35:43 +0000 (UTC)
Received: from pinwheel (unknown [10.39.193.167])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 70B211410DD5;
 Mon, 15 May 2023 08:35:42 +0000 (UTC)
Date: Mon, 15 May 2023 10:35:39 +0200
From: Kashyap Chamarthy <kchamart@redhat.com>
To: "Wang, Lei" <lei4.wang@intel.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, alex.bennee@linaro.org,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH] docs: build-system: rename "default-configs" to "configs"
Message-ID: <ZGHu2yWmOqz6kjBe@pinwheel>
References: <20211004071203.2092017-1-kchamart@redhat.com>
 <f6e92f31-43ba-af11-6c33-0d2090e2b2c7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6e92f31-43ba-af11-6c33-0d2090e2b2c7@intel.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, May 12, 2023 at 04:09:20PM +0800, Wang, Lei wrote:
> There are also several "default-configs" in docs/devel/kconfig.rst, I think they
> can also be updated in this patch.

Good catch, I'll respin it.

> BR,
> Lei
> 
> On 10/4/2021 15:12, Kashyap Chamarthy wrote:
> > Commit 812b31d3f9 (configs: rename default-configs to configs and
> > reorganise, 2021-07-07) did the rename.
> > 
> > Reflect that update also in the documentation.
> > 
> > Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
> > ---
> >  docs/devel/build-system.rst | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/docs/devel/build-system.rst b/docs/devel/build-system.rst
> > index 0f636d620e..bfa5250802 100644
> > --- a/docs/devel/build-system.rst
> > +++ b/docs/devel/build-system.rst
> > @@ -250,7 +250,7 @@ Target-dependent emulator sourcesets:
> >    Each emulator also includes sources for files in the ``hw/`` and ``target/``
> >    subdirectories.  The subdirectory used for each emulator comes
> >    from the target's definition of ``TARGET_BASE_ARCH`` or (if missing)
> > -  ``TARGET_ARCH``, as found in ``default-configs/targets/*.mak``.
> > +  ``TARGET_ARCH``, as found in ``configs/targets/*.mak``.
> >  
> >    Each subdirectory in ``hw/`` adds one sourceset to the ``hw_arch`` dictionary,
> >    for example::
> > @@ -307,8 +307,8 @@ Utility sourcesets:
> >  The following files concur in the definition of which files are linked
> >  into each emulator:

[...]

-- 
/kashyap


