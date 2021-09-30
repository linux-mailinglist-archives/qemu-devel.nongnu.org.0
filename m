Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD5641DCB9
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 16:53:31 +0200 (CEST)
Received: from localhost ([::1]:52028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVxRC-0004Vc-QX
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 10:53:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVxPk-0002wZ-W1
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 10:52:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVxPg-0004Ek-OV
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 10:51:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633013515;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=FApkZFiGjjIp9w/ccQxNoh8SFI1hCrakvPAKYMoUOUU=;
 b=EqmXnhYaYfWBzbenP1CU2keBcFmbe0fGp723Jpo9OEgWS8pbmUm+kgkdBPgiEDDX3IB52q
 LGNvINmdQOSZybynNLaZKRKUaSoKD4+sa83pugcQnLqrpokPbI01/Y5qLr5N5nrZDpP307
 fu4ktBgbj76FB4lPCwm426PAwauE5Lk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-huneXnIxMVOZwuLHh6IuKg-1; Thu, 30 Sep 2021 10:51:49 -0400
X-MC-Unique: huneXnIxMVOZwuLHh6IuKg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E25A38145FB;
 Thu, 30 Sep 2021 14:51:48 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F1159652B9;
 Thu, 30 Sep 2021 14:51:47 +0000 (UTC)
Date: Thu, 30 Sep 2021 15:51:44 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 1/7] docs: name included files ".rst.inc"
Message-ID: <YVXPAI5RfPvpavnA@redhat.com>
References: <20210930133250.181156-1-pbonzini@redhat.com>
 <20210930133250.181156-2-pbonzini@redhat.com>
 <CAFEAcA_BPE47ibbkobDsa2qH3yTOKd_iU3YjR4t452wN-PzDaQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_BPE47ibbkobDsa2qH3yTOKd_iU3YjR4t452wN-PzDaQ@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 30, 2021 at 03:47:46PM +0100, Peter Maydell wrote:
> On Thu, 30 Sept 2021 at 14:33, Paolo Bonzini <pbonzini@redhat.com> wrote:
> >
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> 
> > --- a/docs/devel/ci.rst
> > +++ b/docs/devel/ci.rst
> > @@ -8,6 +8,6 @@ found at::
> >
> >     https://wiki.qemu.org/Testing/CI
> >
> > -.. include:: ci-definitions.rst
> > -.. include:: ci-jobs.rst
> > -.. include:: ci-runners.rst
> > +.. include:: ci-definitions.rst.inc
> > +.. include:: ci-jobs.rst.inc
> > +.. include:: ci-runners.rst.inc
> 
> Why are these includes anyway? I think we should either make them
> proper separate documents (pulled in via a toctree), or just fold
> the whole thing into a single file if we think it should only be
> one page. I think it's probably better to reserve the include
> directive for places where we really do need to textually pull in
> another file, ie where we have the same text in several documents.

When editting them I find myself getting lost in the rst file. Each
of them is covering an essentially self-contained topic, so while
it makes sense for the rendered page to be all one, for editors it
is nicer for them to be separate.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


