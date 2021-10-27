Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0864443D381
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 23:05:21 +0200 (CEST)
Received: from localhost ([::1]:37768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfq6p-0004rH-K3
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 17:05:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfq5M-0004Ck-NI
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 17:03:48 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:36564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfq5K-0005oi-O0
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 17:03:48 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 v1-20020a17090a088100b001a21156830bso6186026pjc.1
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 14:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=00Xnqq+6UBMoEMvd35PtHTQ7EvT0JNOEXVL+8cHZ2rM=;
 b=A2/+719vp/zOLrOYTCG7AcwYu8DjuZ475pCNgO+SPekTjuJmdIkt1hKlIbJyb+9ISc
 NCp1Ww/5Y38fF+blXVfK0uMAoA/RBiAO34/zhNkXv9PLDClTTB0uuIXqJmtOa7LC6C83
 4ebHuMv/RY3yAO+xqX28SUtRSLJX7el2eCMzPQ9A24uT3hovuCx+DHmnwdozrPJylIwL
 Oq3MyQtbrdx0k6mJ8nKDEHd/t3EA/zja9r0d9NYUgqusXCk6hDIxg0AB/250bn5hGXVh
 BXeFs1AjE0cimfTCksbtomzE64lvGxnLKAZfljtmP/1L/SYLEp/0iMTGvX9PosmVfsoe
 Hlog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=00Xnqq+6UBMoEMvd35PtHTQ7EvT0JNOEXVL+8cHZ2rM=;
 b=nyWiFTxHOXBQJh2h+SIb9BlAC8LUe05cJw/MSYGgzHFtqVDgv5XropGzqfnl5M1/jG
 iAx2nij3iJ0Y/Bg/Q2Vb4KIh+/cJspiuhG0ndBPsf7DIEH5ekM43zwQ2A2QLGG/SslgR
 upi+xC8jx6X7MonUmpInGcQQdD9moDHLIukwOweyhBi99obrpLVudCiabuXU2AqyOOR9
 351gfu3KKAin3LnP68joka788PeI+J+V8eDEAQt0ZOFI+2i2mma0K71BRq0bQ+JwcEwY
 VMZmXklgxYODQPkIIkVVj+4TYMIxibF/b7ki5/d56Ge6bed9818k3ZjDgV9fjmq8BFqA
 o8Jw==
X-Gm-Message-State: AOAM5310WRURQr6VfOn/VYeh7Eh8ZlKFKQvziqdmdKtMEHts+3oG0p+P
 NjAL7Duj4oNDuSn0lFu/H5ol/Q==
X-Google-Smtp-Source: ABdhPJwvFWt3xqbO0NxVovRD6NARTEJRGgwGJe5MSpJ8o1cQGyzYZnm1ujUMbGaPQ20UHr1tpIYk3g==
X-Received: by 2002:a17:90a:7e82:: with SMTP id j2mr44049pjl.165.1635368624925; 
 Wed, 27 Oct 2021 14:03:44 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id lt10sm600148pjb.43.2021.10.27.14.03.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 14:03:44 -0700 (PDT)
Subject: Re: [PULL 0/8] 9p queue 2021-10-27
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <cover.1635340713.git.qemu_oss@crudebyte.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1a6e0562-984c-a0b4-b385-f88a0427e128@linaro.org>
Date: Wed, 27 Oct 2021 14:03:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <cover.1635340713.git.qemu_oss@crudebyte.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 6:18 AM, Christian Schoenebeck wrote:
> The following changes since commit 931ce30859176f0f7daac6bac255dae5eb21284e:
> 
>    Merge remote-tracking branch 'remotes/dagrh/tags/pull-virtiofs-20211026' into staging (2021-10-26 07:38:41 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/cschoenebeck/qemu.git tags/pull-9p-20211027
> 
> for you to fetch changes up to 7e985780aaab93d2c5be9b62d8d386568dfb071e:
> 
>    9pfs: use P9Array in v9fs_walk() (2021-10-27 14:45:22 +0200)
> 
> ----------------------------------------------------------------
> 9pfs: performance fix and cleanup
> 
> * First patch fixes suboptimal I/O performance on guest due to previously
>    incorrect block size being transmitted to 9p client.
> 
> * Subsequent patches are cleanup ones intended to reduce code complexity.
> 
> ----------------------------------------------------------------
> Christian Schoenebeck (8):
>        9pfs: fix wrong I/O block size in Rgetattr
>        9pfs: deduplicate iounit code
>        9pfs: simplify blksize_to_iounit()
>        9pfs: introduce P9Array
>        fsdev/p9array.h: check scalar type in P9ARRAY_NEW()
>        9pfs: make V9fsString usable via P9Array API
>        9pfs: make V9fsPath usable via P9Array API
>        9pfs: use P9Array in v9fs_walk()
> 
>   fsdev/9p-marshal.c |   2 +
>   fsdev/9p-marshal.h |   3 +
>   fsdev/file-op-9p.h |   2 +
>   fsdev/p9array.h    | 160 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>   hw/9pfs/9p.c       |  70 +++++++++++++----------
>   5 files changed, 208 insertions(+), 29 deletions(-)
>   create mode 100644 fsdev/p9array.h

Applied, with my R-b as I promised upthread.  Thanks.


r~

