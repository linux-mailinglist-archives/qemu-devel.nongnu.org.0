Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BFD43C57D
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 10:49:13 +0200 (CEST)
Received: from localhost ([::1]:45204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfecS-000526-7l
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 04:49:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mfeZE-0002nJ-1g
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 04:45:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mfeZB-000428-IR
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 04:45:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635324348;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q8qjyxd0zu6+hSAYyveWmB628NSQQVZTLK/qveUDKFs=;
 b=GdrtxPmk5p2yTPMA0sw7YYrfEsHsZcwUI9ofd+FDt2T1uP14dXxxe8YTbdAZ528YHr7fsP
 k6tLMpxipG0bBOcN0VeLScTw3btwOdMJcy0E6KFv8phOGRl+4hmsK1S+JA0mDY0972Ut3h
 CnJp1j4Y7n2FM0RswqorP3tn/w4/pqU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-BpYz1_KFOoW89ZiakAKgAQ-1; Wed, 27 Oct 2021 04:45:33 -0400
X-MC-Unique: BpYz1_KFOoW89ZiakAKgAQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C37898066F5;
 Wed, 27 Oct 2021 08:45:31 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 66DDA5DF21;
 Wed, 27 Oct 2021 08:44:33 +0000 (UTC)
Date: Wed, 27 Oct 2021 09:44:31 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/1] gitlab-ci: Only push docker images to registry from
 /master branch
Message-ID: <YXkRQKUKkpnqgvcu@redhat.com>
References: <20211026145509.1029274-1-philmd@redhat.com>
 <20211026145509.1029274-2-philmd@redhat.com>
 <81fe6a1b-8577-bea5-b287-1faecfb1938b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <81fe6a1b-8577-bea5-b287-1faecfb1938b@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 27, 2021 at 08:01:07AM +0200, Thomas Huth wrote:
> On 26/10/2021 16.55, Philippe Mathieu-Daudé wrote:
> > Users expect images pulled from registry.gitlab.com/qemu-project/qemu/
> > to be stable. QEMU repository workflow pushes merge candidates to
> > the /staging branch, and on success the same commit is pushed as
> > /master. If /staging fails, we do not want to push the built images
> > to the registry. Therefore limit the 'docker push' command to the
> > /master branch on the mainstream CI. The fork behavior is unchanged.
> 
> Hmmm, what if I have a patch series that updates one of the containers and
> then also contains a new test that depends on the updated container? Won't
> that fail in the staging branch now and make me look bad?

Yep, if a patch series contains a dockerfile change we *must* run the
container build no matter what, so tis patch doesn't fly.

This scenario a tricky problem, and I'm not seeing an easy answer to it
so far.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


