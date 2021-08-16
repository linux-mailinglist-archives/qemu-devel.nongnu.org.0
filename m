Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9AF3ED631
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 15:22:04 +0200 (CEST)
Received: from localhost ([::1]:40954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFcZ0-0002rN-RV
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 09:22:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mFcWn-00024O-6X
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 09:19:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mFcWh-0001QJ-1y
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 09:19:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629119977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6fK+6EKciD32LR8C+mdHSD3FZxvvaqF7KB1F0j1F/PI=;
 b=KXs6o7NGcgo55K5qBKddZddX2d/4zfqcpLOKsP4TLnDjI8YNfJqpOF3LVZrpfvoWIVlmos
 NQTzf65SHIL6CO1UJuYUNopcXMOd7nxnnrRPcAC2B9Oh91pJawxpr2Q8CpYf/CQvobUBYO
 X6FuuI/EI86IBtP5ukMcqEAPllofuA8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-1BliwboXO6aVxMMM9NL4hw-1; Mon, 16 Aug 2021 09:19:34 -0400
X-MC-Unique: 1BliwboXO6aVxMMM9NL4hw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 861868799E0;
 Mon, 16 Aug 2021 13:19:33 +0000 (UTC)
Received: from localhost (unknown [10.39.192.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F200060FB8;
 Mon, 16 Aug 2021 13:19:32 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH 2/2] gitlab: don't run CI jobs by default on push to
 user forks
In-Reply-To: <YRpTqmv/yXU0cK5H@redhat.com>
Organization: Red Hat GmbH
References: <20210812180403.4129067-1-berrange@redhat.com>
 <20210812180403.4129067-3-berrange@redhat.com> <87y291u0st.fsf@redhat.com>
 <YRpGFnvZznlU9RKQ@redhat.com> <87v945txvn.fsf@redhat.com>
 <YRpTqmv/yXU0cK5H@redhat.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Mon, 16 Aug 2021 15:19:31 +0200
Message-ID: <87sfz9ttlo.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 16 2021, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Mon, Aug 16, 2021 at 01:47:08PM +0200, Cornelia Huck wrote:
>> On Mon, Aug 16 2021, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote=
:
>>=20
>> > When I'm working on changing gitlab CI rules, then I burn loads of
>> > minutes which is especially troubling - limited CI minutes will make
>> > it very hard for me to debug future CI rule changes :-(
>>=20
>> I hope that will not make gitlab CI a complete non-starter -- if you
>> cannot easily debug a test case that is failing, it's mostly
>> useless. We've seen too many cases where a failure could not be
>> reproduced when the test case was running locally.
>
> One of the best things about GitLab compared to what we had with
> Travis is that the build environment is 100% container based (until
> Cleber's custom runners arrived).  This meant that when something
> does fail in GitLab, you can pull the container image down from
> the gitlab registry and run the build locally. You still have
> differences due to hardware or CPUs resources, but its a hell of
> alot easier to reproduce than before. This is good enough for most
> contributors in general, but not for the CI maintainers, who need
> to debug especially the CI system as it exists on GitLab.

Correct me if I'm wrong, but I remember that some of the more
aggravating failures in particular could not be reproduced outside of
the gitlab environment, even while using the same image.

>
>
>> >> (c) a subsystem maintainer is preparing a pull request
>> >>=20
>> >> Ideally, that should run the 'gating' set, to eliminate needless boun=
ces
>> >> of the pull request; plus some subsystem-specific manual testing on
>> >> top. In practice, the 'full' set might be good enough.
>> >
>> > Yeah, the full/gating set is what I would thing subsys maintainers
>> > would want to use, to minimize risk that Peter's tests throw back
>> > the merge due to failure. The only difference of gating vs full
>> > is whether the acceptance tests run.
>>=20
>> I can at least run a subset of the acceptance tests locally, but I think
>> I may be missing some platforms? Still, better than nothing.
>
> As ever the big problem for most people is non-x86_64 platforms. The
> custom runners solve this for gitlab, and in theory people can deploy
> a VM using QEMU TCG to do this locally, but massively slower

Still, the acceptance tests are usually small enough that running under
tcg is bearable.


