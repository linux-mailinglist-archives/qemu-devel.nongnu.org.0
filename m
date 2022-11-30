Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B813763DCCA
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 19:13:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0RZk-0003Z6-AW; Wed, 30 Nov 2022 13:12:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1p0RZi-0003Ym-8L
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 13:12:50 -0500
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1p0RZg-0000eR-81
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 13:12:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=GpklemIYm2ouWHn3RiNUMkxz683OqxKH2jd1JfwIX0U=; b=GYU0Gum/uSawjpgLLBxwzhU8IU
 ywOawEcJFv+LtpWORUGn3Hc9rfynab8o2h11eyNxVCbkw8bATbkKQ0LxVYC5LlpuovplOKHjOKR6i
 hxhflRoV1VR+720uLOU1a+ekadlCtDS1+h8XcqwwSCjSzB8HPiefhShF6HQVF9DOKlOKmhEoqyIcs
 Mu9lVzyFozgmt0nOzTOpxkv/pEuOMe91/Wtk02cLUBBPYO4XYdBpY1TvSlID0UsE9C370fEjam9kT
 8HO/V1kuOIBpKZOpw1zg7M7CDy6k2pJmSetimjpQerUXSTgh3kXVrVqlJWDlxbmW7EFhADkR2uAF5
 rq3z3FshNIxJYaDbJhQ6bN5FexKZA/1dw9Kl7C1b/no+o8erFBbdShrLc0Y6rRtcgVLhyoGOz6EQT
 O/0dfbr0uTSUZ22yiYDTaW2lJbYz0AceJs9Hl4Ck4UaUOxvVB/C0TaOuNN2wGBV8+hp4hhBhnaCRK
 8j+j0BBd36ms/YV9A4DL4Z78zsg7nKonmQMbWhO0MlhsWKUXtJxpDPmKN/rxfwnEZOzqExBbKzzRN
 7KtKavZwvAi0FsGOSX8hQLtn6VcaSqB2qxtChcNhcIMnrEEcSDsQ/96/mrUwSsjeYyyzG7URZneln
 kuNsN8i+62IXPl5x3ERzADxzxBD9iSyzkIsSI9IWQ=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <philmd@linaro.org>
Cc: Greg Kurz <groug@kaod.org>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: Re: [PATCH] MAINTAINERS: Add 9p test client to section "virtio-9p"
Date: Wed, 30 Nov 2022 19:12:42 +0100
Message-ID: <4272112.8SkojGVNeE@silver>
In-Reply-To: <E1ozhlV-0007BU-0g@lizzy.crudebyte.com>
References: <E1ozhlV-0007BU-0g@lizzy.crudebyte.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Monday, November 28, 2022 6:12:04 PM CET Christian Schoenebeck wrote:
> The 9p test cases use a dedicated, lite-weight 9p client implementation
> (using virtio transport) under tests/qtest/libqos/ to communicate with
> QEMU's 9p server.
> 
> It's already there for a long time. Let's officially assign it to 9p
> maintainers.
> 
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---

Queued on 9p.next:
https://github.com/cschoenebeck/qemu/commits/9p.next

Thanks!

>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cf24910249..4f156a99f1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2036,6 +2036,7 @@ X: hw/9pfs/xen-9p*
>  F: fsdev/
>  F: docs/tools/virtfs-proxy-helper.rst
>  F: tests/qtest/virtio-9p-test.c
> +F: tests/qtest/libqos/virtio-9p*
>  T: git https://gitlab.com/gkurz/qemu.git 9p-next
>  T: git https://github.com/cschoenebeck/qemu.git 9p.next
>  
> 




