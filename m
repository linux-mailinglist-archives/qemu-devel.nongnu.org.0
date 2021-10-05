Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF57422116
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 10:48:01 +0200 (CEST)
Received: from localhost ([::1]:55258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXg7E-0000x2-C0
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 04:48:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mXg4U-0007q0-Jq
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 04:45:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mXg4S-0008MZ-0D
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 04:45:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633423506;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/S9PSKnWdiyo/5wDUz/07t3DN3ZLUOmOwOEKAvD7j+8=;
 b=T6GTIYyTawvG3zL8/VdJDbqQ3lXwuHKeHVB9DBcdEBVnkJ8hcmd8BJGzi6UFbtIk/gA6sO
 ddg7U00FmPc0BFPoEXSECv1/J9DUJ2nJ+Uo5CVxsqjh8b6+CJMnXAIUNpf0nG4X82fqa1L
 jAWJsoioTPtRrbVZzphmP6d7t7kYTcE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-gG2nBkYWO-KCc0UodKbK9g-1; Tue, 05 Oct 2021 04:44:58 -0400
X-MC-Unique: gG2nBkYWO-KCc0UodKbK9g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69F8D1018F62;
 Tue,  5 Oct 2021 08:44:57 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 613BC10023AB;
 Tue,  5 Oct 2021 08:43:54 +0000 (UTC)
Date: Tue, 5 Oct 2021 09:43:51 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] gitlab: Escape git-describe match pattern on Windows hosts
Message-ID: <YVwQRyD6FxrB9qgd@redhat.com>
References: <20210901145229.4132606-1-philmd@redhat.com>
 <YS+UylEr3CJyksxt@redhat.com>
 <CAFEAcA_gyZTfUTAAoKvrA-qyv-8dOvGjLSLmq2uaur8XYS6CuQ@mail.gmail.com>
 <YS+aiZep166VuVcH@redhat.com>
 <0901f6da-de5c-f9e6-5f40-e15f4a7c807d@redhat.com>
 <YS+iCgl88cmMepKl@redhat.com>
 <33d1a40b-c242-6472-5aa4-4108668ccc84@redhat.com>
 <005033c9-ac86-7af2-203d-0c597cec691c@kaod.org>
 <YS+usDwjGFD07w0C@redhat.com>
 <b58ba43f-62a0-c287-ff7c-9a842cf971b9@kaod.org>
MIME-Version: 1.0
In-Reply-To: <b58ba43f-62a0-c287-ff7c-9a842cf971b9@kaod.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 05, 2021 at 10:40:00AM +0200, Cédric Le Goater wrote:
> > I'm curious if you go to
> > 
> >    https://gitlab.com/legoater/qemu/-/settings/ci_cd
> > 
> > and expand "General pipelines", what value is set for the
> > 
> >    "Git shallow clone"
> > 
> > setting.  In my fork it is 0 which means unlimited depth, but in
> > gitlab docs I see reference to repos getting this set to 50
> > since a particular gitlab release.
> 
> Sorry for the late reply.
> 
> Setting the value to 0 fixed the windows build on gitlab.

Ok, so we've got two options

 - Change the code so it has sane fallback if the tags are all missing

 - Set GIT_DEPTH in the affected jobs to a value that is larger than
   the maximum number of commits we expect in the course of a single
   dev cycle, plus 20% grace on top, so that we're guaranteed enough
   history to describe one tag.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


