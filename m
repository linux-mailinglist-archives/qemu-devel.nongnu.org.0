Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C30B943C8EC
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 13:55:10 +0200 (CEST)
Received: from localhost ([::1]:35218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfhWP-0001Fx-Ti
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 07:55:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mfhOj-0003p0-VO
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 07:47:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mfhOi-0008C7-0u
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 07:47:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635335231;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=sXIKQBsVpAsYHiTLufUUfI1Gv9O8mSBMTZzfxoUmHmU=;
 b=TypTEwSV1PyA8OM5OGBFMbUY27pHMyfosv/FgxPSTabnkmwCp7CI5bGnmlNJvhoGhyjcz8
 Ypsy2AQ9gNwxcz/JkDyF7HsWVYvb7p/Ok5JhCEfN9cHYF86lNRD0/jKG5htCK+BDkw2RdZ
 dq+61nlEtGnbJoPMhhygw8gN1MTGMbM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-Ac0b52lzM0iqE-Kb1FGAww-1; Wed, 27 Oct 2021 07:47:08 -0400
X-MC-Unique: Ac0b52lzM0iqE-Kb1FGAww-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91A3180A5CB;
 Wed, 27 Oct 2021 11:47:07 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3977360936;
 Wed, 27 Oct 2021 11:46:41 +0000 (UTC)
Date: Wed, 27 Oct 2021 12:46:39 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 1/1] gitlab-ci: Only push docker images to registry from
 /master branch
Message-ID: <YXk8H8/wwADzGViT@redhat.com>
References: <20211026145509.1029274-1-philmd@redhat.com>
 <20211026145509.1029274-2-philmd@redhat.com>
 <81fe6a1b-8577-bea5-b287-1faecfb1938b@redhat.com>
 <YXkRQKUKkpnqgvcu@redhat.com>
 <20211027113525.sykvnsw5w2uu76qi@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20211027113525.sykvnsw5w2uu76qi@sirius.home.kraxel.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
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

On Wed, Oct 27, 2021 at 01:35:25PM +0200, Gerd Hoffmann wrote:
>   Hi,
> 
> > This scenario a tricky problem, and I'm not seeing an easy answer to it
> > so far.
> 
> Only exclude stable branches?

The stable branches issue is just one of the bugs - the bigger bug is
that we're publishing containers in the qemu-project registry from
the 'staging' branch pipelines, even if the pipeline ultimately
fails.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


