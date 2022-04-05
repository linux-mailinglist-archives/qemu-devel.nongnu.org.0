Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9A74F2E30
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 13:59:05 +0200 (CEST)
Received: from localhost ([::1]:60358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbhpw-0002y2-47
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 07:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbhnl-0000wV-6r
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 07:56:49 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:35257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbhnj-0000G1-BI
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 07:56:48 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2eb43ad7909so81461947b3.2
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 04:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rq96aKcCiL0E2rXkY33O6redv/G/xiu9OTRGaH66Aw4=;
 b=gHiKAv09IUIO72oKZI1r1CVd5SioX5Jb/E0OlW/rp+yIS1Ygih3Sn4+lKpqCJ2W2M7
 dRgGqjUzOlAy+zq9WBFVAHI4mJUwHTPSeZqp6ldb3MEwt1hbQZuetuY5ly3IkjE3EWLz
 wV/upffum+oL6esDxIxMB8dGC+dKhsy2Awe9jN9AuKCQx6wv9DW+DeKxmcZ7CdlyHfx0
 45eeTAWqI92spp4NjvTLeHF4P3ORTZeKAIMO1ro9pixbGbCNPy6EKvHkORPyxbIqZBCj
 gaKn7B8Wl0MJrFu+DrSBq+VwLtfl+GuIVSnZRZmJwjtGYn9ytVsXE40Nbl4vOLnM0Ah2
 fYzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rq96aKcCiL0E2rXkY33O6redv/G/xiu9OTRGaH66Aw4=;
 b=j5x0GmPdnCbXjkUOUtkobch8i/CLAyy3Kfs64bO+tTgiXARugCLgHqYkuxOtzbJDzk
 MW153o6R8/LRRORxx8hwSMp4xPFdU89Ou2SAj6HTIb/fXumtB4smhEetOaQEPhNZFm/D
 By1eRIAYRQIXiwCYuSOV4vHINtiFGNaQbEyyMeAgV6ls+IZN9MyIMHvuu3f4EUqgFk2s
 01Wd4MrKRTNnNVwhjywgXi3NOo44s0bO5J41Yolan4Fb/hR8aYZbC0U1o1hZbnDq5t5H
 uqbMHIpvukthf/GWj829xZ5s4J11t/j38s1yM23nLjUJuKF/ePMgF6U0YKl8jMYdcyQT
 VWFw==
X-Gm-Message-State: AOAM532fzao4aVJceqZ8wmaqCnm/CG6VQAb8s2Ff7y+BfqN4ouANOKO/
 VLeMg7yGr5ntaBDySvilmyT/JWgiilTPi8jJ8drSlw==
X-Google-Smtp-Source: ABdhPJzMIdvYNJqvoi8SThYheAvdmOoRaFRQgVx4o+3J8ovXrDkygGdcVK5s1M3JZoGKsThHahDXyqDlBMArBqvqhdg=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr2275428ywf.347.1649159806283; Tue, 05
 Apr 2022 04:56:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220405103258.105701-1-mcascell@redhat.com>
In-Reply-To: <20220405103258.105701-1-mcascell@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Apr 2022 12:56:34 +0100
Message-ID: <CAFEAcA-E5Xuh4h8WWEQroih==tjB_DNh0K6AOSnkJc=vrH+u5w@mail.gmail.com>
Subject: Re: [PATCH] ui/cursor: fix integer overflow in cursor_alloc
 (CVE-2022-4206)
To: Mauro Matteo Cascella <mcascell@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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
Cc: qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 5 Apr 2022 at 11:50, Mauro Matteo Cascella <mcascell@redhat.com> wrote:
>
> Prevent potential integer overflow by limiting 'width' and 'height' to
> 512x512. Also change 'datasize' type to size_t. Refer to security
> advisory https://starlabs.sg/advisories/22-4206/ for more information.
>
> Fixes: CVE-2022-4206
> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>

> diff --git a/ui/cursor.c b/ui/cursor.c
> index 1d62ddd4d0..7cfb08a030 100644
> --- a/ui/cursor.c
> +++ b/ui/cursor.c
> @@ -46,6 +46,13 @@ static QEMUCursor *cursor_parse_xpm(const char *xpm[])
>
>      /* parse pixel data */
>      c = cursor_alloc(width, height);
> +
> +    if (!c) {
> +        fprintf(stderr, "%s: cursor %ux%u alloc error\n",
> +                __func__, width, height);
> +        return NULL;

Side note, we should probably clean up the error handling in
this file to not be "print to stderr" at some point...

> +    }
> +
>      for (pixel = 0, y = 0; y < height; y++, line++) {
>          for (x = 0; x < height; x++, pixel++) {
>              idx = xpm[line][x];
> @@ -91,7 +98,10 @@ QEMUCursor *cursor_builtin_left_ptr(void)
>  QEMUCursor *cursor_alloc(int width, int height)
>  {
>      QEMUCursor *c;
> -    int datasize = width * height * sizeof(uint32_t);
> +    size_t datasize = width * height * sizeof(uint32_t);
> +
> +    if (width > 512 || height > 512)
> +        return NULL;

Coding style requires braces on if statements.

thanks
-- PMM

