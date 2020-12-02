Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A98472CBC22
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 12:58:07 +0100 (CET)
Received: from localhost ([::1]:37804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkQlq-00071x-OT
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 06:58:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kkQiG-0005Zd-Rv
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 06:54:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kkQiE-00048p-UV
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 06:54:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606910061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yOVKoQ5u9OLoPtRYEB7XsveronjrvQQT9kcarbQzZCg=;
 b=InXzl/EQbsLlo+pLFKXsUHXtcemBNgXD7doSmhnQ6ImfFodRGiReroRNnbB9/coMdT7ATy
 YNiGAbiiVYSJZQjCa/8fbNeMGn+A2rgoFykSXcnNlHaw0XhvKXNwDMfgXpSPYcmghxcscM
 F1ZH7mGRGGpVCdNs31WTTVx+TABxEoA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-OBhNRgfkNDGuy2g5Dj-BtA-1; Wed, 02 Dec 2020 06:54:16 -0500
X-MC-Unique: OBhNRgfkNDGuy2g5Dj-BtA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 238EE108442B;
 Wed,  2 Dec 2020 11:54:15 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF583189B6;
 Wed,  2 Dec 2020 11:54:14 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0BDFE17532; Wed,  2 Dec 2020 12:54:14 +0100 (CET)
Date: Wed, 2 Dec 2020 12:54:14 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 03/23] tests/docker: use project specific container
 registries
Message-ID: <20201202115414.uqergukvhsftofwc@sirius.home.kraxel.org>
References: <20201201171825.2243775-1-berrange@redhat.com>
 <20201201171825.2243775-4-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201201171825.2243775-4-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> --- a/tests/docker/dockerfiles/centos8.docker
> +++ b/tests/docker/dockerfiles/centos8.docker
> @@ -1,4 +1,4 @@
> -FROM centos:8.1.1911
> +FROM registry.centos.org/centos:8

At least for centos-8 I've noticed the docker.io containters are
multiarch whereas registry.centos.org has x86_64 only.

I think right now we don't use any !x86_64 containers due to gitlab
having only x86_64 shared runners.  So this isn't a blocker.  Wanted
to note that nevertheless ;)

take care,
  Gerd


