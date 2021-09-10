Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0B6406E3E
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 17:34:45 +0200 (CEST)
Received: from localhost ([::1]:40382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOiY8-00087f-56
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 11:34:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mOiWz-0007Jv-Cw
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 11:33:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mOiWw-0006Ve-38
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 11:33:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631288008;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=8Fpo4I3A/FS978oafft2JtMWz8X8aiROKAsbvjpm6KI=;
 b=eHKyA5c+NElJHPethAZ/3EXbKMxb0TJaBc0G9h9DSL5Q0luDFxc+IaTf/UgXOL4G7Fnpcx
 KxMbkGvI7xmquUcq50Q+KG/u5bqdCjA7manmPWQ+VDAsMjwWMUChEKOYlp45oBrOeJEvDd
 WyvAOjwvSiwq/f8oKTA+28Su7wguOIk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-83T4gWPCNDWdF2JErMNHOg-1; Fri, 10 Sep 2021 11:33:24 -0400
X-MC-Unique: 83T4gWPCNDWdF2JErMNHOg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B97C84A5E1
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 15:33:23 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.181])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4084460C04;
 Fri, 10 Sep 2021 15:33:19 +0000 (UTC)
Date: Fri, 10 Sep 2021 16:33:16 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [qemu-web PATCH] contribute: ask not to submit merge requests
Message-ID: <YTt6vM2FtoOpi+JP@redhat.com>
References: <20210910152933.468368-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210910152933.468368-1-pbonzini@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: thuth@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 10, 2021 at 05:29:33PM +0200, Paolo Bonzini wrote:
> Currently, the bug reporting page has a paragraph about not sending patches
> on the bug tracker, with a link to the patch submission guidelines.
> 
> However, now that the tracker is hosted on Gitlab it is more likely that
> prospective contributors will submit a merge request linked to an issue,
> rather than attaching a patch to the issue.  Update the language and,
> since it is not limited to bug reports, move it to the main contribute
> page.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  contribute.md              | 3 ++-
>  contribute/report-a-bug.md | 2 --
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/contribute.md b/contribute.md
> index cbb476d..4802452 100644
> --- a/contribute.md
> +++ b/contribute.md
> @@ -15,7 +15,8 @@ permalink: /contribute/
>  
>  * Read developer documentation: &ldquo;[Getting started for developers](https://wiki.qemu.org/Documentation/GettingStartedDevelopers)&rdquo;,
>    &ldquo;[Contributor FAQ](https://wiki.qemu.org/Contribute/FAQ)&rdquo;,
> -  &ldquo;[How to submit a patch](https://wiki.qemu.org/Contribute/SubmitAPatch)&rdquo;,
>    &ldquo;[Improve the website](https://www.qemu.org/2017/02/04/the-new-qemu-website-is-up/)&rdquo;
>  
> +Please do not submit merge requests on GitLab; patches are sent to the mailing list according to QEMU's [patch submissions guidelines](https://wiki.qemu.org/Contribute/SubmitAPatch).
> +
>  Contributing to QEMU is subject to the [QEMU Code of Conduct](https://qemu.org/docs/master/devel/code-of-conduct.html).
> diff --git a/contribute/report-a-bug.md b/contribute/report-a-bug.md
> index 922f699..807daf8 100644
> --- a/contribute/report-a-bug.md
> +++ b/contribute/report-a-bug.md
> @@ -18,8 +18,6 @@ When submitting a bug report, please try to do the following:
>  
>  * Include information about the host and guest (operating system, version, 32/64-bit).
>  
> -* Do not contribute patches on the bug tracker; send patches to the mailing list. Follow QEMU's [guidelines about submitting patches](https://wiki.qemu.org/Contribute/SubmitAPatch).
> -

I think it might be worth leaving a warning here despite adding it
to the main contribute index page, as people might land directly on
this page and not see the other page's warning.

>  Do NOT report security issues (or other bugs, too) as "private" bugs in the
>  bug tracker.  QEMU has a [security process](../security-process) for issues
>  that should be reported in a non-public way instead.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


