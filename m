Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAA63738CF
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 12:47:15 +0200 (CEST)
Received: from localhost ([::1]:56318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leF3i-0002w0-Iw
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 06:47:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1leF1T-0001Qu-6y
 for qemu-devel@nongnu.org; Wed, 05 May 2021 06:44:55 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:42630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1leF1R-0002zY-LN
 for qemu-devel@nongnu.org; Wed, 05 May 2021 06:44:54 -0400
Received: by mail-ed1-x533.google.com with SMTP id j28so1428655edy.9
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 03:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GP/vPds0EqCzt5VvWIxNTtdyM1XqSdLs2BjBAUgiytM=;
 b=ng6Jcw7WG63grQhr8dIcicvF8kM+4SoWMOWyxHNHeQTaxGyWVF/Chuz6NihNGI99fx
 IhWE5jztIdMj2UMm/OwB93TvESzLPHOgZ+EqeA/O2cees+4Fk30wE6FThKioP1FsVko/
 RdwmZQtFbSm7Ofj9fG/l35Zecuf7A53YOKkMs4pD05Pn10i/M+iCjrfCRLMVssDwzE3V
 9YtIhpnicTE7Bm8yEv389iavt4zzQyimJQiigYWxTor9NOCA+kkTRlJif12lTEQl5tME
 S821efxATPFHaZGufX09PSueniyraLBVwMg/hDHqBdGy5n9YPFZQOVAV3FZXaLxyMkup
 zNcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GP/vPds0EqCzt5VvWIxNTtdyM1XqSdLs2BjBAUgiytM=;
 b=orsLUD99daRirQAFlNnC462DgkRMiBj2u+c8dBzMdtFLzS4kYWo1peqFOufHoWhD0y
 VGj+mIVhaTh/1cQVc749w0FiApoXu2/kL6+x7OyHVp32cAz4ILcnZ4Vx7PhKL8k0WR8k
 v2e4Dqpj63Z0YgwI1YQRlJUe3kl28U5+f39+RS5WaS0nt2UgGdMS4xUC3Jtltl8XVvqq
 aF52i+ck0vwy9t7iuML2iDN7RI+uD5qhGgETlWAhQMKO+DU+2y51W2RxyXY8+U+IIGNM
 5Q5HGO3p/PFYeWvq3TTYutUmy6oHXkZxbphEODJ6Y7f8VbyCW1cpV4UMysCrlO93qsi/
 pmsg==
X-Gm-Message-State: AOAM532uMIqsNHHiCjAW/HRyxt8Rdkb483iMieEzUDiQy1ZdaM3W3NRN
 SigjT8zx2BkH8EbGXRu23Z/gZGs+zKQfQRI4cLNAKA==
X-Google-Smtp-Source: ABdhPJx+mLjJjjNs5uWH1Mxk91OlJkeaVYXlzNvPhYf8M1OjF0X6MQ0/vxQz6p7n8o8k8eZaTO4mtE69X7iR7dkFGBY=
X-Received: by 2002:a05:6402:3548:: with SMTP id
 f8mr8171804edd.251.1620211491326; 
 Wed, 05 May 2021 03:44:51 -0700 (PDT)
MIME-Version: 1.0
References: <603798381.17174916.1620200426349.JavaMail.zimbra@redhat.com>
 <1162368493.17178530.1620201543649.JavaMail.zimbra@redhat.com>
In-Reply-To: <1162368493.17178530.1620201543649.JavaMail.zimbra@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 5 May 2021 11:43:44 +0100
Message-ID: <CAFEAcA9mZfuSYsEK-TcERB+8yTnq_Qhn7HwRGvCnE7_DMfAXyQ@mail.gmail.com>
Subject: Re: Prevent compiler warning on block.c
To: Miroslav Rezanina <mrezanin@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 5 May 2021 at 09:06, Miroslav Rezanina <mrezanin@redhat.com> wrote:
>
> Commit 3108a15cf (block: introduce bdrv_drop_filter()) introduced uninitialized
> variable to_cow_parent in bdrv_replace_node_common function that is used only when
> detach_subchain is true. It is used in two places. First if block properly initialize
> the variable and second block use it.
>
> However, compiler treats this two blocks as two independent cases so it thinks first
> block can fail test and second one pass (although both use same condition). This cause
> warning that variable can be uninitialized in second block.
>
> To prevent this warning, initialize the variable with NULL.

If fixing compiler warnings, please quote the compiler name/version
in the commit message. (This helps with understanding whether the issue
is because of an older and not-smart-enough compiler or a new bleeding-edge
compiler with extra checking.)

thanks
-- PMM

