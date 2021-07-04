Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB643BABC9
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 09:18:03 +0200 (CEST)
Received: from localhost ([::1]:39356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzwOA-0004m4-F5
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 03:18:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lzwNB-00047R-3E
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 03:17:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lzwN7-0003Eu-Vj
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 03:17:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625383016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rMFa2rSScLhh8msN873BP9qIishRw227ruLyp9d1sg4=;
 b=H5MVCpG/Df4tt/tMbCrQ9rWotopbWMWu8kjf6ycAv49S7U47+eM4wENo5oSz4wTlhnYHgL
 zjFLjKs8cudOwv6qH2DI5vEhw/oUGRU0eCaUDzSxv+dX1D2sE5NV+GirfU1133abEwNksO
 6Bja+FCl7pO8WG5ixtoLoYKTSyJVKBM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-kTG1c6fpM3SyaX8IJGrGaw-1; Sun, 04 Jul 2021 03:16:55 -0400
X-MC-Unique: kTG1c6fpM3SyaX8IJGrGaw-1
Received: by mail-wm1-f70.google.com with SMTP id
 u64-20020a1cdd430000b02901ed0109da5fso8157374wmg.4
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 00:16:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:references:cc:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rMFa2rSScLhh8msN873BP9qIishRw227ruLyp9d1sg4=;
 b=QPNCVDTMd+fnLu9KQCM+LtzibR9X+ZGnbPu6hbRJhX7SwvduaKB4tYu3mYpkGo4jjy
 ZJI9WMA2z4fv9VKrQttwwmmA+gXkgc7rf5YhhAoj5ngHPNLO7aXIMMfCPn3fLJOnJspF
 4Pa30eUunCRsP8NnZKztU7O4O+g4iQiCNHtGy/sZnWo0Yz2VbVB2J6YEH52KqN2oD3eV
 hp5NAU/0ZNyaAt2joshwN64yIb7AkGztaI/1Z0oKYXahKcVdqlaxvgJFiMRaKVDhBxY2
 ip9AvKfzA8hWrKu4ePHUDGoxPuz0ZthhB2hA7MNQgy49LecTZ85Eqd4dmAJrFUjGOrxA
 mcFw==
X-Gm-Message-State: AOAM531tDZ/AeF7Dph2VUz4MOoogWNd6a0JGujno9RmmYDa/ErwmnC4s
 rgk58BD33LXo9Ztrju2JYF7L/u/bl3nI5QknHrGrPbroTwegvZWdQBJ0i+SJZ9ez3LiXRylY4/T
 t8zXUConO4ByDAG0=
X-Received: by 2002:a7b:cc87:: with SMTP id p7mr8449502wma.2.1625383014209;
 Sun, 04 Jul 2021 00:16:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuXLyj/GT6BL3N8X8HSTFV8VJS2WYUwgUrZIcUfiugbA0gMRMeJK6nsX9tkvVE+oNmST3XQg==
X-Received: by 2002:a7b:cc87:: with SMTP id p7mr8449484wma.2.1625383013997;
 Sun, 04 Jul 2021 00:16:53 -0700 (PDT)
Received: from thuth.remote.csb (p5791d89b.dip0.t-ipconnect.de.
 [87.145.216.155])
 by smtp.gmail.com with ESMTPSA id c16sm8146180wmr.2.2021.07.04.00.16.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Jul 2021 00:16:53 -0700 (PDT)
To: Richard Zak <richard.j.zak@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
References: <CAOakUfOz=89WuCyAQhrebNj_K_3_2ZYAJ_=aRR2bAuKT5=9uow@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 2/2] Fix for Haiku
Message-ID: <557b3546-d263-cfd0-3e49-a1a00eb61b93@redhat.com>
Date: Sun, 4 Jul 2021 09:16:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAOakUfOz=89WuCyAQhrebNj_K_3_2ZYAJ_=aRR2bAuKT5=9uow@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.377,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Eric Blake <eblake@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/07/2021 23.12, Richard Zak wrote:
> Fix for path to env

Please change the subject to something more meaning full, e.g. "Fix setting 
of the SHELL variable for Haiku".

In the patch description, you should mention that there is no /usr/bin/env 
on Haiku.

> Signed-off-by: Richard Zak <richard.j.zak@gmail.com 
> <mailto:richard.j.zak@gmail.com>>
> ---
>   Makefile | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 30f19d33bb..ced9b97372 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -14,7 +14,11 @@ SRC_PATH=.
>   # we have explicit rules for everything
>   MAKEFLAGS += -rR
> 
> +ifneq ($(BE_HOST_CPU),)
> +SHELL = /bin/env bash -o pipefail
> +else
>   SHELL = /usr/bin/env bash -o pipefail
> +endif

Actually, I wonder why we had to take the detour via /usr/bin/env here at 
all? Couldn't we simply set

SHELL = bash -o pipefail

by default, or does this cause some trouble on other systems?

If nobody objects, I'd suggest that you change your patch to always set 
"SHELL = bash -o pipefail" unconditionally.

  Thomas


