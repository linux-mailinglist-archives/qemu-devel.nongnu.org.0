Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B26956A8A7
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 18:53:40 +0200 (CEST)
Received: from localhost ([::1]:40832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Ul1-0002Rw-Ka
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 12:53:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o9Ubj-0006N7-Gb
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 12:44:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o9Ubd-00081h-Lr
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 12:44:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657212237;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vNfexJehAjDIoQ++3JJDH3d2Q0A8GyshZK5l0HocfAs=;
 b=cTgq9Gk0IE7Fk7Mwl0dBFvt2fTzl0pT0zi1+UE5FgtP0Kjho+WPL01tv+eQhvxUo+8YdYP
 NW56pXog4wYlxJGwBq7ldxamUJmPCn4ytuzuEyanVWTslrsp4gNI3KDMNh75aQI1GGsU/K
 kVN6xfhQaJtQ62IoLPUp9guOBQY00TQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-TXNqiw_ZNOOJd4_8my4gsQ-1; Thu, 07 Jul 2022 12:43:53 -0400
X-MC-Unique: TXNqiw_ZNOOJd4_8my4gsQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 45B4182DFA0;
 Thu,  7 Jul 2022 16:43:35 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.167])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A28C340885A1;
 Thu,  7 Jul 2022 16:43:32 +0000 (UTC)
Date: Thu, 7 Jul 2022 17:43:29 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 1/7] tests: introduce tree-wide code style checking
Message-ID: <YscMBIh3ug79k2ug@redhat.com>
References: <20220704152303.760983-1-berrange@redhat.com>
 <20220704152303.760983-2-berrange@redhat.com>
 <CAFEAcA__aTeaeB8JbMQdUz=4_6W8J5m0wOsYWBgj3RLrm=G_uQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA__aTeaeB8JbMQdUz=4_6W8J5m0wOsYWBgj3RLrm=G_uQ@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 04, 2022 at 04:46:53PM +0100, Peter Maydell wrote:
> On Mon, 4 Jul 2022 at 16:23, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > Historically QEMU has used the 'scripts/checkpatch.pl' script to
> > validate various style rules but there are a number of issues:
> 
> >  meson.build              |   3 +
> >  tests/Makefile.include   |   3 +-
> >  tests/meson.build        |  19 +++
> >  tests/style-excludes.mak |   4 +
> >  tests/style-infra.mak    | 265 +++++++++++++++++++++++++++++++++++++++
> >  tests/style.mak          |  24 ++++
> 
> From my point of view the main issue with checkpatch.pl is
> that nobody in the QEMU developers particularly understands
> it or is enthusiastic about trying to add more tests to it
> or adjust the existing ones where QEMU style diverges from
> the kernel style (but nor are we tracking and upgrading to
> newer versions of the kernel's script).
> 
> This seems to be aiming to replace a complex and hard to
> understand perl script with a complex and hard to understand
> makefile. I can't say I'm terribly enthusiastic :-/

Taking that feedback on board, I've proposed a new version which is
written in Python, and uses a plain yaml config file, which I admit
results in an easier to understand and more attractive impl than
this makefile based one.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


