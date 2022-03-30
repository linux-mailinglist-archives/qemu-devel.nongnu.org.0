Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C78C4EC7D6
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 17:08:31 +0200 (CEST)
Received: from localhost ([::1]:33150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZZvx-0007tE-Ux
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 11:08:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nZZul-0007Bk-4e
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 11:07:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nZZud-0005Zb-U0
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 11:07:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648652826;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EywMjuWhh/tH7acll4l0dU7o7n6ykVOHuA2Q3kLyimg=;
 b=Svn4mgPZd1el4wqjZOcXpjOZSZpzD4Cal9yOPqT2L7f/8nXQTZZj6mk7wI5u/WWx5s/pS4
 3nQMpnFvqks73+Yvg6vhAZRdBPW9R8W787qRV2AyrLB3jJGCId1HoR+B/uuWdchj3Sgymt
 7kENroxjgMRsxQrrJxSgB5gKznigQ2A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-198-JporrjkhMkioaisICzptBQ-1; Wed, 30 Mar 2022 11:06:58 -0400
X-MC-Unique: JporrjkhMkioaisICzptBQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A428833975;
 Wed, 30 Mar 2022 15:06:58 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.146])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4046AC202C6;
 Wed, 30 Mar 2022 15:06:56 +0000 (UTC)
Date: Wed, 30 Mar 2022 16:06:53 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 3/4] python/qmp-shell: relicense as LGPLv2+
Message-ID: <YkRyDe3yiIWYFyLT@redhat.com>
References: <20220325200438.2556381-1-jsnow@redhat.com>
 <20220325200438.2556381-4-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220325200438.2556381-4-jsnow@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Fam Zheng <fam@euphon.net>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel@nongnu.org, Luiz Capitulino <lcapitulino@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <mlureau@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Eric Blake <eblake@redhat.com>,
 Eduardo Habkost <ehabkost@habkost.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 25, 2022 at 04:04:37PM -0400, John Snow wrote:
> qmp-shell is presently licensed as GPLv2 (only). I intend to include
> this tool as an add-on to an LGPLv2+ library package hosted on
> PyPI.org. I've selected LGPLv2+ to maximize compatibility with other
> licenses while retaining a copyleft license.
> 
> To keep licensing matters simple, I'd like to relicense this tool as
> LGPLv2+ as well in order to keep the resultant license of the hosted
> release files simple -- even if library users won't "link against" this
> command line tool.
> 
> Therefore, I am asking permission from the current authors of this
> tool to loosen the license. At present, those people are:
> 
> - John Snow (me!), 411/609
> - Luiz Capitulino, Author, 97/609
> - Daniel Berrangé, 81/609
> - Eduardo Habkost, 10/609
> - Marc-André Lureau, 6/609
> - Fam Zheng, 3/609
> - Cleber Rosa, 1/609
> 
> (All of which appear to have been written under redhat.com addresses.)
> 
> Eduardo's fixes are largely automated from 2to3 conversion tools and may
> not necessarily constitute authorship, but his signature would put to
> rest any questions.
> 
> Cleber's changes concern a single import statement change. Also won't
> hurt to ask.
> 
> CC: Luiz Capitulino <lcapitulino@redhat.com>
> CC: Daniel Berrange <berrange@redhat.com>
> CC: Eduardo Habkost <ehabkost@habkost.com>
> CC: Marc-André Lureau <mlureau@redhat.com>
> CC: Fam Zheng <fam@euphon.net>
> CC: Cleber Rosa <crosa@redhat.com>
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/aqmp/qmp_shell.py | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Acked-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


