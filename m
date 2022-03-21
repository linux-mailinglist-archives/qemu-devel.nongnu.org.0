Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCED4E2E3D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 17:40:31 +0100 (CET)
Received: from localhost ([::1]:46318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWL54-0005oJ-H0
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 12:40:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nWL3j-0004zu-Sn
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 12:39:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nWL3h-0006vV-Vj
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 12:39:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647880744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2d0AsfQ7TFAPXcyhpJ33LO9+1k2Vt/Gc9xoQzk/U5Wk=;
 b=eyo1CnPa32rTJ9/5bnhZPNs0njFC3cjAacA6omroezNUkn467nG+Sl7yntSV7bR2KzME8I
 d4iTZhb1/wC7bYB4eHPToFb1VwsJ/12N4zIsOoZjS53iZrLOJUHGEqm+GFHVP4/KBcoX7P
 R0xLfkpZsUES/6dLYAHLrEeFGDKZ2fY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-kidXTSHEPe61z3H4UXb5mg-1; Mon, 21 Mar 2022 12:39:01 -0400
X-MC-Unique: kidXTSHEPe61z3H4UXb5mg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13C23185A79C;
 Mon, 21 Mar 2022 16:39:01 +0000 (UTC)
Received: from localhost (unknown [10.39.195.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9069A2026D07;
 Mon, 21 Mar 2022 16:38:55 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2] gitlab: disable accelerated zlib for s390x
In-Reply-To: <20220321161151.3654386-1-alex.bennee@linaro.org>
Organization: Red Hat GmbH
References: <20220321161151.3654386-1-alex.bennee@linaro.org>
User-Agent: Notmuch/0.34 (https://notmuchmail.org)
Date: Mon, 21 Mar 2022 17:38:54 +0100
Message-ID: <87mthjqmzl.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, "open list:S390
 general arch..." <qemu-s390x@nongnu.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 21 2022, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:

> There appears to be a bug in the s390 hardware-accelerated version of
> zlib distributed with Ubuntu 20.04, which makes our test
> /i386/migration/multifd/tcp/zlib hit an assertion perhaps one time in
> 10. Fortunately zlib provides an escape hatch where we can disable the
> hardware-acceleration entirely by setting the environment variable
> DFLTCC to 0. Do this on all our CI which runs on s390 hosts, both our
> custom gitlab runner and also the Travis hosts.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Peter Maydell <peter.maydell@linaro.org>
>
> ---
> v2
>   - more complete commit wording from Peter
>   - also tweak travis rules
> ---
>  .gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml | 12 ++++++++++++
>  .travis.yml                                        |  6 ++++--
>  2 files changed, 16 insertions(+), 2 deletions(-)

Acked-by: Cornelia Huck <cohuck@redhat.com>


