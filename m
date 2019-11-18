Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 658CCFFFAA
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Nov 2019 08:38:53 +0100 (CET)
Received: from localhost ([::1]:58790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iWbca-0008EC-F7
	for lists+qemu-devel@lfdr.de; Mon, 18 Nov 2019 02:38:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44799)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iWbbQ-0007mu-Na
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 02:37:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iWbbP-0000iK-C9
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 02:37:40 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:38497)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iWbbP-0000i0-1n
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 02:37:39 -0500
Received: by mail-wr1-x443.google.com with SMTP id i12so18142618wro.5
 for <qemu-devel@nongnu.org>; Sun, 17 Nov 2019 23:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BgDQpe7O6fcEJpYuCTzp3mYRTcxN+WdT3AnSVUMiwCg=;
 b=Wsjnf87RCt51dEVjfys051bXzGhbhSmbXGhoFZdJOV5yB9txOWEOcVmYje+dzMMJBJ
 nr9frYbyN1mrh/ZRxnxDkEieCPzZK7fXvC7uX5Ay+2ydpRG6KyyXLqDM1RD+kgqhU5lu
 pmZGFPkDEN2XXTjd2aTngPmoER/ymty836LiL/lym+00Z7cV3LCIf3iD9rJ4qomDmtdq
 AXYkKI6tpzrOSsdRXX5QVjVafxwSl6dhbSckfRn4Zpmbj1Re920g/NqyEOr7kiZRcI+P
 FppHLrRdwFj7XzQW9uYeycdvPJwB4WJ1iKjsXxX02jrqGAO5c+JyJgQe1fPyYFuZbrpi
 aVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BgDQpe7O6fcEJpYuCTzp3mYRTcxN+WdT3AnSVUMiwCg=;
 b=LM7N2KmuAhGXLGNfjUIn+XA0CtHxcAFmgimqsEGL4vtwfaApO2W7T0KiB/MLlKfMbk
 yyIq7/DyN8utnJwSkVJBOot3aG8JKRhiRbAWk9Nz2xUqdElVtqkaQm7jx7EWpnlPn/rp
 lOg4JHQlEZiwLgzeE3l63zNho6DaIZVxFFbOg4Ho8jH2DKgqa2tNH8ICzTVQcDHakO7q
 fpL5dk/Tl1j71i/oqqO6MJEmRKdZkxDyCGi6N2SyT+phwvr5WXILWNGou1phXTfSR9AC
 0/Q4nljQytCgg8Mync9gQTMMJCHKOQI6SrLDpehzLgLE8+bMfxL6/c4tcugEpWMvrcm2
 UcWg==
X-Gm-Message-State: APjAAAVytEp4Sw0nk8lVZQ+9owySoR9a2iv3RxcAZ4whMVCW2kl5+WTY
 hRH4RVEs0SrvIvNotIeQjdTQeg==
X-Google-Smtp-Source: APXvYqwZ9oAEMXl+gcLUFtXIlwk4n5GfUtn8jqsWjLVplEpTc8DR7dsVY7/OgFUF8DBqcIiuXMYwow==
X-Received: by 2002:a5d:67ce:: with SMTP id n14mr27995144wrw.67.1574062657523; 
 Sun, 17 Nov 2019 23:37:37 -0800 (PST)
Received: from [192.168.8.102] (65.red-79-149-41.dynamicip.rima-tde.net.
 [79.149.41.65])
 by smtp.gmail.com with ESMTPSA id i71sm24384063wri.68.2019.11.17.23.37.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 17 Nov 2019 23:37:36 -0800 (PST)
Subject: Re: [RFC PATCH 01/11] gdbstub: move allocation of GDBState to one
 place
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20191115173000.21891-1-alex.bennee@linaro.org>
 <20191115173000.21891-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <9393c566-a9f3-8c0d-a505-fc17a62bc6c8@linaro.org>
Date: Mon, 18 Nov 2019 08:37:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191115173000.21891-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: damien.hedde@greensocs.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 luis.machado@linaro.org, alan.hayward@arm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/15/19 6:29 PM, Alex Bennée wrote:
> We use g_new0() as it is the preferred form for such allocations. We
> can also ensure that gdbserver_state is reset in one place.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  gdbstub.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

