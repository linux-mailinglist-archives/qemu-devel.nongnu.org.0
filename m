Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FECE495CE
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jun 2019 01:23:38 +0200 (CEST)
Received: from localhost ([::1]:52546 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hd0yP-00018z-4A
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 19:23:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46056)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hd0xh-0000jk-0J
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 19:22:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hd0xb-0002Fx-Or
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 19:22:49 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:43313)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hd0xX-00023o-9x
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 19:22:44 -0400
Received: by mail-pl1-x641.google.com with SMTP id cl9so4826841plb.10
 for <qemu-devel@nongnu.org>; Mon, 17 Jun 2019 16:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HxHc8sgDRA6aZ4OnB3U7oz7N0NQdmPIUncCxTUvcdmc=;
 b=qNAUSPa6Fj2bm+gpvoziHrWx9YZdKbweG0sQw0hXYwiGOzyVpK0zmfQyiDcq7fCfdL
 LizIS5oVC1w0MJD6pbV+CaUXUQjbOKxXKTz8zxI6rCT9Pxm3mmcy0FqZ6vN6Q66wfx1l
 X82nUCuxA2vUCEzfAy2Nzb27tVi1r2oDk5NrTfa5+zOIJ1YymmQaJYP4Yeh/mFAFwikO
 Py24zx4XiNiNx1yEqq5iyGIuvCT/3s7Lv5cFGAP4k6CuIoaLzMMSfUKWvo+RbEQ0t0ob
 Lj9uDI42gnwNxbZIgv9gcnPu7mZNxuc81pVVPHCSddRxg/pK9fzZu7trpBk47jZb6LcG
 RfEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HxHc8sgDRA6aZ4OnB3U7oz7N0NQdmPIUncCxTUvcdmc=;
 b=q1n2Q56Y2LLB0hJ8M3oUTkiFF/RDt/6txmCBg4O5JbA9XaIbDnCtnGlPAdYdHTQrs7
 ect800iWPCCehklDbp5WO26VT+vUHUlzBhxs/XE228+yOymstAe193Rkd5nFdRgC2Jig
 TJVCfLPNX9MYj4w607DvXPX58pow1HNcvxQHek+0fknwckmcLmW/ZcAwmahPcUGbJZ0k
 SVwDP8IV9th8/U62ejmV+xA7uYA60ZRuPkYiUxWnIZhK1o1lG0EQx20m0khDhTXAuSZm
 0ckaw42LJ1M52E5ULfq6bzxIrKRD1avUaCRo/qmwNXRtMfIWa4An4vSPwMprTa3yATHe
 M+4w==
X-Gm-Message-State: APjAAAUDoKtoLHeZPmbz1GW3d5sQMaSLm5ooGJhkSweeFI+xmqfEbzvF
 GveQLh/Inh5KnJ6bD9HCnCQ23A==
X-Google-Smtp-Source: APXvYqxbMaXlXBmM8UAipaNy1X52pVFNdqN6nGJFhor/nHu6g1qlFJaqRFMg0VYKeAy8yfHnYsdE0w==
X-Received: by 2002:a17:902:9689:: with SMTP id
 n9mr14345787plp.241.1560813761921; 
 Mon, 17 Jun 2019 16:22:41 -0700 (PDT)
Received: from [192.168.1.11] (97-113-2-33.tukw.qwest.net. [97.113.2.33])
 by smtp.gmail.com with ESMTPSA id s66sm14758672pgs.87.2019.06.17.16.22.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 16:22:41 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20190614171200.21078-1-alex.bennee@linaro.org>
 <20190614171200.21078-48-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <cfd5b6b9-852c-6a34-3d07-1576f5b3f543@linaro.org>
Date: Mon, 17 Jun 2019 16:22:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614171200.21078-48-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: Re: [Qemu-devel] [PATCH v3 47/50] accel/stubs: reduce headers from
 tcg-stub
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/19 10:11 AM, Alex Bennée wrote:
> We don't need much for these. However I do wonder why these aren't
> just null inlines in exec-all.h
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  accel/stubs/tcg-stub.c | 3 ---
>  1 file changed, 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


