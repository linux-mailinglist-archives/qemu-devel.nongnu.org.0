Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4686EF097
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 11:09:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prb88-0004q4-Au; Wed, 26 Apr 2023 05:08:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1prb80-0004m0-AX
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 05:07:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1prb7s-00038q-UF
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 05:07:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682500064;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wl7FQJsNN76Vz4RdIelxp0LbGzYVpv9nvfw6HVwAW6Y=;
 b=QiVeCmm/M+fAkA61xIy31V8ojU6aFP/Mp1z8Y+njEID3gBdTBUl8P4vqMPioIr48DdWno+
 IDoo16TB/sa7+FBrpvHnUzI0b3i6z0kNE7/0ttX//TcxGTM11JTFVJwj9YcuJAj2kWnWGM
 8lEu5fgI/zAlzOJ0NzSR8n8AwTSLWKc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-216-3EX2yvqHMzKB3JArIUHX_A-1; Wed, 26 Apr 2023 05:07:40 -0400
X-MC-Unique: 3EX2yvqHMzKB3JArIUHX_A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E3DE101A531;
 Wed, 26 Apr 2023 09:07:40 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 284072027043;
 Wed, 26 Apr 2023 09:07:37 +0000 (UTC)
Date: Wed, 26 Apr 2023 10:07:34 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Li Zhijian <lizhijian@fujitsu.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Zhang Chen <chen.zhang@intel.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v2 2/6] tests/qtests: remove migration test iterations
 config
Message-ID: <ZEjp1o9lGfQFXNZG@redhat.com>
References: <20230421171411.566300-1-berrange@redhat.com>
 <20230421171411.566300-3-berrange@redhat.com>
 <87r0scgats.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87r0scgats.fsf@secure.mitica>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Apr 21, 2023 at 11:54:55PM +0200, Juan Quintela wrote:
> Daniel P. Berrangé <berrange@redhat.com> wrote:
> > The 'unsigned int interations' config for migration is somewhat
> > overkill. Most tests don't set it, and a value of '0' is treated
> > as equivalent to '1'. The only test that does set it, xbzrle,
> > used a value of '2'.
> >
> > This setting, however, only relates to the migration iterations
> > that take place prior to allowing convergence. IOW, on top of
> > this iteration count, there is always at least 1 further migration
> > iteration done to deal with pages that are dirtied during the
> > previous iteration(s).
> >
> > IOW, even with iterations==1, the xbzrle test will be running for
> > a minimum of 2 iterations. With this in mind we can simplify the
> > code and just get rid of the special case.
> 
> Perhaps the old code was already wrong, but we need at least three
> iterations for the xbzrle test:
> - 1st iteration: xbzrle is not used, nothing is on cache.

Are you sure about this ?  I see ram_save_page() calling
save_xbzrle_page() and unless I'm mis-understanding the
code, it doesn't appear to skip anything on the 1st
iteration.

IIUC save_xbzrle_page will add pages into the cache on
the first iteration, so the second iteration will get
cache hits

> - 2nd iteration: pages are put into cache, no xbzrle is used because
>   there is no previous page.
> - 3rd iteration: We really use xbzrle now against the copy of the
>   previous iterations.
> 
> And yes, this should be commented somewhere.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


