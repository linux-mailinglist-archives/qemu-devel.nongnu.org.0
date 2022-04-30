Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8439515F4E
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 18:39:39 +0200 (CEST)
Received: from localhost ([::1]:50724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkq8A-0006aB-Bu
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 12:39:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkq6N-0005t4-Kl
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 12:37:47 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:43651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkq6L-0006IF-RO
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 12:37:47 -0400
Received: by mail-pf1-x432.google.com with SMTP id y14so9278234pfe.10
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 09:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8IdIOxsA3sRxDm+OVjN0kPpXjSZAZRYiYS+vIZow+t0=;
 b=HiO9AWU0uElPKjcRWnQS4r6uEIWBDzfbL94cRp85waXRgEAvTcnfRzN7e9VeJamK9l
 3CR1Tql8Dh9YkUJVJKCjLGAj9eXeWZVsJ6f2M4W89EgDYjJ4cJgZJtjCZixrjE3wpiay
 YPPubhLOTz1dx5EVdWlMzfunlVCWWjBqmavL0lcoyx9JKR1m0UnspDl78BwHzjw5YC48
 YnGZSs6lcpCg4S/nXVWdIm1gT0KAdUaEXVYMbQ48eoRJFsglM3lzE1GMHJWJHuwVA8bF
 jNXV6EqB89R0za9GZRUsgSXPfkXX9g5GWXXvt/PhvXYpndQ54VsQug6YKQLhzU4GsmSx
 WDPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8IdIOxsA3sRxDm+OVjN0kPpXjSZAZRYiYS+vIZow+t0=;
 b=eeuWwNnjN3dnrKHI+QXbtAaeJzJWSpMdQADrWQMmFIvUv7DMUnIsHFnkoSmXF75Fca
 BquJJuVSKyive5Po5GA1MdiY2jIDv1gT30enCwqc/QzMW/clJMoNaMytmM+QNb4n9gSi
 P4mfuNq9otY9vSO/wmKicUDxouhpWdRbaVpue9KY2bo04tXatdRQlvk/k0Ot1S0B++fV
 HLfzwy78K9fcESJSXgEVpatltkETFc5z40CG/7Gg2vK01eo+SvEcOpwhx1CW7HBRXIEa
 g3b4qTnm2+1YjXF3Qkq3lzsYc7zjiw/RKrKNXag20vYpTWOxFRHgwFkAGY6bb68L3itN
 U21w==
X-Gm-Message-State: AOAM532ipVAwh3NbInKZzU5cFuNPB/iuIMRUFLeokGstbruKQLtU6WYF
 AatDtJtt8x2wrml+ojJSz6RNFg==
X-Google-Smtp-Source: ABdhPJys/vhfH/DknGuX2lg9gTCwaoUWOirFU2VXC5ZtwmVxxGN3kZI2R5Z6DQPjkNiralo+3mYbHA==
X-Received: by 2002:a63:34cd:0:b0:3ab:a3e8:7b48 with SMTP id
 b196-20020a6334cd000000b003aba3e87b48mr3697979pga.524.1651336663894; 
 Sat, 30 Apr 2022 09:37:43 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 d21-20020a170902b71500b0015e8d4eb2c0sm1678635pls.266.2022.04.30.09.37.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 09:37:43 -0700 (PDT)
Message-ID: <d218e8b7-2d0c-a24c-7fff-c33d175549c8@linaro.org>
Date: Sat, 30 Apr 2022 09:37:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 0/7] 9p queue 2022-04-30
Content-Language: en-US
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <cover.1651319081.git.qemu_oss@crudebyte.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <cover.1651319081.git.qemu_oss@crudebyte.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Cc: Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/30/22 04:44, Christian Schoenebeck wrote:
> The following changes since commit 731340813fdb4cb8339edb8630e3f923b7d987ec:
> 
>    Merge tag 'pull-riscv-to-apply-20220429' of github.com:alistair23/qemu into staging (2022-04-29 08:46:55 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/cschoenebeck/qemu.git tags/pull-9p-20220430
> 
> for you to fetch changes up to e8fb9ed725fe2ed00a275674a84beb5ba6e538a7:
> 
>    9pfs: fix qemu_mknodat() to always return -1 on error on macOS host (2022-04-30 13:11:48 +0200)
> 
> ----------------------------------------------------------------
> 9pfs: various fixes
> 
> * macOS: Fix recently (in QEMU 7.0) added 9p support for macOS hosts.
> 
> * Tests: Fix inode sequencing in 'synth' driver.
> 
> ----------------------------------------------------------------
> Christian Schoenebeck (7):
>        9pfs: fix inode sequencing in 'synth' driver
>        9pfs: fix qemu_mknodat(S_IFREG) on macOS
>        9pfs: fix qemu_mknodat(S_IFSOCK) on macOS
>        9pfs: fix wrong encoding of rdev field in Rgetattr on macOS
>        9pfs: fix wrong errno being sent to Linux client on macOS host
>        9pfs: fix removing non-existent POSIX ACL xattr on macOS host
>        9pfs: fix qemu_mknodat() to always return -1 on error on macOS host
> 
>   hw/9pfs/9p-posix-acl.c   | 12 +++++++--
>   hw/9pfs/9p-synth.c       |  4 +--
>   hw/9pfs/9p-util-darwin.c | 54 +++++++++++++++++++++++++++++++++++--
>   hw/9pfs/9p-util.h        | 69 ++++++++++++++++++++++++++++++++++++++++++++++++
>   hw/9pfs/9p.c             |  4 ++-
>   5 files changed, 136 insertions(+), 7 deletions(-)
> 

Fails with

../hw/9pfs/9p-util-darwin.c:107:46: error: use of undeclared identifier 
'AT_SYMLINK_NOFOLLOW_ANY'
     err = fchmodat(AT_FDCWD, filename, mode, AT_SYMLINK_NOFOLLOW_ANY);
                                              ^
1 error generated.

https://gitlab.com/qemu-project/qemu/-/jobs/2398467527


r~

