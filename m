Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E68A638B443
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 18:32:02 +0200 (CEST)
Received: from localhost ([::1]:38392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljlac-000862-1s
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 12:32:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ljlZ4-0007J6-Hg
 for qemu-devel@nongnu.org; Thu, 20 May 2021 12:30:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ljlZ1-0005BD-9h
 for qemu-devel@nongnu.org; Thu, 20 May 2021 12:30:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621528222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p3DpBoyTE0298B001VjsJVHq5WUgTjgIr6PsMN8axEY=;
 b=Ob7+UWm4Hcpw0WZmr/ILOSnslCq3PeXgq3q+LD4L4SD5GfppB1Y2IKfYFQNATBa0mxGHII
 fYAuyXxyIq57Y6R548VyNHKL7BGubbpQEpP1/TvUgFr42t1Q3uM/fN8sekq//RE0Vb0DDT
 /RAzLvRVRswaztvCzUz1Hj2UtfDTBpU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-RfrTLJZ6PkCOl8jRAHA52Q-1; Thu, 20 May 2021 12:30:20 -0400
X-MC-Unique: RfrTLJZ6PkCOl8jRAHA52Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91CE7C73A3;
 Thu, 20 May 2021 16:30:19 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-166.ams2.redhat.com
 [10.36.113.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5364F60C04;
 Thu, 20 May 2021 16:30:11 +0000 (UTC)
Date: Thu, 20 May 2021 18:30:08 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Subject: Re: [RFC PATCH v2] gitlab: add special rule for the hexagon container
Message-ID: <20210520183008.6e8e791a.cohuck@redhat.com>
In-Reply-To: <20210520153831.11873-1-alex.bennee@linaro.org>
References: <20210520153831.11873-1-alex.bennee@linaro.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 20 May 2021 16:38:31 +0100
Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:

> The hexagon container is always manually built but of course not
> everyone will be building it themselves and pushing to their
> registries. We still need to create a "local" registry copy for the
> actual gitlab tests to run. We don't build it in this case, just pull
> it across from the upstream registry. We disable this rule from
> running on the qemu-project itself so it doesn't accidentally wipe out
> our master copy.
>=20
> Fixes: 910c40ee94 ("gitlab: add build-user-hexagon test")
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Cornelia Huck <cohuck@redhat.com>
>=20
> ---
> v2
>   - fix silly typo
> ---
>  .gitlab-ci.d/containers.yml | 27 +++++++++++++++++++++++++++
>  .gitlab-ci.yml              |  2 ++
>  2 files changed, 29 insertions(+)

Thanks, that got me over my problems when triggering the CI.

Tested-by: Cornelia Huck <cohuck@redhat.com>


