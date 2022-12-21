Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D546652D43
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 08:26:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7tTO-00021T-8H; Wed, 21 Dec 2022 02:25:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7tTL-000211-Dt
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 02:25:03 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7tTJ-0000zz-NW
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 02:25:03 -0500
Received: by mail-wm1-x32a.google.com with SMTP id bg10so10542862wmb.1
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 23:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z6zZsajT9SsvaNuxvc5/OP9mHZZjarB9QJuIjloT8vg=;
 b=vbjmfmvtfYuLOrQehvF3dG2cnnlXoYI5C0Fb9rZPocLvx/lmgwygWxF6WYh+TfqKmL
 7MAFCuer+1bhbJ0P7dGhytexDmHey52Dl/B25bOACvNYjWXGWDM1oZUc17Ova4BSp9fG
 kVqES5hkOdKryxKr8N4LYPIpzI0PsI7IKWaaohabAiGihX5tkxnHI35cim6cBtk3xyzU
 IPJL83DhlPhtwp7oiQoihVreX44twEvB8cyhYxslAW41xtWEN9q9X49wCV6qNSicZQoO
 J5IkEhLHN3XqPEO54bMejANCuIOZhUDIbkUIDPLmsTKuqAYB+BQGnVPRUPowhQ4rKfTw
 7QGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z6zZsajT9SsvaNuxvc5/OP9mHZZjarB9QJuIjloT8vg=;
 b=08jlUdaeZ/SuEh3PnyeK1eG1uQfLB6jRt9to1XKryg2syC07F1lIwz63vjEzDizNgQ
 VRNoYwKJnKthVhVZTs23vgBzvKgW1AcsEcTUxYYPXkHXmqa/6BjQ11qsuIUXra6CNQMU
 DjdtGs9UeDfV6upXeO8MOrte5fi9N59FNEHgd9GaXMcrUwaHST9nHHgcYoWYX1meTY8r
 al6X7WHfbCu7aWnwqhSHfF+n3l6N4/eQkSciHloxsTc+9H+23i1AaJVqxvc+DCErxYK4
 bS07WHGCmms3Dwnynx8a1+y5BdFYYg7Fi8PW9uTHIDrZihE68aT6ezqq3dsKSckhjahX
 0N/A==
X-Gm-Message-State: AFqh2koUslWWooSZQ3HFBwHFP4Tw9w1sdM3MmGvBGns4FcFq81l+x849
 eT3aiCt38eP2PbgZcsj5cgdTow==
X-Google-Smtp-Source: AMrXdXvaM1HU3IWcp5PZi6BxbFsn3ngeyRhsmXxIP+FzAtY3kGsHqfo7nS03ZlutXAYx9eezVip7qw==
X-Received: by 2002:a05:600c:3b29:b0:3cf:d18e:528b with SMTP id
 m41-20020a05600c3b2900b003cfd18e528bmr444968wms.39.1671607500189; 
 Tue, 20 Dec 2022 23:25:00 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m16-20020a05600c3b1000b003c5571c27a1sm1720036wms.32.2022.12.20.23.24.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 23:24:59 -0800 (PST)
Message-ID: <12e12e2f-f69b-eb98-9b22-cb6633433c9f@linaro.org>
Date: Wed, 21 Dec 2022 08:24:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v2 0/3] Decouple INTx-to-LNKx routing from south bridges
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Peter Maydell <peter.maydell@linaro.org>, Huacai Chen
 <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org
References: <20221120150550.63059-1-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221120150550.63059-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.161,
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

On 20/11/22 16:05, Bernhard Beschow wrote:

> Bernhard Beschow (3):
>    hw/pci/pci: Factor out pci_bus_map_irqs() from pci_bus_irqs()
>    hw/isa/piix3: Decouple INTx-to-LNKx routing which is board-specific
>    hw/isa/piix4: Decouple INTx-to-LNKx routing which is board-specific

Thanks, series queued to mips-next.


