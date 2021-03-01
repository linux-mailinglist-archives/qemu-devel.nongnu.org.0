Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C9C328306
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 17:06:26 +0100 (CET)
Received: from localhost ([::1]:56348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGl3x-0004Qz-45
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 11:06:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1lGl2Y-0003ee-SC
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 11:04:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1lGl2X-0000Qa-6l
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 11:04:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614614695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FqF210RpOISiYiswT5DqkHx/UEebQ6auEtzH9FW8kNg=;
 b=MM1mFQeGCa5GNjliBigJyGnT4FQAE/ZJjRYtEIcA2gCdrIJwoxzaHovVLiIf5HAuWR+vpX
 7GmtQLs/owIHUA5DHWTfjzOaLhFUHY7VyvcUAXrLwKrQPvy+zMpf9PnM3QrnB9Iu5Fq9rO
 Vtl2qWZ9X8JBCvZbsTWIZZhSWWGhqEE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340--8YEtCSLMT-_KolW1PUojg-1; Mon, 01 Mar 2021 11:03:38 -0500
X-MC-Unique: -8YEtCSLMT-_KolW1PUojg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3E8F427C1
 for <qemu-devel@nongnu.org>; Mon,  1 Mar 2021 16:03:37 +0000 (UTC)
Received: from paraplu.localdomain (ovpn-114-174.ams2.redhat.com
 [10.36.114.174])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 898075D9E3;
 Mon,  1 Mar 2021 16:03:37 +0000 (UTC)
Received: by paraplu.localdomain (Postfix, from userid 1001)
 id A0AD03E0499; Mon,  1 Mar 2021 17:03:35 +0100 (CET)
Date: Mon, 1 Mar 2021 17:03:35 +0100
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: About '-readconfig' [Was: Re: [PULL 27/29] vl: deprecate -writeconfig]
Message-ID: <20210301160335.GA86420@paraplu.home>
References: <20210226080526.651705-1-pbonzini@redhat.com>
 <20210226080526.651705-28-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210226080526.651705-28-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Fri, Feb 26, 2021 at 09:05:24AM +0100, Paolo Bonzini wrote:
> The functionality of -writeconfig is limited and the code
> does not even try to detect cases where it prints incorrect
> syntax (for example if values have a quote in them, since
> qemu_config_parse does not support any kind of escaping)
> so remove it.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  docs/system/deprecated.rst | 7 +++++++
>  qemu-options.hx            | 7 +------
>  softmmu/vl.c               | 1 +
>  3 files changed, 9 insertions(+), 6 deletions(-)

[...]

Hi,

Sorry, I'm coming very late[1] to the discussion.  Will there be a
replacement for '-readconfig'?

I agree with Gerd's comment[2] in the last year's thread (I missed to
notice at that time) about '-readconfig' being useful.  I'm familiar
with least one hosting provider who uses[3] '-readconfig'.  And I've
also used it for small snippets myself.  I understand, these simple
use-cases doesn't make it right to keep it. :-)

I'm not saying "don't deprecate '-readconfig'", but just noting its
usefulness, even in its current form.  So I'm just curious if there's
be a suggested replacement.  Even if it means: "use libvirt; or use your
own bespoke scripts".

[1] https://lists.nongnu.org/archive/html/qemu-devel/2020-05/msg03681.html
    "proposal: deprecate -readconfig/-writeconfig"
[2] https://lists.nongnu.org/archive/html/qemu-devel/2020-05/msg03681.html
[3] https://github.com/flyingcircusio/fc.qemu/blob/f789e57f605969a0/src/fc/qemu/agent.py#L1153

-- 
/kashyap


