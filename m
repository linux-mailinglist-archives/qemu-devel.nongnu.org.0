Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7BC5F104C
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 18:53:38 +0200 (CEST)
Received: from localhost ([::1]:34968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeJGZ-0007yT-WB
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 12:53:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oeJEX-0005ET-I2
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 12:51:30 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:39477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oeJEV-0006Ty-GF
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 12:51:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=6gLtfxVVkSS+fmuuuBClzkfwpv46NPzPSm7mVFSnWhY=; b=DNkNqTpTJg/6KusAd9QsqRi7R2
 agUqhBG2X1Q4bQSqoMZbFX0jPN6l5ycinhnbhcRaloRgqlV+MpYsOtqaXxExH8iK43WTedjN3AZnN
 mplRwDhk8Wd7EPJoFDSoXc5PLoQhzT8wt5CysxqMlCMFj90wvF3l1Y/U6lmbR2dPKEng6X3AOfMg+
 r3UJztQmo+T79sMq4c9Q8Dc2+E/RxjPzefwOjFOoMnCFn+55fxO3Wqu5/zxhXnAgfxE4NSCWuGK7D
 4BeuYjciCSK9e6UkDjlDxolzvOCq4qU73XdxQ8pDHtzP7NC0p3wrZQQiU7I7fMfeXvgNEPQlUfuKw
 PSz6mrE6F0CSk4j2+mNWF7NHRqnZgHSqnfs2ubFyZmKfdiegtkGzKyiGC8kz4A+ho+BrAe9duXESB
 hRnruFtvhZSBw9Gm+cXNHVtSESzsL202j9aTBwQ10YU1VkrFEmcelTRah4qczxybG6blefK17Nzxq
 u+vxFwk/LYAYNCPyyRlsCDmFHbgb8P3iQzSUkuXPJgFgMm5rqzjqXnhVd/xhIzxYFhFwxBEkMGbDG
 74k2I8yBnZuuliSBGMs2SwgF28TVolFNO1+e8FKg9A9f7OI/QG3xBzHnRIdWaJxvxPp6q9L/ju/la
 QZ2K4e3iUxrtAI7Ht4CWihadKe8c0xMdN3BC/jfuo=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org,
 Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>,
 "Daniel P . Berrange" <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 for-7.2 0/6] Drop libslirp submodule
Date: Fri, 30 Sep 2022 18:50:20 +0200
Message-ID: <30266128.I4sqonfujN@silver>
In-Reply-To: <20220824151122.704946-1-thuth@redhat.com>
References: <20220824151122.704946-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mittwoch, 24. August 2022 17:11:16 CEST Thomas Huth wrote:
> At the point in time we're going to release QEMU 7.2, all supported
> host OS distributions will have a libslirp package available, so
> there is no need anymore for us to ship the slirp submodule. Thus
> let's clean up the related tests and finally remove the submodule now.
> 
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

And I was wondering (bisecting) why network silently stopped working here.

While I understand the motivation for this change, it's probably not a user 
friendly situation to just silently decease functionality. As slirp was the 
default networking (i.e. not just some exotic QEMU feature), wouldn't it make 
sense then to make missing libslirp a build-time error by default?

Best regards,
Christian Schoenebeck



