Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A13BBAA2BA
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Sep 2019 14:09:17 +0200 (CEST)
Received: from localhost ([::1]:45364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5qZg-0000vf-Kj
	for lists+qemu-devel@lfdr.de; Thu, 05 Sep 2019 08:09:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59871)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1i5qXj-00085m-Nc
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 08:07:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1i5qXi-0002X7-Gd
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 08:07:15 -0400
Received: from 7.mo3.mail-out.ovh.net ([46.105.57.200]:35462)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1i5qXi-0002Qz-9N
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 08:07:14 -0400
Received: from player798.ha.ovh.net (unknown [10.108.42.167])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 11FE62263C7
 for <qemu-devel@nongnu.org>; Thu,  5 Sep 2019 14:07:10 +0200 (CEST)
Received: from kaod.org (deibp9eh1--blueice1n4.emea.ibm.com [195.212.29.166])
 (Authenticated sender: groug@kaod.org)
 by player798.ha.ovh.net (Postfix) with ESMTPSA id 2DC34990179A;
 Thu,  5 Sep 2019 12:07:04 +0000 (UTC)
Date: Thu, 5 Sep 2019 14:07:01 +0200
From: Greg Kurz <groug@kaod.org>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20190905140701.6cc679ee@bahia.lan>
In-Reply-To: <20190905113346.2473-1-thuth@redhat.com>
References: <20190905113346.2473-1-thuth@redhat.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 18045079284129110322
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrudejjedggeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.57.200
Subject: Re: [Qemu-devel] [PATCH] travis.yml: Install libcap-dev for testing
 virito-9p
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
Cc: Fam Zheng <fam@euphon.net>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu,  5 Sep 2019 13:33:46 +0200
Thomas Huth <thuth@redhat.com> wrote:

> So far we were not testing virtio-9p in Travis yet, since we forgot to
> install libcap-devel. Do it now to get some more test coverage.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---

Acked-by: Greg Kurz <groug@kaod.org>

and

Tested-by: Greg Kurz <groug@kaod.org>

Whose tree is this going through BTW ?

>  .travis.yml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/.travis.yml b/.travis.yml
> index 92b00927d4..1d46442020 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -15,6 +15,7 @@ addons:
>        - libaio-dev
>        - libattr1-dev
>        - libbrlapi-dev
> +      - libcap-dev
>        - libcap-ng-dev
>        - libgcc-4.8-dev
>        - libgnutls-dev


