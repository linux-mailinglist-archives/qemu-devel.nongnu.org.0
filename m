Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB691AE9B2
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Apr 2020 05:43:43 +0200 (CEST)
Received: from localhost ([::1]:54512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jPeOM-0002t4-Ah
	for lists+qemu-devel@lfdr.de; Fri, 17 Apr 2020 23:43:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60091)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jPeHA-0001fa-HD
 for qemu-devel@nongnu.org; Fri, 17 Apr 2020 23:36:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jPeH8-0002Ii-8v
 for qemu-devel@nongnu.org; Fri, 17 Apr 2020 23:36:15 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:35463)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jPeH7-00026s-OW
 for qemu-devel@nongnu.org; Fri, 17 Apr 2020 23:36:14 -0400
Received: by mail-pl1-x642.google.com with SMTP id f8so1707993plt.2
 for <qemu-devel@nongnu.org>; Fri, 17 Apr 2020 20:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7lm71FM8jAywewUQQ6iTxyvXW44ISzsx8AV54B1hpyI=;
 b=v7LrDTgXAvniXET4W8lZzGr9UA5jT9DNT0w+vLs+it47vdpkw6FN5Q7JZwj482+ZGC
 tvga5Jyvr1LI7PPvW7Cz1emtF8+4ebTWa8CBVsblhLxECS1/7uJLqNE3c3ohy/dqyQQb
 5XiqhW1CKV4V8G9IFxwfezGqxV7B05ibAJFXvS4tteH/QI43o50a3VLL7NWadgTvixYJ
 QJE4NYmZkSscB+8J/pPp1dBhxVZtzL6vNMJhNEbxD6CJENcWQLe4RM2U85QQlecjEAtN
 J9IFac/yGHXj8G1QyTyFCsw9tzfHyLsekz7ZWkcuLwfwdBLCH0jxpnA/+rsSFi3h9HG9
 z4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7lm71FM8jAywewUQQ6iTxyvXW44ISzsx8AV54B1hpyI=;
 b=WDgSVhu+0elx+6pVj5PDBBCINEWH1CqRMCDenexvL1tvPlShD5O9WRdfCzi8O29Clc
 uWMjp6/YjMhfpa//Cv7NHcIOdaIQV/sXxpFXNttibLoh8NH0wE/skOtzvWb0OZ5PoOFS
 +aAYJGrMxI4hjSddODr7lCV9tW209JGNwdVeAnwZ59Fvm3d6Zngpednd/FMZsTposNYS
 rSW1qyuLFWfDFQq6sP6/lNTE6XSWwim1AhSBKccI1vVkGjS4Xwq9eirlDWCqrscO93Fg
 QIXE2/7z0S+US8u3EV5dfBtIa5fmqUExV63ulG4AYZsUHfb2iVsZLruUoGuzEaX9OUq+
 25oA==
X-Gm-Message-State: AGi0PuZr+nnWCm4eqCVk1cu4HmjEWqiUbjpwyEmsgwBLbtiDJ1G7xz5/
 welktkv4gpNrFxN2bRJPZgdqUg==
X-Google-Smtp-Source: APiQypJx0O7VvgXOR82eZlCTzcbEqAd/8GIVYIKlMsTE7BAFpYNrJWzd8Vvtmai+q+dbFc1UhxB+Lw==
X-Received: by 2002:a17:90a:3568:: with SMTP id
 q95mr8369337pjb.47.1587180972138; 
 Fri, 17 Apr 2020 20:36:12 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id u24sm17456609pgo.65.2020.04.17.20.36.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Apr 2020 20:36:11 -0700 (PDT)
Subject: Re: [PATCH 11/16] target/arm: Update contiguous first-fault and
 no-fault loads
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200311064420.30606-1-richard.henderson@linaro.org>
 <20200311064420.30606-12-richard.henderson@linaro.org>
 <CAFEAcA_V09rpr4X_TTZgo+v5Dj1yZR4zA9-94q+C5xikkhM=BQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ea6f727f-a4fc-1106-bb16-5f93c5fdd450@linaro.org>
Date: Fri, 17 Apr 2020 20:36:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_V09rpr4X_TTZgo+v5Dj1yZR4zA9-94q+C5xikkhM=BQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/16/20 7:15 AM, Peter Maydell wrote:
>> +     * While we do not have access to the memory attributes from the PTE
>> +     * to tell Device memory from Normal memory, we can validly assume that
>> +     * non-RAM has been mapped as Device memory.  Thus we indicate fault
>> +     * on all MMIO.
> 
> I don't think you can assume this; for instance a QEMU 'romd'
> device might reasonably be mapped as Normal memory but currently
> be in "send all accesses to my read/write functions" mode.

If that is so, then TLB_MMIO will be set in the tlb_entry comparator.  See
accel/tcg/cputlb.c:882.


r~

