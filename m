Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC641211DE
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Dec 2019 18:38:16 +0100 (CET)
Received: from localhost ([::1]:57834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iguJz-0001HQ-2A
	for lists+qemu-devel@lfdr.de; Mon, 16 Dec 2019 12:38:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48806)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1igtnA-0006bo-GF
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 12:04:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1igtn9-000784-7W
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 12:04:20 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:50867
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1igtn9-00074n-2t
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 12:04:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576515858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x0LxTIX6dntFtwM1DHsZ4mgKEmQO8iqOb5pA9nzmJJ4=;
 b=I93oTzZ/LZU0B7W9HIwpeGZwUnjiAOSlZ70ZsbR5egNqkKyZUXWv8c1GFOxsduvQa0DCo4
 Ji7P+2LvuS+zivxV7Z/h1K9ZZnDKJEe1bpFdlx8MUOLD4E3sU37UVORoKdfQcoBfrkxPCt
 oDpreztogyVPnuiFg23hL0fp1aP5H4g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-wzSfNTY0ObqGdnn18DmcHQ-1; Mon, 16 Dec 2019 12:04:16 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18A96800D53;
 Mon, 16 Dec 2019 17:04:15 +0000 (UTC)
Received: from gondolin (dhcp-192-245.str.redhat.com [10.33.192.245])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BABCA60625;
 Mon, 16 Dec 2019 17:04:11 +0000 (UTC)
Date: Mon, 16 Dec 2019 18:04:09 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 0/2] target/s390x: Implement LOAD/STORE TO REAL ADDRESS
 inline
Message-ID: <20191216180409.6a753390.cohuck@redhat.com>
In-Reply-To: <20191211203614.15611-1-richard.henderson@linaro.org>
References: <20191211203614.15611-1-richard.henderson@linaro.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: wzSfNTY0ObqGdnn18DmcHQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
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
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 11 Dec 2019 12:36:12 -0800
Richard Henderson <richard.henderson@linaro.org> wrote:

> Found while working on other parts of cputlb,
> this cleanup can be split out independently.
> 
> 
> r~
> 
> 
> Richard Henderson (2):
>   target/s390x: Split out helper_per_store_real
>   target/s390x: Implement LOAD/STORE TO REAL ADDRESS inline
> 
>  target/s390x/helper.h      |  5 +----
>  target/s390x/mem_helper.c  | 38 --------------------------------------
>  target/s390x/misc_helper.c | 10 ++++++++++
>  target/s390x/translate.c   | 21 ++++++++-------------
>  target/s390x/insn-data.def |  8 ++++----
>  5 files changed, 23 insertions(+), 59 deletions(-)
> 

Should I take these via the s390 tree, or do you plan to merge them via
another path?


