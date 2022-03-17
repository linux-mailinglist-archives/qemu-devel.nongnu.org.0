Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B283E4DC511
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 12:54:45 +0100 (CET)
Received: from localhost ([::1]:47572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUoiK-0004aY-QE
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 07:54:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nUofB-0002Xc-FQ
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 07:51:29 -0400
Received: from [2a00:1450:4864:20::634] (port=40761
 helo=mail-ej1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nUof2-0005Bd-Rw
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 07:51:28 -0400
Received: by mail-ej1-x634.google.com with SMTP id p15so10154939ejc.7
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 04:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4E/JiMnubydXsLao2rH+X8/9rmHXaHSoLTtrz+HMJyc=;
 b=hKYEaTp//g3GD61twOvkEzBN4AaLombG/QVhqPHeE8Npv8/MLCFz7t9HFZoLfuKMkK
 d81twsiY+Vr+aSAO74HNYIRxU2cD/J6/D+8rCQdyRjzvoKG3ywdZfH6PtVh/V9BI1aMK
 pyh+IzXGh+ESG9a6xa/FFyz4X6LyzolL0QxG2lXRxasRG0V5AMVhFlsI5my5qlrwudAZ
 2KfLBs99qzPNYL722Sv/PR5Yfe5x3Va0qO8Cvukwu+bOMFcYP3Ttvp21sxguIMmGi3Oq
 pNYoFaxaFOD1b41/y59AVllo9rjYQv5pr0V99424NT58jJhfGbxmQC/gOL6lljXvJwwC
 z2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4E/JiMnubydXsLao2rH+X8/9rmHXaHSoLTtrz+HMJyc=;
 b=VIUBif7b2d8je4iNkGI6Mhkxzame6gxLJpQ3947CJ+Aw6ND5NHsSEb109Q1CU+oFi7
 DTUQYbwE8vh2zKNI8WVcr8gmrRmlpuIfO2KiqzAvIYBClT9i6wXFgowTPRBwVDJgtXQs
 grY/EmXpJHCdS+4zx5cFgvS4SUrxUaK8iXqDEHacaG0/1PoExfEz4BM0aPjZRTClFM89
 e6tVpvhH5JTtnY5tFqTlzE8cj/XMqJU5o9xp3HjFSeRttu46qJ4ybc4xNsXrDmouYF4u
 H+nuw/EFlhynVYMG7NrZy4uczJ8KoP4gl1kdCq4u2uZZqGeXme0fIbt2xmbe/hkRyLLJ
 N1qA==
X-Gm-Message-State: AOAM533LT1Yhne479dxvuzoc57j6LaRYwbicaTlhP+P1MQdLuwTLn2Jr
 CfawJLET3qBnJWxXsCnW30g=
X-Google-Smtp-Source: ABdhPJxbu8omzfPKn7xHZxD2KFAVTXP8SSSd42ZTiSHMpy91TUcoXxTCJGKxxU5XkKSeF06US1OmgQ==
X-Received: by 2002:a17:906:6a11:b0:6d7:76cc:12f6 with SMTP id
 qw17-20020a1709066a1100b006d776cc12f6mr4078380ejc.456.1647517878058; 
 Thu, 17 Mar 2022 04:51:18 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 l5-20020a170906644500b006ce6b73ffd2sm2281898ejn.84.2022.03.17.04.51.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 04:51:17 -0700 (PDT)
Message-ID: <db36f8e0-d4ce-c666-c69c-fb333ba004da@redhat.com>
Date: Thu, 17 Mar 2022 12:51:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH-for-7.0 v2] cocoa: run qemu_init in the main thread
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220316160300.85438-1-philippe.mathieu.daude@gmail.com>
 <e1a5b41b-708d-ef3b-4c9b-8b2469cf4a92@gmail.com>
 <f7fb6c55-60ba-f510-b9cc-8a257859072e@redhat.com>
 <CAFEAcA_JHky3XJYVsq9VzG38fWQgSO4k7QWWf+hAyUXrh-BfJQ@mail.gmail.com>
 <CAFEAcA-bqoQR+qdFe6fkZ9Rvn4rKAxOXTwfPdFGA9uNEdHKGNg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFEAcA-bqoQR+qdFe6fkZ9Rvn4rKAxOXTwfPdFGA9uNEdHKGNg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::634
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x634.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/22 22:06, Peter Maydell wrote:
>> Speaking of 7.1, is cocoa currently completely broken, ie in need
>> of an interim fix for 7.0 ? If so, which of the various patches/approaches
>> should it be ?
> 
> To answer the first half of my question, yes, the cocoa UI is
> currently completely broken as it asserts on startup.

I think this patch is a good interim fix for 7.0 and an improvement in 
general.  Any other changes can be deferred to 7.1.  For example it's 
trivial for Cocoa not to block GTK+/SDL anymore, but no need to have 
that in 7.0.  Same for removing main() from ui/cocoa.m.

Paolo

