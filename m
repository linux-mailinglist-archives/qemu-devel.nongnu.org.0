Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A71EB9FE0
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Sep 2019 00:23:29 +0200 (CEST)
Received: from localhost ([::1]:43992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iBnmp-0001BR-Pv
	for lists+qemu-devel@lfdr.de; Sat, 21 Sep 2019 18:23:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46980)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iBnlW-0000jh-Me
 for qemu-devel@nongnu.org; Sat, 21 Sep 2019 18:22:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iBnlV-0006LS-Ay
 for qemu-devel@nongnu.org; Sat, 21 Sep 2019 18:22:06 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:38192)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iBnlV-0006LE-42
 for qemu-devel@nongnu.org; Sat, 21 Sep 2019 18:22:05 -0400
Received: by mail-pg1-x52b.google.com with SMTP id x10so5794951pgi.5
 for <qemu-devel@nongnu.org>; Sat, 21 Sep 2019 15:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XA3QduPvib98slnfAWd5DCGDEAAkFgBrAwzCf8D60U4=;
 b=hsE0noCJ2JL6uIDhIfwCgJal74OgLPJAyywrWh4YL/L23yPfCy62zWF14cNjw9bRGb
 npqLaKpZcQxWhW3BQ43Wm8j4oSULOK8jZYLSXeVwwg74sK8WwZAeOWZqluiNjtX2AwTC
 bwVBBGqaWwk4iDjqjAcjJODgtvzL8+gw/pJF5MrZBZGtLpK3FxSUoZyjDtr5Ivd0sU2o
 dNSZu7Q+ek7S17CxP9+QB3rz+nLv0uR4gOPp9YxhjNAm7ItW7wGfHqWGq0oZ40dvEoih
 sNLYNttjVeebtbqMg5YTxCex4iMQwku3uK/cLD2FtpOdJGI8Vtqld3qw4/LAQ+XNGneU
 c5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XA3QduPvib98slnfAWd5DCGDEAAkFgBrAwzCf8D60U4=;
 b=KQ/1Rtki+aDjnvES3maGQDd4hCat4TZAHF3QcSqNNPID5G6FPhdPdlOZboxnjofktY
 xMfQ2VcLms/XMUE5atL4VgbcKDUk8rg7cdlMbcB+wI4t/QPjdvp5YcWobdMvIsEil/2X
 rzvpiyv2QGgmg1zrpYa7ofXCHbm2HM9teI1G0wb0JV2vrK0ZoXM3myTAXyKqRspCGK9S
 RrLXNAOekrD8dCaq+hfpjKziCI5lvetW2wpunetPxHdvVHfKYvC/1x90+1mF7XdN8rh4
 Wn3+DocUxpeyqYBEtdFVgJXC3dRbYSsbXEtc9iPlwf4st2lwcBtO2DAM+HqEgmG73Bvp
 DVGQ==
X-Gm-Message-State: APjAAAUxF1O7ApnXBoZwBr3no468OwDcHapHVo+d/h2bk64oKomzqhWU
 ufyTJH7ks1UwGTV7mgDhF+dwvw==
X-Google-Smtp-Source: APXvYqxPocooeSfPoIUyslnIGZlomdTEvoPlvz4oRdeKlR5bGY/Ib8yJ0NEnp0e7l80MSRBQCwF9ig==
X-Received: by 2002:a63:c807:: with SMTP id z7mr22149831pgg.202.1569104523321; 
 Sat, 21 Sep 2019 15:22:03 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f15sm8604820pfd.141.2019.09.21.15.22.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 21 Sep 2019 15:22:02 -0700 (PDT)
Subject: Re: [RFC v2 0/5] Move notdirty handling to cputlb
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20190918180251.32003-1-richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b5da3be9-3809-cc44-f7e0-a0b4571edb6b@linaro.org>
Date: Sat, 21 Sep 2019 15:21:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190918180251.32003-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::52b
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
Cc: pbonzini@redhat.com, alex.bennee@linaro.org, stefanha@redhat.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/18/19 11:02 AM, Richard Henderson wrote:
> However this time the changes are extremely minimal, and now
> I really *really* don't understand why they don't work, because
> as far as I can tell the new locking is *identical* with the
> current i/o path.

The difference was failing to set cpu->mem_io_pc, so that
TARGET_HAS_PRECISE_SMC within tb_invalidate_phys_page_range__locked could look
up the current TB, and potentially restore state and exit to the main loop.

Version 3 will have this fixed.


r~

