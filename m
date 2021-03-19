Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D2F342028
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 15:51:46 +0100 (CET)
Received: from localhost ([::1]:39210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNGTZ-0001gu-E2
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 10:51:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lNGJw-0007PM-KF
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 10:41:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lNGJu-0005v0-3o
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 10:41:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616164905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fk30H839TsrFSdQ4z4m/Ty6jOpZtNL5bxBM6Jpq3Obc=;
 b=U+YfhsntXCz/fYO+mCWRWvf4ZgZs3zdGIBQv1XGY0itMvGatmZz77rhLZzHg+w1uUf4rS2
 w1hHIrTJdCZBJJMLE2+WiuhHctv6wsY5E7DHmN2kEypYvLpKEhPCzoXgerWzt68dck0PGW
 HxZEo+b7rHHBqj5WiooEQc3aZNIXJk8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-uv4oupgkMJOLwq1YhW3obA-1; Fri, 19 Mar 2021 10:41:42 -0400
X-MC-Unique: uv4oupgkMJOLwq1YhW3obA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 675C39CDAF;
 Fri, 19 Mar 2021 14:41:41 +0000 (UTC)
Received: from gondolin (ovpn-112-229.ams2.redhat.com [10.36.112.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D8B7463B8C;
 Fri, 19 Mar 2021 14:41:38 +0000 (UTC)
Date: Fri, 19 Mar 2021 15:41:36 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v2 2/6] m68k: add the virtio devices aliases
Message-ID: <20210319154136.391224ff.cohuck@redhat.com>
In-Reply-To: <20210319132537.2046339-3-laurent@vivier.eu>
References: <20210319132537.2046339-1-laurent@vivier.eu>
 <20210319132537.2046339-3-laurent@vivier.eu>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 19 Mar 2021 14:25:33 +0100
Laurent Vivier <laurent@vivier.eu> wrote:

> Similarly to 5f629d943cb0 ("s390x: fix s390 virtio aliases"),
> define the virtio aliases.
> 
> This allows to start machines with virtio devices without
> knowledge of the implementation type.
> 
> For instance, we can use "-device virtio-scsi" on
> m68k, s390x or PC, and the device will be respectively
> "virtio-scsi-device", "virtio-scsi-ccw" or "virtio-scsi-pci".
> 
> This already exists for s390x and -ccw interfaces, add them
> for m68k and MMIO (-device) interfaces.
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  include/sysemu/arch_init.h |  1 +
>  softmmu/qdev-monitor.c     | 12 ++++++++++++
>  2 files changed, 13 insertions(+)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


