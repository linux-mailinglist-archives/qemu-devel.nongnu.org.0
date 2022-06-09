Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 494E054557D
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 22:22:12 +0200 (CEST)
Received: from localhost ([::1]:54492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzOfS-0006lp-Su
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 16:22:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzObn-0004lL-4B
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:18:23 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:54058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzObl-0006oP-CA
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:18:22 -0400
Received: by mail-pj1-x1029.google.com with SMTP id a10so22288476pju.3
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 13:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=QNQgm+cW6Gv7mdifYLUFJlGVLq+XhHVP82xFs87VHws=;
 b=M6W1DQMfaZ6Vaa35pwi4rsk9XMeFxdtQ1sLrBOQM3ioOTD0tA6lwOFkA9eZTddiUK9
 ztWqu4m2V9L8cwG40mLDR/flU7+gH+4QwzmXAVNDe3ipPXaeOwBCo3LqQ3NnVFv19UXi
 myB1fKdW76ShhqCMab+rPvzJA3NKaInOMRph6NWzFnxeNoiXonAskqamhnaSUivE7Zqk
 62UXy3LonIkZLh3TODO1SykXvtU8lG+zrR6jvh8zX3R8pENkqLAjW5RxGqq7YhNK4at9
 7CPegjC2xCv5h3b4VS/+SfcE3nkd1RlvxOZ59g5HmQxulJd66yeZVqSd9eOKbjnFSIoy
 chkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QNQgm+cW6Gv7mdifYLUFJlGVLq+XhHVP82xFs87VHws=;
 b=F/IdFD5xHUueHhe+Wsxya58SkfgfgLiPi5bSbZ3CjtNXRqT+43eJY9PJuaMlMUjnvP
 JNn4g4bWo0ppM8ewTEwgnADSyyqSLEOBzVmjeS3tg223F4b6c4o8uUcaPp8U8Hh20WFi
 WEm2173N9gIZeutCkNi5bSz9GojAd8XObCp4e+uimbH2pdAl5n3X0gif7cvuCxQjNymV
 syqQQuPzmiB6O4ZtU2cZhr9bQ/4YactWxIKTWLbiYtUcfOBvQALOhdRoQgI2432mhcA8
 x2eJrfC81C+zqJtyCjXM32aPy0E1btI4ZfT5hAMH/lCMBF14Qz4HBxJ/ZbI+BxF+77Rg
 0cOA==
X-Gm-Message-State: AOAM5316ZnYluZFAYWI8PF68OqGn/qrIfPFXAnCU9aIh9sl0i/02LNiH
 /gVE9llxLgrlUsfsz1MOhGIr5g==
X-Google-Smtp-Source: ABdhPJzXxwZVEcSSsTqBVRVzEBLxHO7n0lIHlwRf8LAyda2KM8RCTGJWAo9r3Xw5NPvih4vsSd0WSQ==
X-Received: by 2002:a17:903:187:b0:166:4360:a4fa with SMTP id
 z7-20020a170903018700b001664360a4famr39122877plg.87.1654805898664; 
 Thu, 09 Jun 2022 13:18:18 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:839f:476f:678:38a?
 ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 x25-20020aa78f19000000b0051bfd13809fsm11201753pfr.119.2022.06.09.13.18.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jun 2022 13:18:18 -0700 (PDT)
Message-ID: <a8b15969-fafa-e088-d778-278891c3970e@linaro.org>
Date: Thu, 9 Jun 2022 13:18:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 00/18] Block layer patches
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20220609172149.293877-1-kwolf@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220609172149.293877-1-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/9/22 10:21, Kevin Wolf wrote:
> The following changes since commit 028f2361d0c2d28d6f918fe618f389228ac22b60:
> 
>    Merge tag 'pull-target-arm-20220609' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-06-09 06:47:03 -0700)
> 
> are available in the Git repository at:
> 
>    git://repo.or.cz/qemu/kevin.git tags/for-upstream
> 
> for you to fetch changes up to 7f9a8b3342ff00d3398fdc08264948762d748edb:
> 
>    nbd: Drop dead code spotted by Coverity (2022-06-09 18:07:17 +0200)
> 
> ----------------------------------------------------------------
> Block layer patches
> 
> - Add vduse-blk export
> - Dirty bitmaps: Fix and improve bitmap merge
> - gluster: correctly set max_pdiscard
> - rbd: report a better error when namespace does not exist
> - aio_wait_kick: add missing memory barrier
> - Code cleanups

Several sets of compile failures:

https://gitlab.com/qemu-project/qemu/-/jobs/2571008901

../subprojects/libvduse/libvduse.c:578:20: error: unused function 
'vring_used_flags_set_bit' [-Werror,-Wunused-function]
static inline void vring_used_flags_set_bit(VduseVirtq *vq, int mask)
                    ^
../subprojects/libvduse/libvduse.c:587:20: error: unused function 
'vring_used_flags_unset_bit' [-Werror,-Wunused-function]
static inline void vring_used_flags_unset_bit(VduseVirtq *vq, int mask)
                    ^

https://gitlab.com/qemu-project/qemu/-/jobs/2571008908

../meson.build:1652:2: ERROR: Tried to use 'add_global_arguments' after a build target has 
been declared.

https://gitlab.com/qemu-project/qemu/-/jobs/2571008833

../subprojects/libvduse/libvduse.c:325:20: error: cast to pointer from integer of 
different size [-Werror=int-to-pointer-cast]
   325 |             munmap((void *)dev->regions[i].mmap_addr,
       |                    ^
../subprojects/libvduse/libvduse.c: In function 'vduse_dev_create':
../subprojects/libvduse/libvduse.c:1318:54: error: format '%lu' expects argument of type 
'long unsigned int', but argument 3 has type 'uint64_t' {aka 'long long unsigned int'} 
[-Werror=format=]
  1318 |         fprintf(stderr, "Failed to set api version %lu: %s\n",
       |                                                    ~~^
       |                                                      |
       |                                                      long unsigned int
       |                                                    %llu
  1319 |                 version, strerror(errno));
       |                 ~~~~~~~
       |                 |
       |                 uint64_t {aka long long unsigned int}


r~

