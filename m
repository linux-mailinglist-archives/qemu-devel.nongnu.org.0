Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 353FC541F78
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 01:25:47 +0200 (CEST)
Received: from localhost ([::1]:34446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyia0-00018I-Hh
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 19:25:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyhbe-00084w-93
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 18:23:22 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:33480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyhbc-0007V1-OU
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 18:23:22 -0400
Received: by mail-pl1-x62a.google.com with SMTP id f9so5551200plg.0
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 15:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=q66yRfoRNu/P2XPKSObPOd4KY8fvv5FhIw/05WBJnLA=;
 b=TK7BZCLOhPGJnfI+Qn4zvm+wIA9RNLdM7ssFLwc9F6H8mNdubztF68i08xDQTiGLBY
 BK2dy75a1i/tWrbuve6vz2rTdYUqzRwcOfHpfC69uCRbPc3YcOwRn9W1D1+VlxcZXiH2
 i5FX13CukC4prjOcBcM/VzxVBx6Wj0lGpjR1j2ikn0R8EMi+YkWr3n1OPDbK5SJfBf3U
 VkVMjtmFSEfvJOR0SNOT5RLHxYOjzT1dPiXUX3U9fE4EqUYrnLtK+9qe+oCe7UUzckus
 yHkis9fBm4xAnsTe7p6ZyYIlOfNTfdM2uO9SgrzqgT+rio4L5Lms/0H1Zu4+phHuN9sg
 Cg3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=q66yRfoRNu/P2XPKSObPOd4KY8fvv5FhIw/05WBJnLA=;
 b=HZ//Gqxi359JYvgcC2CA11yXe/gw+XF4+1v8AC2cR0bU/9M/moFMIXCec30+/nSwik
 2NvhT5Ewn+q+O3ngazcqyGmDO0St4n+g7w7h3N0p9geK9nFK+QT9CXkz6T04jbu0VQq+
 IM73vTw/ExCHedAeXii6I85RcGYqGrU0OH7JewMMmGiW28P8jmLWOoH128gk3ovF52es
 zA06/gBmzxKVGY8BVpeB4IlKBTu8uIQHql3BxZIK4aCzBFyV1xmjzzI5ZpWRC+YwLENr
 FfvxoZDJ8eMzwZTwKhrz9Ht7LVJavMdX6J59aydVAkJIrWpFBNoCB91tWjMCRiIpzc8A
 15fQ==
X-Gm-Message-State: AOAM533AdlDkDuYSBRW80GG7BSGB5oEawozf54rkm23M2dMxWdQyKwNS
 kGg6qwyx8zfsqlg7II3O1okMjQ==
X-Google-Smtp-Source: ABdhPJwDrShPlaJYgo/UJVCexiILw2ninouLVSmgQiXJGfgGw7oqV67p2EiVI5Q6yJCoAScA9b3RwA==
X-Received: by 2002:a17:902:70c1:b0:163:5a8f:9df9 with SMTP id
 l1-20020a17090270c100b001635a8f9df9mr31020737plt.9.1654640599118; 
 Tue, 07 Jun 2022 15:23:19 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:3cf2:c634:5b19:25f6?
 ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a170902ea4a00b00163e459be9asm6051467plg.136.2022.06.07.15.23.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 15:23:18 -0700 (PDT)
Message-ID: <35407e39-ac93-b5c0-c634-975ab8609a92@linaro.org>
Date: Tue, 7 Jun 2022 15:23:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/6] bsd-user/freebsd/os-syscall.c: unlock_iovec
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gleb Popov <arrowd@freebsd.org>, 
 Konrad Witaszczyk <def@freebsd.org>, Jessica Clarke <jrtc27@freebsd.org>, 
 Kyle Evans <kevans@freebsd.org>
References: <20220607201440.41464-1-imp@bsdimp.com>
 <20220607201440.41464-3-imp@bsdimp.com>
 <4279f170-76df-c329-24ec-26e1e68446eb@linaro.org>
 <CANCZdfq5L5Q3ePmdF6_ap73h5CGgtc6ZVK0e+tPfUOqW5SKBkw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CANCZdfq5L5Q3ePmdF6_ap73h5CGgtc6ZVK0e+tPfUOqW5SKBkw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

On 6/7/22 14:51, Warner Losh wrote:
>     void unlock_iovec(IOVecMap *map, bool copy_out)
>     {
>           for (int i = 0, count = map->count; i < count; ++i) {
>               if (map->host[i].iov_base) {
>                   abi_ulong target_base = tswapal(map->target[i].iov_base);
>                   unlock_user(map->host[i].iov_base, target_base,
>                               copy_out ? map->host[i].iov_len : 0);
>               }
> 
> 
> And wouldn't we want to filter out the iov_base that == 0 since
> we may terminate the loop before we get to the count. When the
> I/O is done, we'll call it not with the number we mapped, but with
> the original number...  Or am I not understanding something here...

I'm not following -- when and why are you adjusting count?


r~

