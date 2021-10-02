Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E8441FE0E
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 22:33:54 +0200 (CEST)
Received: from localhost ([::1]:58016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWlhh-0000lp-1v
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 16:33:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWlfo-0007Oc-U0
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 16:31:56 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:46836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWlfn-0000xL-4A
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 16:31:56 -0400
Received: by mail-qk1-x729.google.com with SMTP id b65so12596121qkc.13
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 13:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3sk3VK87RTeC2DQCgpFzKA86Ln6xDgKRsP707wCdDFQ=;
 b=RKmeKQCZnrRoJ1f32J9F7DKW5F6TWiJzbrW04LWIxFrjPzaK+ycN3bA8w9Qs3w63HI
 573SD5LX/2sHdSgn40jVKdIRDZsWPQ/SUiNI45Siq41H8vqOZ+ZJxEidixzd0EZtCyJK
 Rd2uQa9g/VG8rCpJFnIYO3oUc7bOM8t6GF3o4HGOR+VHvyYjnxomFBu9tRcZwu9GMxlJ
 KAoPeqlo3PWF5nCnlFZtzJCITiIPH143x6Hbc0omNRK5d7ZMW2egk8sdwHmx5s08Rwmt
 INWy68DtGqIG458d5s+UcCuIz7MnrelSbZicSChhGgfxXvPn8C6sCyWnS6fhrgUPo1Ny
 +fyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3sk3VK87RTeC2DQCgpFzKA86Ln6xDgKRsP707wCdDFQ=;
 b=Juy6NqH3rnVCNANfk5QHbRIPaA9TIkil/lnN/ewC/mumkp2vqezuIUEIwV4+N6E60x
 DUyrOzsW5Y3/W2vUAu7Oz+KfwDJOOQ4BOSIqIsYdPMEurIGRyX5pmV614t08wfI4D18B
 XIfkWEkstCSuc6Ebh+wJgiR+GNUlKgjYDcox/w1sn8pls/7iPcxCFN2ZjPn/CuSlfloc
 2hBY77wzo7Ic/ps3FW/6ZroF8+2SeAJe0y4pLhlTKCjLIikG7hZq5Sp8L1S6vH9ZhAwL
 FUUifVaPjc2t93yJPUt7p/h50fAjECllNjlhYd1jtnWxAcYOQ+FJNW4ruDRtmbjG09gM
 bZag==
X-Gm-Message-State: AOAM5318gC5FAMI7wZ33aztrXLvpOcDpEK3ors7omlIFML17M9P4MXWL
 Yf6RJP72adn8dK2kPWexJLr+pUNWXPOGzg==
X-Google-Smtp-Source: ABdhPJwJvEkWcbwJIPPCtu7opewWibc+2KreALLyeS98DMiN11vVBHQ7a7+yX/V0PwHdbiBdNWnYrw==
X-Received: by 2002:a37:6841:: with SMTP id d62mr3838537qkc.107.1633206713048; 
 Sat, 02 Oct 2021 13:31:53 -0700 (PDT)
Received: from [192.168.3.43] (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id q84sm5133928qke.3.2021.10.02.13.31.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Oct 2021 13:31:52 -0700 (PDT)
Subject: Re: [PULL 00/13] QAPI patches patches for 2021-10-02
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20211002095655.1944970-1-armbru@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3a6c6bb6-7cc9-545d-4b2a-add776c06e8f@linaro.org>
Date: Sat, 2 Oct 2021 16:31:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211002095655.1944970-1-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x729.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.413,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/2/21 5:56 AM, Markus Armbruster wrote:
> The following changes since commit 5f992102383ed8ed97076548e1c897c7034ed8a4:
> 
>    Merge remote-tracking branch 'remotes/bonzini/tags/for-upstream' into staging (2021-10-01 13:44:36 -0400)
> 
> are available in the Git repository at:
> 
>    git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2021-10-02
> 
> for you to fetch changes up to d183e0481b1510b253ac94e702c76115f3bb6450:
> 
>    qapi/parser: enable pylint checks (2021-10-02 07:33:42 +0200)
> 
> ----------------------------------------------------------------
> QAPI patches patches for 2021-10-02
> 
> ----------------------------------------------------------------
> John Snow (13):
>        qapi/pylintrc: ignore 'consider-using-f-string' warning
>        qapi/gen: use dict.items() to iterate over _modules
>        qapi/parser: fix unused check_args_section arguments
>        qapi: Add spaces after symbol declaration for consistency
>        qapi/parser: remove FIXME comment from _append_body_line
>        qapi/parser: clarify _end_section() logic
>        qapi/parser: Introduce NullSection
>        qapi/parser: add import cycle workaround
>        qapi/parser: add type hint annotations (QAPIDoc)
>        qapi/parser: Add FIXME for consolidating JSON-related types
>        qapi/parser: enable mypy checks
>        qapi/parser: Silence too-few-public-methods warning
>        qapi/parser: enable pylint checks

Thanks, applied.

r~

