Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A08845A798A
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 10:54:21 +0200 (CEST)
Received: from localhost ([::1]:56982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTJUK-00060Z-Q2
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 04:54:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oTJQ1-0000wF-D6
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 04:49:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oTJPx-0000JD-NQ
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 04:49:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661935784;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/6rgVL73Mz4gxrUlP4hAh84c9GGjnqIDaSuB8ZxZmSM=;
 b=O2gideXjYFq1c4RoBaavx5vVEPUDMlEzvnnqUMGHqPElJrDXa71XSt9YhXJBKtyU8zhpSd
 4mPSCGGynWyZI6FIApvwC31x3CnnMaAxaFSVu+sZ2aEw5dkogzk/NyjHYztYWDYt3Fqvbh
 Sab8Z8FYDCcM/uLK/KA3/hTabCiiQgI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-BzoLFJhxMKCc8v3wgVIXNg-1; Wed, 31 Aug 2022 04:49:43 -0400
X-MC-Unique: BzoLFJhxMKCc8v3wgVIXNg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3DB6885A585;
 Wed, 31 Aug 2022 08:49:43 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE02EC15BB3;
 Wed, 31 Aug 2022 08:49:42 +0000 (UTC)
Date: Wed, 31 Aug 2022 09:49:40 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Wang, Lei" <lei4.wang@intel.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [Qemu-devel] [RFC PATCH] Add qemu .clang-format
Message-ID: <Yw8gpOzspxrcE8rE@redhat.com>
References: <1443720628-16512-1-git-send-email-marcandre.lureau@redhat.com>
 <9cb1a173-c703-1787-90e1-4668710b323b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9cb1a173-c703-1787-90e1-4668710b323b@intel.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 31, 2022 at 02:23:51PM +0800, Wang, Lei wrote:
> 
> On 10/2/2015 1:30 AM, marcandre.lureau@redhat.com wrote:
> > From: Marc-André Lureau <marcandre.lureau@redhat.com>
> > 
> > clang-format is awesome to reflow your code according to qemu coding
> > style in an editor (in the region you modify).
> > 
> > (note: clang-tidy should be able to add missing braces around
> > statements, but I haven't tried it, it's quite recent)
> > 
> > Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> > ---
> >   .clang-format | 6 ++++++
> >   1 file changed, 6 insertions(+)
> >   create mode 100644 .clang-format
> > 
> > diff --git a/.clang-format b/.clang-format
> > new file mode 100644
> > index 0000000..6422547
> > --- /dev/null
> > +++ b/.clang-format
> > @@ -0,0 +1,6 @@
> > +BasedOnStyle: LLVM
> > +IndentWidth: 4
> > +UseTab: Never
> > +BreakBeforeBraces: Linux
> > +AllowShortIfStatementsOnASingleLine: false
> > +IndentCaseLabels: false
> 
> Hi, any progress on this? I also found a gist on GitHub which can be a
> reference: https://gist.github.com/elmarco/aa5e0b23567f46fb7f0e73cde586a0c1

clang-format is a great tool and I'd highly recommend its use on
any newly started projects, and even retrospectively on existing
projects which are small scale. Adding it to large existing projects
is problematic though.

None of the QEMU code complies with it today and indeed there is
quite a bit of style variance across different parts of QEMU. If
we add this config file, and someone makes a 1 line change in a
file, clang-format will reformat the entire file contents.

The only practical way to introduce use of clang-format would be
to do a bulk reformat of the entire codebase. That is something
that is quite disruptive to both people with patches they're
working on but not submitted yet, as well as people wanting to
cherry-pick new commits back to old code branches.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


