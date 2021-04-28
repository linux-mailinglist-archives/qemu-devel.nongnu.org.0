Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CED9C36D9D7
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 16:50:51 +0200 (CEST)
Received: from localhost ([::1]:55920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lblWc-0001aZ-TV
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 10:50:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lblVG-0000kQ-Aw
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 10:49:26 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:34474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lblVC-0005xR-0r
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 10:49:26 -0400
Received: by mail-pl1-x62b.google.com with SMTP id h7so4396098plt.1
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 07:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AGf9MC1aB2MkLkO15YrgBoFZemTAePxM33VsbbzX0fA=;
 b=nabsdUXhhWSCkZtwTCefYMXLaWNBxV0AZOQ3IS+xiimSK6M8lmVWUtYzqpKCMGQgYf
 Y75ZnEq1oM54C4RAomOf0H/j+TD33RP8axxQCCWuP6DsApeHimi9oxkUEy1g1o5rgD57
 nA6YAoWlmtfXENnr35MiR9Xxe+7SDqPdFQhnzMSbZdapsDn1C5RwLZaVYyAlszEAX2aY
 Tl7HOMRBvw3/4cnLYySeTQBC2ECQw4aP195R/2A0QXq5lgCFezcE83HKwU71AJX70HEV
 QFXIkbJxFOBSAtxRjngk1Fj/Fddtuad5oq3at0LOSFmsKW0IMt7iNZc4R8RdfTJu+2JN
 wykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AGf9MC1aB2MkLkO15YrgBoFZemTAePxM33VsbbzX0fA=;
 b=ifIWHeNLiA5syOHqcmWXUWTliXtK27LDRMd+zH/d7qIVC55AEL0qDRR/ZYPlnYfrTi
 noPCIWp4ff9j7Xut8QeieB5+ydH/xGskTYhOF7WpfD6rtzYBX/WRAfDY3+/TqFoxkVdI
 lEdBtbRgVVlNRoWo3jj+klP+d7A9Er9tmZh2hyyaDKrOv+3Sm5WyXKeWcVSBrJh7CdQU
 g+OBiSpsiCEBbSezAMT3sGw5m07rYkD+uzNcqmVcXlJ4h+4IJbAN+dAhBWB2d1u4+T+n
 BZuMeWAPmeJUB8GJ5B8VlBKfeZYEXfllD6VVZtgaxNDdjJSGnbZ974CQHuV1hGZvCIkW
 O5Zw==
X-Gm-Message-State: AOAM530lyL+9ipghOTtmIsrWG2UdLzdrmkQJNQRAMfXUgse7ldLV3dr5
 VPkte17K8tQcqAZcWvzFiZAK5A==
X-Google-Smtp-Source: ABdhPJwE66wBCVuyOnMaGX4LUM+C/eWcEuyMN2EfW+o7e3IyKtnxmClEzEgTB4BeFl6TnYiM3UcOtA==
X-Received: by 2002:a17:90b:388c:: with SMTP id
 mu12mr4444460pjb.51.1619621360672; 
 Wed, 28 Apr 2021 07:49:20 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 5sm48274pfi.43.2021.04.28.07.49.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 07:49:20 -0700 (PDT)
Subject: Re: [PATCH v2 2/4] hw/sparc64: Remove unused "hw/char/serial.h" header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210428141655.387430-1-f4bug@amsat.org>
 <20210428141655.387430-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e4c963ce-d013-bd47-0c65-a60c19022315@linaro.org>
Date: Wed, 28 Apr 2021 07:49:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210428141655.387430-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: KONRAD Frederic <frederic.konrad@adacore.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, Fabien Chouteau <chouteau@adacore.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/21 7:16 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/sparc64/sparc64.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


