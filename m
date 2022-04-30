Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E446B516030
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 21:59:55 +0200 (CEST)
Received: from localhost ([::1]:53924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nktFz-0001ax-31
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 15:59:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nktEY-0000Oe-8q
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 15:58:26 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:44803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nktEW-0007Fs-Qg
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 15:58:25 -0400
Received: by mail-pl1-x635.google.com with SMTP id j8so9714072pll.11
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 12:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+1PDwdPiBFHcrv+5bWrRXUgWZ98lwvAvBdyWfdv4IaE=;
 b=z1TYSntlmXxGtWIEPhzEZVTSX7DoWH9R5XOv7HQQNlIW+D0YiDeNwIs3Gly0okQ0Mq
 J5E01AWlGsBHeiT0HRk2JMGtkoVh5cWg2MNdhocuLlB9cy0YFzNBSowc3QGfhO3htXDS
 1Lc277a2HfkqBeSq7D+LedqNX1m5ZjvrAlGTrbmltcC2HKrVw1qnn4jaZSqjBTeeStOu
 9qIpGk2x/rg1sXmzKWFy4+JoZKdhlNKc3WCBwnx94Ehr15PCQKHlyIYCuRlqV4H9LWra
 jbJVk5aRb9ctK/6gP0Sjz3jtQUkWVxA+J96PGC2SxYIpLZ+BIM5nBFvLBVXOdTWNt/as
 sUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+1PDwdPiBFHcrv+5bWrRXUgWZ98lwvAvBdyWfdv4IaE=;
 b=741G+XMG2WJaVpI2luKkj0U+PFz/MJqQdQosLUnP0CutyaR7cmYRo8I3HHdLbOHQnJ
 XCidcHzhTP637DqAx9j4ZZEbVhB+sP975GPEqLGeLuHwNhIiTDczwN5w4xZjPVQ/n2Hs
 xX5u1hfDcPm2PnaloUDanM/jF9AA64mA4ZxqL+HnQmkn2yQHiltnBAj6Sk4MTrUEuJjx
 hlw3tbsv5cCcY0HSi9OFYZZlVd1TYdmh2QDB67X+ox947GmtUejiVoEjPypv4jW/0dRU
 4GS7O8wA5uM6HL2STLzRyvdO8edm0wS1oKMjFO6IezDu2q6NrILJB0ygNrsnhJmrOMJp
 zdrA==
X-Gm-Message-State: AOAM5316+qO/luj6MQswIEs1XMVWDmHz7OBU12nPThezvzQS6XVeS0uz
 hY1XwdVb2a/w6nraIHZl32WcJg==
X-Google-Smtp-Source: ABdhPJxZEub/hlaTeBapavv+cKzrbZtT3Y2X+qx1TtRq1z4NaOmL8sdyliDhOGHdtkJNAJldR/GMyg==
X-Received: by 2002:a17:902:e851:b0:15e:93ac:41db with SMTP id
 t17-20020a170902e85100b0015e93ac41dbmr2343518plg.26.1651348703224; 
 Sat, 30 Apr 2022 12:58:23 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 g4-20020a1709026b4400b0015e8d4eb299sm1854788plt.227.2022.04.30.12.58.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 12:58:22 -0700 (PDT)
Message-ID: <70dbbce0-2aa2-ce0e-be28-1f637e4b5cc5@linaro.org>
Date: Sat, 30 Apr 2022 12:58:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 10/12] pc-bios/optionrom: compile with
 -Wno-array-bounds
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220429141813.328975-1-pbonzini@redhat.com>
 <20220429141813.328975-11-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220429141813.328975-11-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/29/22 07:18, Paolo Bonzini wrote:
> Avoids the following bogus warning:
> 
> pvh_main.c: In function ‘pvh_load_kernel’:
> pvh_main.c:101:42: warning: array subscript 0 is outside array bounds of ‘uint16_t[0]’ {aka ‘short unsigned int[]’} [-Warray-bounds]
>    101 |         uint32_t ebda_paddr = ((uint32_t)*((uint16_t *)EBDA_BASE_ADDR)) << 4;
>        |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

