Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9EB1B9FE3
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Apr 2020 11:30:42 +0200 (CEST)
Received: from localhost ([::1]:33958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jT065-0000JT-IS
	for lists+qemu-devel@lfdr.de; Mon, 27 Apr 2020 05:30:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32848)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jT04k-0007ob-U8
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 05:29:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jT04Z-0001Tz-TB
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 05:29:18 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:34516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jT04Z-0001Te-GP
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 05:29:07 -0400
Received: by mail-ot1-x343.google.com with SMTP id 72so25065788otu.1
 for <qemu-devel@nongnu.org>; Mon, 27 Apr 2020 02:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9/Pvvd9YuVSkjU51nhuEjAcNwQ3wEACDyG45mPpqrv0=;
 b=D5gCg8QIGFiGkQEquebuEjKyaF5PZSBF3XjnS3x3CdKEzB5EbqrFXBckysCBDkvW6g
 iEZTim8IAftsUU1ShYQZgeQK+LUwKZ0+OFNz79vYMiUlIy7Z1dVXPIBE0R8pkgxRoYhV
 G8jUphgfJBSZK4iDOAntJQrdDwel/1rudWqV2SZ0NohwUJAPRL82N4odno1F3ImV5aA8
 ZC/xfHQvCz/MBF3fxM71Fu+MGbMFTXx8BA5kIoCMLQsWWE3q/JxDzyIerd/oM0p4Jy5V
 vYUyMA49FY3CipRS6wCV3iyIQ41jLsCzMLYWXq/uVMN6xqGKAQWr7XIuM98mwx6iHOfp
 9c6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9/Pvvd9YuVSkjU51nhuEjAcNwQ3wEACDyG45mPpqrv0=;
 b=VXeZ6t00WQhdgzCSh0D494LNp/ghaLqBdQQqnILxgHSBhViLPgfE4H8GqDUc2US7W7
 IP5ELArWKeZBDbMUNBDiJPmUnnFK9Gd4fiPMfrGD8//yllikre6L/d9XR++bgapQ5ZPD
 b7Rf0+tJVHnh63Mgc6Btl0zyT5XkmIqQjWMN9xzdlwOV/1pMUwZ72mDon2ZgkICC2NvS
 bA0egSthXHRgPivpO3nyM8+8ldhXdhHqfPYklu6AQAZHjpByLs+cnjlqeYcY28/3td1a
 Y6JXBEL962FdG3Qlb0twDePy4jfXpQJMeiqpwf2sR0F4TDTPaeTyG59T/6pXLACuDrx+
 SWLQ==
X-Gm-Message-State: AGi0PuZXjiDwYCXSlglVnN3XJKvXeVickPupy1XA5RBIYlCnsyC8N49q
 oVpPb+LMTmoauAC9c8lFo7uBS+KB0M4k5SqhptjSdeEJ7cc=
X-Google-Smtp-Source: APiQypL+oNoiBLp7NolIOFZucidKf+DMm8CG6qKAUDlmmV9cehE06p3bj1BVJRrKgobT9n6kAQplqlXS8SCIvNeqFSM=
X-Received: by 2002:a05:6830:1e4e:: with SMTP id
 e14mr17254586otj.91.1587979746399; 
 Mon, 27 Apr 2020 02:29:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200422043309.18430-1-richard.henderson@linaro.org>
 <20200422043309.18430-3-richard.henderson@linaro.org>
In-Reply-To: <20200422043309.18430-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Apr 2020 10:28:55 +0100
Message-ID: <CAFEAcA-aG-vRG14pTbpGnRqzJjGFiuTgKQ0qm-OdLOFPmVBYEA@mail.gmail.com>
Subject: Re: [PATCH v3 02/18] exec: Fix cpu_watchpoint_address_matches address
 length
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 22 Apr 2020 at 05:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The only caller of cpu_watchpoint_address_matches passes
> TARGET_PAGE_SIZE, so the bug is not currently visible.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  exec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

