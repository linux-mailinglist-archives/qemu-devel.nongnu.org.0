Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0AC34EE50
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 18:48:52 +0200 (CEST)
Received: from localhost ([::1]:44294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRHXv-0002Oe-BX
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 12:48:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lRHWR-0001fj-4j
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 12:47:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lRHWO-0006bB-DC
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 12:47:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617122833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QoR2rwpEI7k3fOeYcmtX2wtN69M799v3kWSB5zw/Bso=;
 b=Xi/XcnKW4yFW3DopiVuqGlrcR1RB+zCkNvHnebJq4Km8miyM2cvnHKmXkJCmalCPsdaztW
 i7gQEUlGosDScnEicdfNmh+cnZrjz+7zAzpQbN0jxnGxgXHbYtvNVN6HBGootu8d/T68/Q
 DF2rLMD40nOSnG8nK/BprsrSWzmjUFo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-WJMnBVkjPYqpk1L4QdlFAQ-1; Tue, 30 Mar 2021 12:47:09 -0400
X-MC-Unique: WJMnBVkjPYqpk1L4QdlFAQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 995B7180FCAF;
 Tue, 30 Mar 2021 16:47:08 +0000 (UTC)
Received: from gondolin (ovpn-113-155.ams2.redhat.com [10.36.113.155])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 768CD5F705;
 Tue, 30 Mar 2021 16:47:06 +0000 (UTC)
Date: Tue, 30 Mar 2021 18:47:03 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH 10/13] blobs: Only install s390x firmwares if s390x
 system target is built
Message-ID: <20210330184703.79d16098.cohuck@redhat.com>
In-Reply-To: <20210323155132.238193-11-f4bug@amsat.org>
References: <20210323155132.238193-1-f4bug@amsat.org>
 <20210323155132.238193-11-f4bug@amsat.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Mar 2021 16:51:29 +0100
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: qemu-s390x@nongnu.org
> ---
>  meson.build         | 2 ++
>  pc-bios/meson.build | 9 +++++++--
>  2 files changed, 9 insertions(+), 2 deletions(-)

Acked-by: Cornelia Huck <cohuck@redhat.com>


