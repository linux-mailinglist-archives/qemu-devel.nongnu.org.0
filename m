Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEC22CBD17
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 13:36:56 +0100 (CET)
Received: from localhost ([::1]:40868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkRNP-0006dA-N8
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 07:36:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kkRLV-0005JC-AW
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 07:34:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kkRLT-0001Vs-69
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 07:34:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606912494;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=c7/NUiKhk/BcGP6AZJIF8imS1NrodbaRLeB+LvZSucE=;
 b=O2mOx6ZoHZrEnQoZGMyXIE4RWMuzHI0XuecJHbAGosChkxfr35/IBPPflW1nAhLPro3GYc
 /Wv8wazc7u25sC5g64/4BZt4IK/Lct7xbSPT1+at24Ru8nmR5TNukAtcTvH2PicoiH+ljK
 dd+z8ky3frkHU7JbP37vut+uqs7szQI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-O7x9v90ZP02xlr6HxrIiEw-1; Wed, 02 Dec 2020 07:34:41 -0500
X-MC-Unique: O7x9v90ZP02xlr6HxrIiEw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CBC880362D;
 Wed,  2 Dec 2020 12:34:40 +0000 (UTC)
Received: from redhat.com (ovpn-115-57.ams2.redhat.com [10.36.115.57])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2516E27C4F;
 Wed,  2 Dec 2020 12:34:22 +0000 (UTC)
Date: Wed, 2 Dec 2020 12:34:18 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: P J P <ppandit@redhat.com>
Subject: Re: [PATCH v1 1/1] security-process: update process information
Message-ID: <20201202123418.GH2360260@redhat.com>
References: <20201130134907.348505-1-ppandit@redhat.com>
 <20201130134907.348505-2-ppandit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201130134907.348505-2-ppandit@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: peter.maydell@linaro.org, Stefano Stabellini <sstabellini@kernel.org>,
 Petr Matousek <pmatouse@redhat.com>, Prasad J Pandit <pjp@fedoraproject.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Darren Kenny <darren.kenny@oracle.com>, Michael Roth <michael.roth@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 30, 2020 at 07:19:07PM +0530, P J P wrote:
> From: Prasad J Pandit <pjp@fedoraproject.org>
> 
> We are about to introduce a qemu-security mailing list to report
> and triage QEMU security issues.
> 
> Update the QEMU security process web page with new mailing list
> and triage details.
> 
> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> ---
>  contribute/security-process.md | 134 ++++++++++++++++++++-------------
>  1 file changed, 80 insertions(+), 54 deletions(-)

> +* List members follow a **responsible disclosure** policy. Any non-public
> +  information you share about security issues, is kept confidential within the
> +  respective affiliated companies. Such information shall not be passed on to
> +  any third parties, including Xen Security Project, without your prior
> +  permission.

Why this explicit note about the Xen project ?  What if we decide to want
a member of the Xen security team on the QEMU security mailing list so that
we can collaborate on triage ?

Perhaps

     Any non-public information you share about security issues, is kept
     confidential between members of the QEMU security team, and a minimal
     number of supporting staff in their affliated companies.  Information
     will not be disclosed to other third party organizations/individuals
     without prior permission from the reporter

> +* We aim to process security issues within maximum of **60 days**. That is not
> +  to say that issues will remain private for 60 days, nope. After the triaging
> +  step above
> +    - If issue is found to be less severe, an upstream public bug (or an
> +      issue) will be created immediately.

No need to repeat "or an issue". I think it would read more clearly as

   - If the severity of the issue is sufficiently low, an upstream public bug
     may be created immediately.
   
> +    - If issue is found to be severe, an embargo process below is followed,
> +      and public bug (or an issue) will be opened at the end of the set
> +      embargo period.

   - If the severity of the issue requires co-ordinated disclosure at a future
     date, then the embargo process below is followed, and public bug will be
     opened at the end of the set embargo period.


Somewhere around here is probably a good place to link to:

  https://www.qemu.org/docs/master/system/security.html

which describes why we'll consider some things to be not security issues

>  ### Publication embargo
>  
> -If a security issue is reported that is not already publicly disclosed, an
> -embargo date may be assigned and communicated to the reporter. Embargo
> -periods will be negotiated by mutual agreement between members of the security
> -team and other relevant parties to the problem. Members of the security contact
> -list agree not to publicly disclose any details of the security issue until
> -the embargo date expires.
> +* If a security issue is reported that is not already public and is severe
> +  enough, an embargo date may be assigned and communicated to the
> +  reporter(s).


  * If a security issue is reported that is not already public and its
    severity requires coordinated disclosure, an embargo date may be
    assigned and communicated to the reporter(s).


> +* Embargo periods will be negotiated by mutual agreement between reporter(s),
> +  members of the security list and other relevant parties to the problem.
> +  Such embargo period is generally upto [2 weeks](https://oss-security.openwall.org/wiki/mailing-lists/distros).

  "The preferred embargo period will be upto 2 weeks, however, longer
   embargoes can be negotiated if the severity of the issues requires it."

> +
> +* Members of the security list agree not to publicly disclose any details of
> +  an embargoed security issue until its embargo date expires.
>  
>  ### CVE allocation


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


