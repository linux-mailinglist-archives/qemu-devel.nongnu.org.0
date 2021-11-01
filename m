Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B04441DC6
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 17:12:32 +0100 (CET)
Received: from localhost ([::1]:51642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhZvD-0006zx-TP
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 12:12:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mhZth-0005Um-BM
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 12:10:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mhZtb-0002gL-2E
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 12:10:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635783049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iqRSp32kT9+Rn5scolYRJteN2uODx7kmsHiPi+N0+y8=;
 b=fIfd4NAGnAtwTh+8zXlBy4YQYYV6vCGMztCyiriqEM9XMmqmWQgTHHOSgr359vno5d3Fti
 WHKzrHt/U1KBgVSnOWdaq4u0+emNxK4DZy0WuUDQ+ir7dJEkplq+GT6f/1iMD/uya4Gb45
 6hDN9AxxNHps14fhQ/cthblPfCzArD4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-x4My6o_LNKOaIpeB32F7Mw-1; Mon, 01 Nov 2021 12:10:48 -0400
X-MC-Unique: x4My6o_LNKOaIpeB32F7Mw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48B1C18460F6;
 Mon,  1 Nov 2021 16:10:08 +0000 (UTC)
Received: from [10.39.192.86] (unknown [10.39.192.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A8CD46418A;
 Mon,  1 Nov 2021 16:10:06 +0000 (UTC)
Message-ID: <d9cb104f-741c-e85d-5e29-c2b37d641a25@redhat.com>
Date: Mon, 1 Nov 2021 17:10:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 13/66] linux-user/host/s390: Populate host_signal.h
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
 <20211030171635.1689530-14-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211030171635.1689530-14-richard.henderson@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.14, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/10/2021 19.15, Richard Henderson wrote:
> Split host_signal_pc and host_signal_write out of user-exec.c.
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/host/s390/host-signal.h  | 93 ++++++++++++++++++++++++++++-
>   linux-user/host/s390x/host-signal.h |  2 +-
>   accel/tcg/user-exec.c               | 88 +--------------------------
>   3 files changed, 94 insertions(+), 89 deletions(-)
> 
> diff --git a/linux-user/host/s390/host-signal.h b/linux-user/host/s390/host-signal.h
> index f4b4d65031..21f59b612a 100644
> --- a/linux-user/host/s390/host-signal.h
> +++ b/linux-user/host/s390/host-signal.h
> @@ -1 +1,92 @@
> -#define HOST_SIGNAL_PLACEHOLDER
> +/*
> + * host-signal.h: signal info dependent on the host architecture
> + *
> + * Copyright (C) 2021 Linaro Limited

Since you moved code around, should this file also bear the original 
copyright statement?

OTOH, if I've got that right, the code has change locations a couple of 
times already, so the original statement might not match the code anyway.

> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.

License changes from LGPL to GPL - intended? (I personally don't mind, I 
just wanted to check whether this was on purpose or by accident)

  Thomas


