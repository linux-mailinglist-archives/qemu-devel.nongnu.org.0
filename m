Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DBA5658B6
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 16:35:45 +0200 (CEST)
Received: from localhost ([::1]:36668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8NAu-0004Dl-4S
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 10:35:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M8F-0000Gh-48
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:28:55 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:40454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M8D-0003ui-H7
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:28:54 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-317a66d62dfso82209657b3.7
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=832XTr8KnCCb8qjYa18XlWYpctrAuaSk1Zn5WeQ8iTA=;
 b=xjBJ7c8UBXeB3cX9N0W/34Nhh1JDZehn70cGsoBgCYfU+eDVZkNYIew5OpdxLT3Uw+
 QChfDVqAxRfb7KXf4Y/aIQjaM0b7wPsEcQygIzEootW8iwCdFSOHO/DZqQn4gZYwP5+F
 yN/NL/y1u2ARkjd/5QU8WMgYRMbTMT3vrW9d37d6MTudhoNhAku8O+MwCDJ6KgfWR7IF
 CbwST6wqnwUl3zLnXbHHFDvpUDyj1EqTw7MES3y2W3ifVUOYb4mNqH8sv0zVrMwV+oMv
 KSIXsbEMJnKEVV65LWy1dF8OivqmM5Df0GjkI+TIcPssfM8EzvI1hdvXOIo3DtpOpLLY
 A4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=832XTr8KnCCb8qjYa18XlWYpctrAuaSk1Zn5WeQ8iTA=;
 b=BkUs1ZJlI/R5zqELQK2ink7reRYTCZAWFNHA9gyr4DDdWKpa1AcjTznlNJREpfrh6x
 HqQf9XvjWCrow0AZDv9aah5c3kbRR8b6oQ5GUUvMjpfdpYrC1P6jzqvY+SL8xGtvd6yj
 iumNRzsTrdBSDBeXrxpuBw6yU7rEZCgsdB1wQ5MzDxURBkwt/obeC+tdLs+HwB2qn8pW
 7UeOtnvYNks/QvdGmIdXa97Q6EHgKL7CcZkDUCRsUShQ0UDS98FZHLiP5htbCn9Y3uwh
 KC9Nf5aK31tz243nstSMoIj9tUG9xuBc1wNJoBnV3cDkBj0DHgZ/zdFcpGPGqrhjauWD
 y7Zw==
X-Gm-Message-State: AJIora9dKguxg+tHnN4a8XoNqAH3sG9oCve4uZOiSWoeaoObMLAzvdmd
 w/4pDc81zpDtdwOOgR+0M5KtbJPXHdjD3GdfYCblXA==
X-Google-Smtp-Source: AGRyM1vsW0/Lhq+u/CBrXUxQMiOwyh4JR2G06SFVrfBUWYGxziTWStdMAsgtWVIPkmiFw13PWjy7TFEYYP21xlDhw5M=
X-Received: by 2002:a81:6585:0:b0:31c:b55b:dd36 with SMTP id
 z127-20020a816585000000b0031cb55bdd36mr861320ywb.469.1656941331889; Mon, 04
 Jul 2022 06:28:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-30-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-30-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:28:41 +0100
Message-ID: <CAFEAcA_=zGYooKT6tNp5cJRDYj-XcpxSssd9as21st_DZav9Pg@mail.gmail.com>
Subject: Re: [PATCH 29/40] lasips2: rename LASIPS2Port parent pointer to
 lasips2
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This makes it clearer that the pointer is a reference to the LASIPS2 container
> device rather than an implied part of the QOM hierarchy.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

