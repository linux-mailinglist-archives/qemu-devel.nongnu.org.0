Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E11243C9E4
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 14:43:39 +0200 (CEST)
Received: from localhost ([::1]:39816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfiHK-0004dj-1N
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 08:43:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mfi8M-0005a9-0P
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 08:34:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mfi8K-0006tQ-2K
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 08:34:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635338059;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=e78TOZ+5+gXSFINAOlo3wXkIRqkiHHuPAowRV3KzL50=;
 b=RW1srbFxDLPt66duclZokojfFAnzjGtrKEgySx44ELk4H7M9uPzzeySt3bJ4L4V7nMvMbx
 RMNZmTLlZhtJqRUxuym14jrdzVdursxpLhV45fRcVhMlZdsga+bcWVQmL2NVSkGbXaGVjm
 N8+JuUhm8Igae8QxRZ3LlE/Xdm5hGFM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-rUsPlyVGP76b20m1g0oYfg-1; Wed, 27 Oct 2021 08:34:16 -0400
X-MC-Unique: rUsPlyVGP76b20m1g0oYfg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EF6EA40D6;
 Wed, 27 Oct 2021 12:34:15 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A70135C232;
 Wed, 27 Oct 2021 12:34:11 +0000 (UTC)
Date: Wed, 27 Oct 2021 13:34:09 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 0/1] gitlab-ci: Only push docker images to mainstream
 registry from /master
Message-ID: <YXlHQXWoLpvT7ukX@redhat.com>
References: <20211026145509.1029274-1-philmd@redhat.com>
 <YXk7nLN/rBGk+Gaz@redhat.com>
 <20211027122658.ieazn3sykshtlth4@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20211027122658.ieazn3sykshtlth4@sirius.home.kraxel.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 27, 2021 at 02:26:58PM +0200, Gerd Hoffmann wrote:
>   Hi,
> 
> > Notably the latter is more restrictive that git branch names. We could
> > assume users always have "sensible" branch names that are less than
> > 128 chars and only alpha-num characters plus dash/underscore. This
> > would be fine for my personal branch naming, but I wonder if anyone
> > uses wierd branch names that would violate docker tag name rules ?
> 
> /me uses slashes in branch names, i.e.
> 
> queue/$topic for patch queues
> $hostname/$subject for my development branches.

Ok, good to know. So that example clearly rules out use of git branch
names as docker tags.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


