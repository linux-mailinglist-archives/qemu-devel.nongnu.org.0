Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB036A0BA0
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 15:15:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVCMm-0007ZT-Uy; Thu, 23 Feb 2023 09:14:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pVCMk-0007TT-Ph
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 09:14:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pVCMj-0001zE-50
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 09:14:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677161672;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=RsgXgF3laHaDq1170slptDCQwi/3hv40iY5zqbaLBUM=;
 b=fOzR+V5fzEXTq8dImldzTnKT5MDTe68FYfMtOdtRKtclme7Vg8mdWNgkS/d3LbSk7NDBH/
 X2akQPtLauPo8dOZCxah9dX+UjiiOhXd92TzBNDDvWtOcFuOPupby8Sckpj3E9ktkebRbX
 vyP0h/Y59LjOtQ0cA9IqRp27obuYiDg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-15-sakJFIU5PYuQqRcdpKvjEg-1; Thu, 23 Feb 2023 09:14:28 -0500
X-MC-Unique: sakJFIU5PYuQqRcdpKvjEg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E1C7D104F0B4;
 Thu, 23 Feb 2023 14:14:21 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.113])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3111B404BEC4;
 Thu, 23 Feb 2023 14:14:12 +0000 (UTC)
Date: Thu, 23 Feb 2023 14:14:09 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: out of CI pipeline minutes again
Message-ID: <Y/d0sWajo0mvX2iu@redhat.com>
References: <CAFEAcA83u_ENxDj3GJKa-xv6eLJGJPr_9FRDKAqm3qACyhrTgg@mail.gmail.com>
 <3e1f9f5f-c4ec-d13d-7f88-df741a63f747@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3e1f9f5f-c4ec-d13d-7f88-df741a63f747@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

On Thu, Feb 23, 2023 at 02:46:40PM +0100, Thomas Huth wrote:
> On 23/02/2023 13.56, Peter Maydell wrote:
> > Hi; the project is out of gitlab CI pipeline minutes again.
> > In the absence of any other proposals, no more pull request
> > merges will happen til 1st March...
> 
> I'd like to propose again to send a link along with the pull request that
> shows that the shared runners are all green in the fork of the requester.
> You'd only need to check the custom runners in that case, which hopefully
> still work fine without CI minutes?

The maintainer's fork will almost certainly not be against current
HEAD though. So test results from them will not be equivalent to
the tests that Peter normally does on staging, which reflects the
result of merging current HEAD + the pull request.

Sometimes that won't matter, but especially near freeze when we have
a high volume of pull requests, I think that's an important difference
to reduce risk of regressions.

> It's definitely more cumbersome, but maybe better than queuing dozens of
> pull requests right in front of the soft freeze?

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


