Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F676516027
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 21:43:46 +0200 (CEST)
Received: from localhost ([::1]:40136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkt0L-0000OJ-7A
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 15:43:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkszM-00088l-2Q
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 15:42:44 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:53161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkszK-0005D0-AP
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 15:42:43 -0400
Received: by mail-pj1-x102a.google.com with SMTP id e24so9741055pjt.2
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 12:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=stcVaT16hwzb5z6o+unH6ar073lxbVkX+IwxYQiv+7s=;
 b=iIaZL8aEjxqvUIVgWUJWgPZeSBFjegfi3uKxuSYVDE0bXkMp96lD23a4TPXpzG0klO
 rwAxuAwEpQYDNHtvN+gcM1kBq6M9Bx0wWyUbwR4scXMILFZ1CGhaYrb2XtMbtAgfP5Vn
 XoKr69lomnqiX0Rif162ihDjqV/Fw+8gEgUhUVmyZ+W+ZYbYS7vfoUnTyMIDb1gX1jn3
 DZggG+eN3EW0tyYo8gzPWZIrDyMNzDoy04pAX0tWFXJw/pVNDyhmRt1qHrZ+bK876wup
 XvcvQtiSlQ4FP3YMjviFz7lJK7VcHeCXRMitJxzpP7stR1fbSknzeU3oGAdSRqqlS/I4
 YWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=stcVaT16hwzb5z6o+unH6ar073lxbVkX+IwxYQiv+7s=;
 b=sGdQrPhuau4tehAV1pbGCLziK6/ulPwlovhK3GOcAUEQ5tJxVfnu+HHIpqvjCc48K3
 R3Z+RMzone8vJwtEIw4oZryTOsn5xL0cT54OwTRKpMYpFn0W15eA1N8lOzyMpJPDfh+6
 6RjoRcxXO9EXFC/LtFpUSdMZAX73ARkTJuSRyCHXqw27Xhh+tx+MfuOT8QzoGJcaiEm/
 uASDm3h5vtZ9JQvykZTGD7h5eW48/3hbBBXmr6euik3uw3cwi8WVkcuYzoiyW12+D1vd
 /dvRAaGBObvEThJBilMIb8osp36ivn4Utv7u04GFVnPZQXD/xyHz+W9+fG9Xu02RS/U6
 y0HQ==
X-Gm-Message-State: AOAM531Vb7+oJi4bECvh2C1NnsNqqckIE/rLbJ5LfgR3Mw6bzC9ogd6J
 7yhHwEf1VpXFcbODUESjpW8R4A==
X-Google-Smtp-Source: ABdhPJzm99wkVLs46wgdWfwHxpjBkxB/CjtRefxO9yHggzTPq1f+lo+JpxkSE3RoB7M7ZoU8GeflUQ==
X-Received: by 2002:a17:90a:884:b0:1d9:531c:9cd6 with SMTP id
 v4-20020a17090a088400b001d9531c9cd6mr5252453pjc.211.1651347760712; 
 Sat, 30 Apr 2022 12:42:40 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 n9-20020aa79049000000b0050dc762813bsm1878280pfo.21.2022.04.30.12.42.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 12:42:40 -0700 (PDT)
Message-ID: <1160b611-0388-bff5-c070-01bbedda5f74@linaro.org>
Date: Sat, 30 Apr 2022 12:42:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 04/12] configure: introduce --cross-prefix-*=
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220429141813.328975-1-pbonzini@redhat.com>
 <20220429141813.328975-5-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220429141813.328975-5-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/29/22 07:18, Paolo Bonzini wrote:
>   # cross compilers defaults, can be overridden with --cross-cc-ARCH
> -: ${cross_cc_aarch64="aarch64-linux-gnu-gcc"}
> +: ${cross_prefix_aarch64="aarch64-linux-gnu-"}
> +: ${cross_prefix_aarch64_be="$cross_prefix_aarch64"}
> +: ${cross_prefix_alpha="alpha-linux-gnu-"}
> +: ${cross_prefix_arm="arm-linux-gnueabihf-"}
> +: ${cross_prefix_armeb="$cross_prefix_arm"}
> +: ${cross_prefix_hexagon="hexagon-unknown-linux-musl-"}
> +: ${cross_prefix_hppa="hppa-linux-gnu-"}
> +: ${cross_prefix_i386="i686-linux-gnu-"}
> +: ${cross_prefix_m68k="m68k-linux-gnu-"}
> +: ${cross_prefix_microblaze="microblaze-linux-musl-"}
> +: ${cross_prefix_mips64el="mips64el-linux-gnuabi64-"}
> +: ${cross_prefix_mips64="mips64-linux-gnuabi64-"}
> +: ${cross_prefix_mipsel="mipsel-linux-gnu-"}
> +: ${cross_prefix_mips="mips-linux-gnu-"}
> +: ${cross_prefix_nios2="nios2-linux-gnu-"}
> +: ${cross_prefix_ppc="powerpc-linux-gnu-"}
> +: ${cross_prefix_ppc64="powerpc64-linux-gnu-"}
> +: ${cross_prefix_ppc64le="$cross_prefix_ppc64-"}
> +: ${cross_prefix_riscv64="riscv64-linux-gnu-"}
> +: ${cross_prefix_s390x="s390x-linux-gnu-"}
> +: ${cross_prefix_sh4="sh4-linux-gnu-"}
> +: ${cross_prefix_sparc64="sparc64-linux-gnu-"}
> +: ${cross_prefix_sparc64="sparc64-linux-gnu-"}
> +: ${cross_prefix_x86_64="x86_64-linux-gnu-"}

sparc64 listed twice -- was this intended to be sparc(32)?

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

