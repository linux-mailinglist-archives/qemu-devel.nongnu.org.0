Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A48315A024A
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 21:50:36 +0200 (CEST)
Received: from localhost ([::1]:37998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQwOZ-0006wf-MM
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 15:50:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1oQwL1-0003rP-6R
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 15:46:57 -0400
Received: from fencepost.gnu.org ([2001:470:142:3::e]:34422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1oQwL0-0008Vb-Cx; Wed, 24 Aug 2022 15:46:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gnu.org;
 s=fencepost-gnu-org; h=In-Reply-To:MIME-Version:References:Subject:To:From:
 Date; bh=lNpcW4bFVk44Dk6Dz2zAvGhsxdMYKIGfCSG4Ruivb1Q=; b=Wno17wOc84fceIKsIKe9
 rag2rk89P5ExcQoWqj4wL97mjL5r9ZIvqMjo5UYkLReuLmJNM7xckBbEQTaDtROC170V7Guf8NwuX
 8ORWQ0O3BanG2wA0p0/RLqiSvHXQ1vvtnpPS6DQwKWiRWvoeK1lnihN/8hW34cofBTwVfoWnwLvD9
 Yj/A78Qmuc7Ww7aYuBsonzjEcAFL3SDmQvWrB0fR0rMLqt+EoNucwUCNKx3fL+XFqN4UPwatYiYiI
 MS2sq3EM+aR9eFsuKZsvfQzHW/JH140H7RLVIvCJl79RA1C6t8YWHA3LVyoVrg/DOb5/3ddt34rKz
 aimDhUs5/KIBBA==;
Received: from [2a01:cb19:956:1b00:de41:a9ff:fe47:ec49] (port=48788 helo=begin)
 by fencepost.gnu.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1oQwKy-0000ef-Eu; Wed, 24 Aug 2022 15:46:53 -0400
Received: from samy by begin with local (Exim 4.96)
 (envelope-from <samuel.thibault@gnu.org>) id 1oQwKw-009Fn4-0X;
 Wed, 24 Aug 2022 21:46:50 +0200
Date: Wed, 24 Aug 2022 21:46:50 +0200
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH v2 for-7.2 0/6] Drop libslirp submodule
Message-ID: <20220824194650.ygpenow5za5fszbk@begin>
References: <20220824151122.704946-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220824151122.704946-1-thuth@redhat.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thomas Huth, le mer. 24 août 2022 17:11:16 +0200, a ecrit:
> At the point in time we're going to release QEMU 7.2, all supported
> host OS distributions will have a libslirp package available, so
> there is no need anymore for us to ship the slirp submodule. Thus
> let's clean up the related tests and finally remove the submodule now.

Acked-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Thanks!

> v2:
> - Added patches to clean up and adapt the tests
> - Rebased the removal patch to the latest version of the master branch
> 
> Thomas Huth (6):
>   tests/docker: Update the debian-all-test-cross container to Debian 11
>   tests/vm: Add libslirp to the VM tests
>   tests/lcitool/libvirt-ci: Update the lcitool module to the latest
>     version
>   tests: Refresh dockerfiles and FreeBSD vars with lcitool
>   tests/avocado: Do not run tests that require libslirp if it is not
>     available
>   Remove the slirp submodule (i.e. compile only with an external
>     libslirp)
> 
>  configure                                     |  24 ----
>  meson.build                                   | 121 ++++--------------
>  .gitlab-ci.d/buildtest.yml                    |  20 ++-
>  .gitlab-ci.d/cirrus/freebsd-12.vars           |   2 +-
>  .gitlab-ci.d/cirrus/freebsd-13.vars           |   2 +-
>  .gitlab-ci.d/container-cross.yml              |   1 -
>  .gitmodules                                   |   3 -
>  MAINTAINERS                                   |   1 -
>  meson_options.txt                             |   5 +-
>  scripts/archive-source.sh                     |   2 +-
>  scripts/meson-buildoptions.sh                 |   4 +-
>  slirp                                         |   1 -
>  tests/avocado/avocado_qemu/__init__.py        |   7 +
>  tests/avocado/info_usernet.py                 |   1 +
>  tests/avocado/replay_linux.py                 |   1 +
>  tests/docker/Makefile.include                 |   1 -
>  .../dockerfiles/debian-all-test-cross.docker  |   9 +-
>  tests/docker/dockerfiles/opensuse-leap.docker |   2 +-
>  tests/docker/dockerfiles/ubuntu2004.docker    |   2 +-
>  tests/lcitool/libvirt-ci                      |   2 +-
>  tests/vm/freebsd                              |   3 +
>  tests/vm/haiku.x86_64                         |   3 +-
>  tests/vm/netbsd                               |   3 +
>  23 files changed, 64 insertions(+), 156 deletions(-)
>  delete mode 160000 slirp
> 
> -- 
> 2.31.1
> 

-- 
Samuel
---
Pour une évaluation indépendante, transparente et rigoureuse !
Je soutiens la Commission d'Évaluation de l'Inria.

