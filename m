Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6914F231B52
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jul 2020 10:36:53 +0200 (CEST)
Received: from localhost ([::1]:44016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0ha0-0003ta-Gm
	for lists+qemu-devel@lfdr.de; Wed, 29 Jul 2020 04:36:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1k0hXx-00028i-5Z
 for qemu-devel@nongnu.org; Wed, 29 Jul 2020 04:34:45 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:31269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1k0hXv-0002GY-F4
 for qemu-devel@nongnu.org; Wed, 29 Jul 2020 04:34:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596011681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SW53tCPkcb48MlrSl8GF6qoAvxmvNHI42pc2WxZSu7g=;
 b=G3IuZx57gghE4T1NnqCR9tpnCcP/QpKpI+B/NLEw5mwDQxrOF6yq9SMZun+y1apHHBqjlF
 DgyI9FK7bQtBHhQfR2V7Uh85uZIblSIbzwoKbPLxcxYUAgY5zC/WW1RLCDmItG+ZepEFLQ
 T/HM3gcLXyMDckRohvFisiu4ZAr77FM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-WQuS8tlXN_6wgbv1GjhWtg-1; Wed, 29 Jul 2020 04:34:40 -0400
X-MC-Unique: WQuS8tlXN_6wgbv1GjhWtg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B32D59;
 Wed, 29 Jul 2020 08:34:38 +0000 (UTC)
Received: from gondolin (ovpn-113-17.ams2.redhat.com [10.36.113.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB5245DA6A;
 Wed, 29 Jul 2020 08:34:36 +0000 (UTC)
Date: Wed, 29 Jul 2020 10:34:34 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH for-5.2 1/6] pc-bios/s390-ccw/Makefile: Compile with
 -std=gnu99, -fwrapv and -fno-common
Message-ID: <20200729103434.7fc4eb6a.cohuck@redhat.com>
In-Reply-To: <20200728183734.7838-2-thuth@redhat.com>
References: <20200728183734.7838-1-thuth@redhat.com>
 <20200728183734.7838-2-thuth@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.74; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/29 01:09:48
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>,
 Collin Walling <walling@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>,
 qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x@nongnu.org, Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 28 Jul 2020 20:37:29 +0200
Thomas Huth <thuth@redhat.com> wrote:

> The main QEMU code is compiled with -std=gnu99, -fwrapv and -fno-common.
> We should use the same flags for the s390-ccw bios, too, to avoid that
> we get different behavior with different compiler versions that changed
> their default settings in the course of time (it happened at least with
> -std=... and -fno-common in the past already).
> 
> While we're at it, also group the other flags here in a little bit nicer
> fashion: Move the two "-m" flags out of the "-f" area and specify them on
> a separate line.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  pc-bios/s390-ccw/Makefile | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Commonality is good :)

Acked-by: Cornelia Huck <cohuck@redhat.com>


