Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F971834AD
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Aug 2019 17:05:38 +0200 (CEST)
Received: from localhost ([::1]:34030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hv11t-0001pA-Bf
	for lists+qemu-devel@lfdr.de; Tue, 06 Aug 2019 11:05:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49286)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hv11D-00017t-C0
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 11:04:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hv11C-0000ch-GA
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 11:04:55 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:37188)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hv11C-0000cU-94
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 11:04:54 -0400
Received: by mail-pf1-x441.google.com with SMTP id 19so41648763pfa.4
 for <qemu-devel@nongnu.org>; Tue, 06 Aug 2019 08:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0UvgkNYT4XxnBleRsi7bo7lrrahSm8tWNJn+dEGwjUs=;
 b=BsmGIqStDVudsifgfrdE1GITdloX52P4jiKkg3LUxxfWdnMQX1fo9zcQoCwNl0lMxz
 Gj1uXmf7T33QwA73W5Ju6j1oEZq50kQvqsbvQCPwC5S45KUWUFkAkEzkFZ4JHnfw0UuC
 ey3GUlpTOl0uZ0IFIiwweHO3KuICTUNMdwXkveGXRAjy7G6rWccUWzbRGgnV9bPr/C9a
 QlwJWaCBJr4knbr4qiFsrAfD0qFMDjmdIfxLC72682SQt2dN7CKueAZT18My+Jt0NrTj
 LpSBLZb/DrFGRuotTLuNMn8yg5yKSmk6mIyP+m85cMTkl4MV1FKUWE/SDavy+vCikDcU
 6YZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0UvgkNYT4XxnBleRsi7bo7lrrahSm8tWNJn+dEGwjUs=;
 b=lIuc8eoLEbmSbQFXtDbqe82SY9DWfN9hkx3DR4n8Kpg8pzJjSw4JJ+gBWOx/4gLwQ1
 kSKNPIpEKrFIMfMnJQ2uX0J+S29bgBeu4qYhNa6vPIsVevP10mW6tkDOBo9lRbhu6K6x
 KpXpfplfTXT3mZSJFNVBqjTUuIkPkb1La3Imdxi1nqTrSprd3a3eTMLHo4Dxz0eG7uoF
 TZzbhK2ybNp8uOZ9Fr7iycVIbG4JWwDFrYOKnSgZwF0QZahN6u6slqzNcNQ19Gefe9HR
 O69FvZ4fCbplbzrUAi3E1gQA2C9sK7qZbqmGXRzCT38+wvOX03vBzfKOXMJB9sPDilTK
 DFXw==
X-Gm-Message-State: APjAAAUZ8oPONLYhyo6QbQQOJSNN7eOcmlUlI4qfZj4skJ1xrB8WU2Nk
 QSEyGl01y211nbc7NsaweWpbaQ==
X-Google-Smtp-Source: APXvYqyKhOiKBS1Us3ex4IuGQgF8/zyArymUfFzEZeLZj4GfpdzZROuvY8poWruB8yhtD3GF7infVg==
X-Received: by 2002:a17:90a:26e4:: with SMTP id
 m91mr3659576pje.93.1565103892410; 
 Tue, 06 Aug 2019 08:04:52 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id 85sm93424647pfv.130.2019.08.06.08.04.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Aug 2019 08:04:51 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
 <20190726175032.6769-7-richard.henderson@linaro.org>
 <CAFEAcA_kmuX6bxR50eU_3nTdRcjON2nVTqVWiRamSRe6jui3ig@mail.gmail.com>
 <09b930e2-0a92-25a3-4e26-8bea1f437039@linaro.org>
 <CAFEAcA9yQQSYnwEeSNbx4P94deuG5v5fKs7gW4VgG7LFzBX03w@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <92a7e54e-678e-cf4e-fadc-373e1bd6a41b@linaro.org>
Date: Tue, 6 Aug 2019 08:04:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9yQQSYnwEeSNbx4P94deuG5v5fKs7gW4VgG7LFzBX03w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-devel] [PATCH 06/67] target/arm: Introduce pc_read
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/6/19 3:00 AM, Peter Maydell wrote:
> Renaming pc_next would be a cross-target change, so let's put that
> on the shelf for the moment. Maybe just put a TODO comment to the
> effect that we could consider renaming in future ?

I wasn't suggesting renaming the cross-target variable.

I was suggesting shuffling around the current names, and using "pc_next" for
what it sounds like -- the pc of the next insn.


r~

