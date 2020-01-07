Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5769132996
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 16:06:22 +0100 (CET)
Received: from localhost ([::1]:50914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioqR3-0007y9-FK
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 10:06:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37880)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iopp7-0006KF-7A
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 09:27:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iopp6-0005ET-3k
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 09:27:09 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54795
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iopp6-0005ED-0c
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 09:27:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578407227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=bo30kPqYfk15g/C1wsxC1OHTH1xSVr2i9hTl+UFxNEE=;
 b=VeSCeLB3vms9qalnz7ZlZAXVnQnjEIeHzuPoLXz3ubVSZoNXnBejfc5yjAI25wtZMaf+Ya
 kKYaXxK1QxsKoSY/avT1baYRtlnrZVkT/haG5D+kEmQMmnWRLW5wPeYXB9L6RaPRE/+y2b
 496YEuJlmTlziqq4RsuLJMmA0yJHr8c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-eRSIA8JSO8eWTH39Thm2sA-1; Tue, 07 Jan 2020 09:27:04 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 323A2801E6C;
 Tue,  7 Jan 2020 14:27:03 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-116.ams2.redhat.com [10.36.116.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 432DA1000322;
 Tue,  7 Jan 2020 14:26:56 +0000 (UTC)
Subject: Re: [PATCH v2 8/8] pc: stubify x86 iommu
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1576171754-45138-1-git-send-email-pbonzini@redhat.com>
 <1576171754-45138-9-git-send-email-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <fae3437d-36c9-73bf-05a5-294cbffb9fad@redhat.com>
Date: Tue, 7 Jan 2020 15:26:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1576171754-45138-9-git-send-email-pbonzini@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: eRSIA8JSO8eWTH39Thm2sA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, philmd@redhat.com,
 slp@redhat.com, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/12/2019 18.29, Paolo Bonzini wrote:
> Allow building microvm without x86-iommu.c and in turn hw/i386/pc.h.
>=20
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/i386/Kconfig          |  6 ++++++
>  hw/i386/Makefile.objs    |  3 ++-
>  hw/i386/x86-iommu-stub.c | 34 ++++++++++++++++++++++++++++++++++
>  3 files changed, 42 insertions(+), 1 deletions(-)
>  create mode 100644 hw/i386/x86-iommu-stub.c

I just ran into this strange Travis build issue:

 https://travis-ci.com/huth/qemu/jobs/273007378#L3509

... I think it might be related to this patch?

CONFIG_Q35 only does "imply AMD_IOMMU", so when compiling with
"--without-default-devices", x86-iommu.c is not used... Do
x86_iommu_ir_supported() and x86_iommu_get_type() need to be added to
the x86-iommu-stub.c file?

 Thomas


