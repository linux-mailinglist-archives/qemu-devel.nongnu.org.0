Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 359AE50EAB1
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 22:36:27 +0200 (CEST)
Received: from localhost ([::1]:45570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj5Ra-0005Yq-4y
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 16:36:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nj5Qc-0004bC-Um
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 16:35:26 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:36432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nj5Qb-00061x-BU
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 16:35:26 -0400
Received: by mail-pl1-x62b.google.com with SMTP id q8so5100161plx.3
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 13:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=SLZZsRwOVEr1h7Zw3TExL5rYmQuAdJqbt6lFKY0oJEE=;
 b=Oi4qS+4sEq6Pfc2Pz7rAmX6aVnZbMLaj0eWK4Mh35ybsGeQJvA5BVZUYx07arG9Cf1
 6srFkRxDw2fmaaW45myk9kCGiTv1BfIYF+0a/rPpGd4ObWFDSk5qblt5qVzRPEq5+RSf
 WjMT09pe53+SBTN07SFFkGIocTpQO+eZwEffosahsW0+AEZSeCJt/X1by6yRWAUPzRdK
 8RnENSFWEL3FZIKwo043twgQBazW9h18Jug0gPW0Gyq92kJndNTj3YRa+8yjDUquQp6g
 hUjZgpEBTTDSAhUayx+vv7n0yQYn3WujA2pseacYDFZOTwt9UrXm0523EL2x+U+C/QWF
 sUOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SLZZsRwOVEr1h7Zw3TExL5rYmQuAdJqbt6lFKY0oJEE=;
 b=vsss/bwehb08xHWLqHOyUk6uLr25jnFH6/eIZBELC2Udxvt77wnbDAb61qT66BZn+p
 a+cuZss/9pabjHpqceiAVQ539T0VW+ZiKGOZmLkTB7eElAurQCtskZZOQikMqdaRhSL2
 TJ/6+pLggNmgFsWSVCc20Acw7bi6IVEi1A2ZI/+HTwFQG2aE0xh8rhWWFA3eOyrzy+r5
 HQdjKNSIdN83m6Hh4iJBvh0K7uKsQ17Y+71r13iwkHbbiMWtMWAt5RSLKqSL7wEkYlun
 TPSwiNXtZ8NUk26owNsOngUYDab9l4fpDfHkOMgQJtfqd02oh+f6HcUWH5jcoawhBypp
 H6Eg==
X-Gm-Message-State: AOAM530+c6VmFEL5HrDwzAxDTDlrgdc9fJp7hSEMDI4gkjAUvlLcp7cU
 sqbqIxma4qkLtWwK55GTDWZO+Q==
X-Google-Smtp-Source: ABdhPJwwXIBlS01imKfVhxJdMkNBv/FG8zxSxc4JzRSfXDJE4zjAtuPl7fsKQBjeCzRAHlt1KIOGjw==
X-Received: by 2002:a17:90b:17cf:b0:1d2:8430:13a5 with SMTP id
 me15-20020a17090b17cf00b001d2843013a5mr22526178pjb.154.1650918923859; 
 Mon, 25 Apr 2022 13:35:23 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 w123-20020a623081000000b005056a4d71e3sm12449019pfw.77.2022.04.25.13.35.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 13:35:23 -0700 (PDT)
Message-ID: <cc37f682-0da0-f62e-e919-83c6122df2f5@linaro.org>
Date: Mon, 25 Apr 2022 13:35:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 0/3] Block patches
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20220425084844.1086768-1-stefanha@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220425084844.1086768-1-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/25/22 01:48, Stefan Hajnoczi wrote:
> The following changes since commit 9c125d17e9402c232c46610802e5931b3639d77b:
> 
>    Merge tag 'pull-tcg-20220420' of https://gitlab.com/rth7680/qemu into staging (2022-04-20 16:43:11 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/stefanha/qemu.git tags/block-pull-request
> 
> for you to fetch changes up to d45c83328feab2e4083991693160f0a417cfd9b0:
> 
>    virtiofsd: Add docs/helper for killpriv_v2/no_killpriv_v2 option (2022-04-21 12:05:15 +0200)
> 
> ----------------------------------------------------------------
> Pull request
> 
> Small contrib/vhost-user-blk, contrib/vhost-user-scsi, and tools/virtiofsd
> improvements.

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~



> 
> ----------------------------------------------------------------
> 
> Liu Yiding (1):
>    virtiofsd: Add docs/helper for killpriv_v2/no_killpriv_v2 option
> 
> Sakshi Kaushik (1):
>    Implements Backend Program conventions for vhost-user-scsi
> 
> Stefan Hajnoczi (1):
>    contrib/vhost-user-blk: add missing GOptionEntry NULL terminator
> 
>   docs/tools/virtiofsd.rst                  |  5 ++
>   contrib/vhost-user-blk/vhost-user-blk.c   |  3 +-
>   contrib/vhost-user-scsi/vhost-user-scsi.c | 77 +++++++++++++++--------
>   tools/virtiofsd/helper.c                  |  3 +
>   4 files changed, 62 insertions(+), 26 deletions(-)
> 


