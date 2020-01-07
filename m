Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C965C13242E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 11:54:36 +0100 (CET)
Received: from localhost ([::1]:46370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iomVO-0006zr-Gg
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 05:54:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44734)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <abologna@redhat.com>) id 1iolKq-0005yx-3C
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 04:39:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <abologna@redhat.com>) id 1iolKo-0001P8-T3
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 04:39:35 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:20587
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <abologna@redhat.com>) id 1iolKo-0001Oc-Pq
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 04:39:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578389973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B//8vRo20C+8Gt42JSm+8TpAVhpMlc2XMCKMjASdfB4=;
 b=P+UadafOhUC0pD7nBw+tKO3AWSyeoE7WsRSBgvOQ1CP7yzZI59WnVpvcT4uBn7cG51RLE+
 jBkff3ItcforADKkH1Bjrdhw6yqix52Eogb5gnugr3CyzrylSfzFP7NLcsJ3RApguu3fn8
 b9X/znq4QURCQGPgucH9TJ32nz7GrL0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-CTRV_67dOTSQ2Lh4OzHObQ-1; Tue, 07 Jan 2020 04:39:30 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57CD4DB6B;
 Tue,  7 Jan 2020 09:39:27 +0000 (UTC)
Received: from kinshicho.usersys.redhat.com (unknown [10.43.2.246])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F0C9C1000325;
 Tue,  7 Jan 2020 09:39:23 +0000 (UTC)
Message-ID: <e3299f0688127627de96eb2db1f127bf94df9085.camel@redhat.com>
Subject: Re: [RFC PATCH qemu] spapr: Kill SLOF
From: Andrea Bolognani <abologna@redhat.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Daniel Henrique Barboza
 <danielhb413@gmail.com>, qemu-devel@nongnu.org
Date: Tue, 07 Jan 2020 10:39:21 +0100
In-Reply-To: <81f1f752-3ada-2c8d-38b7-1344c7633e14@ozlabs.ru>
References: <20200103074404.30853-1-aik@ozlabs.ru>
 <3cf3e733-199a-61ba-7aaa-05e9546cd4d9@ozlabs.ru>
 <dd98618f-01c6-850f-ac00-454a2f798508@gmail.com>
 <81f1f752-3ada-2c8d-38b7-1344c7633e14@ozlabs.ru>
User-Agent: Evolution 3.34.2 (3.34.2-1.fc31)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: CTRV_67dOTSQ2Lh4OzHObQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Jose Ricardo Ziviani <joserz@linux.ibm.com>,
 Fabiano Rosas <farosas@linux.ibm.com>, Sam Bobroff <sbobroff@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, qemu-ppc@nongnu.org,
 Leonardo Augusto =?ISO-8859-1?Q?Guimar=E3es?= Garcia <lagarcia@br.ibm.com>,
 Leonardo Bras <leonardo@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2020-01-07 at 12:55 +1100, Alexey Kardashevskiy wrote:
> On 07/01/2020 01:15, Daniel Henrique Barboza wrote:
> > Question: does Petitboot already replaces SLOF in every possible
> > scenario for all
> > the spapr machine features?
> 
> Petitboot kernel+initramdisk almost replaces SLOF + GRUB.

Is this necessarily a good thing? Personally I quite like the fact
that I can use the same bootloader across x86, ppc64 and aarch64.

-- 
Andrea Bolognani / Red Hat / Virtualization


