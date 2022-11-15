Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1506D62975F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 12:29:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouu7c-0001Yz-Lh; Tue, 15 Nov 2022 06:28:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ouu7a-0001UC-I8
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 06:28:54 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ouu7Y-0005Xa-RX
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 06:28:54 -0500
Received: by mail-ej1-x635.google.com with SMTP id k2so35301323ejr.2
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 03:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Gi35BK4XzZJmIycnEjm0yvCkTNe5l82Czar2qiGnxbw=;
 b=Xj3caSzwqq3/RRIy0fe40D/VCidA9o1XM5Yu1sYWNZLHfnI+Xh9PafB8br1iS/0PcJ
 swlGbdDHNBGUT/P4USmpGcy2laeJ7yFamtYyDPTN34qbO2sdB0juoPDOFeVT76zpdZn6
 rn7oVwOqdZQqHeJjXQhH0am2PliWj3DakZt8UqR7PH+/VzhqSe6+1T4uSon1OPGR0WAs
 QgKCmlTTXLpKT4Jhdq4VHxTRMZOwGOxlQ+Grk7/xUeL2EZyk4wIuKfFW8O7TLmXfyaDv
 PV5pArntmOTUApoQYzzioOPrQpqsiqoP8bHRv2zqZW7iDt5xBK94PaMtEWCh/3w1ZBz/
 mihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gi35BK4XzZJmIycnEjm0yvCkTNe5l82Czar2qiGnxbw=;
 b=uO8J1wR6cDpTGZ+nLCZ5fhwKc3nIojjVxKpI0Y3821kpvUd/FVkNsC6+s33jCehDHF
 bAajlcJg1DAKVsg4l+4I8oV44kK4BuDURzKXAO6X6B3OU7MP3h+wGCkFhXau/3kKTuIK
 OrhpArv1nwpIN9CsyZJMp0AKpRFMIXLTDPu+8PrSwmNRLXoWH/SUujoyZrsYAPMbAxZE
 s2EIr0SqTmALzgcNDyQlIV9D+1ebZms+pNTiUetu7pLNiSxARR6dqmYhZclUo2IWrcGE
 EabRXMtlbx+PwWjIJr3PsieA1bPiGo7xVmFOBTYBxY3BsvlizkK2k9g1+VODZHrA8iWi
 dnLQ==
X-Gm-Message-State: ANoB5pl5FVMcFi/fLFtnFxEp6ubm8RbjvBSqeqtmmP7E0VNNnyf6ilJ7
 J610jF6HGhyUkHjNm8f4Vglapg==
X-Google-Smtp-Source: AA0mqf4zz3KC+xI+cocf+4eVLxTF2O7POjOFvGUs2VPqJmAJ20Zli0yZERGUXdZtDXHE1VRNXBsDRw==
X-Received: by 2002:a17:906:d791:b0:78d:48ac:9044 with SMTP id
 pj17-20020a170906d79100b0078d48ac9044mr12559474ejb.613.1668511730994; 
 Tue, 15 Nov 2022 03:28:50 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k26-20020aa7d2da000000b00467c3cbab6fsm3310333edr.77.2022.11.15.03.28.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 03:28:49 -0800 (PST)
Message-ID: <a94ce3c2-79e1-fae0-a5e2-31510e9aa1fb@linaro.org>
Date: Tue, 15 Nov 2022 12:28:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v3 0/7] memory: prevent dma-reentracy issues
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Mauro Matteo Cascella <mcascell@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>, "Edgar E . Iglesias"
 <edgar.iglesias@gmail.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>
References: <20221028191648.964076-1-alxndr@bu.edu>
 <CAJSP0QXf3ZiNOQc7ok8Wq6C5np+Q7SDuXu6jmuMivxq6RkGFQA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAJSP0QXf3ZiNOQc7ok8Wq6C5np+Q7SDuXu6jmuMivxq6RkGFQA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 10/11/22 21:50, Stefan Hajnoczi wrote:
> Preventing this class of bugs is important but QEMU is currently
> frozen for the 7.2 release. I'm a little concerned about regressions
> in a patch series that changes core device emulation code.

I'm waiting for Alex's MemTxRequesterType field addition in
MemTxAttrs [1] lands to rework my previous approach using
flatview_access_allowed() instead of access_with_adjusted_size()
[2]. I haven't looked at this series in detail, but since the
permission check is done on the Memory API layer, I might have
missed something in my previous intent (by using the FlatView
layer).

[1] 
https://lore.kernel.org/qemu-devel/20221111182535.64844-2-alex.bennee@linaro.org/
[2] 
https://lore.kernel.org/qemu-devel/20211215182421.418374-4-philmd@redhat.com/

> I'll review the series on Monday and if anyone has strong opinions on
> whether to merge this into 7.2, please say so. My thoughts are that
> this should be merged in the 7.3 release cycle so there's time to work
> out any issues.
> 
> Stefan


