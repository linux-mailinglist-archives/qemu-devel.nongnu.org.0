Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D94EB34BD8D
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 19:23:46 +0200 (CEST)
Received: from localhost ([::1]:41198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQZ8b-0003A5-VI
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 13:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQZ6L-0002eU-TA
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 13:21:27 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:42590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQZ6J-0007Lt-Sb
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 13:21:25 -0400
Received: by mail-oi1-x22f.google.com with SMTP id n140so10952434oig.9
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 10:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Zwp5UQog1R+9rU1CaHkFEn24W7arrqMAGCzYTfPof10=;
 b=jO8sMbrvG6X51PyHxY+j6D6VlEfsgF3oKFsQBrwauKmxbb1h6RMVMuDz4FiUNTuxhb
 pb0BAun9fvcMsAujYygoAj62uOxlNueVQ4Mnw2lDd4Iwfmj24qWV5RAMV7Kn1qIWLj0O
 FRAuSnCmCWLDfl1SOHLx2bz74aM0g3iDwNFRYLVgAj+wEYVUZaPNXKj1jelfOKqz/zUt
 fCquamw2re5QApoFdwzmyCXs7qq68x+L7neMCMcC8bkecopSKPGtN1ljF4/6f3lfToiU
 6N3vSdlIgIuUifLQootb6mUPNYDb1LOxkVV9CVFWgz/HPP2UHAZilI9IbUzcB1MhT3iK
 cDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Zwp5UQog1R+9rU1CaHkFEn24W7arrqMAGCzYTfPof10=;
 b=gxxGoTyXWQB6kGTtcxEIT5LpaxXmya7p1PHBj1ljp+BwIMv6r7B26zDfBY9FZ9mwIw
 OHt2cVzPsUH6nDJYN5KsIl/sL3Zn26PKBlyAXF0CsSpAg1HRrGaiNdwr4bsGzKyPoZoM
 S6LhDBfUBEyp37arczBPvAHkRdbzZf5KtqVzwxoyso/VqltPsBDDulnJTjwBRvGjCeKu
 jEzUZDSRGNJjxLg/hDJm9Js/zR67TtGbNKf/Sc7pA5ssA2V7qACZ3ya7qAM22GCsTtSO
 dsOF3bbCO/5Jm00cVAYjaO9K7wI0SK8pPVtx9jfTFtHHBAuYfBfpRzhrpE2KszklUJ7v
 ATiQ==
X-Gm-Message-State: AOAM5306s3G3cTX67sh62gQO1yd/L8T/QpXfVwMn04uo59UqYP6YC+fz
 eVyecIB0l9bAgwqHR8ycJcCsoQ==
X-Google-Smtp-Source: ABdhPJxB998nWt6UUGjHTYLcbCbcOBm3L9rM3LftPosMbSM4I9HRhlrZe9QJWUBiywtNGEouZ3aYKw==
X-Received: by 2002:a05:6808:18d:: with SMTP id
 w13mr16369542oic.144.1616952082646; 
 Sun, 28 Mar 2021 10:21:22 -0700 (PDT)
Received: from [192.168.211.34] (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id z19sm2945801oia.25.2021.03.28.10.21.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 10:21:22 -0700 (PDT)
Subject: Re: [RFC v12 40/65] tests/qtest: skip bios-tables-test
 test_acpi_oem_fields_virt for KVM
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-41-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <be6e704a-8c61-052a-daaf-deddd683c6cc@linaro.org>
Date: Sun, 28 Mar 2021 11:21:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-41-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22f.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 1:36 PM, Claudio Fontana wrote:
> test is TCG-only.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   tests/qtest/bios-tables-test.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index e020c83d2a..bd7b85909c 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1488,6 +1488,13 @@ static void test_acpi_oem_fields_virt(void)
>       };
>       char *args;
>   
> +#ifndef CONFIG_TCG
> +    if (data.tcg_only) {
> +        g_test_skip("TCG disabled, skipping ACPI tcg_only test");
> +        return;
> +    }
> +#endif /* CONFIG_TCG */

Why is this an ifdef and not tcg_enabled()?
We're using kvm_enabled() elsewhere...


r~

