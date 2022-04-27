Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F18510D4C
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 02:39:01 +0200 (CEST)
Received: from localhost ([::1]:56194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njVhs-0002Uq-8t
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 20:39:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njVfz-0000vB-Rg
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 20:37:03 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:50789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njVfy-0005n5-0j
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 20:37:03 -0400
Received: by mail-pj1-x102d.google.com with SMTP id iq10so123278pjb.0
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 17:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=0cGR/kC1WoTbFgu1JXgnv0SqceI7tlcyQ81zb7SUM+E=;
 b=k7bnkuuPdi+pp5xCEtIZOSAnznpoMIpj9a48wuTbqXWSfbMDFVrgmmSDr0WSN/A/yk
 Rfsh4hDVIHOSQRFNmUhbAh+EYoMx+6q+svkySQjDJThDQDNPkczEK+GwOARxN0wMNkGO
 LOEoa8XJEyT1zDLXZqbCYLBqlER2ndp+NXQ2uzPlyv1s2L3IWu8whhtxFXwgur8VqrjS
 ts2TadGK1ZQSa/FyTh3T4kLxG25Wv4Fpj8ui5RGJRLO+j45IinLUiITi4MwLut4PnPwc
 wItEU9amAToVuOGXhru9S2IbUjHfya0D2rwYJIeqU7l/4TX0iRjjkQ0HLiloVYGMdTd+
 zJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0cGR/kC1WoTbFgu1JXgnv0SqceI7tlcyQ81zb7SUM+E=;
 b=0gCdxEOzTnmKfUfiLRjcF6LRsP59Dydx9houhi3qZwhYDv+yyuR7WKHSQazST1HS9q
 RHZ7ecK8SmLGoxOltzIP0Q8P9UTmr6nEo3BwhSGNAgu9+MP9tHDSNqNvl3/g02NjPmz3
 KBMz3xKcv4nMnNicYKKxfj3sZ54I8doZuIzOfxMU9ynAsdXMHNMdQ9MPE81c5DkCxql2
 uKPa/xLoM4AjGvBsZuQAEbxTF4qDqmKNR9QdtqjLXEKuFwgJCeofrMLXNnH61xbq2oPS
 gc24gwUnNCJuKi66zaFosPgdFIg+XOZHbG8snTGQuWBnDNxQ6NSdD8Zl80a7jsZgWQ4V
 oTMg==
X-Gm-Message-State: AOAM532Yz6BoHsx9a9KvUoHag9MbgIxdEpZG28AG6Ya5wdmWq7aA0MX6
 8RjBuYu4G6UnvITAJ7i5wf6IAw==
X-Google-Smtp-Source: ABdhPJyNjAthWH6yPS9xUDZGerbkz9AodZxrig45svk+hDQSlw+KVWikNehiMMXdmk5XfMm4cx/T8A==
X-Received: by 2002:a17:902:d507:b0:15d:11cf:ca68 with SMTP id
 b7-20020a170902d50700b0015d11cfca68mr13211461plg.38.1651019820363; 
 Tue, 26 Apr 2022 17:37:00 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 u26-20020a63471a000000b003aa1ad643bdsm14096169pga.47.2022.04.26.17.36.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 17:36:59 -0700 (PDT)
Message-ID: <41113410-3c82-6b7b-e546-5b6d0728a92a@linaro.org>
Date: Tue, 26 Apr 2022 17:36:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 00/13] NBD patches through 2022-04-26
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20220426201514.170410-1-eblake@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220426201514.170410-1-eblake@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

On 4/26/22 13:15, Eric Blake wrote:
> The following changes since commit 80a172de5592b5c33aa6bc30da6f16c4ad1ae390:
> 
>    Merge tag 'trivial-branch-for-7.1-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2022-04-26 07:54:22 -0700)
> 
> are available in the Git repository at:
> 
>    https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2022-04-26
> 
> for you to fetch changes up to 620c5cb5da57dc97f655e6218e7ca9bc896394a2:
> 
>    nbd: document what is protected by the CoMutexes (2022-04-26 13:16:42 -0500)
> 
> ----------------------------------------------------------------
> nbd patches for 2022-04-26
> 
> - Paolo Bonzini: thread-safety improvements to NBD client
> - Vladimir Sementsov-Ogievsky: finer-grained selection of bitmaps during
>    nbd-export
> 

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~



> ----------------------------------------------------------------
> Paolo Bonzini (9):
>        nbd: safeguard against waking up invalid coroutine
>        nbd: mark more coroutine_fns
>        nbd: remove peppering of nbd_client_connected
>        nbd: keep send_mutex/free_sema handling outside nbd_co_do_establish_connection
>        nbd: use a QemuMutex to synchronize yanking, reconnection and coroutines
>        nbd: code motion and function renaming
>        nbd: move s->state under requests_lock
>        nbd: take receive_mutex when reading requests[].receiving
>        nbd: document what is protected by the CoMutexes
> 
> Vladimir Sementsov-Ogievskiy (3):
>        qapi: rename BlockDirtyBitmapMergeSource to BlockDirtyBitmapOrStr
>        qapi: nbd-export: allow select bitmaps by node/name pair
>        iotests/223: check new possibility of exporting bitmaps by node/name
> 
>   qapi/block-core.json                   |   6 +-
>   qapi/block-export.json                 |   5 +-
>   block/coroutines.h                     |   5 +-
>   include/block/block_int-global-state.h |   2 +-
>   block/monitor/bitmap-qmp-cmds.c        |   6 +-
>   block/nbd.c                            | 286 +++++++++++++++++----------------
>   blockdev-nbd.c                         |   8 +-
>   nbd/server.c                           |  63 +++++---
>   qemu-img.c                             |   8 +-
>   qemu-nbd.c                             |  11 +-
>   tests/qemu-iotests/223                 |  16 ++
>   tests/qemu-iotests/223.out             |  47 +++++-
>   12 files changed, 282 insertions(+), 181 deletions(-)
> 


