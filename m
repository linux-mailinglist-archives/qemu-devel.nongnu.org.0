Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF152B9A5A
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 19:06:18 +0100 (CET)
Received: from localhost ([::1]:45684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfoK1-0006JY-7P
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 13:06:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kfoHm-0005rx-Lz
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 13:03:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kfoHj-0003w6-0t
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 13:03:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605809033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D3OZoCQwdnb266+IU8Yw9F5GpvKMyNQLLZQlY/zTDYU=;
 b=ZK3D0vFPFaOz6Je0ZkZkkZTbC9o77ssdqWtSVrKvl/c7ujFiyFv6kAYCCrbeQaUVxMtByx
 hs4/65lv0LZJJRPUq2kaQj+1D3fihSe4m5ZvqiCQhvpNitNLphO27h8dLYjsQc5dM1IVs0
 IuxyeNmriEDO2mOIVgdeeM/Wrte6Uzw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90-AMZ7skQQNRSE1yxio7PsAQ-1; Thu, 19 Nov 2020 13:03:51 -0500
X-MC-Unique: AMZ7skQQNRSE1yxio7PsAQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E58B51005D51;
 Thu, 19 Nov 2020 18:03:50 +0000 (UTC)
Received: from localhost (ovpn-115-101.rdu2.redhat.com [10.10.115.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7893E5C1D5;
 Thu, 19 Nov 2020 18:03:50 +0000 (UTC)
Date: Thu, 19 Nov 2020 13:03:49 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 1/8] qobject: Include API docs in
 docs/devel/qobject.html
Message-ID: <20201119180349.GW1509407@habkost.net>
References: <20201116224143.1284278-1-ehabkost@redhat.com>
 <20201116224143.1284278-2-ehabkost@redhat.com>
 <87wnyhd6wd.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87wnyhd6wd.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CCing Peter, Sphinx documentation machinery maintainer.

On Thu, Nov 19, 2020 at 10:37:22AM +0100, Markus Armbruster wrote:
> Eduardo Habkost <ehabkost@redhat.com> writes:
> 
> > Render existing doc comments at docs/devel/qobject.html.
> >
> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > ---
[...]
> >  /**
> > - * qnum_destroy_obj(): Free all memory allocated by a
> > - * QNum object
> > + * qnum_destroy_obj(): Free all memory allocated by a QNum object
> > + *
> > + * @obj: QNum object to be destroyed
> >   */
> >  void qnum_destroy_obj(QObject *obj)
> >  {
> 
> Many lines of the form
> 
>   + * @foo: a foo

I hate them too.

> 
> One of my reasons to dislike GTK-Doc.  Oh well, it's what we're using.

It's not gtk-doc.  It's kernel-doc who generates warnings
if some parameters are not documented, and maybe we should
silence them.

-- 
Eduardo


