Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D01252F1407
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 14:19:01 +0100 (CET)
Received: from localhost ([::1]:48524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyx64-0005gA-C0
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 08:19:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kyx2n-0004dG-Ii
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 08:15:40 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:43697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kyx2h-0004Mm-7v
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 08:15:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=ZrNunMV8wObm+SaJNMQLZansfmj341oBpNjWNuTuO0o=; b=In+lnshzMlW0c5QDmEok0LVo5j
 h0TnQne2h0806D7jKgCR3zuAExZA53XZo6fPENOng8a9WgEJ7Pud4B4Uezxj8LqSV+qbSkls8EeOb
 2xvjcKsNDWfGu42mPxwASC1WuVp76GwuWCWactOjOCI8jYj7CtXA8tOV+eznJW4MSg56IHgWBc0XN
 wz89OvcDxtpSg3TM2z/Cl07ebwb7UWSW97tmaog6YvqKSJckzRzriu/0Kj5RepWnHctIh6aA9Zr9e
 LrXl76ri9pI5I+0cZdc9q/XYAD9QwSHmt4cJOiGq69a7Ni/cDDx6vF/itgTPYm7HSsalWX4knTbJC
 zCO/tJu8DwdIdTWO5kVB51pc8BKQCOtsaFmz+7f+nidbitiI0iojXd61TD/rz9WdO/o5ZcKOO5c0J
 5lCS5xSnLtUdRXYtWRCfEuf+PR6VKgul8PO4QXpJt2UcHOcq2MBmtQcwEq7uqR5qG9tiyBTG+BK4J
 rrSc/gyeVHA8/KhoME1b3pKOCazPeFe48Zl5fQsdBX1nwC7qKNjYP5nhN9hVll+YERnX9WGbuIWhj
 Nu9pDTiJ1Jjr64HHgoS74f9HPqVVZqa0kQsCWkKwJ+kfdHPSc51IaPvL3u/k7SkOfPfUv0mjeHraU
 jlxNApUGETxbREuwWdsxSXfzgIVAqhxiJYJqs5M1E=;
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] 9pfs/proxy: Check return value of proxy_marshal()
Date: Mon, 11 Jan 2021 14:15:17 +0100
Message-ID: <2260349.uzTyekElz3@silver>
In-Reply-To: <161035859647.1221144.4691749806675653934.stgit@bahia.lan>
References: <161035859647.1221144.4691749806675653934.stgit@bahia.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Christian Schoenebeck <qemu_oss@crudebyte.com>
From: Christian Schoenebeck via <qemu-devel@nongnu.org>

On Montag, 11. Januar 2021 10:49:56 CET Greg Kurz wrote:
> This should always successfully write exactly two 32-bit integers.
> Make it clear with an assert(), like v9fs_receive_status() and
> v9fs_receive_response() already do when unmarshalling the same
> header.
> 
> Fixes: Coverity CID 1438968
> Signed-off-by: Greg Kurz <groug@kaod.org>

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

What's your workload Greg, are you able to push this through your queue?

It's time that I signup for coverity. I'm doing that now before I forget it  
again.

> ---
>  hw/9pfs/9p-proxy.c |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/9pfs/9p-proxy.c b/hw/9pfs/9p-proxy.c
> index 6f598a0f111c..4aa4e0a3baa0 100644
> --- a/hw/9pfs/9p-proxy.c
> +++ b/hw/9pfs/9p-proxy.c
> @@ -537,7 +537,8 @@ static int v9fs_request(V9fsProxy *proxy, int type, void
> *response, ...) }
> 
>      /* marshal the header details */
> -    proxy_marshal(iovec, 0, "dd", header.type, header.size);
> +    retval = proxy_marshal(iovec, 0, "dd", header.type, header.size);
> +    assert(retval == 4 * 2);
>      header.size += PROXY_HDR_SZ;
> 
>      retval = qemu_write_full(proxy->sockfd, iovec->iov_base, header.size);

Best regards,
Christian Schoenebeck



