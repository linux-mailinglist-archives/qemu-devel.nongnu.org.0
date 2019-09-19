Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88322B8556
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Sep 2019 00:20:16 +0200 (CEST)
Received: from localhost ([::1]:49148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iB4md-0002ZZ-J9
	for lists+qemu-devel@lfdr.de; Thu, 19 Sep 2019 18:20:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59557)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iB4cG-0000AN-7m
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 18:09:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iB4cF-0002wX-2z
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 18:09:32 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:39276)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iB4cE-0002w9-Rt
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 18:09:30 -0400
Received: by mail-pg1-x543.google.com with SMTP id u17so2644983pgi.6
 for <qemu-devel@nongnu.org>; Thu, 19 Sep 2019 15:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DkZVL945NAnYHjWuiXZVXLZifIDxk/sIZLtif3ChFoE=;
 b=Ljq7lKhP5vhf0x3PV29onNMfkxqUiSH44ZvtKQz6ZkLngzVNTZC5k0cvtLMK5j8Kab
 k5I5ODe731GeEu1TF8vrDVwhGl+KNTqr7xbGl6Gh0iwroi4BHBrr9IWVoYZ2Myqj7PtG
 SBBQZWbZ8uTGdfiBpJCwYd43E+MRVod15lYLHzhQeU+wJC8rxUg8P5DjX8bpKCPblIGd
 cl9Gv1Isl09P06Q5PM7jSmqjdn0KS1XY6noF7qfTeiQZMkv/GqCiHKz0uQeFzQd/L+x9
 y5kh7flp5bdjnVg3VxDsFnCfWcfy7fAMf1s87KZCBq30JRaLd2RClyCEnrdH5mXJiGT5
 K7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DkZVL945NAnYHjWuiXZVXLZifIDxk/sIZLtif3ChFoE=;
 b=m2sL+QCrB/Yon2lsipG+J4Nv8nbG9O6m642J4KQX4Bofhk++Qh6yHVUtoaOeVtE3NW
 OxvlGL0ZlrBr13MJRTPeFrjgEAOud2gdP/sqauNxLD0oc8rdA43obPK1RwqP5B4fRnTA
 +bEUTJ+U2gGZekO0nvBHI1I00Ivyifag1nI6W+0afikXJpS5HfyIxvkSejrQDYKsiwbg
 te/oPA0wWfNeadqwOgLmwneqwGwFKd9WefbDVOE0Ixth0zH87vQvavGD2sgKNotsPGXo
 dBuuT2Oczdg5W2rJcG8+5EkxlR3blBut8tLLv3/dcP9ue70TGyiL1VciKmqYjRLNsjTR
 Y3bg==
X-Gm-Message-State: APjAAAVPOt5XM81XtSB9zqupVvgl9xuYQRLaCVaID9qitNVmuTxS1m6D
 cJxwQsdvZiZws782fuuAjT+ZwQ==
X-Google-Smtp-Source: APXvYqwZGF9/EjxGtzE7GXn0x31jpAMryJ8X8zyBtjNDW9E3/1eENt8tj4Gyjm+tUcPtsEKH3z7ZvQ==
X-Received: by 2002:a17:90a:de0f:: with SMTP id
 m15mr128386pjv.107.1568930969517; 
 Thu, 19 Sep 2019 15:09:29 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id v68sm4052pfv.47.2019.09.19.15.09.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 19 Sep 2019 15:09:28 -0700 (PDT)
Subject: Re: [PATCH v2 10/16] tests/tcg: add generic version of float_convs
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20190919171015.12681-1-alex.bennee@linaro.org>
 <20190919171015.12681-11-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <c6cd971c-e84c-c5c9-b313-2e454e02a1da@linaro.org>
Date: Thu, 19 Sep 2019 15:09:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190919171015.12681-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/19/19 10:10 AM, Alex Bennée wrote:
> This is broadly similar to the existing fcvt test for ARM but using
> the generic float testing framework. We should be able to pare down
> the ARM fcvt test case to purely half-precision with or without the
> Alt HP provision.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

