Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 118C731EA82
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 14:41:49 +0100 (CET)
Received: from localhost ([::1]:38812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCjYv-0007mt-0E
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 08:41:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lCjVu-0006xL-Mf
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 08:38:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lCjVs-0000V6-5N
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 08:38:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613655514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GV8m8OfuolKrRbDd5qaxFzwO1pTy1UI3YB6YIZZMFZ8=;
 b=h+tfD1AOpjVqlLkd7WHqkpE1QJBfVrUkc7u2IiHUjmBcqa5j+N0ujJ1Y4hKwHiWLhXbTDb
 MCGTdq4WoExwud8T718L2RdcB3W7n2HGv+X6hX0Rz+f2KA91Tctbg34kyG6apClOl0ZS/K
 4aI1K5jqIPvoIgqj4ULKqwBYwRpgEPs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-KD27dX1MOPOSEV76oJq5NQ-1; Thu, 18 Feb 2021 08:38:32 -0500
X-MC-Unique: KD27dX1MOPOSEV76oJq5NQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2757D1936B61;
 Thu, 18 Feb 2021 13:38:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C14D5D9C2;
 Thu, 18 Feb 2021 13:38:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 61E1118000B7; Thu, 18 Feb 2021 14:38:20 +0100 (CET)
Date: Thu, 18 Feb 2021 14:38:20 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH 1/1] hw/s390x: modularize virtio-gpu-ccw
Message-ID: <20210218133820.cflf455nj44mxzja@sirius.home.kraxel.org>
References: <20210218022227.979741-1-pasic@linux.ibm.com>
 <6c0f5acf-9ebb-ba04-1389-c6690796a6ad@redhat.com>
 <20210218113438.3fe80078.pasic@linux.ibm.com>
 <20210218135618.06532573.cohuck@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210218135618.06532573.cohuck@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Boris Fiuczynski <fiuczy@linux.ibm.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Bruce Rogers <brogers@suse.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > The explanation is simple. Unlike most devices, the ccw devices aren't
> > portable. In particular both css.c and css.h includes "cpu.h", and
> > virtio-ccw-gpu.c includes "qemu/osdep.h". Furthermore osdep.h contains:
> > #ifdef NEED_CPU_H
> > #include CONFIG_TARGET
> > #else
> > #include "exec/poison.h"
> > #endif
> > so if we don't have NEED_CPU_H, among others CONFIG_KVM is poisoned, and
> > CONFIG_KVM is used in "css.h". Frankly, I can't tell under what circumstances
> > does css need "cpu.h". 
> 
> s390_crw_mchk() and s390_io_interrupt() are in cpu.h. Nowadays, they
> use the flic to inject interrupts; but their earlier implementations
> had a dummy cpu state.
> 
> I'm wondering whether s390_flic.h is a better place for functions
> injecting floating interrupts, now that we don't have the non-flic
> support anymore.

Sounds like the easiest way forward.  Alternatively add support for
target-specific modules (which we don't really have right now).

(modular-izing virtio-gpu-ccw makes sense indeed, virtio-gpu-pci is a
module for pretty much the same reasons).

take care,
  Gerd


