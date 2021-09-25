Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2975418130
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 13:09:04 +0200 (CEST)
Received: from localhost ([::1]:45220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU5YF-0002SL-Tw
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 07:09:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mU5VU-0008Ty-AG
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 07:06:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mU5VS-0004De-GV
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 07:06:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632567969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yi2Z6RB0b+bO7Gpdoh/nc/GVapX1+RckivB76WkpHMw=;
 b=UubjYly1Zg5E7o0oIisIlBC+pgFESGPUIddnfc866/JbO5OtIuxhi6AQ8mARo07BE6yCas
 Jvf3/eDiZDq4Ofoev729hG1xaLkzq5eSu5QN90P4YSUAkXop2oeVy+Mm2Cmcc/ih6PqG66
 2nDOa/d4hOuIXqKtTm49gXoV8BeVENo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-sXcOkeaLMTqED8Mjzui2zg-1; Sat, 25 Sep 2021 07:06:07 -0400
X-MC-Unique: sXcOkeaLMTqED8Mjzui2zg-1
Received: by mail-wr1-f69.google.com with SMTP id
 u10-20020adfae4a000000b0016022cb0d2bso10321877wrd.19
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 04:06:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Yi2Z6RB0b+bO7Gpdoh/nc/GVapX1+RckivB76WkpHMw=;
 b=rVTjh79aXKc2DUmtK4Yn+h4f/upEj2btfaNm25hPNXO4YTJHhTuXomWHoeNapvdbQI
 mgPdGjf807gE9l2ajWm9ZE3rNnBP04IQVlgTJiyOf85i7vERyqSYDrpP4EP86IHoRktE
 At2JpS4jn2p/N3qtcwZFMU5eMwiUxPAweZl8N82b5gw8VpIfY6pMNO6EQHR6uYY7ei2R
 CI4F8gVSDua3wYrb0S5XKopQnEcGKBgIQqjn1lrEaqwjErwjRsCZe+sFNgWdOZJYfTsE
 uHG4ZTUJepnL5fWJGsV6pwKmXg+agH2woBnqjqgnLTrvuFLobL9GzU3wXKfVZirlSMk1
 g1tg==
X-Gm-Message-State: AOAM532I+3BLSbiPobhGsWXq0/3X2ucwQIF5at9Ur6CCGArgKePQsW4F
 g+ohrulp198KpuUjrZDUlx5/zw02ya1GOWyNF/bFyEFMTolqQK3R5XZvokDP3aylpTo/mXwsR2A
 rcfqw1H0xqf8zKoA=
X-Received: by 2002:a05:600c:198c:: with SMTP id
 t12mr6683393wmq.128.1632567966388; 
 Sat, 25 Sep 2021 04:06:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvILsLfFOtQYALh3PZpsPPyVwwSp65on0fKvqiABmQOeXKXcJb+WjKLf0ArxVLTBZ4Zvwemw==
X-Received: by 2002:a05:600c:198c:: with SMTP id
 t12mr6683361wmq.128.1632567966163; 
 Sat, 25 Sep 2021 04:06:06 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id x4sm2943014wmi.22.2021.09.25.04.06.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 04:06:05 -0700 (PDT)
Message-ID: <c62b205e-493c-de55-c27f-aea0415ab7ad@redhat.com>
Date: Sat, 25 Sep 2021 13:06:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 1/3] tests/Makefile: allow control over tags during
 check-acceptance
To: Willian Rampazzo <willianr@redhat.com>, qemu-devel@nongnu.org
References: <20210923161141.232208-1-willianr@redhat.com>
 <20210923161141.232208-2-willianr@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210923161141.232208-2-willianr@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.482,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/23/21 18:11, Willian Rampazzo wrote:
> Although it is possible to run a specific test using the avocado
> command-line, a user may want to use a specific tag while running the
> ``make check-acceptance`` during the development or debugging.
> 
> This allows using the AVOCADO_TAGS environment variable where the user
> takes total control of which tests should run based on the tags defined.
> 
> This also makes the check-acceptance command flexible to restrict tests
> based on tags while running on CI.
> 
> e.g.:
> 
> AVOCADO_TAGS="foo bar baz" make check-acceptance
> 
> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>   docs/devel/testing.rst | 14 ++++++++++++++
>   tests/Makefile.include | 12 +++++++++---
>   2 files changed, 23 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


