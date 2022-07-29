Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E936585269
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 17:24:19 +0200 (CEST)
Received: from localhost ([::1]:60326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHRqc-0006ci-5I
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 11:24:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oHRlk-0002sh-MT
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 11:19:21 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:46671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oHRli-0000LZ-Vx
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 11:19:16 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-31f445bd486so54131867b3.13
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 08:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=u3tNOSsk5xtk48RLXsCaJHh662k3ySizpnWyZ1kxss4=;
 b=Myn9mpsTdL1o/Pnu3xXGlo56AL3y4gb3UsibIAakXfhcJamPbSKoXPTsCH45aB0nkW
 oni9ySSoVmzewsPnFovXVz3mRK7w3A/sTLL5wWlaujWttX7cJopHdIXY7tgLwG1fcLsQ
 iT6mb5G1z73OvwbtI+0Dkmnk+YgcUWSMFm+G9qGK11xIDI4D4YHS0PKoxnd8QDc9TQKs
 EJo8auq/jkjUvjWdN5geiTceC/DC899yUz7n/v4JqWD7OEJRYuT4guUq/qj4jE9bA3I4
 CnpPzDVGyygqVthdmR6IfQvc9fLmgKFaIViDIpc9x29EZ0QmddOB8WEPYReiUnwltM/z
 o2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=u3tNOSsk5xtk48RLXsCaJHh662k3ySizpnWyZ1kxss4=;
 b=3KzhkOqtVqWPoNG3VMtsr2DcBVjGpXFrvfXA/S1R3Acrx400riRneLQ1TGE7LMoxfY
 vzDq8jM6YJfcF7H6KG5kWTUr2PgYnKmyDw/77LSONEHcBZA/dUaweMbk5GlxFvP8eI/Y
 4YDsA7ILp/2e2FiYc0M2/Egmf6hESMuNn0838rvDIgtFbjMJdpjDb/3XT9XA5tgk9GNJ
 8KHSvwEJiL4wfpHyKBrxatXACO9uYAUzCxa9fiLxHb5FqpfDb6IJ9JxyFyVopeGHZkFv
 RQjla3bcCV4z3YNMB+UET9DF9+q3oxHMr1InRp55t98MUxBqhZXqBMVoZg7g4MuWOMKI
 tQ6Q==
X-Gm-Message-State: ACgBeo3RN9CjYSpdpBYYSS5tPdvkgLO9MuotbEjMAtU4VoZt+vDbKfKc
 nfnsPcpOIKq0YY2CTzaUR8WUur66pAcAwzTcskFe+A==
X-Google-Smtp-Source: AA6agR4lTBuwckPQ0RudBPUGqBbTii1mJc563i84+agiUn+BQM/9PYN4j8qz87bGXPSQLEiotASYn/h1C5/AfBm2oE8=
X-Received: by 2002:a81:a247:0:b0:31d:72da:e931 with SMTP id
 z7-20020a81a247000000b0031d72dae931mr3521537ywg.469.1659107953840; Fri, 29
 Jul 2022 08:19:13 -0700 (PDT)
MIME-Version: 1.0
References: <d2b97d5ab8098b215304a4b81a93ad02f6232b41.1659107152.git.huangy81@chinatelecom.cn>
In-Reply-To: <d2b97d5ab8098b215304a4b81a93ad02f6232b41.1659107152.git.huangy81@chinatelecom.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Jul 2022 16:18:33 +0100
Message-ID: <CAFEAcA-bwbJatLwZOsTd9JvxZU3J6ifhHizfVaYNKYXOUwDZmw@mail.gmail.com>
Subject: Re: [PATCH] dirtylimit: Fix overflow when computing MB
To: huangy81@chinatelecom.cn
Cc: qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, leobras@redhat.com, 
 quintela@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 berrange@redhat.com, iii@linux.ibm.com, peterx@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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

On Fri, 29 Jul 2022 at 16:17, <huangy81@chinatelecom.cn> wrote:
>
> From: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
>
> Coverity points out a overflow problem when computing MB,
> dirty_ring_size and TARGET_PAGE_SIZE are both 32 bits,
> multiplication will be done as a 32-bit operation, which
> could overflow. Simplify the formula.
>
> Meanwhile, fix spelling mistake of variable name.
>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
> ---
>  softmmu/dirtylimit.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/softmmu/dirtylimit.c b/softmmu/dirtylimit.c
> index 8d98cb7..ab62f29 100644
> --- a/softmmu/dirtylimit.c
> +++ b/softmmu/dirtylimit.c
> @@ -236,14 +236,14 @@ static inline int64_t dirtylimit_dirty_ring_full_ti=
me(uint64_t dirtyrate)
>  {
>      static uint64_t max_dirtyrate;
>      uint32_t dirty_ring_size =3D kvm_dirty_ring_size();
> -    uint64_t dirty_ring_size_meory_MB =3D
> -        dirty_ring_size * TARGET_PAGE_SIZE >> 20;
> +    uint32_t dirty_ring_size_memory_MB =3D
> +        dirty_ring_size >> (20 - TARGET_PAGE_BITS);
>
>      if (max_dirtyrate < dirtyrate) {
>          max_dirtyrate =3D dirtyrate;
>      }
>
> -    return dirty_ring_size_meory_MB * 1000000 / max_dirtyrate;
> +    return dirty_ring_size_memory_MB * 1000000 / max_dirtyrate;

Now you've changed dirty_ring_size_memory_MB to 32 bits,
this multiplication is going to be done at 32 bit
precision and can overflow. Adding 'ULL' to the '1000000'
is one way to fix that.

thanks
-- PMM

