Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0C610FC3D
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Dec 2019 12:12:12 +0100 (CET)
Received: from localhost ([::1]:51730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ic66F-0002Mf-IU
	for lists+qemu-devel@lfdr.de; Tue, 03 Dec 2019 06:12:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40549)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1ic5sL-0004M0-0O
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 05:57:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1ic5sG-0004zC-VM
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 05:57:46 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:44199
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1ic5sG-0004q6-Oj
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 05:57:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575370662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tmE6T+90ulAzLVV6uJG128gLj4NrWI8Np4kYPYZNYMA=;
 b=hxByg4bKhuPhdWuVaLUZDaPQ8oZXliYYlbGYKeB8s/uQjgFHDlEPosmUtKV1MJ5IHHYce4
 B+T0AzSJPagtHPmYT5jCTcvtD3qL9tjek9re9MPTagJOR+AxsqC1KQXbrlGuzuUtDw3XU9
 WKs67F1HVx7QTsUMMKi19QdKUtlBQEk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-3WbV_gq6OYiqkqvsa42EWw-1; Tue, 03 Dec 2019 05:57:41 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CBB9801E76;
 Tue,  3 Dec 2019 10:57:39 +0000 (UTC)
Received: from gondolin (ovpn-116-214.ams2.redhat.com [10.36.116.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6FAE8600C8;
 Tue,  3 Dec 2019 10:57:34 +0000 (UTC)
Date: Tue, 3 Dec 2019 11:57:31 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Subject: Re: [PATCH v5 02/13] hw/core/qdev: add trace events to help with
 resettable transition
Message-ID: <20191203115731.5c5f55f1.cohuck@redhat.com>
In-Reply-To: <20191018150630.31099-3-damien.hedde@greensocs.com>
References: <20191018150630.31099-1-damien.hedde@greensocs.com>
 <20191018150630.31099-3-damien.hedde@greensocs.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 3WbV_gq6OYiqkqvsa42EWw-1
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
Cc: peter.maydell@linaro.org, berrange@redhat.com, ehabkost@redhat.com,
 qemu-s390x@nongnu.org, mark.burton@greensocs.com, qemu-devel@nongnu.org,
 edgari@xilinx.com, qemu-arm@nongnu.org, pbonzini@redhat.com, philmd@redhat.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Oct 2019 17:06:19 +0200
Damien Hedde <damien.hedde@greensocs.com> wrote:

> Adds trace events to reset procedure and when updating the parent
> bus of a device.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>  hw/core/qdev.c       | 27 ++++++++++++++++++++++++---
>  hw/core/trace-events |  9 +++++++++
>  2 files changed, 33 insertions(+), 3 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


