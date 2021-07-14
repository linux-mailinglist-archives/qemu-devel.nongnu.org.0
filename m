Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3683C8A9B
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 20:16:32 +0200 (CEST)
Received: from localhost ([::1]:39828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3jQt-00025k-65
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 14:16:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m3jPa-0001PI-0H
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:15:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m3jPV-0006FT-7v
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:15:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626286503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kSpyzkUoYMoPdVPWQ+l3Q2kuizpiFfmpR1uBxk+ZrQw=;
 b=hi021jUeyR85rHtK6cYV089HdYlnpFd4EHjEy0h3WUbwy9A7WneLYlk4rtrTyLVmuUW5fk
 kY19D2PEaFppClzGc17MZo4I+zJnVEIq9oZTCiI/extnONef3WFkU7S5YVKs6SBja6NLr2
 dRyesunsTKVokdQmr7lmDbl/WF1Zbts=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-QDcjarybPRGJJkJhDbRsNA-1; Wed, 14 Jul 2021 14:15:01 -0400
X-MC-Unique: QDcjarybPRGJJkJhDbRsNA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8127C18D6A35;
 Wed, 14 Jul 2021 18:15:00 +0000 (UTC)
Received: from p50.localhost.localdomain.some.host.somewhere.org
 (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B42F5D9DD;
 Wed, 14 Jul 2021 18:14:52 +0000 (UTC)
References: <20210714101003.3113726-1-philmd@redhat.com>
User-agent: mu4e 1.4.15; emacs 27.2
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-6.1] gitlab-ci: Extract EDK2 job rules to reusable
 section
In-reply-to: <20210714101003.3113726-1-philmd@redhat.com>
Date: Wed, 14 Jul 2021 14:14:51 -0400
Message-ID: <871r8069us.fsf@p50.localhost.localdomain>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 writes:

> All jobs depending on 'docker-edk2' job must use at most all
> the rules that triggers it. The simplest way to ensure that
> is to always use the same rules. Extract all the rules to a
> reusable section, and include this section (with the 'extends'
> keyword) in both 'docker-edk2' and 'build-edk2' jobs.
>
> The problem was introduced in commit 71920809cea ("gitlab-ci.yml:
> Add jobs to build EDK2 firmware binaries"), but was revealed in
> commit 1925468ddbf ("docker: EDK2 build job depends on EDK2
> container") and eventually failed on CI:
> https://gitlab.com/qemu-project/qemu/-/pipelines/335995843
>
> Reported-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> If this is a correct fix, I'll send a similar fix for the
> OpenSBI jobs.
> ---
>  .gitlab-ci.d/edk2.yml | 27 ++++++++++++++++-----------
>  1 file changed, 16 insertions(+), 11 deletions(-)
>
> diff --git a/.gitlab-ci.d/edk2.yml b/.gitlab-ci.d/edk2.yml
> index ba7280605c4..aae2f7ad880 100644
> --- a/.gitlab-ci.d/edk2.yml
> +++ b/.gitlab-ci.d/edk2.yml
> @@ -1,10 +1,22 @@
> -docker-edk2:
> - stage: containers
> - rules: # Only run this job when the Dockerfile is modified
> +# All jobs needing docker-edk2 must use the same rules it uses.
> +.edk2_job_rules:
> + rules: # Only run this job when ...
>   - changes:
> +   # this file is modified
>     - .gitlab-ci.d/edk2.yml
> +   # or the Dockerfile is modified
>     - .gitlab-ci.d/edk2/Dockerfile
> +   # or roms/edk2/ is modified (submodule updated)
> +   - roms/edk2/*
>     when: always
> + - if: '$CI_COMMIT_REF_NAME =3D~ /^edk2/' # or the branch/tag starts wit=
h 'edk2'
> +   when: always
> + - if: '$CI_COMMIT_MESSAGE =3D~ /edk2/i' # or last commit description co=
ntains 'EDK2'
> +   when: always
> +
> +docker-edk2:
> + extends: .edk2_job_rules
> + stage: containers
>   image: docker:19.03.1
>   services:
>   - docker:19.03.1-dind
> @@ -24,16 +36,9 @@ docker-edk2:
>   - docker push $IMAGE_TAG
> =20
>  build-edk2:
> + extends: .edk2_job_rules
>   stage: build
>   needs: ['docker-edk2']
> - rules: # Only run this job when ...
> - - changes: # ... roms/edk2/ is modified (submodule updated)
> -   - roms/edk2/*
> -   when: always
> - - if: '$CI_COMMIT_REF_NAME =3D~ /^edk2/' # or the branch/tag starts wit=
h 'edk2'
> -   when: always
> - - if: '$CI_COMMIT_MESSAGE =3D~ /edk2/i' # or last commit description co=
ntains 'EDK2'
> -   when: always
>   artifacts:
>     paths: # 'artifacts.zip' will contains the following files:
>     - pc-bios/edk2*bz2


Hi Phil,

This looks good, but have you triggered a pipeline with these changes?
It'd be helpful for an extra level of assurance for the intended results.

Thanks!

--=20
Cleber Rosa
[ Sr Software Engineer - Virtualization Team - Red Hat ]
[ Avocado Test Framework - avocado-framework.github.io ]
[  7ABB 96EB 8B46 B94D 5E0F  E9BB 657E 8D33 A5F2 09F3  ]


