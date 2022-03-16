Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7154DB1D5
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 14:48:36 +0100 (CET)
Received: from localhost ([::1]:45022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUU0x-0000d0-II
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 09:48:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUTah-0000zd-95
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:21:27 -0400
Received: from [2a00:1450:4864:20::435] (port=46957
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUTaf-0003h8-AR
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:21:26 -0400
Received: by mail-wr1-x435.google.com with SMTP id x15so2914971wru.13
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 06:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=jgFHt2cAr7TsiJSo9AGdNUGQ5eRJGR6s65Mk/Ij18ps=;
 b=CU6MxjezWU3IvNAWKKL5X1nZwDG8wfvnDRECQwoWa4B1naywoKcNwPglrGypnYUDHd
 hvFrLE3bXTXA6Pt0236qC+nrBhz+5/3xfSc+ON9UKLxiNKUgzQLa5Mzqt0aRMIlyrrgB
 RFBeP0TQGB1lCc3xldkVeBT5GHYnm2P+4ZCIUQyYcNaNAuWyLMyHSl8iONhmMtKuOETp
 jg3WjEfBg35hVFDw0e2paM1D3qnUXSgA08DqZwHbjSAI3SFnxPaLmC6XziZkkyvnEcgW
 M6GjpyoG7t+9AVALM27pfj1t8MDXBSSJlWL46tpzXItNJy4vjEU0uzJB8uRi4FgRTV6a
 wDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jgFHt2cAr7TsiJSo9AGdNUGQ5eRJGR6s65Mk/Ij18ps=;
 b=TuIv/6vKlOhAelV+vW02LJ+k/2jBkElTxoEshwQAEJdXZzNgR0Cg+/MQygJhGhOXor
 rFq7kr4ToH9lBEraXt7gAkfQ2tXcxcmFzYUh8f3lt0OCtId+Yuc0YxAKKkYfqHtLFDgH
 RPci9Cad7HmAuKAVi+FcGZ363JHrtPpzexhNOQ0qe4BFg0UV3E3xlJdEVECDLuR1ZWP+
 YKexkp1hZBvITtYS22UgB3f60ZtscK3e7aml/A8o4/LoBN9FlzQkXufwnU2lrYXCKsf2
 V8e/4t1K3Ig+2tBWlSFxfS4TK2yjQTLFv0SeyEGekxDYvbxJBIDcCaZGTxEFezUpnVeh
 PrlA==
X-Gm-Message-State: AOAM533qzmHdnIYLDWQdPJG1Y46Okebp4zgqpU8i8A7NokhBs2TOaq2l
 xLbCTcR2x99Y03YxNMSiiF2WU+1wkdc=
X-Google-Smtp-Source: ABdhPJwrtmCXs+SAxiWdmo4SxFAA36gGj979pf7MGLhe+9y0Sj2uIRfsqH8kxi+iiktjZXCp5YKepA==
X-Received: by 2002:a5d:4c4a:0:b0:1f1:e43d:c9ba with SMTP id
 n10-20020a5d4c4a000000b001f1e43dc9bamr23114986wrt.677.1647436883804; 
 Wed, 16 Mar 2022 06:21:23 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a5d64cc000000b00203d01e1075sm1840350wri.50.2022.03.16.06.21.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 06:21:23 -0700 (PDT)
Message-ID: <661bc3ca-25f6-428a-3e3b-8e8babb7a51d@gmail.com>
Date: Wed, 16 Mar 2022 14:21:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 00/27] Misc fixes and cleanups for 7.0?
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220316095156.2613419-1-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220316095156.2613419-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 16/3/22 10:51, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Hi,
> 
> Various clean-up and fixes patches that might be worth it for 7.0.
> Some of the patches have been posted and reviewed before.
> 
> Marc-André Lureau (27):
>    m68k/nios2-semi: fix gettimeofday() result check
>    meson: remove bsd_oses
>    meson: use chardev_ss dependencies
>    meson: add util dependency for oslib-posix on freebsd
>    char: move qemu_openpty_raw from util/ to char/
>    Drop qemu_foo() socket API wrapper
>    Replace GCC_FMT_ATTR with G_GNUC_PRINTF
>    compiler.h: replace QEMU_WARN_UNUSED_RESULT with
>      G_GNUC_WARN_UNUSED_RESULT
>    compiler.h: replace QEMU_SENTINEL with G_GNUC_NULL_TERMINATED
>    Replace config-time define HOST_WORDS_BIGENDIAN
>    osdep: poison HOST_WORDS_BIGENDIAN
>    Simplify HOST_LONG_BITS
>    Move HOST_LONG_BITS to compiler.h
>    scripts/modinfo-collect: remove unused/dead code
>    util: remove needless includes
>    util: remove the net/net.h dependency
>    qapi: remove needless include
>    meson: move int128 checks from configure
>    meson: fix CONFIG_ATOMIC128 check
>    qapi: remove needless include
>    qga: remove bswap.h include
>    error-report: replace error progname with glib functions
>    tests: remove needless include
>    Remove trailing ; after G_DEFINE_AUTO macro
>    include/qapi: add g_autoptr support for qobject types
>    tests: replace free_all() usage with g_auto
>    qapi: remove needless include

FYI git-publish eases sending patches to mailing list:

   https://github.com/stefanha/git-publish

