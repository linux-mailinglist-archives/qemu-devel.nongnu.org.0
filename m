Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 039E3520C7F
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 05:58:28 +0200 (CEST)
Received: from localhost ([::1]:33742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noH10-00076J-FB
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 23:58:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1noGzF-0006GZ-4v
 for qemu-devel@nongnu.org; Mon, 09 May 2022 23:56:37 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:35719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1noGzD-0002ox-FY
 for qemu-devel@nongnu.org; Mon, 09 May 2022 23:56:36 -0400
Received: by mail-pl1-x632.google.com with SMTP id c9so14969406plh.2
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 20:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=kvks7pSHiMVMq4roazioOH9rk3DVVksRuyMsumO9q8s=;
 b=LqcNbDOolqHTOds/UBdhrYTKpGXU59pBCfUs4vT9xYsb5MKJ1PGbBpvbCrJu24jHdv
 W3RBfQLOZss+lmQes9o6IMsFtw8FuZvgT3dozs9whC7pS4PZSvAozw18TKMelefBAB6X
 6IPeNs6ftJqZ7SYYVtov4Ac5r3kXuQERqxDhyGEdH/C7gHSHII6534BonPuyyZDCnj0X
 sKfYo35PjkrW4EfmxOasZ7uL3WiUW5o2I1JYmlKNADw3RYIyPxn0dyOg6PgVJ5eem7fm
 25ovfLefbVlAM7IG9b/LD+MJUuqIj4YNqUKA5oYl77Nn1of7CwlaL7UiF7QYkRSGgCIo
 iddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kvks7pSHiMVMq4roazioOH9rk3DVVksRuyMsumO9q8s=;
 b=h2Sp3XTEY0x2WhEscqnfbQwucBm0gPGa+drjCt90cr72AqufYOg6Yb3IvbM1pi12EH
 P5MgaIcyCKAGEWZM8sCXAXw4KRoZyYbP/bUj6csO9iYBfQUo15uCoOePZspDJTBsGgcK
 qBPMKjiW49htNqwxx4yRGjoTsIyPL2eiCQM3av56jcoPznFuzJCOoSzKN2rmiEz5I396
 DopydwE32GAPMjXEpTH7WxVRGZ2NuYVhkg3loSAH8Q68yX3zVF9uMHBfxWiSvT2b/nX3
 nTEYVXt41GQZp8bQDqBnMthQ6WcuNwLoC3rWOT8RFPKxCe4Klik2vD17kjeLy8gmGvq/
 qG4A==
X-Gm-Message-State: AOAM53253u7MXpWkB6/kAnkt0m8/LGm8w+5gtYbMPa4HGrVkherXt1Xn
 er+omSySEP0h9j/XwYGUhMgGhA==
X-Google-Smtp-Source: ABdhPJyp/tHCHqcL0DTY94MPS7Kc0TOw6tKktN5+ivA2KPQgVY2M8NRfi1qX98hHBfZP6E0+z63+DA==
X-Received: by 2002:a17:902:b703:b0:15e:ea16:2c6e with SMTP id
 d3-20020a170902b70300b0015eea162c6emr18888764pls.100.1652154993598; 
 Mon, 09 May 2022 20:56:33 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 i10-20020a17090a974a00b001dc99c4a74esm554618pjw.28.2022.05.09.20.56.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 20:56:32 -0700 (PDT)
Message-ID: <edd5c684-03aa-ee73-e1a6-11afb89144c1@linaro.org>
Date: Mon, 9 May 2022 20:56:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 34/43] hw/intc: Add LoongArch extioi interrupt
 controller(EIOINTC)
Content-Language: en-US
To: maobibo <maobibo@loongson.cn>, Peter Maydell <peter.maydell@linaro.org>
Cc: yangxiaojuan <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org,
 gaosong@loongson.cn, mark.cave-ayland@ilande.co.uk
References: <20220429100729.1572481-1-yangxiaojuan@loongson.cn>
 <20220429100729.1572481-35-yangxiaojuan@loongson.cn>
 <c6b58ba0-38c4-6542-86d1-eb1f14a12121@linaro.org>
 <707db6c2-49f2-2ca2-7025-0cf401f11c60@loongson.cn>
 <e514e333-b458-517f-66f7-f3fd0a0c5bad@linaro.org>
 <CAFEAcA8y-ZVeEHDXUv2bAwKL9EumTmrJ-Xz1r23C7Lm0yajBdQ@mail.gmail.com>
 <402096bf-2a89-311e-6174-eac63b78f74a@linaro.org>
 <2dc9050b-00b2-e571-b553-f1d49c0d9a4a@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <2dc9050b-00b2-e571-b553-f1d49c0d9a4a@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/9/22 19:54, maobibo wrote:
> how about put address_space_iocsr as board rather than percpu since there is no concept
> of "cpu package".

"cpu package" works ok as a device on the board.

I don't know if it's possible to have the iocsr address space controlled by the device, 
especially since it appears that the iocsr address space is *also* available -- or at 
least partially available -- in the main address space at base 0x1fe00000?


r~

