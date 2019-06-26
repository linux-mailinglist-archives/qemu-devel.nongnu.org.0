Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0B5570F2
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jun 2019 20:46:53 +0200 (CEST)
Received: from localhost ([::1]:44288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgCwX-0000Ej-1Z
	for lists+qemu-devel@lfdr.de; Wed, 26 Jun 2019 14:46:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44335)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hgCfl-0001h3-P0
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 14:29:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hgCfj-0008Ag-NA
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 14:29:33 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:38999)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hgCfh-00087e-L2
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 14:29:29 -0400
Received: by mail-wr1-x443.google.com with SMTP id x4so3875056wrt.6
 for <qemu-devel@nongnu.org>; Wed, 26 Jun 2019 11:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=l08eu0l9D5ktUzQZ4NmUljmAfhxNN6xoemzjFfIAF7A=;
 b=KnqqEV8x9Z4Rz/EREv7Q1AHdoqKpM1PIIqD+mQmSWDIuwb8yl05VbE4p3lS/2DJbF1
 4clTNNbEBAUfK3uht3wPvjdiQOZFKQWDQkJutVJa7w1Q0dTpTFAxkNJ5hbTJg8wVkAi0
 soX6ktyrsyWtE4HX+OaLWkCdi3mN60Q3m443bq4ekqhuMYc1JooFjXPBi5djG91/Mq1z
 Sx0fVqHIpQghNjd32zSHSISMMRg26xKcRqxYNgQbLpSn8vWPulyj65dUUS8MkRCXXpcY
 ThzAETolfKqsz7v6VhH7ZuR1545je/YDJOm7K9rWpIdMcX/mcFqkiUMODLGHoWgNoY0j
 CAfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l08eu0l9D5ktUzQZ4NmUljmAfhxNN6xoemzjFfIAF7A=;
 b=G4r0Zbr55+2lWHXNp2u1tbIxNESKIPT6UitbwssNXw0YgZQNwH0IhkmAha5zQaG9W7
 eMORmixHqtNNnNUUAWaX4EtAA/wCbi10wO88Mg4rFdjvPNESl+N4GSsHvZGOIN4CzqG6
 kGSYBhZ1Hb+3HNSQyNX4Hk2y6eGjnoBOyOOevKD7+D0NUeCXivFL6cgwW8Qn4EihScEq
 25z89+mQhXdw22z0Z3O9gUt2dmtkHWdMk6kbhcsBuRQfcziUhsHShE8UVBwtEde4Cc5V
 1DkCPYBu35D7UsHJkWdil1ZYNHq+rFbZXRBAOlpA1qc51YvPEhKbiQ3ARitIBN43cJJX
 m94w==
X-Gm-Message-State: APjAAAUtpaKfDfFIITRiuNCthkTChD8S0JVooIpAqfJ/ohUzlL4oSGxa
 vjkwbrheLFYX9wOyAknWa7TQ0mcQ8Hdihw==
X-Google-Smtp-Source: APXvYqzKTgZrncqWDVB7pZolW6QQlEkEWmi5rkUd7WOk6cKrQ910W1S+SmQJsDEdXpYPV1HEMuv8pQ==
X-Received: by 2002:a5d:4949:: with SMTP id r9mr4535954wrs.289.1561573767578; 
 Wed, 26 Jun 2019 11:29:27 -0700 (PDT)
Received: from [192.168.2.137] (93-34-153-63.ip50.fastwebnet.it.
 [93.34.153.63])
 by smtp.gmail.com with ESMTPSA id d18sm51318197wrb.90.2019.06.26.11.29.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Jun 2019 11:29:27 -0700 (PDT)
To: Stefan Brankovic <stefan.brankovic@rt-rk.com>, qemu-devel@nongnu.org
References: <1560942225-24728-1-git-send-email-stefan.brankovic@rt-rk.com>
 <1560942225-24728-2-git-send-email-stefan.brankovic@rt-rk.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <fcf11625-48cc-2f79-42d1-6faad9ec38b8@linaro.org>
Date: Wed, 26 Jun 2019 17:48:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1560942225-24728-2-git-send-email-stefan.brankovic@rt-rk.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: Re: [Qemu-devel] [PATCH 1/8] target/ppc: Optimize emulation of lvsl
 and lvsr instructions
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
Cc: david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/19/19 1:03 PM, Stefan Brankovic wrote:
> +    /* Get sh(from description) by anding EA with 0xf. */
> +    gen_addr_reg_index(ctx, EA);
> +    tcg_gen_ext_i32_i64(sh, EA);

>From patchew, this fails to build one of the ppc*-linux-user configurations.

You need to use tcg_gen_extu_tl_i64().


r~

