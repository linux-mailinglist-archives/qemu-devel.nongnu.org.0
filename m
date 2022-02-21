Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8600A4BEB51
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 20:42:48 +0100 (CET)
Received: from localhost ([::1]:52276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMEa7-0000Y4-ED
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 14:42:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMEMB-0004yO-J7; Mon, 21 Feb 2022 14:28:24 -0500
Received: from [2607:f8b0:4864:20::536] (port=40503
 helo=mail-pg1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMEM3-0003Uh-65; Mon, 21 Feb 2022 14:28:22 -0500
Received: by mail-pg1-x536.google.com with SMTP id w37so8721446pga.7;
 Mon, 21 Feb 2022 11:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=G9ZtRisj5qdEyxbcjxfWjt6PCOG02wNAxTqLy7KlnoA=;
 b=ipND2NSUAxJviPFgRAiHVXRsUJXfxtFmZ8HBcxjxcH+nvpMRHwo69qz1L94DOz4yfB
 A0BpDSq9XEWMzLI6LQBjdpRj8IpZggy5jGfjEUX0lMvbkssPSbe36RQWhUuuLhxOD06+
 dtNAZcyv/gbRpqk2Re+ZLRwlvXLwOF86Pq+D9HrVfwL9pFbAQ5FKr6srnOGLUS+IY2Yx
 g1jtMxx+8MUPaBHdlOYlrx7Fd2IPyTlVOZenHS5KwCeS4HunEHON9va+VWY61ICTJrH+
 xUKbSf66DUWJUOig9yHTd+3gLDRWBaafF3ofVnzJ073obnsnaCeZxLE3CoCJ9UZqSdrP
 pYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=G9ZtRisj5qdEyxbcjxfWjt6PCOG02wNAxTqLy7KlnoA=;
 b=sj4j0Y7gphws8D34Y16MxTvWueHBr3l8sIqBwIM0ojqNSxHBesB3b0CnDLXMFq2b6m
 FmIno/6YUiesyXaLNE8yJMyxHO6k3GUBrivtxKlx+q1fGRUlBKajtqbAlBnWvYfqVotr
 bdgHEDpLR2T9GBG0Bh/kcpN7Zd2YVB2fPotOU9WrcW5uR0mbQJOYHLjQ3nICA24hXPfp
 p8kLY6pUYijuhWwbXrHyaoY+LAg9SdUMggqjm8h1T4BhdILolGjs90pPLBKUabqb7Hp7
 v1tI6C9UdbD/pJASIMB1lHpRR6nzM1O40/nVZA7EDl3abrcIzF4Do+2OA4qpjyhD5Jh3
 72ag==
X-Gm-Message-State: AOAM531aOJwLQj/IoSyKpAk9nHf7Nz4oIyoO5HDd9ANOsusrKeyjpx5i
 maGLAlyNWRnQ7M2GIPw4+Ho=
X-Google-Smtp-Source: ABdhPJyWfkWOAuL5shE7nCaeIkVDNmVEtQawZ2NwINQcaVmocqgPT1QcWIbQ+p4PjeycsOHuZmdK4A==
X-Received: by 2002:a65:41c3:0:b0:363:5711:e234 with SMTP id
 b3-20020a6541c3000000b003635711e234mr17124152pgq.386.1645471692815; 
 Mon, 21 Feb 2022 11:28:12 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id u39sm14647431pfg.195.2022.02.21.11.28.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 11:28:12 -0800 (PST)
Message-ID: <d292fa72-292c-99d4-9f45-8b15dde71edf@gmail.com>
Date: Mon, 21 Feb 2022 20:28:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH v2 2/3] qapi: Document some missing details of RTC_CHANGE
 event
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220221192123.749970-1-peter.maydell@linaro.org>
 <20220221192123.749970-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220221192123.749970-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::536
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x536.google.com
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
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/2/22 20:21, Peter Maydell wrote:
> The RTC_CHANGE event's documentation is missing some details:
>   * the offset argument is in units of seconds
>   * it isn't guaranteed that the RTC will implement the event
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> v1->v2: add the "RTC might not implement this" note
> ---
>   qapi/misc.json | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


