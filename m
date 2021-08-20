Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 536373F2A05
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 12:19:30 +0200 (CEST)
Received: from localhost ([::1]:46498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH1cX-0002eP-FE
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 06:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mH1bV-0001yo-JO
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 06:18:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mH1bO-0003Tt-FB
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 06:18:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629454697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kvDtnkpexav30VZbscEkdbZRsWagIBj1QCgg+PSIZyw=;
 b=hMUh4gEWzqyMP+PnU+tqmVSuHccPFIx2sG0No3n97LBHfX5gwk0I+btIAxYoUSX9dKhViP
 bFGDbsEeCDKM6YOz7mK0MDDnrLZ7q0JxyE39NFWtVITvHQdlQ2aGfA+IeYRV/uWbxXb4M0
 wNOw0h4zI5SCBby0cUBwsuntYPQUCBs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-VN31zO3WO6aRy3VwKazW5w-1; Fri, 20 Aug 2021 06:18:14 -0400
X-MC-Unique: VN31zO3WO6aRy3VwKazW5w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D87F918C89C4;
 Fri, 20 Aug 2021 10:18:12 +0000 (UTC)
Received: from localhost (unknown [10.39.193.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 753605D9FC;
 Fri, 20 Aug 2021 10:18:07 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>, qemu-devel@nongnu.org,
 libvir-list@redhat.com
Subject: Re: [PATCH 2/2] docs/about: Unify the subject format
In-Reply-To: <20210820015628.173532-3-wangyanan55@huawei.com>
Organization: Red Hat GmbH
References: <20210820015628.173532-1-wangyanan55@huawei.com>
 <20210820015628.173532-3-wangyanan55@huawei.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Fri, 20 Aug 2021 12:18:06 +0200
Message-ID: <87zgtcqv1d.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Andrew Jones <drjones@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 20 2021, Yanan Wang <wangyanan55@huawei.com> wrote:

> Unify the subject format in deprecated.rst to "since X.Y".
> Unify the subject format in removed-features.rst to "removed in X.Y".

It seems unlikely that we will ever deprecate something in a stable
release, and even more unlikely that we'll remove something in one, so
the short versions look like the thing we want to standardize on.

>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  docs/about/deprecated.rst       | 56 ++++++++++++++++-----------------
>  docs/about/removed-features.rst | 28 ++++++++---------
>  2 files changed, 42 insertions(+), 42 deletions(-)

Unrelated to your patch, line 143 in removed-features.rst reads

``-vnc ...,tls=...``, ``-vnc ...,x509=...`` & ``-vnc ...,x509verify=...``

and is missing the release it was removed in (presumably 3.1?)

Anyway,

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


