Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DB22FD17E
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 14:54:10 +0100 (CET)
Received: from localhost ([::1]:36730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Dw1-0007r9-Dk
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 08:54:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l2DtZ-0006su-OS
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 08:51:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l2DtV-0003IK-0U
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 08:51:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611150690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SKLPOJFkcpTTdh7G0XUMs8+yP/BtB6WtFlDWL9M1Oig=;
 b=iHmVmM4JueeiJoD4zldeo/fjvfys0dTW1G8PVxuZ/3DIOI0UfpWG5nGsP0UYdnGOg6TBUs
 LKpgJTg8Mpe57OYnZ2lvJfn9sE9Xcew4lVP6j8/755XO1obs1XONUBb0QlIO4/Jwr8U2Rb
 K2gE6XuUBu+Qi13Kqky75bsWDwuyh2w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-f3PC1jeZOwepFXqWOaUl8w-1; Wed, 20 Jan 2021 08:51:29 -0500
X-MC-Unique: f3PC1jeZOwepFXqWOaUl8w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05F15E757;
 Wed, 20 Jan 2021 13:51:28 +0000 (UTC)
Received: from localhost (unknown [10.40.208.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 719D02BFE4;
 Wed, 20 Jan 2021 13:51:26 +0000 (UTC)
Date: Wed, 20 Jan 2021 14:51:23 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2] machine: add missing doc for memory-backend option
Message-ID: <20210120145123.06a853bf@redhat.com>
In-Reply-To: <CAFEAcA843rP6rvktc0FSZEjK8C9E8h_5_PbCBUXYM4XJRE7KHQ@mail.gmail.com>
References: <20210114234612.795621-1-imammedo@redhat.com>
 <CAFEAcA843rP6rvktc0FSZEjK8C9E8h_5_PbCBUXYM4XJRE7KHQ@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Michal Privoznik <mprivozn@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Jan 2021 10:02:04 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Thu, 14 Jan 2021 at 23:48, Igor Mammedov <imammedo@redhat.com> wrote:
> >
> > Add documentation for '-machine memory-backend' CLI option and
> > how to use it.
> >
> > And document that x-use-canonical-path-for-ramblock-id,
> > is considered to be stable to make sure it won't go away by accident.  
> 
> That's not what the x- prefix is supposed to mean.
> If we have an internal constraint that we mustn't delete
> the option in order to support some other must-be-stable
> interface (eg migration of some machines) we can document
> that in a comment,
that was in v1, and Peter asked for adding assurance to help/doc as well.

> but that doesn't mean that we should
> document to users that direct use of an x-prefix option
> is supported as a stable interface.
A concur, that we don't have to declare it as stable in help/doc,
but we still have to document x-use-canonical-path-for-ramblock-id=off
the so users would know how/when to use it in this particular case.


> Alternatively, if the option is really stable for direct
> use by users then we should commit to making it so by
> removing the x-.

Peter Maydell,

I think Peter Krempa already explained/pointed to discussion why
x-use-canonical-path-for-ramblock-id wasn't renamed.

So as I see options are:
  1) keep x- prefix declare it as stable both in doc and comments (like in this patch)
     add to commit message why we are keeping x-
  2) keep x- prefix declare it as stable in comments only,
     keep doc changes to explaining how/when to use it
     add to commit message why we are keeping x-
  3) rename/drop x- prefix and don't care about QEMU-5.0-5.2
     (libvirt would use old syntax (-mem-path/mem-prealloc) for them
      which also leads to => no virtiofs as it needs shared RAM that
      new syntax with backend provides for main RAM)

Which one is acceptable to you?

> thanks
> -- PMM
> 


