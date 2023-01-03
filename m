Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C48E65C077
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 14:11:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCh40-00043c-2d; Tue, 03 Jan 2023 08:10:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pCh3q-0003wr-RW
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 08:10:36 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pCh3p-0001GR-7L
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 08:10:34 -0500
Received: by mail-wr1-x433.google.com with SMTP id w1so17247125wrt.8
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 05:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vuBXIChN3jpkV/TrPBhM0ivtggrHtriwaME48Ys1+K4=;
 b=IzMPenfAqQYJulxO90uy5AtJknn426MoavOSpajbJY3BDu3SDUIMI93dTRwn4EGeWS
 miq6Q1f0qOEq1ySGDMiyFgf34t+R+xLsVFgd1y4lNlRBzuZhKs2TOnYMUCUXgBOFlgrQ
 LTq3hHjDjuIyRVVpIWspZCcLnEkKOmD0MftTaVtHIIyaFLHavHZl1/QDZehzJLAMXjGE
 oJA2yJzCzZTHB/TDZtqMNkEHlAWNhJaYVYbDb3f/p2Oyh0DoDK69cZyQFOArxsWyM6UU
 Nfceiv03bqgCqb6LcnWLpYpHNIBRSKjjSKE42NKKTMFBBd4llPMZH6H904UPexEIlWrj
 qE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vuBXIChN3jpkV/TrPBhM0ivtggrHtriwaME48Ys1+K4=;
 b=sCHNu5LI5rsGu3J16VedK2b3VG7ar8yNGsgXrSjuX0Pn+k6YQME/YxX5P9rzLLmdWW
 xAURGcNEePqpEdHN5KD0gUYYAEUhDepm47fbNFw6ODwPWN8jxMwVvzp7Q2RKK2MmHGvr
 upNZQjaPHa+Qodjb65gLWcr7N30N1IfPt9l10pWQ000CjdXQZ+TWkF3KiLc971OD+hLv
 DMUCEPairDksnj4KLb/S/vNN0/bfM7XgXPHzXWwDLdon2LulLDxw694MYZWOg2Akpe2u
 b0iQfiLZr4yhHmdk4fM4Q7OwOZNSHwWPBw++O8oIICQdeVA7XMQzdCyjEkp6eHCP6I9H
 b0iw==
X-Gm-Message-State: AFqh2kp/oK8NT1I7AN1OPPhMQM8Xa0IstVk74bmX+wXx+p2PD/+ekNf0
 wzt80puI7dMbsjt8oj+89kN1TQ==
X-Google-Smtp-Source: AMrXdXv4HdCVsxkZdELefKPPuypAM5S2LBI8ID3GxfzbEoPjvPgq6ahEmA7L0dKR+z/V5JvMTys5JQ==
X-Received: by 2002:adf:eb02:0:b0:265:faec:7086 with SMTP id
 s2-20020adfeb02000000b00265faec7086mr30057658wrn.9.1672751431515; 
 Tue, 03 Jan 2023 05:10:31 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h10-20020a5d4fca000000b00281eab50380sm24572392wrw.117.2023.01.03.05.10.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jan 2023 05:10:31 -0800 (PST)
Message-ID: <4e4dbae4-2214-fe5c-6492-ff956e7dc1f2@linaro.org>
Date: Tue, 3 Jan 2023 14:10:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 4/6] hw/rtc/mc146818rtc: Add a property for the
 availability of the slew tick policy
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael S Tsirkin <mst@redhat.com>, qemu-devel@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: BALATON Zoltan <balaton@eik.bme.hu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20230103084801.20437-1-thuth@redhat.com>
 <20230103084801.20437-5-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230103084801.20437-5-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.103,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/1/23 09:47, Thomas Huth wrote:
> We want to get rid of the "#ifdef TARGET_I386" statements in the mc146818
> code, so we need a different way to decide whether the slew tick policy
> is available or not. Introduce a new property "slew-tick-policy-available"
> which can be set by the machines that support this tick policy.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   include/hw/rtc/mc146818rtc.h |  1 +
>   hw/i386/pc_piix.c            |  1 +
>   hw/isa/lpc_ich9.c            |  1 +
>   hw/isa/piix3.c               |  1 +
>   hw/rtc/mc146818rtc.c         | 16 ++++++++++------
>   5 files changed, 14 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


