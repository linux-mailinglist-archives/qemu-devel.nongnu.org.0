Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28898341BCA
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 12:51:52 +0100 (CET)
Received: from localhost ([::1]:57982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNDfT-0003se-8c
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 07:51:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lNDXm-0006Tt-NU
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:43:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lNDXh-0003Ls-Gi
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:43:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616154228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5LmwMQjU6KGoditx1XSYgNuj+HpTm+J9/zNdPcf8xBk=;
 b=hVnULsQ4p6SNQowtTUj45mXl/2V1kLUJfrdZ4B9zL9WRVn8PbwZpbXsBhpYj9JFW7hZwsz
 BeH1Si3ho0c6Xvooha+br1WrKxIUBOlPIpyZrnofcOKGU7w6gwnnjHj2S58KxkVQo8TW7+
 xHBC0OO0v0R2MLyVQtexYD88jMK+uNo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-dbab35tVM1msKL0T1kNBuw-1; Fri, 19 Mar 2021 07:43:46 -0400
X-MC-Unique: dbab35tVM1msKL0T1kNBuw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E438189CD03;
 Fri, 19 Mar 2021 11:43:45 +0000 (UTC)
Received: from gondolin (ovpn-112-229.ams2.redhat.com [10.36.112.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8212319C79;
 Fri, 19 Mar 2021 11:43:42 +0000 (UTC)
Date: Fri, 19 Mar 2021 12:43:39 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH 2/4] iotests: Revert "iotests: use -ccw on s390x for
 040, 139, and 182"
Message-ID: <20210319124339.6acd05d8.cohuck@redhat.com>
In-Reply-To: <20210318223907.1344870-3-laurent@vivier.eu>
References: <20210318223907.1344870-1-laurent@vivier.eu>
 <20210318223907.1344870-3-laurent@vivier.eu>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGll?= =?UTF-8?B?dS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Mar 2021 23:39:05 +0100
Laurent Vivier <laurent@vivier.eu> wrote:

> Commit f1d5516ab583 introduces a test in some iotests to check if
> the machine is a s390-ssw-virtio and to select virtio-*-ccw rather

s/ssw/ccw/

> than virtio-*-pci.
> 
> We don't need that because QEMU already provides aliases to use the correct
> virtio interface according to the machine type.

Maybe add a comment that this also enables virtio-mmio?

> 
> This patch removes all virtio-*-pci and virtio-*-ccw to use virtio-*
> instead.
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> cc: Cornelia Huck <cohuck@redhat.com>
> ---
>  blockdev.c                    |  6 +-----

Hm, that also tweaks how -drive behaves, IIUC. Intended, I think; but
worth a note as well?

>  tests/qemu-iotests/040        |  2 +-
>  tests/qemu-iotests/051        | 12 +-----------
>  tests/qemu-iotests/068        |  4 +---
>  tests/qemu-iotests/093        |  3 +--
>  tests/qemu-iotests/139        |  9 ++-------
>  tests/qemu-iotests/182        | 13 ++-----------
>  tests/qemu-iotests/238        |  4 +---
>  tests/qemu-iotests/240        | 10 +++++-----
>  tests/qemu-iotests/257        |  4 ++--
>  tests/qemu-iotests/307        |  4 +---
>  tests/qemu-iotests/iotests.py |  5 -----
>  12 files changed, 18 insertions(+), 58 deletions(-)


