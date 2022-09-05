Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 973C75AD3EC
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 15:31:17 +0200 (CEST)
Received: from localhost ([::1]:42970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVCC4-00009s-4a
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 09:31:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oVC8u-00032X-K5
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 09:28:00 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:37803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oVC8p-00079N-Ld
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 09:28:00 -0400
Received: by mail-yb1-xb33.google.com with SMTP id t184so12809786yba.4
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 06:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=9gxGO5AyCs37Pqg7jDxszM9ZjHpYnRVWTQSJQokRGRo=;
 b=kejg5Mr3JXwzrDioOy3+yRS+3PZjFUedOhQyTrBg7bZmE1MH/r51UhUcjKm+e95l05
 2of648v5c8zLrODM4/onrxvKtVVxn7yVZ9bSKeIgcrJhz7jxHDPPBkeVUvs1FIj370XD
 q5D4SEKnJS6+IkrY0T2f9+StaeRymFy95g0eO3o5ofnPziDUNuluk8BAptqSf4uhI7YG
 jNmJevmar2+QFN/0xx9iC+Egi62ZdVHrN0EFOCNXcbdbc7FSFGlSnil2VXkn9K9CjCpb
 vYJ3+oWXc/6Ymyu2xaDNzO5q0JPq89zYi6/etBhIbS5vHapRf36MsI6Qi779N/omChEr
 lNlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=9gxGO5AyCs37Pqg7jDxszM9ZjHpYnRVWTQSJQokRGRo=;
 b=Df4YSnFMkmb4jChv+MnYL56Ou6WjjORNSZRNT1LQq3ajYrQq921ByNDYQImHQluP3n
 gn/nhyQVQekwbkVfuyJUNLAy4c8uGqd0EAgQh+iY/0KlOCzAAxIxpujeE3BY5QklbIX3
 dhX8nk2D1gOdehslYZdRt/r/TfgQxvdGCUuU0R1I8cjU9EkmqV/f0FLkH1b2itZir2Ej
 KvcQzwLAkluWSWTdC0HeRrznxhfGCdV88tiJdyFmOIJnv97ABbfvhY6CzOKczc59OTXx
 EXt1QhqQYBPdXF7wZhiZZ58PR41M20eRYIWNybCwl2jmRiqHla6NiQWNpu54mIGds39A
 nE9w==
X-Gm-Message-State: ACgBeo2xeFuXo+aM2W27Av1dhYS3tb2PKeadGJOjn9f7f7auIrJk/O8p
 dckKskhwD/8atq2QLMbObuAOS6LAUw6nRW7cAVsQug==
X-Google-Smtp-Source: AA6agR5+r+8KWyFJQkqBbycz7AM6HeXlTYfaly1EdKVr4nU9HohTsouODIKpS8xQeOvVI1n5KP9PnAxDCStzHtQ9MY0=
X-Received: by 2002:a05:6902:1245:b0:699:fc86:d9f5 with SMTP id
 t5-20020a056902124500b00699fc86d9f5mr31052713ybu.288.1662384473178; Mon, 05
 Sep 2022 06:27:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220905125741.95516-1-marcandre.lureau@redhat.com>
 <20220905125741.95516-2-marcandre.lureau@redhat.com>
In-Reply-To: <20220905125741.95516-2-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Sep 2022 14:27:41 +0100
Message-ID: <CAFEAcA_PrFOTtY7OaoLpGJgdbvFHMt2jhaGKENaBHc2oaLCXDA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dump: simplify a bit kdump get_next_page()
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qiaonuohan@cn.fujitsu.com, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
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

On Mon, 5 Sept 2022 at 13:57, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> This should be functionally equivalent, but slightly easier to read,
> with simplified paths and checks at the end of the function.
>
> The following patch is a major rewrite to get rid of the assert().
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  dump/dump.c | 21 ++++++++-------------
>  roms/SLOF   |  2 +-
>  2 files changed, 9 insertions(+), 14 deletions(-)

> diff --git a/roms/SLOF b/roms/SLOF
> index 6b6c16b4b4..5b4c5acdcd 160000
> --- a/roms/SLOF
> +++ b/roms/SLOF
> @@ -1 +1 @@
> -Subproject commit 6b6c16b4b40763507cf1f518096f3c3883c5cf2d
> +Subproject commit 5b4c5acdcd552a4e1796aeca6bb700f6cbb0282d

This shouldn't be in here, right? (I'm guessing a rebase
accident -- git submodules have terrible ergonomics.)

-- PMM

