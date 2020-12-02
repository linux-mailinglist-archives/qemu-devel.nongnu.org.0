Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C00B22CBC86
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 13:11:17 +0100 (CET)
Received: from localhost ([::1]:50586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkQyZ-0005DL-Fv
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 07:11:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kkQvG-0004Fv-1X
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 07:07:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kkQvB-0000Nw-Fy
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 07:07:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606910863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tJFyZyFqbceqWyTHtQ9963ygMqQGG5Dsv3vyikybHIA=;
 b=bwu1qYn0EXvhQUjbfNKrtuhgLiGCeHOaktZCbQktbTVzm4KPTfwvHYVoaTo0T76d7dmUOY
 lHZ/BOiG5yvFSf1Av92i3VLnn5H/dZfUJv34KerT2X5qvZCBm/m45wDZck3j6o1vk54YFA
 9ejrmY0KSGK3Dfa3IcJRYXL6N4ojDyQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-DKBBMcmUMkiddyUjoyZ-yw-1; Wed, 02 Dec 2020 07:07:42 -0500
X-MC-Unique: DKBBMcmUMkiddyUjoyZ-yw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA9878558E7;
 Wed,  2 Dec 2020 12:07:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A32925D9CA;
 Wed,  2 Dec 2020 12:07:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E05A417532; Wed,  2 Dec 2020 13:07:39 +0100 (CET)
Date: Wed, 2 Dec 2020 13:07:39 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 18/23] tests/docker: auto-generate centos7 with lcitool
Message-ID: <20201202120739.iwej4lbv7srkz4uf@sirius.home.kraxel.org>
References: <20201201171825.2243775-1-berrange@redhat.com>
 <20201201171825.2243775-19-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201201171825.2243775-19-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

  Hi,

> +RUN echo 'skip_missing_names_on_install=0' >> /etc/yum.conf && \
> +    yum install -y epel-release && \
> +    yum install -y centos-release-xen-48 && \
> +    yum update -y && \
> +    yum install -y \
> +        SDL2-devel \

More a comment for lcitool I guess:  rpmbuild generates provides entries
for pkg-config files, so 'SDL2-devel' can be replaced with
'pkgconfig(sdl2)'.  Which should work fine on any rpm-based distro, no
matter how the package is actually named.

Dunno whenever apt/deb has something simliar or whenever that actually
can simplify things for lcitool ...

take care,
  Gerd


