Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E9B4548B9
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 15:31:11 +0100 (CET)
Received: from localhost ([::1]:35072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnLxu-0004dK-9T
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 09:31:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mnLrJ-0002ez-JS
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 09:24:21 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:36749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mnLr7-0005SH-JB
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 09:24:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=eZazGPxSLUoEA0gFxlbyzaZVrKmJv+WVVpLtdZGsKmI=; b=PVv1CoZUOiAAGpE9s9uYBJDbft
 +4SPv05VDIhXG4gZZVPr+kwbXz6KFVHFx0PoRX3Es69YivzmCEa6JhcXpGkOns1qyF4Z7h5TY3H/N
 T+DdvK8ca2Fj3EPCu3QpIpL6UvnehLX1nUXwaknFfe8pyvr8tKUVkM0B/qf3q/OVDUkjPWHOp9OTK
 RXLQ09I99WGATRGobbZ1XiAOyuDHuY7bU2GCXglGmPgU1iYhT8VxBohUmFYjHc1+DRnkIPRPDxqAC
 ZThb0FzUaQhLqwBU8mr1zoM7mG2jwVtqDrtbDA4lvnu4fIXOxTRqfBn5QaTRnh4E+EszGCg/g0MiZ
 uZ9z+bXKe26+VDlbez5IvfHKjIH7dlrUNh+MfFqgJLA9SJIZ1RM3xKloezjx3d1SXby2HFS1PiR+Z
 KgYM8cDruPJIeACaOAUz1mX3ttX5cVwk++z5g4IeJGoBq1gAUYEb82hU9YY6ENuOuhrg4ww8yPdRB
 qf/OtGzk54+sQvL2ai1QOwngx4xzVwbpYzqrT5/YjpWu2uSOztcM0D0krwDIvEHN9WbFdmDbHko9l
 xuwikXdkx7xlXuuoyR4Lvw85FuyBiY9U3bx8QWK9L1fvVLig2XzpvHk5YqAyHHE6/Vky1uu5lRcjr
 JhbYBxWccpa2UdbdyGTGnnuf3Y1XNuDjtB9x3j0Wk=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] tests/9pfs: use g_autofree where possible
Date: Wed, 17 Nov 2021 15:24:06 +0100
Message-ID: <8354180.QfA1WaD6YU@silver>
In-Reply-To: <E1mn1fA-0005qZ-TM@lizzy.crudebyte.com>
References: <E1mn1fA-0005qZ-TM@lizzy.crudebyte.com>
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Dienstag, 16. November 2021 17:40:08 CET Christian Schoenebeck wrote:
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  tests/qtest/virtio-9p-test.c | 86 +++++++++++-------------------------
>  1 file changed, 25 insertions(+), 61 deletions(-)
> 
> diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
> index 41fed41de1..11861aaf7d 100644

Queued on 9p.next, along with Greg's suggested additional hunk:
https://github.com/cschoenebeck/qemu/commits/9p.next

Thanks!

Best regards,
Christian Schoenebeck



