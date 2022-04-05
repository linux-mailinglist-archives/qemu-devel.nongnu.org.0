Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 559E64F229E
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 07:40:31 +0200 (CEST)
Received: from localhost ([::1]:44224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbbvZ-0006Na-HB
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 01:40:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hk@zapateado.de>) id 1nbbq8-0005Ww-BR
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 01:34:52 -0400
Received: from relay.yourmailgateway.de ([188.68.61.102]:33527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hk@zapateado.de>) id 1nbbq5-0001jN-Ph
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 01:34:51 -0400
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
 by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4KXbts2Hmbz7ycr;
 Tue,  5 Apr 2022 07:34:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zapateado.de; s=key2;
 t=1649136885; bh=Hbvu8xrW0Xb+Lr2Fpd/EL6PoK73nmdP/I5e4/m+gNsg=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=jX7VaBHc3kl7Y53AtI7+Hghk87OZxLxCRPMtdzChnPApleU4i/z7fydmQJXRHMgSL
 TERvlTucgEaPfhWzkEixp0okDmB35GvUp+20A+WzpUgtB6N1i2I0bl5a6rVvYHwEnh
 OUHcvLl+9qdtKZ5c3eg69XNpG9BA6KazvGmbYERu0QEVqLkbXRGjqI4QGQrB/9TNOK
 2jUSoXJMshh/pt6ptFnMkv4ioQWi3Jmc3hB1+e0nHbjlah3ANLHuTSbaiKxUrvgkO9
 xypXEDRUnMGkpyBcFdybywtwypdzkYo0X+pTttRUFxS10KeNEVs5RoEnHesBiBbcsK
 WbYDfenElI+kA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.53])
 by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4KXbts1vZhz7yWk;
 Tue,  5 Apr 2022 07:34:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy02-mors.netcup.net
X-Spam-Score: -2.9
Received: from mx2f6e.netcup.net (unknown [10.243.12.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by policy02-mors.netcup.net (Postfix) with ESMTPS id 4KXbtq61HVz8sWQ;
 Tue,  5 Apr 2022 07:34:43 +0200 (CEST)
Received: from [192.168.54.9] (ip-095-223-070-176.um35.pools.vodafone-ip.de
 [95.223.70.176])
 by mx2f6e.netcup.net (Postfix) with ESMTPSA id DA71962631;
 Tue,  5 Apr 2022 07:34:42 +0200 (CEST)
Authentication-Results: mx2f6e;
 spf=pass (sender IP is 95.223.70.176) smtp.mailfrom=hk@zapateado.de
 smtp.helo=[192.168.54.9]
Received-SPF: pass (mx2f6e: connection is authenticated)
Message-ID: <3adf9a61-a8a2-5dbe-4cf2-74afd48edda2@zapateado.de>
Date: Tue, 5 Apr 2022 07:34:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: Helge Konetzka <hk@zapateado.de>
Subject: Re: ping [PATCH-for-7.0 v2] qga/vss-win32: fix compilation with
 clang++
To: qemu-devel@nongnu.org
References: <39400817-3dc9-516d-9096-bc1f68862531@zapateado.de>
Content-Language: en-US
In-Reply-To: <39400817-3dc9-516d-9096-bc1f68862531@zapateado.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <164913688331.9132.13644514445630192542@mx2f6e.netcup.net>
X-PPP-Vhost: konetzka.de
X-NC-CID: tglpPyIRybqM+bHXjtd6Ae45hZVwj4vd+REsBzOGOWk/
Received-SPF: pass client-ip=188.68.61.102; envelope-from=hk@zapateado.de;
 helo=relay.yourmailgateway.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: Konstantin Kostiuk <kkostiuk@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping

https://lore.kernel.org/qemu-devel/39400817-3dc9-516d-9096-bc1f68862531@zapateado.de/
https://patchew.org/QEMU/39400817-3dc9-516d-9096-bc1f68862531@zapateado.de/

Am 16.03.22 um 14:54 schrieb Helge Konetzka:
> This fixes:
> 
> qga/vss-win32/install.cpp:49:24: error: cannot initialize a variable of
> type 'char *' with an rvalue of type 'const char *'
>      char *msg = NULL, *nul = strchr(text, '(');
>                         ^     ~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Helge Konetzka <hk@zapateado.de>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Compiling with clang++ of msys2 toolchain clang64 leads to
> 
> [1445/1747] Compiling C++ object 
> qga/vss-win32/qga-vss.dll.p/install.cpp.obj
> FAILED: qga/vss-win32/qga-vss.dll.p/install.cpp.obj
> ...
> qga/vss-win32/install.cpp:49:24: error: cannot initialize a variable of 
> type 'char *' with an rvalue of type 'const char *'
>      char *msg = NULL, *nul = strchr(text, '(');
>                         ^     ~~~~~~~~~~~~~~~~~
> 1 error generated.
> ninja: build stopped: subcommand failed.
> make: *** [Makefile:163: run-ninja] Error 1
> ==> ERROR: A failure occurred in build().
>      Aborting...
> ---
>   qga/vss-win32/install.cpp | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/qga/vss-win32/install.cpp b/qga/vss-win32/install.cpp
> index 8076efe3cb..b57508fbe0 100644
> --- a/qga/vss-win32/install.cpp
> +++ b/qga/vss-win32/install.cpp
> @@ -46,7 +46,8 @@ void errmsg(DWORD err, const char *text)
>        * If text doesn't contains '(', negative precision is given, 
> which is
>        * treated as though it were missing.
>        */
> -    char *msg = NULL, *nul = strchr(text, '(');
> +    char *msg = NULL;
> +    const char *nul = strchr(text, '(');
>       int len = nul ? nul - text : -1;
> 
>       FormatMessage(FORMAT_MESSAGE_ALLOCATE_BUFFER |

