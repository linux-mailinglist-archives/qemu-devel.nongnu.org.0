Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79164667044
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 11:55:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFvDm-0002WT-WB; Thu, 12 Jan 2023 05:54:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFvD9-0002LR-7Q
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:53:35 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFvD7-0006AJ-2P
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:53:30 -0500
Received: by mail-wr1-x42f.google.com with SMTP id az7so17672260wrb.5
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 02:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f2uMKdRit6CAT3ygBmrsYQThLKgWdi2zdDIg2UMzQfU=;
 b=G42BNTBewO8P5YrJSou5gm8uzZs6DLnrQ/tJWaZCcXKteq/jxix4IdTGljpyYAMWX7
 XPNDodcT1MA/geAjb1HIngqkiAtrvqL+lqed+DFaHH7CVGb27fjs7M6i5YdrvswJtEvs
 Isa92+NRDq2OrblxuL+/HGDVMO4vxTRQzv6ggCZqGA2YXzIo4Tql09jluMgkGg6o1431
 wUUq7tjXh8bFo5GtOKpMdIeaNHQGYTR4wUnILJHuxPYtYKG6ArvdQrvRaX3+DOxo8/dP
 bdN44XfcVRiur82hIgYiTyZSvAWGMnNe4xv2H847jYscHF88Bj1sm2VC9Meh38lY4fEa
 2RrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f2uMKdRit6CAT3ygBmrsYQThLKgWdi2zdDIg2UMzQfU=;
 b=cSjKEndcdU1Tqss/mXZjMcbL+Vvz4xNuI71ynyKby2xRO4CHBs3nF/Zr3FKoeVD4zS
 HBhLuoehzYXBMfcdbttesj4du1CQ3qUcBNJ5Kb8OVqMYzx7j/teYWVENomAwxB6SKpLU
 5F291U7dyrx9EVcHJr7gk3WJwcc/Hny0vYNwV4VhB3wB9K3vzqrbuT7y1pxxhCa4yf6v
 LFJk60SeJg06C2yOpnaBoYvOOL2EhARyq52zAauJ5CH0WGOg4Qew0u4D8Nhxdt/hbmxg
 SvIe5RJ6+J3L3GqbJrRi9kVwymPY09dQwDXUp2dwqODpgOn6CcitkmtEDc4p5mTJOW1y
 ndng==
X-Gm-Message-State: AFqh2koo5tWbsk1nTtnlnk7mxgx4fEMz0XlUWEmotgX360Bc4eY8kdsK
 ICvuh432aVqVi/L+spG3OGm6JQ==
X-Google-Smtp-Source: AMrXdXt6PmwpVYc4FfO3e9mpQr4ubnDRZ99vhSblR5CB9ovE37kn8VHZ7/PKbXI1Mz5ZXFavgW8awQ==
X-Received: by 2002:adf:fe0e:0:b0:2bd:c03f:c010 with SMTP id
 n14-20020adffe0e000000b002bdc03fc010mr4167405wrr.40.1673520807634; 
 Thu, 12 Jan 2023 02:53:27 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m5-20020a056000024500b00267bcb1bbe5sm16425932wrz.56.2023.01.12.02.53.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 02:53:27 -0800 (PST)
Message-ID: <753cf420-6867-cd6d-f5ed-ed88b811c82c@linaro.org>
Date: Thu, 12 Jan 2023 11:53:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 20/31] pcie: Introduce pcie_sriov_num_vfs
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Darren Kenny
 <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, devel@daynix.com,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Gal Hammer <gal.hammer@sap.com>
References: <20230112095743.20123-1-akihiko.odaki@daynix.com>
 <20230112095743.20123-21-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230112095743.20123-21-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 12/1/23 10:57, Akihiko Odaki wrote:
> igb can use this function to change its behavior depending on the
> number of virtual functions currently enabled.
> 
> Signed-off-by: Gal Hammer <gal.hammer@sap.com>
> Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   hw/pci/pcie_sriov.c         | 5 +++++
>   include/hw/pci/pcie_sriov.h | 3 +++
>   2 files changed, 8 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


