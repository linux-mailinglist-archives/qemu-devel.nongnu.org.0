Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3531A4531D8
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 13:10:58 +0100 (CET)
Received: from localhost ([::1]:41808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmxId-0001w9-LO
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 07:10:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmxGj-0008Md-M9
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 07:08:57 -0500
Received: from [2a00:1450:4864:20::332] (port=53895
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmxGh-00065E-UE
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 07:08:57 -0500
Received: by mail-wm1-x332.google.com with SMTP id y196so16682179wmc.3
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 04:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IgKg0Ai0yjKlbpvtP8SqPraRkPfaxY7/PrE17+6WNkQ=;
 b=x6ovScYSnu9bcvUOLuyFrBk4s1aAlmR4SSERQF3wE0shnJ3C4nv9ggWSuN3/7Ds6u+
 mt+xnSEjbcoDg9UDJF3G8Mfwwk03Ztx3N9IFsYadl9PQYnEdzeWvgotwVeYjheBoX97s
 fceFmomv2+4khFAKoixqM2+CedwmIpb7RhcZOfOS0t1f52Wz+At2n2BCDWjra1OVAmYC
 P34rS0sxHYd3JwwR3QSNN2VBw71k/QRaQ7EWChVypiGvanHLDrX7ZFgi9GnBOhlStqck
 zHNO4Tz7UlaXJzz40i6FCUYp4ZGlbA58nVpAO51Ra11BdlaDboavx3B+2JyPE4EphQji
 EXyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IgKg0Ai0yjKlbpvtP8SqPraRkPfaxY7/PrE17+6WNkQ=;
 b=4V4n40+h/Ox+hwI1vF52aUQBnOv8aKnvS77NYpVD/UExohTSKdKXcPNQPwIBOez1RG
 V/D+EYckTkN71+8jYXC4un3+2bZPVWkmSqf5Y9ztzucCVkp28tJeyGBKXKoCI07pmcxG
 xrBKbIYVk+A0cX5XhpF6XbNtxxdT09gzrjQcfr9+pL9Nqgg2fMgQENCvmUpOIgDE6aRO
 ssCzD6YRD1nMS4HPhCZiAHEX9m3MuZXYzHIMrUok/iirt0/8jxplS23Psyg7/W7oIpWP
 vWqE/9xsKkj6ie98S6oAEN6LTvV8mF5pdfEUzts0qDM/lPJo0d1c3xxnKyEzGwXpqQHC
 XGYw==
X-Gm-Message-State: AOAM532L8yJZOAncPRqTNbFgfzNeqVC/PX4Mgdeo29oeItkjGcBxZjP5
 IIYwiL9VqGBktMaq7/bgRhm++g==
X-Google-Smtp-Source: ABdhPJww7p3oGQ7pdDmWZW9mSKq6IhCbpqmvuItNNo6dJadfcKMpDbY+wX5UfqK8d0R33f2V4tG2mw==
X-Received: by 2002:a7b:c2a1:: with SMTP id c1mr19647679wmk.112.1637064534547; 
 Tue, 16 Nov 2021 04:08:54 -0800 (PST)
Received: from [192.168.8.105] (145.red-37-158-173.dynamicip.rima-tde.net.
 [37.158.173.145])
 by smtp.gmail.com with ESMTPSA id c5sm18329676wrd.13.2021.11.16.04.08.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 04:08:54 -0800 (PST)
Subject: Re: [PATCH-for-7.0 v4 08/11] tests/unit/test-smp-parse: Add
 'smp-without-dies-valid' machine type
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211115145900.2531865-1-philmd@redhat.com>
 <20211115145900.2531865-9-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a5ea8c56-1574-b7d8-a1e6-8f4f988aedac@linaro.org>
Date: Tue, 16 Nov 2021 13:08:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211115145900.2531865-9-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.446,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/15/21 3:58 PM, Philippe Mathieu-Daudé wrote:
> Keep the common TYPE_MACHINE class initialization in
> machine_base_class_init(), make it abstract, and move
> the non-common code to a new class: "smp-without-dies-valid".
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   tests/unit/test-smp-parse.c | 19 +++++++++++++++----
>   1 file changed, 15 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

