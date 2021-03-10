Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 694BA333A2A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 11:39:02 +0100 (CET)
Received: from localhost ([::1]:53826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJwF3-0003Cc-E9
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 05:39:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lJw92-0006o9-N9
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:32:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lJw8y-0002Mb-8r
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:32:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615372363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IjLPx21+Fa/HkAjxME8Yk4zkT5yeMg/4qgZLK89nsgk=;
 b=PS/h1gMI9qRE+vhI7X3JjY3JVTBeSvt3uPV+HAp/tlsDskMzBRINUf3y7d6HIrJwHqW7Of
 6rK3SOSN0PpkJY71u/T8EULakpibVwmCf4z2o5aV5RGt8AlkKnoahDbqDDDTg6dfX16R4X
 7gOIqu1aA7RL/p6ipv4ZCr38wsxo9qU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-PI8ahs3LOlGmirbDt4pA2Q-1; Wed, 10 Mar 2021 05:32:41 -0500
X-MC-Unique: PI8ahs3LOlGmirbDt4pA2Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1639108BD07;
 Wed, 10 Mar 2021 10:32:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DBCB5C1A1;
 Wed, 10 Mar 2021 10:32:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8EDEE1132C12; Wed, 10 Mar 2021 11:32:34 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] tests: Move unit tests into a separate directory
References: <20210310063314.1049838-1-thuth@redhat.com>
Date: Wed, 10 Mar 2021 11:32:34 +0100
In-Reply-To: <20210310063314.1049838-1-thuth@redhat.com> (Thomas Huth's
 message of "Wed, 10 Mar 2021 07:33:14 +0100")
Message-ID: <87mtvb5mf1.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thomas Huth <thuth@redhat.com> writes:

> The main tests directory still looks very crowded, and it's not
> clear which files are part of a unit tests and which belong to
> a different test subsystem. Let's clean up the mess and move the
> unit tests to a separate directory.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  MAINTAINERS                                   |  68 +++----
>  tests/meson.build                             | 182 +----------------
>  tests/{ => unit}/check-block-qdict.c          |   0
>  tests/{ => unit}/check-qdict.c                |   0
>  tests/{ => unit}/check-qjson.c                |   0
>  tests/{ => unit}/check-qlist.c                |   0
>  tests/{ => unit}/check-qlit.c                 |   0
>  tests/{ => unit}/check-qnull.c                |   0
>  tests/{ => unit}/check-qnum.c                 |   0
>  tests/{ => unit}/check-qobject.c              |   0
>  tests/{ => unit}/check-qom-interface.c        |   0
>  tests/{ => unit}/check-qom-proplist.c         |   0
>  tests/{ => unit}/check-qstring.c              |   0
>  tests/{ => unit}/crypto-tls-psk-helpers.c     |   0
>  tests/{ => unit}/crypto-tls-psk-helpers.h     |   0
>  tests/{ => unit}/crypto-tls-x509-helpers.c    |   0
>  tests/{ => unit}/crypto-tls-x509-helpers.h    |   0
>  tests/{ => unit}/io-channel-helpers.c         |   0
>  tests/{ => unit}/io-channel-helpers.h         |   0
>  tests/{ => unit}/iothread.c                   |   0
>  tests/{ => unit}/iothread.h                   |   0
>  tests/unit/meson.build                        | 184 ++++++++++++++++++
>  tests/{ => unit}/pkix_asn1_tab.c              |   2 +-
>  tests/{ => unit}/ptimer-test-stubs.c          |   0
>  tests/{ => unit}/ptimer-test.c                |   0
>  tests/{ => unit}/ptimer-test.h                |   0
>  tests/{ => unit}/rcutorture.c                 |   0
>  tests/{ => unit}/socket-helpers.c             |   0
>  tests/{ => unit}/socket-helpers.h             |   0
>  tests/{ => unit}/test-aio-multithread.c       |   0
>  tests/{ => unit}/test-aio.c                   |   0
>  tests/{ => unit}/test-authz-list.c            |   0
>  tests/{ => unit}/test-authz-listfile.c        |   0
[...]

Oppportunity to normalize the naming: check-FOO vs. test-FOO
vs. FOO-test vs. FOO.


