Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A44B95E605E
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 13:04:36 +0200 (CEST)
Received: from localhost ([::1]:46828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obK0R-0004qh-La
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 07:04:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obJqq-0004kQ-Ol; Thu, 22 Sep 2022 06:54:40 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:39866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obJqo-00059a-Sz; Thu, 22 Sep 2022 06:54:40 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 d64-20020a17090a6f4600b00202ce056566so1841515pjk.4; 
 Thu, 22 Sep 2022 03:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=o2F5DMFaxaHm2IdfKRmuFO5KvgalzunCefgOCWoHWis=;
 b=Q9TP+26+yOwhw/YZAN39MXpZMTU295l0rUyNm79pCMoIxn/jxlXIpirz2Pb8Lke7eF
 ejvo3IRmJzXN8bkWweBgaaAfECMREWCt75OhHnbEIBJO+fg5YFh18jyKjAjXd8EtTzKC
 L9w8yAfZG6GDtxxbl4k2OyB3DjPii20PzFtIzNh1TgS85Ta13EwHyNjXaWI7PLz8ahpb
 f1CXSz3XR9+3fqlTPKYO+Pk3LJKEw+0kvvHnntMrM+poU7N+ProJnVJGqPQQQ8N40g50
 CBOfjoebK62WgwQldb5i1wWjkjYvfWYT/V5ikyKfiu+8H98mY2ltjQg2alw/trZQozqR
 3VfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=o2F5DMFaxaHm2IdfKRmuFO5KvgalzunCefgOCWoHWis=;
 b=wNpZJIoqe5FBK6Ihkiz+GNUISk6UHJroS2eJsdcJwMCW/qLrNkpMyom8Pn5xBPtJnG
 rz2B575i3ouo7U8xpuf8g24BRQI0WmT686jUTWDmNvnRicfLehb7HBNZJl7F6I/jlL5w
 nDI4XUkVIDzoLllDo0RiRqXXRwFSddDxzpirBclFqKltSDgDScC3lSFXvbyT0CBfw2O6
 +cnAXDSA8hv05yIq43cHIKVkHNAuoRmh0OZdJ9rcRxac2NKH4mmlU9XcrOisCwmMAu1d
 yCUF3zHAhBZEx6i8MwM2Bm9vAtyDLPmvW6vwrNMY1XzsBSjF8if92o9jHNV4PqV6cWIu
 P11A==
X-Gm-Message-State: ACrzQf18qNi/9zGtq94uFBkQ2zlD70nf3Vc4XfNWakk8c3SWpRrJukPB
 i/A4Stti/5r6eKzlJpqn1xw=
X-Google-Smtp-Source: AMsMyM74lMKvfglMqQQGSUiAqqRuXAMhaTQC7zzaTqbfGc3m7YN1dn/wUQBJ46AT/diM3o5lgd867w==
X-Received: by 2002:a17:90a:c70b:b0:200:4366:d047 with SMTP id
 o11-20020a17090ac70b00b002004366d047mr14881463pjt.240.1663844077002; 
 Thu, 22 Sep 2022 03:54:37 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a170902ce8d00b0017894903949sm3812354plg.157.2022.09.22.03.54.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 03:54:36 -0700 (PDT)
Message-ID: <f2d309e6-cd23-9fc8-b0e3-8be01d2e57cf@amsat.org>
Date: Thu, 22 Sep 2022 12:54:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v7 03/14] hw/nios2: set machine->fdt in nios2_load_dtb()
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>
References: <20220908194040.518400-1-danielhb413@gmail.com>
 <20220908194040.518400-4-danielhb413@gmail.com>
In-Reply-To: <20220908194040.518400-4-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.702,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 8/9/22 21:40, Daniel Henrique Barboza wrote:
> This will enable support for 'dumpdtb' QMP/HMP command for all nios2
> machines that uses nios2_load_dtb().
> 
> Cc: Chris Wulff <crwulff@gmail.com>
> Cc: Marek Vasut <marex@denx.de>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   hw/nios2/boot.c      | 8 +++++++-
>   hw/nios2/meson.build | 2 +-
>   2 files changed, 8 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

