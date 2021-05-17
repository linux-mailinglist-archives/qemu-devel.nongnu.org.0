Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AD8383A11
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 18:36:22 +0200 (CEST)
Received: from localhost ([::1]:36038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ligE9-00085v-C0
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 12:36:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lifpi-0007sr-7q
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:11:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lifpd-0006BC-OS
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:11:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621267861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/74/OfsaEPcVML+T9JCTHZtRSw5smL/A8bWHININLnw=;
 b=F2RvARkWxtaXMUCpVDKCPMADsYLSshiuXvk4ukv2DdGkrqS78UUIa+p1MqOUWBqRw8MiM+
 +95eup1DVYMIdHoGKXBBc/99pg/ILQZyUE5Hz7QqLZacEBOtdo6NZUtS+naRTfNxJAV0po
 glQ1I72457zx/Bu/klJ6WHSOENJlq9o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-1ZjMg8bkMteFQw3qjjTn4A-1; Mon, 17 May 2021 12:10:59 -0400
X-MC-Unique: 1ZjMg8bkMteFQw3qjjTn4A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29BE9107ACE4;
 Mon, 17 May 2021 16:10:58 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-115-195.ams2.redhat.com
 [10.36.115.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB4C21349A;
 Mon, 17 May 2021 16:10:49 +0000 (UTC)
Date: Mon, 17 May 2021 18:10:47 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH 1/5] docs: fix references to docs/devel/tracing.rst
Message-ID: <20210517181047.6284f9b2.cohuck@redhat.com>
In-Reply-To: <20210517151702.109066-2-sgarzare@redhat.com>
References: <20210517151702.109066-1-sgarzare@redhat.com>
 <20210517151702.109066-2-sgarzare@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 17 May 2021 17:16:58 +0200
Stefano Garzarella <sgarzare@redhat.com> wrote:

> Commit e50caf4a5c ("tracing: convert documentation to rST")
> converted docs/devel/tracing.txt to docs/devel/tracing.rst.
> 
> We still have several references to the old file, so let's fix them
> with the following command:
> 
>   sed -i s/tracing.txt/tracing.rst/ $(git grep -l docs/devel/tracing.txt)
> 
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  MAINTAINERS                     | 2 +-
>  accel/kvm/trace-events          | 2 +-
>  accel/tcg/trace-events          | 2 +-
>  audio/trace-events              | 2 +-
>  authz/trace-events              | 2 +-
>  backends/tpm/trace-events       | 2 +-
>  backends/trace-events           | 2 +-
>  block/trace-events              | 2 +-
>  chardev/trace-events            | 2 +-
>  crypto/trace-events             | 2 +-
>  hw/9pfs/trace-events            | 2 +-
>  hw/acpi/trace-events            | 2 +-
>  hw/adc/trace-events             | 2 +-
>  hw/alpha/trace-events           | 2 +-
>  hw/arm/trace-events             | 2 +-
>  hw/audio/trace-events           | 2 +-
>  hw/block/dataplane/trace-events | 2 +-
>  hw/block/trace-events           | 2 +-
>  hw/char/trace-events            | 2 +-
>  hw/display/trace-events         | 2 +-
>  hw/dma/trace-events             | 2 +-
>  hw/gpio/trace-events            | 2 +-
>  hw/hppa/trace-events            | 2 +-
>  hw/i2c/trace-events             | 2 +-
>  hw/i386/trace-events            | 2 +-
>  hw/i386/xen/trace-events        | 2 +-
>  hw/ide/trace-events             | 2 +-
>  hw/input/trace-events           | 2 +-
>  hw/intc/trace-events            | 2 +-
>  hw/isa/trace-events             | 2 +-
>  hw/mem/trace-events             | 2 +-
>  hw/misc/macio/trace-events      | 2 +-
>  hw/misc/trace-events            | 2 +-
>  hw/net/trace-events             | 2 +-
>  hw/nvram/trace-events           | 2 +-
>  hw/pci-host/trace-events        | 2 +-
>  hw/pci/trace-events             | 2 +-
>  hw/ppc/trace-events             | 2 +-
>  hw/rdma/trace-events            | 2 +-
>  hw/rdma/vmw/trace-events        | 2 +-
>  hw/rtc/trace-events             | 2 +-
>  hw/s390x/trace-events           | 2 +-
>  hw/scsi/trace-events            | 2 +-
>  hw/sd/trace-events              | 2 +-
>  hw/sparc/trace-events           | 2 +-
>  hw/sparc64/trace-events         | 2 +-
>  hw/timer/trace-events           | 2 +-
>  hw/tpm/trace-events             | 2 +-
>  hw/usb/trace-events             | 2 +-
>  hw/vfio/trace-events            | 2 +-
>  hw/virtio/trace-events          | 2 +-
>  hw/watchdog/trace-events        | 2 +-
>  hw/xen/trace-events             | 2 +-
>  io/trace-events                 | 2 +-
>  linux-user/trace-events         | 2 +-
>  migration/trace-events          | 2 +-
>  monitor/trace-events            | 2 +-
>  nbd/trace-events                | 2 +-
>  net/trace-events                | 2 +-
>  qapi/trace-events               | 2 +-
>  qom/trace-events                | 2 +-
>  scripts/simpletrace.py          | 2 +-
>  scsi/trace-events               | 2 +-
>  softmmu/trace-events            | 2 +-
>  target/arm/trace-events         | 2 +-
>  target/hppa/trace-events        | 2 +-
>  target/i386/kvm/trace-events    | 2 +-
>  target/i386/trace-events        | 2 +-
>  target/mips/trace-events        | 2 +-
>  target/ppc/trace-events         | 2 +-
>  target/s390x/trace-events       | 2 +-
>  target/sparc/trace-events       | 2 +-
>  trace-events                    | 2 +-
>  ui/trace-events                 | 2 +-
>  util/trace-events               | 2 +-
>  75 files changed, 75 insertions(+), 75 deletions(-)

Acked-by: Cornelia Huck <cohuck@redhat.com> (mostly for the s390x parts)


