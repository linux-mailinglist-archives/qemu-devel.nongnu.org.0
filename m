Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD384EC9CE
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 18:41:52 +0200 (CEST)
Received: from localhost ([::1]:47280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZbOI-0004H9-Vo
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 12:41:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1nZbKZ-0001sf-Rm
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 12:37:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1nZbKW-0002PX-AD
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 12:37:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648658274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K8k7npROK3iafK9dkdm22m/HbaNqyGXCEZDzBFcvdCQ=;
 b=WuYaFE4/qmJQ8kwpfnnBinfGeldCHT9Ym3RVsiF0Lp1BT5S1rmt2Df0PYkkl1fMGebLw3D
 OE4JjojATJAeZKq9VezjaHnbwXolqk/OjcFYq68Ng2hskSETnkrcVjVWOSm4HNRBMmV9IW
 Eh3y2KJNEx/s6ooXOdn2s24WjbNNaWw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-302-soo10AWqO22GpzEcJY-sgg-1; Wed, 30 Mar 2022 12:37:51 -0400
X-MC-Unique: soo10AWqO22GpzEcJY-sgg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D8EE80348D;
 Wed, 30 Mar 2022 16:37:51 +0000 (UTC)
Received: from p50.localhost.localdomain.some.host.somewhere.org (unknown
 [10.22.18.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE221400F8FE;
 Wed, 30 Mar 2022 16:37:50 +0000 (UTC)
References: <20220325200438.2556381-1-jsnow@redhat.com>
 <20220325200438.2556381-4-jsnow@redhat.com>
User-agent: mu4e 1.6.6; emacs 27.2
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 3/4] python/qmp-shell: relicense as LGPLv2+
Date: Wed, 30 Mar 2022 12:37:04 -0400
In-reply-to: <20220325200438.2556381-4-jsnow@redhat.com>
Message-ID: <87sfqz75wk.fsf@p50.localhost.localdomain>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Daniel Berrange <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org,
 Luiz Capitulino <lcapitulino@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <mlureau@redhat.com>,
 Eric Blake <eblake@redhat.com>, Eduardo Habkost <ehabkost@habkost.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


John Snow <jsnow@redhat.com> writes:

> qmp-shell is presently licensed as GPLv2 (only). I intend to include
> this tool as an add-on to an LGPLv2+ library package hosted on
> PyPI.org. I've selected LGPLv2+ to maximize compatibility with other
> licenses while retaining a copyleft license.
>
> To keep licensing matters simple, I'd like to relicense this tool as
> LGPLv2+ as well in order to keep the resultant license of the hosted
> release files simple -- even if library users won't "link against" this
> command line tool.
>
> Therefore, I am asking permission from the current authors of this
> tool to loosen the license. At present, those people are:
>
> - John Snow (me!), 411/609
> - Luiz Capitulino, Author, 97/609
> - Daniel Berrang=C3=A9, 81/609
> - Eduardo Habkost, 10/609
> - Marc-Andr=C3=A9 Lureau, 6/609
> - Fam Zheng, 3/609
> - Cleber Rosa, 1/609
>
> (All of which appear to have been written under redhat.com addresses.)
>
> Eduardo's fixes are largely automated from 2to3 conversion tools and may
> not necessarily constitute authorship, but his signature would put to
> rest any questions.
>
> Cleber's changes concern a single import statement change. Also won't
> hurt to ask.
>
> CC: Luiz Capitulino <lcapitulino@redhat.com>
> CC: Daniel Berrange <berrange@redhat.com>
> CC: Eduardo Habkost <ehabkost@habkost.com>
> CC: Marc-Andr=C3=A9 Lureau <mlureau@redhat.com>
> CC: Fam Zheng <fam@euphon.net>
> CC: Cleber Rosa <crosa@redhat.com>
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/aqmp/qmp_shell.py | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>

Acked-by: Cleber Rosa <crosa@redhat.com>


