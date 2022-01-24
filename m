Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D522549897B
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 19:56:38 +0100 (CET)
Received: from localhost ([::1]:34998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC4W5-0007LI-V6
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 13:56:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nC45l-0007w4-HP
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 13:29:25 -0500
Received: from [2a00:1450:4864:20::432] (port=42690
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nC45j-0002S0-T7
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 13:29:25 -0500
Received: by mail-wr1-x432.google.com with SMTP id a13so15265436wrh.9
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 10:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3IySyDPEM082I2ZzP5Ob7Bu+w6xaAql9dCjvWxsNVoM=;
 b=aFRYdyN8jsExTqcbAzMJqdBi/itiz2hZJ1J7fudaNPYM8iIIUW2nc+tGhse0GJjn7m
 iMoeEXf56pSOsAYvwd/V3jjisJ956I+xYd2ubmOdpbg9E5cN4Nyo7RAfpKMqQkEGmXu6
 ZwfYcx0MAWOm39JGBsRaK+TImhsULESDfi5E0Xwd94Xm+EfnVUz5FeT36Vihfchp/Eid
 2LeOerl1RPIqWjPfB9BlH3zH1W9FxdHb6doC5/eB+U1lNVKABkFjxLcadH79cWyPKFQE
 WgieSdkB5m5hla1f1V+vcvb4z0j2Y+ADqpoO3p9UXeeKqQyUtVGcRkDdT9wFi/BVLEb5
 p1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3IySyDPEM082I2ZzP5Ob7Bu+w6xaAql9dCjvWxsNVoM=;
 b=S2whpyuWvwU2GIqfLIg0N0xMb1SPAV1y55KFFMuuubT7jthN/88yw7vs1C9wJf7n1M
 ieDKyy3TULx6oPKzSltfqKg9DuoRphoM/6+B7d5hzoChtpvDaqjPJXnlmOnSo26WaGVk
 pMucczjsv3+54pg5VmACZH/anZZ+gU/6QAkblVCdVDLCsuhSN4eyra6GGVuFFrLdeenl
 xfCMkh3yUnsoCutS+uJsXAGjXxv1PP1pCveodIDRt/fsDh/5SG6nEE0k6DIf8deoytSy
 4z2mJqR/nqIvlKQpItgOFR42FsH0iBfbaN4pkJNmzGIHgwIrdfSYY94vzrw1dx4uchkz
 32SA==
X-Gm-Message-State: AOAM533gXvyzca7ytYqGWlzO5dmzYpg3jvSx8TMfx/BFNUhD11a+1/XR
 ClFY5pXs9nN9NEr4AnCZZQI=
X-Google-Smtp-Source: ABdhPJxjjCKj+cYsk4SlpgIGSacGBaC4tLsH3WdR5jinB72Jjx00Uw4dZLuH4z1C8OdG5U3XyohdJw==
X-Received: by 2002:a05:6000:184f:: with SMTP id
 c15mr1983433wri.208.1643048962204; 
 Mon, 24 Jan 2022 10:29:22 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id i3sm59597wmd.30.2022.01.24.10.29.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 10:29:21 -0800 (PST)
Message-ID: <4dc22a36-52da-26fb-bf8e-5e27e91db359@amsat.org>
Date: Mon, 24 Jan 2022 19:29:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 0/7] tests: Refresh lcitool submodule & remove libxml2
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Ed Maste <emaste@freebsd.org>,
 Thomas Huth <thuth@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>
References: <20220121154134.315047-1-f4bug@amsat.org>
 <87mtjle71g.fsf@linaro.org>
In-Reply-To: <87mtjle71g.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 1/24/22 11:55, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
> 
>> This is my last respin on this series which is fully reviewed.
>>
> <snip>
> 
> Just to note the "b4" application of this broke the From addresses. If
> you see the lore copy:
> 
>   https://lore.kernel.org/qemu-devel/20220121154134.315047-1-f4bug@amsat.org/
> 
> all your From's are via qemu-devel. Have you changed anything about your
> submission process?

No. Maybe the list changed something again? Similar problem occurred
18 months ago IIRC. Not sure what I can do, the domain misses SPF/DKIM:
https://toolbox.googleapps.com/apps/checkmx/check?domain=amsat.org

If it helps you can get them on my branch macos12:
https://gitlab.com/philmd/qemu/-/compare/5e9d14f2...36d00943e?from_project_id=6939745

