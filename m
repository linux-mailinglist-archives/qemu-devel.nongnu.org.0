Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2559FEFC85
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Nov 2019 12:36:54 +0100 (CET)
Received: from localhost ([::1]:43154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iRx8n-0006jd-5X
	for lists+qemu-devel@lfdr.de; Tue, 05 Nov 2019 06:36:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45960)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iRx7Q-0006Au-4g
 for qemu-devel@nongnu.org; Tue, 05 Nov 2019 06:35:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iRx7P-0004lh-3F
 for qemu-devel@nongnu.org; Tue, 05 Nov 2019 06:35:28 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:38794)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iRx7O-0004lK-Ru
 for qemu-devel@nongnu.org; Tue, 05 Nov 2019 06:35:27 -0500
Received: by mail-wr1-x441.google.com with SMTP id j15so274836wrw.5
 for <qemu-devel@nongnu.org>; Tue, 05 Nov 2019 03:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gGa4wz3Mk5jDffDf5pkC3o5Y2o5q9anJY/9iijHzDsk=;
 b=kxT8c11lR8pnB59rGlGJINIgZBb28b4LYh3P1GsJLO2HLYz378phu5qZqkRHJuHyD+
 ZUprAXp/W0lbPCQKn16yPN4l7fzXClZZbOlL86W/fSwPGs0Rfe6n1UFNVoNIo/FP71c4
 HSYLxRD9GS5rAysKWcRDb1gIjnHbv1nFuaE/s9EfXmQDEkIpjAvsJy2LpxXibGUGsLnO
 BFnCOX4V8prKtq5gwMSSxrWKmh+y1XnZ7friHWcedyeZNdwEpdSS9RzDFoO1xcBG5lnQ
 Jsw/2iMxHoDl0Pwuk9ThL6EFVxwX26a5q+am5VA6HOOW1WDjYpP86xT291xEsIanHLIu
 0CBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gGa4wz3Mk5jDffDf5pkC3o5Y2o5q9anJY/9iijHzDsk=;
 b=pQJ+QsiKPfn0iTDKMqulNNJFEWbTW7nWiZ6LSIkMTrS9IBYGmFmk6lrk6lHVTtkLFL
 hPfRrPGuZXmDLxNhJxgrL3rXhypPrwhJ2XWq6ne2Gs5YIWBOEPXBijexERnQm9HCMgmg
 6dqDnKb8PnZ/2ce91CMOYe6GNzUFT7H8LXyEjTd61wy3xW8cl0mSSkOIX4C1qd009kIb
 bg+JPDMzf3VAe3+5Uf6i8Ahv7nr4GiuMPH6p5cForE0QakRuuBHCnxFsJI3LmxDjZVqO
 RK8HqR6N36gHnDf/Cw134auxAAi1F4ke19rqO1fFqVZtGs/sGibNwxnfK1fXFVzR7EHD
 6JSQ==
X-Gm-Message-State: APjAAAXFWbAohk/hZ4o4lxZO9xi8TTBOR9U3VRsanBXsq2edF59pO872
 iQ8aHz8oUREWSKquS65rOb3f3A==
X-Google-Smtp-Source: APXvYqxBhS4+DP393Fb+DTwCnCfpf/Fjxl5GlQByjkmKJSYm3CIOlpDwUj7E2OyNOkivcYVSZ8TDhA==
X-Received: by 2002:adf:e28f:: with SMTP id v15mr26726208wri.130.1572953725570; 
 Tue, 05 Nov 2019 03:35:25 -0800 (PST)
Received: from [192.168.8.102] (228.red-2-141-116.dynamicip.rima-tde.net.
 [2.141.116.228])
 by smtp.gmail.com with ESMTPSA id b8sm13507452wrt.39.2019.11.05.03.35.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 Nov 2019 03:35:25 -0800 (PST)
Subject: Re: [PATCH v3] q800: fix I/O memory map
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20191104101513.29518-1-laurent@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <3413ab9e-2da8-6688-8e5d-dc0811b6ebab@linaro.org>
Date: Tue, 5 Nov 2019 12:35:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191104101513.29518-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/4/19 11:15 AM, Laurent Vivier wrote:
> Linux kernel 5.4 will introduce a new memory map for SWIM device.
> (aee6bff1c325 ("m68k: mac: Revisit floppy disc controller base addresses"))
> 
> Until this release all MMIO are mapped between 0x50f00000 and 0x50f40000,
> but it appears that for real hardware 0x50f00000 is not the base address:
> the MMIO region spans 0x50000000 through 0x60000000, and 0x50040000 through
> 0x54000000 is repeated images of 0x50000000 to 0x50040000.
> 
> Fixed: 04e7ca8d0f ("hw/m68k: define Macintosh Quadra 800")
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/m68k/q800.c | 40 ++++++++++++++++++++++++++++++++--------
>  1 file changed, 32 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

