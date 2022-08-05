Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F88C58AF1B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 19:45:50 +0200 (CEST)
Received: from localhost ([::1]:43170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oK1OP-0006r3-1t
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 13:45:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oK1LL-0004Up-1n
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 13:42:40 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:45701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oK1LJ-0006IK-J1
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 13:42:38 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-3246910dac3so30467427b3.12
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 10:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=ifPtP1I+zKKihh9OhtzGg5JfI69+9uRMUEWS7Qx/Gjk=;
 b=vpUYsLT08JlKArOlmMRk2P9WZWhrjCiQJgBjl3BtACXq++Bpiqws24PMXJr+/LVACM
 2zlsFU6fgLv9xjyCfeaDknyW+wzbO01gPjNxfHEbU2AGWH2+l87GmyEjmHX6Ls2zIFD0
 ZfGe8li0t9nsskqrhzqvLU+bfDH2UjeWMDqlESDl2gr9T/NLjYAar8hNdu1JpRTsrag5
 EWIv/AVasGNvxir01t3zcEpu+vzwWMpoq9oGJuUIZs5mToQG96/cEjwJgbpCLIQD9Enl
 U/UOZHC93DH5fRKhhNFRJF57lMhzy84nKz5BA384nrppGy0nJU6kqwJLuDYMrnDhAXTB
 3KLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=ifPtP1I+zKKihh9OhtzGg5JfI69+9uRMUEWS7Qx/Gjk=;
 b=0fH/Z7vgW2UZGlPQQJFgXyVPpv6EV1Nq1QkYBH6Y3It0lkwGbHcIMl8XO91IKWZe4o
 5IIDOr+iw4J7ZU7MHo3Eh4jseZ/P4pyfUwmZNYdVfyRsF0e3w+VUwU/TvTMZ7BUpgavh
 uA9h9eAJfump97x8qbCbMfxCJQBZ2sYGT63YSVjVP1bwjilnGyppybB3N2mKpJ1PWQ1g
 O/+Xw/WFl/6HUMiXYS39w1AW9ek33xHSVhEfdgli6M1qMg41UE/E6N7H6OAsioaQ5z30
 mzVOYV5rA4c23ly2emIzqbVd5KNJjnvywI/9QRS6Re/dIpatX14mxs55be1UPCddu5D3
 mAug==
X-Gm-Message-State: ACgBeo0cPJFQWlkFOlyBoEZeP4n7GwOXerPJj08JcsF9ja+n025cO/0O
 dS3CRcKiiVKGl04AdiVU0B/I0BYRYoZL/7gciOarrA==
X-Google-Smtp-Source: AA6agR7Rmj8USYGpGbJRsY64gVtgvcrVsevT/4UpSmEpt87773qqFcp6HlZ6N3ctOKUbvhxscw8fbFPjU72SZEJxn+M=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr7010938ywb.257.1659721356195; Fri, 05 Aug
 2022 10:42:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220805160914.1106091-1-iii@linux.ibm.com>
 <20220805160914.1106091-2-iii@linux.ibm.com>
In-Reply-To: <20220805160914.1106091-2-iii@linux.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Aug 2022 18:42:25 +0100
Message-ID: <CAFEAcA8tFhKdZY2mDjz6EcvVWCdWkarNudM1cAbM9VoXkQE7BQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] accel/tcg: Invalidate translations when clearing
 PAGE_READ
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Laurent Vivier <laurent@vivier.eu>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, 
 qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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

On Fri, 5 Aug 2022 at 18:33, Ilya Leoshkevich <iii@linux.ibm.com> wrote:
>
> After mprotect(addr, PROT_NONE), addr can still be executed if there
> are cached translations. Drop them.
>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>  accel/tcg/translate-all.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index ef62a199c7..9318ada6b9 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -2295,12 +2295,19 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
>           len != 0;
>           len -= TARGET_PAGE_SIZE, addr += TARGET_PAGE_SIZE) {
>          PageDesc *p = page_find_alloc(addr >> TARGET_PAGE_BITS, 1);
> +        bool write_set, read_cleared;
>
> -        /* If the write protection bit is set, then we invalidate
> -           the code inside.  */
> -        if (!(p->flags & PAGE_WRITE) &&
> -            (flags & PAGE_WRITE) &&
> -            p->first_tb) {
> +        /*
> +         * If the write protection bit is set, then we invalidate the code
> +         * inside.
> +         */
> +        write_set = !(p->flags & PAGE_WRITE) && (flags & PAGE_WRITE);
> +        /*
> +         * If PAGE_READ is cleared, we also need to invalidate the code in
> +         * order to force a fault when trying to run it.
> +         */
> +        read_cleared = (p->flags & PAGE_READ) && !(flags & PAGE_READ);

Isn't it architecture-dependent whether you need PAGE_READ
to execute code ? How about PAGE_EXEC ?

thanks
-- PMM

