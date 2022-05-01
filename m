Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C47C451663B
	for <lists+qemu-devel@lfdr.de>; Sun,  1 May 2022 18:54:21 +0200 (CEST)
Received: from localhost ([::1]:37244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlCpw-0000yc-Ek
	for lists+qemu-devel@lfdr.de; Sun, 01 May 2022 12:54:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlCoc-000809-DM
 for qemu-devel@nongnu.org; Sun, 01 May 2022 12:52:58 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:50745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlCoa-0007J4-KN
 for qemu-devel@nongnu.org; Sun, 01 May 2022 12:52:58 -0400
Received: by mail-pj1-x1033.google.com with SMTP id iq10so11010809pjb.0
 for <qemu-devel@nongnu.org>; Sun, 01 May 2022 09:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KCmm02I6cnLQdS6T5x7S1yyDZ2HGSe+JxRc8N8uoyV4=;
 b=l3h1QDsNpEDJ1MUylw8O4uS/2pTOs75Pac71vGocN9U/g1tzqmXJo2m+9d1rBf1JLm
 +rNo9wMzIWnNx6T3wG4OwQ6+peoBaUJO9uw7jiGVffGtzWUS2SOx97nAmWYDoaJju/DB
 rlAhrNvdOKLA/i4ffL6Th8AUjwngf9t9gbd5GdFx7hi9ktH4QyTHeNyADryQjdiKAzPI
 g0K1Jj7latBaQ3x7RKnbl7aJQcHEIwiGGXUpDUTZiA2DejYbwCCSnpSEUtPYOoqw3+DP
 OzUeUXcmCz7GoHuB/Xa33iFQZmO7dHdZs7PhMO9sToDChjhdUzvSPqMGnQb8BNbxc79a
 XtdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KCmm02I6cnLQdS6T5x7S1yyDZ2HGSe+JxRc8N8uoyV4=;
 b=FWGZOteOH/ekCGkJEngtXq+XWblBFMcenxXuYcVFuT98TDWk5k9LjVO2rsUMP+vKAh
 V9ERDgtF9q2avIL31z8u/zG1v6zPRYEwSnsyjwzfJZauHno3Wu5+XA+/E7UOnLpMe2nP
 8n/jhhDDU+TogANBbDICc1xNHb+ZBPh8lUi4IqshISbKcAKTIlaJvWCwaNGY1e6tDMU9
 +2u9Cqy/64jP6770KisdSoCew1Tqr9ik4o71TNI8u1NRZf7r3Grqww7r4TP8mkm2RZII
 U5JlFE4LSP9DSnW7KVS6xpH7BwCrrZ16l80E0uFAb14VIEB/I9BhTOojWY4eS+TH3Atn
 dQeg==
X-Gm-Message-State: AOAM53261WqypDN3aGZXT7stz+yF1+TT4UfDrdwPxnpp2uvwgj2zeIrN
 TYdSxm0lDGGkoFH8iongalDKAA==
X-Google-Smtp-Source: ABdhPJy3aA+iYU6z8K9GZDRchFqkoE4wVZsl3csILkkA9GfnPIygos4xLUxkZPJk5YJhuHEIcQqKdQ==
X-Received: by 2002:a17:90a:b797:b0:1d4:f7be:2eeb with SMTP id
 m23-20020a17090ab79700b001d4f7be2eebmr13826959pjr.217.1651423974938; 
 Sun, 01 May 2022 09:52:54 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a170902a60700b0015e8d4eb2cesm3096895plq.280.2022.05.01.09.52.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 May 2022 09:52:54 -0700 (PDT)
Message-ID: <0d9d067d-3372-6267-bc94-0af3af05e46f@linaro.org>
Date: Sun, 1 May 2022 09:52:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL v2 0/7] 9p queue 2022-05-01 (previous 2022-04-30)
Content-Language: en-US
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <cover.1651410615.git.qemu_oss@crudebyte.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <cover.1651410615.git.qemu_oss@crudebyte.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: Will Cohen <wwcohen@gmail.com>, Greg Kurz <groug@kaod.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/1/22 06:10, Christian Schoenebeck wrote:
> The following changes since commit 731340813fdb4cb8339edb8630e3f923b7d987ec:
> 
>    Merge tag 'pull-riscv-to-apply-20220429' of github.com:alistair23/qemu into staging (2022-04-29 08:46:55 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/cschoenebeck/qemu.git tags/pull-9p-20220501
> 
> for you to fetch changes up to 063c75db2e03938b2fadb052c4661adae36e352c:
> 
>    9pfs: fix qemu_mknodat() to always return -1 on error on macOS host (2022-05-01 14:07:03 +0200)
> 
> ----------------------------------------------------------------
> 9pfs: various fixes
> 
> * macOS: Fix recently (in QEMU 7.0) added 9p support for macOS hosts.
> 
> * Tests: Fix inode sequencing in 'synth' driver.

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


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


