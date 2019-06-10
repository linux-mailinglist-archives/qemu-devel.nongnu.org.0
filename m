Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F763B80E
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jun 2019 17:08:31 +0200 (CEST)
Received: from localhost ([::1]:47570 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1haLuR-0006B9-79
	for lists+qemu-devel@lfdr.de; Mon, 10 Jun 2019 11:08:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42748)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1haLru-0004r5-U6
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 11:05:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1haLrt-0001CQ-1A
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 11:05:54 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:45811)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1haLrp-000157-6h
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 11:05:51 -0400
Received: by mail-pf1-x441.google.com with SMTP id s11so5461062pfm.12
 for <qemu-devel@nongnu.org>; Mon, 10 Jun 2019 08:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BbJ6hN2tuQJxmxsKQ7zetbLM8DIduHO3hLnwFHSDIfA=;
 b=VqN/AMt9YUFl7NSFmhVwb1/h/yC2+krY+89No36h09CM6QlOn2myJYUrE/ZUJMYV8F
 MWY+n/jnmKtboK+tY9+oFFObsalLpDo7gz6iVRxKrzxUQLGqQMRFrQp4gFQYoTHWMxN/
 1LcZhfL3qON/glcD3u5QEOkO/y6dNeIrwjKX0DSY2UgN0D0t34NH4esQtnU6xA+302kc
 bKGW2x5+w75NA3LiN3WEvT9ju6wfy8Qn6snOR56Jht1zPjsw13SEe1XiwN3TNV+ayQmb
 ybvhfYBqmL4EOVLf2B+m9GSUent+bVwzyMXG3bk/XmgcMUjqMOShMplp45/gHWvSQX5Q
 ym+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BbJ6hN2tuQJxmxsKQ7zetbLM8DIduHO3hLnwFHSDIfA=;
 b=tzFUgGdaGTVSWvb/YXlrmlRur0npgKcjUHXJcdAEybS0DHrtPJVFR6QpbbwGXP3y49
 QrcpRUVKmEtAvRxQfxcJOV8U3NZKbu3v43xGz+7UNV+mZm92kO1C6TsYv3k1xihQzqMl
 azFYrMizVgETPpqvJFbQSd5HIvAOeKm7ZcBX2lR1idxt7CBv8jIPQk9DfMCDO8tUCLBo
 tTjDIMR2qVuFB+AVPJCPJDyRwmeUUVl7gQG/wAY6863XaCZyFxR0mNT4OLdz0yry6bLG
 HlDTIGnbqpKXLWbg4O8RsLVLJCK9o3NCqT08bTbAyqy1FtvUVtPFnk+UaF2SDDEz8z2l
 bTOQ==
X-Gm-Message-State: APjAAAXDkuf2Nqy5A+IKVCcsLNSFcZxFG+IvOr9isJhTzrEtMK3cth8D
 s8puA3NS/F6wA4uvfPS4LRGP1Q==
X-Google-Smtp-Source: APXvYqzm5JHWRxMOxxMgAgjaMZGEuLCq/evhnTKzzT3riSsTTLHzt2tApNA2Wgyx0HoVio2PjEpjGw==
X-Received: by 2002:a62:63c6:: with SMTP id x189mr63140701pfb.31.1560179141381; 
 Mon, 10 Jun 2019 08:05:41 -0700 (PDT)
Received: from [192.168.1.11] (97-113-13-231.tukw.qwest.net. [97.113.13.231])
 by smtp.gmail.com with ESMTPSA id
 j15sm6556823pfr.146.2019.06.10.08.05.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Jun 2019 08:05:40 -0700 (PDT)
To: Michael Rolnik <mrolnik@gmail.com>, qemu-devel@nongnu.org
References: <20190606193012.37715-1-mrolnik@gmail.com>
 <20190606193012.37715-4-mrolnik@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <e1412f5c-a0a0-d28c-ce45-b689614b56cb@linaro.org>
Date: Mon, 10 Jun 2019 08:05:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606193012.37715-4-mrolnik@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-devel] [PATCH v21 3/7] target/avr: Add instruction
 decoding
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
Cc: rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/6/19 12:30 PM, Michael Rolnik wrote:
> +STS             1001 001 ..... 0000         @ldst_s
> +
> -- 

checkpatch error for extra blank line at end of file.


r~

