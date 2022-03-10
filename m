Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5934D4893
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 15:07:27 +0100 (CET)
Received: from localhost ([::1]:46502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSJRu-00011S-8s
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 09:07:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSIo6-0002t2-Il
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 08:26:19 -0500
Received: from [2a00:1450:4864:20::434] (port=44791
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSIo2-0004JG-GL
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 08:26:17 -0500
Received: by mail-wr1-x434.google.com with SMTP id u1so7938131wrg.11
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 05:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PMuIn21CpzQcy9AY5FJxpFPddRUP2e4ksQgdXc1f6ns=;
 b=EpVOWWu4Dp20w2ei5onxO5YAO3A53dgB+34cFR/YlftCMJOLLb+xxPlfOsc4xbV2QD
 zYSljoLpE/355J+kwVAR+v8HWnSDYXmmZQwbbQH6GKEitA0uhpaIPq4RJB2hpdbXbqv9
 L+3hUYA8ANRCeukuM6CuYkBlePuVDb55qeNH1V5jKVgdD4G6UY0tRqUyfkKgKu55fZkw
 DB0BQyjDKad3VZ73VJe+ASWk5W0/TAPdaDrXIC4oN/+YaTeGdDx1Y/KW4inME2DzNYIM
 6pwCguMSysZMq/6Oj9JoDD13e02qjAnAlUxpishqTH5IX96ZsPJfHJF5x0w6b/xCEtqD
 5hTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PMuIn21CpzQcy9AY5FJxpFPddRUP2e4ksQgdXc1f6ns=;
 b=WUKak2D7hPQr0xRFO3BCC0+UMlpO8ktnbQvy6y4D9nomlM6INoTB3/QM6XXxfQ7C4g
 TinBOGxZsqNA6IXbXIc2JkYA4YcUHL7Sxie6gZ7Gc2xZQpfvqbFZnJzEGVad7FH+DU0b
 O9v3gGtBeOeAbukz/+u0euYqpPrFjh1sjjVnEeMKHhkZjmkQ6zQt0oTTVb9Qyb6jAbkm
 +5t7vYMLgVCYoJJaBO6yb61jCIhrP03Pd8bSWV/IUcoQltqAZRE7CZlwIALdeXdB/Gw4
 ooIH/UUbHaEe+TXmOIxVLq3zT2w57C82hGEJ45TcxIsBO7A9ElrSUnKLy26pPtVjnIEs
 AI2Q==
X-Gm-Message-State: AOAM533YCoZEH/0FmGGHbMaYb/Yw/To0n7hDJObk+6/go2NoXHXST6Mc
 6TfZDA+oM2V8a8EI+G+Lxhw=
X-Google-Smtp-Source: ABdhPJyWbFL20nhbdpI643KeMsssdH5QsGddfY9/Pq/Gki7y0vSyhbXyx/KLAZVEuNpwa4GBxy4puA==
X-Received: by 2002:adf:a198:0:b0:1f0:2477:3b79 with SMTP id
 u24-20020adfa198000000b001f024773b79mr3502778wru.24.1646918772344; 
 Thu, 10 Mar 2022 05:26:12 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 l10-20020a056000022a00b001f017dfb5cdsm5538572wrz.90.2022.03.10.05.26.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 05:26:11 -0800 (PST)
Message-ID: <81eb1a92-986d-80c5-c7cb-2fcb51edbb3d@redhat.com>
Date: Thu, 10 Mar 2022 14:26:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PULL 00/23] QEMU changes for 7.0 soft freeze
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20220307181633.596898-1-pbonzini@redhat.com>
 <e6d0fc5a-c1be-41b7-239c-c5db02f21cf1@redhat.com>
 <06fed507-e09f-b62a-30cc-046fcdd80760@redhat.com>
 <391c0c77-3072-2299-f675-6e214110002e@redhat.com>
 <e45024ca-2845-527d-fe14-b3675532d944@redhat.com>
 <689406f4-429b-f1b2-c22e-9aefdcf145e3@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <689406f4-429b-f1b2-c22e-9aefdcf145e3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/22 08:56, Thomas Huth wrote:
> 
> Yes, understood, but again, that only works for me if I run:
> 
>   make check-block
> 
> But if I run:
> 
>   make check-block -j8
> 
> I only get one single line saying:
> 
>   [1/1] 🌓 qemu:block / qemu-iotests qcow2                   2s
> 
> And the progress report is only printed in one go at the end, after all 
> tests have finished. Since I'm using -jX with X > 1 by default, the 
> progress report that you get with -j1 is simply no advantage for me. Is 
> your build behaving differently? ... then this maybe depends on the 
> meson version? I think my build is using the one from the submodule, 
> version 0.59.3.

Ok, I'll check that out.

Paolo

