Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 252D766CCF9
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 18:31:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHTKC-0003yE-Ao; Mon, 16 Jan 2023 12:31:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pHTK8-0003vI-BK; Mon, 16 Jan 2023 12:31:08 -0500
Received: from mout.kundenserver.de ([212.227.126.135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pHTK3-0004MC-HP; Mon, 16 Jan 2023 12:31:08 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N8n8I-1odJTA0Z9y-015uBF; Mon, 16 Jan 2023 18:30:58 +0100
Message-ID: <86fc15b7-6880-b628-c9c6-c4cc1d602eeb@vivier.eu>
Date: Mon, 16 Jan 2023 18:30:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 0/5] hw/i2c/bitbang_i2c: Housekeeping
Content-Language: fr
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Jan Kiszka <jan.kiszka@web.de>,
 qemu-trivial@nongnu.org
References: <20230111085016.44551-1-philmd@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230111085016.44551-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:b9ptuYCHik5xG1OgcoUTvkqqqkyAxdf1o6ga4eJI3WcDOJBOQ1s
 IJop18Xc1WQuYOslxrIxE7fnhUKT8chDVMrDBJpl8RhY0Is869/lPu6l9XVhkYNhyusFNTP
 qGqyvFEjmrtkqg7+JgKEyyuVXH76DtAjvRqxNoJc9aA8igWp2Ac8GGhJMaTFjRKdcPPEWjn
 HUZ24VmNuVOqL1/FYSQyg==
UI-OutboundReport: notjunk:1;M01:P0:rY6nDk+mIxw=;bRCHoBhDAr5elq5hGg5UoXq2IBQ
 golH4bjRB4apnR4toGVjKKXyIy20uukdN6xS5vP898TLXzJINW5iGAy9bof/IuvlTcwo9E0jF
 sqpeBVdc3C4sCFGDXv/b7Et5jn4dsD8xAGfSg98IMf4tMvC3we39kBuUhTyp4Zua5eJCExVNs
 WSiHaqmhn9JEEhS/xaDfn3lBdZES/7kATSyTfNCOl1SmzDGYeVhG2SOXjCZUfHBPrcxp2VnFN
 oawiFp0J+iMggrpUTRMSsEyVsfIogEid6rPAoRLuy+A7Ku7UYzCrPmTWa72u0E4S5OlfzbKv4
 7QvkBixdj5BzpDU9kgLLNBfeDfGwUDHneOWdZH/Ef2PY6FsasvmIwUNWj9ORYwdndnfcuJgj+
 UPKEhz4SaW+WhYIPf4JQO73SC5ia/ZxGrnyHkd5Ea9qXo45EE7KfNw8OotoWYbw5Ot8cWeQxt
 WUizynKJuHnOh6bL6B2ZjiHnsuIh0OcKVIdo7rkgzfUo9UIfN5xpa9BdlW4Q0NK4h/WlR7qiy
 JF+FG9NuR5JWj4+Sq2RLd2Vh90GhibUNikAEHxKY2GFpTM3VtopS4JdtBJGGKS5DZDwTJf70m
 RZtwPfbTcMzI3fCbQD2855mJt5VQY7wQafBlH8BmC7pzIyXcVgSXNwxnP5ggUKqVZmdUuFHJP
 hPLscQUHNFAC3Aikzy59GpR6ZopT5E60Szz8xS8nUg==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.097,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 11/01/2023 à 09:50, Philippe Mathieu-Daudé a écrit :
> Series fully reviewed.
> 
> Since v2:
> - Use array of const pointers to const (Richard)
> 
> Since v1:
> - Fixed overwritten RECEIVING_BIT7 entry (Richard)
> - Picked R-b tags
> 
> - Remove unused dummy MemoryRegion
> - Convert DPRINTF() to using trace events
> 
> (series used as base for follow-up, better if merged via ARM tree)

I can take this via trivial, what do you prefer?

Laurent

> 
> Philippe Mathieu-Daudé (5):
>    hw/i2c/bitbang_i2c: Define TYPE_GPIO_I2C in public header
>    hw/i2c/bitbang_i2c: Remove unused dummy MemoryRegion
>    hw/i2c/bitbang_i2c: Change state calling bitbang_i2c_set_state()
>      helper
>    hw/i2c/bitbang_i2c: Trace state changes
>    hw/i2c/bitbang_i2c: Convert DPRINTF() to trace events
> 
>   hw/arm/musicpal.c            |  3 +-
>   hw/i2c/bitbang_i2c.c         | 80 ++++++++++++++++++++++--------------
>   hw/i2c/trace-events          |  7 ++++
>   include/hw/i2c/bitbang_i2c.h |  2 +
>   4 files changed, 61 insertions(+), 31 deletions(-)
> 


