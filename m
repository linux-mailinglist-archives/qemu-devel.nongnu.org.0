Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA123A6CAD
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 19:04:53 +0200 (CEST)
Received: from localhost ([::1]:54646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsq15-0006BX-OG
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 13:04:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lspzj-0005QG-At
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 13:03:27 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:38600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lspzf-0002Ul-Rt
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 13:03:26 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 m13-20020a17090b068db02901656cc93a75so10480578pjz.3
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 10:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=gdHl44hfaSc555IxUTN6n7BkjazQ7aVjqGDVYYL/RjI=;
 b=CelvRIeGoT45UbeQ7DX83xk3vBZpXHBlLvFitjYHxayEFwg/AV6EM3PHQxvRClc8YF
 9hFB6cZkbhTqDp01pkES9sfiM7sNtQJNAhiZYA1DFNWaJNoTVWwTSg8Ji6WYMWM1mFkH
 OUIf4EXFZ0KfxUOgJHA1J722SCBpbq062tagY/6fcy15Yv0bHn17BkviOg5JhSCou38k
 J3DcWrhGoUfKicaatMn60AAnFconP46pG2TsZD6sQocYY5iJxms049H2GFXqVo/TcMmp
 0RADmjEyvbJkYFSNp0fjugsJYfbcA6xiJdS38nJTj7xhzDzNxxYxvQNeQg+FKQshM++q
 RFVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gdHl44hfaSc555IxUTN6n7BkjazQ7aVjqGDVYYL/RjI=;
 b=d/C4yNIM/gJO6uZHF6s/4+ZYKcA89cdJdtJzQDCc+R3c26xo71FJ+oj5caYM7aPeXj
 02Q4E7qNGHV6y/lw/dWWnKsMRCeaRjBO2GFe9ICgJe9+OTwtu3v3Jt9qxxzDMZzDFDM6
 cUN91Z3MObtGcyA5SRJbZf//otAuLUPNLn95K4Jisje3oyKqjlXVqznSXm0HOCNzb1mj
 9mwxsdBqZsinvE82epOJ7LUs9NgQUCSCtZ2Q5TsAIMLxxLmBLYOtct6m0piTTBz2FRvD
 3Suiit15sfw8nw5oEEBvL7V7AF54tnAqJzaetY8l2wQDNtUnTVdRObgOX31coBA7iU7F
 fsZg==
X-Gm-Message-State: AOAM532+QVWm1F/2J8wbrZ0Qxd/Jv4xT8wtS1P7iSD1t0YctpZVts07F
 byqQHGzX2cjlbb67pwCvXUucDQ==
X-Google-Smtp-Source: ABdhPJxZ23CqXJIYW+UnPZ5IzV1iSuhoyofSjac//CGm/E80RCg5PvaCkJyhZf6AfkwFfVvF0VvdmQ==
X-Received: by 2002:a17:90a:6002:: with SMTP id y2mr75998pji.197.1623690202159; 
 Mon, 14 Jun 2021 10:03:22 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 g17sm4560496pgh.61.2021.06.14.10.03.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 10:03:21 -0700 (PDT)
Subject: Re: [gitlab] Renamed issue labels for target architecture
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <0a102843-bb93-93b8-f502-dd0cb2a6c636@linaro.org>
 <9b0849bd-20d0-9f72-01bb-ffb60cad575b@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7864c853-8f4e-b6a5-aa19-213534c6d72a@linaro.org>
Date: Mon, 14 Jun 2021 10:03:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <9b0849bd-20d0-9f72-01bb-ffb60cad575b@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/21 9:29 AM, Philippe Mathieu-Daudé wrote:
> Wait, are you seeing labels are a notification mechanism or a way
> to sort the issues?

Sort the issues, primarily.

> Until your rename I was using arch:s390x to contact S390 maintainers
> for build failure on s390x host [Build System, arch: s390x], bug in TCG
> backend or bug in TCG frontend for target [accel: TCG, arch: s390x],
> hoping at least one person notified would have further look.

Ah, hmm.


r~

