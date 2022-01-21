Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA9349657F
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 20:18:43 +0100 (CET)
Received: from localhost ([::1]:40692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAzQn-0007R4-Jd
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 14:18:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1nAzPN-0006Rn-Aq
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 14:17:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1nAzPK-0004fM-C9
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 14:17:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642792629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vJxnzkHNePGVMeHPeDTG4sCZ3uiJfUxVDgMe4enNnug=;
 b=CyeGriUlpQgRTY5h1Eh5PxUoFa9Ej3EzCOfM2V/RM90WcFQr4vQ0avfW44giidKVmt841c
 eel+a0G3z63A7bhzwMWQwD8jR/G0yVbhoWj9CvYCyDGB17wTbqGwtLE3X4+9IaB/isCTqH
 9q3A1e+Zfr5ksDXT8gs8IdptD/xK3OM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-G20Xw9uCOJiExb0D-x-grA-1; Fri, 21 Jan 2022 14:15:56 -0500
X-MC-Unique: G20Xw9uCOJiExb0D-x-grA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7D4915743;
 Fri, 21 Jan 2022 19:15:55 +0000 (UTC)
Received: from p50.localhost.localdomain.some.host.somewhere.org (unknown
 [10.22.35.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2942D5C22B;
 Fri, 21 Jan 2022 19:15:55 +0000 (UTC)
References: <20220121005221.142236-1-jsnow@redhat.com>
User-agent: mu4e 1.6.6; emacs 27.2
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH] python: pin setuptools below v60.0.0
Date: Fri, 21 Jan 2022 14:15:26 -0500
In-reply-to: <20220121005221.142236-1-jsnow@redhat.com>
Message-ID: <87ee50vr11.fsf@p50.localhost.localdomain>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


John Snow <jsnow@redhat.com> writes:

> setuptools is a package that replaces the python stdlib 'distutils'. It
> is generally installed by all venv-creating tools "by default". It isn't
> actually needed at runtime for the qemu package, so our own setup.cfg
> does not mention it as a dependency.
>
> However, tox will create virtual environments that include it, and will
> upgrade it to the very latest version. the 'venv' tool will also include
> whichever version your host system happens to have.
>
> Unfortunately, setuptools version 60.0.0 and above include a hack to
> forcibly overwrite python's built-in distutils. The pylint tool that we
> use to run code analysis checks on this package relies on distutils and
> suffers regressions when setuptools >= 60.0.0 is present at all, see
> https://github.com/PyCQA/pylint/issues/5704
>
> Instruct tox and the 'check-dev' targets to avoid setuptools packages
> that are too new, for now. Pipenv is unaffected, because setuptools 60
> does not offer Python 3.6 support, and our pipenv config is pinned
> against Python 3.6.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/Makefile  | 2 ++
>  python/setup.cfg | 1 +
>  2 files changed, 3 insertions(+)
>

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>


