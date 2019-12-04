Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F28C112BA4
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Dec 2019 13:41:54 +0100 (CET)
Received: from localhost ([::1]:38152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icTyb-0004Nm-Dg
	for lists+qemu-devel@lfdr.de; Wed, 04 Dec 2019 07:41:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50718)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1icTa9-0007rT-ED
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 07:16:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1icTa7-0007df-Ck
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 07:16:36 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:30723
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1icTa7-0007CM-9a
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 07:16:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575461791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=1Up6nyC+VBIZvFYpmAH0EjJNPaHcivy4vdGB1uE2q3U=;
 b=YzXqdHvzPAMmMIf3zT+BdoLTqKwvrE5jQo8X/9ikpcewSdSyZ538lWlJRaicysYeDUlHmu
 nLJUto03QuKopF2nf4OEJUFITTW0nfXonFVUlVQj2a++EC7umRtNAM1wuT/J5AaGC3SMUk
 AsQE8oQxnwbxDVzyNPWviQLt5pYWQdE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-Z_f2uQUZONaWN_UKt0HbqQ-1; Wed, 04 Dec 2019 07:16:28 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C20B8800EB8;
 Wed,  4 Dec 2019 12:16:26 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-117-39.ams2.redhat.com [10.36.117.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 725075D6AE;
 Wed,  4 Dec 2019 12:16:22 +0000 (UTC)
Subject: Re: [PATCH v2 12/13] s390x: protvirt: Disable address checks for PV
 guest IO emulation
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
References: <20191129094809.26684-1-frankja@linux.ibm.com>
 <20191129094809.26684-13-frankja@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <e40bff7c-6325-f434-1cbd-cd59b5bccaa9@redhat.com>
Date: Wed, 4 Dec 2019 13:16:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191129094809.26684-13-frankja@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: Z_f2uQUZONaWN_UKt0HbqQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: pmorel@linux.ibm.com, david@redhat.com, cohuck@redhat.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, mihajlov@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/11/2019 10.48, Janosch Frank wrote:
> IO instruction data is routed through SIDAD for protected guests, so
> adresses do not need to be checked, as this is kernel memory.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>  target/s390x/ioinst.c | 26 +++++++++++++++++++-------
>  1 file changed, 19 insertions(+), 7 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


