Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA1A9DCEC
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Aug 2019 07:01:18 +0200 (CEST)
Received: from localhost ([::1]:46664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2TbZ-00089H-Dc
	for lists+qemu-devel@lfdr.de; Tue, 27 Aug 2019 01:01:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37029)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i2TaA-0007jq-E8
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 00:59:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i2Ta9-0005ft-9B
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 00:59:50 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:33924)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i2Ta8-0005fF-VZ
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 00:59:49 -0400
Received: by mail-pg1-x542.google.com with SMTP id n9so11940376pgc.1
 for <qemu-devel@nongnu.org>; Mon, 26 Aug 2019 21:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zI/uto9yxNnWrFZoRkgTLQ8QKcp/Nqa91bO4oFtL9fk=;
 b=a8G95aiW7qxrfs64PVcYOMykLJ9lbCTV6JxU/QKvVQmfCkOmwf0ww4XsvxF8KIsWzK
 Gw6UZ0M0k/wUdTl/kQ3AWGwtbRWcxJ7gcWW0+IsJiIo2Q7MsydwjjlriDeVN/7Wx9pNI
 Pp5FUvY1aURhj1z1sjqQZnLDzQXWHL/l2x+aB4uw+44/6Wh5emrpRl0ZNrS0Zn0lbCV9
 6HR9+mixjUqL2JcXbxvm4YZCr25ZAX77T4zGxkn7yJH2+Ww57sfv+viNG6/d8Y07imLF
 c2xOcPQksABdI0w9kMH6HKls3nbSsWGgUZbsaORRrSJwmYg4vWLj4VD60sdGYGdboAAB
 t9LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zI/uto9yxNnWrFZoRkgTLQ8QKcp/Nqa91bO4oFtL9fk=;
 b=KVDpUqLVKA0APZsdYFJpTebNe6Ov8L59RXpeJTfLvYOqxO3MuKW4XRxda51BDwFP4U
 MglzNsPfCZmSjvvzslZ8zYbV8yF5FEYWdhEVxmh0NFut1GzkaoXIgcMEO/rw/+CeZj4B
 Ytzcbrbaa1VW65XfQlY6qPPbjgasTB2lmfEYh3rP4F2QDMpmOwRRWDkNQg/dC8ScKJXG
 aGZkM/+GqdL8ORcgCPSeSfH8CuusUJMFAVe6rpPZU7IHNCvt/FuZgphSG6MxzOEItHV4
 9cdswLNaLBzntpUAnlcjEAckzEt3XAJ8TBSAyID5xKK7+lcDkHsLu3P6wJ1yA5ige1U+
 GQ4Q==
X-Gm-Message-State: APjAAAVSXqPbbSvU71+mdjckRsVKXgSaYNcpGhv0Izw3+wb/oHHvS2TY
 iKjo6Ln+kYRXu0BlEZR0WYMcWVdmWws=
X-Google-Smtp-Source: APXvYqyzBdDyW7e4iLq3nKDBDnFJz9h6dnlhBkg27tazEsbyl6gDRj4nLUm5tdEsbsHdGPHF3dBZvA==
X-Received: by 2002:a63:e14d:: with SMTP id h13mr19504020pgk.431.1566881987162; 
 Mon, 26 Aug 2019 21:59:47 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id v22sm11231209pgk.69.2019.08.26.21.59.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 26 Aug 2019 21:59:46 -0700 (PDT)
To: Stafford Horne <shorne@gmail.com>
References: <20190827000745.19645-1-richard.henderson@linaro.org>
 <20190827000745.19645-7-richard.henderson@linaro.org>
 <20190827043624.GK24874@lianli.shorne-pla.net>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <38002440-429f-33cb-abe5-db3bb5efb562@linaro.org>
Date: Mon, 26 Aug 2019 21:59:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190827043624.GK24874@lianli.shorne-pla.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: Re: [Qemu-devel] [PATCH 06/13] target/openrisc: Add VR2 and AVR
 special processor registers
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/26/19 9:36 PM, Stafford Horne wrote:
>>      /* Fields from here on are preserved across CPU reset. */
>>      uint32_t vr;              /* Version register */
>> +    uint32_t vr2;             /* Version register 2 */
>> +    uint32_t avr;             /* Architecture version register */
> 
> Do you need to update the serialization in machine.c?

I don't think so, because these are invariant for the cpu type.  It is not
valid to migrate state to a different cpu.

The VR, DMMUCFGR, IMMUCFGR entries that you pointed out wrt the previous patch
wouldn't need to be in the serialization if they weren't already there.


r~

