Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 522021442C8
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 18:09:13 +0100 (CET)
Received: from localhost ([::1]:58658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itx1c-0002O0-AV
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 12:09:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43590)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1itwyu-0007oY-2v
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 12:06:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1itwyq-0001Z7-7f
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 12:06:24 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:26488
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1itwyq-0001XX-44
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 12:06:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579626379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nz9lR7mPCurD5IEGaW/tFT5cXnNU8G8+MsNBoMEQVFU=;
 b=GKW45CFCHKW7bbKiesMfRfWSzp0RSl28kjdjiJlnKYszGVoJmz8RlgpTARWxFJhX8kPJRe
 pul8PlLSGOi89cKf6/WAmHWWQF1TRwp1TCSAcoUUXyP4LVbmyLIycekTQz5Kf5BfKXKnK4
 Cyn8kj/EcNHuixmGqOeBTJH8NrJRVoU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-bPlf889VM0W1UnSgpLeU8g-1; Tue, 21 Jan 2020 12:06:16 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 040C51005516
 for <qemu-devel@nongnu.org>; Tue, 21 Jan 2020 17:06:16 +0000 (UTC)
Received: from gondolin (dhcp-192-195.str.redhat.com [10.33.192.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ACA2B19C58
 for <qemu-devel@nongnu.org>; Tue, 21 Jan 2020 17:06:15 +0000 (UTC)
Date: Tue, 21 Jan 2020 18:06:13 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] docs/devel: fix stable process doc formatting
Message-ID: <20200121180613.13551328.cohuck@redhat.com>
In-Reply-To: <20200113103023.31255-1-cohuck@redhat.com>
References: <20200113103023.31255-1-cohuck@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: bPlf889VM0W1UnSgpLeU8g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 13 Jan 2020 11:30:23 +0100
Cornelia Huck <cohuck@redhat.com> wrote:

> Enumeration of stable criteria needs proper bullet points.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  docs/devel/stable-process.rst | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/devel/stable-process.rst b/docs/devel/stable-process.rst
> index 98736a9ea487..e541b983fac7 100644
> --- a/docs/devel/stable-process.rst
> +++ b/docs/devel/stable-process.rst
> @@ -18,8 +18,10 @@ What should go into a stable release?
>  -------------------------------------
>  
>  Generally, the following patches are considered stable material:
> -- Patches that fix severe issues, like fixes for CVEs
> -- Patches that fix regressions
> +
> +* Patches that fix severe issues, like fixes for CVEs
> +
> +* Patches that fix regressions
>  
>  If you think the patch would be important for users of the current release
>  (or for a distribution picking fixes), it is usually a good candidate

Queued to s390-next, so that it doesn't fall through the cracks.


