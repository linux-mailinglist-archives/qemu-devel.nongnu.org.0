Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C30B69E1A2
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 14:46:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUSx6-0000Yn-Ph; Tue, 21 Feb 2023 08:45:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUSx4-0000Y2-QF
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 08:45:02 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUSx3-0001pO-1U
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 08:45:02 -0500
Received: by mail-wr1-x433.google.com with SMTP id t15so4591686wrz.7
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 05:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+FqS8U2oKf/rqIfeWbb75D5eEHkq0RS3dmXOIQfkSWQ=;
 b=BquXHRWusqVn3DJOWnrh7GvRdDx8RTJQKnJZCO8Bd+i3KJsw2LCvhpfzos0rTgoiYa
 vFHadiEgDBQbfAIvQHIYn4Uj1hwoLhfVwUHIQIfNnMnAmQQ0taAtnQMqHm4mor6ecx5D
 JiwOr/d4fNcnJEk5hWqCVttxXqQU9hot3lIozHNbWSTTbfYUngIHizh3ZnriDzhr4JXa
 t6bbdLeC5MKLWSKu92Y3WLPiL9IpnxT1nz6V15xAdV4XAwAHRUVhkXDos1lemHZr/WWa
 eW+szHcKrRfiK59Fu5dPeDLEmv91p/ewP8FDdgJbjWouF3VR1yFp8CKQP83w3dujJB1n
 60RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+FqS8U2oKf/rqIfeWbb75D5eEHkq0RS3dmXOIQfkSWQ=;
 b=VBkXKiivTK+rY3OvAEFb+qLVWtkRA8ddZmb+m7rkPXzrYHhqjAMPaF1Z8P2fTNsA1O
 p6DRejZCkaw5T0qcrq4ICE63JHAlRCV+Nq7K6yF5Ctc3v/Dmpd7UGAg6fm26kpz7Uk+P
 izhDyR54e1OSdX1ZkOHX2odb7TX6AL9bYT+aDgi0szOvrCgdUCeoZ9WflJBHFU/BunT2
 CJ4C9Guj9AzxDlkDwmap/JEee7guK6NVwkh+LAuCMmKaoVFEYCNusjCUbx5UBLC5aZva
 rd8TS+2zmLCmLN83pbrszGFw+p1Dk/JpXG1zdukZlD0NtVC4XBPuH1zoWkdmXhSifv0y
 hM2Q==
X-Gm-Message-State: AO0yUKU0g4JLrnTsJM2i9tZr7JzxDkqaRR2GyGzPYkNkXQ0Ztyb4NxPG
 /AkcIkTgRGN1FSNaRftz7SiTxg==
X-Google-Smtp-Source: AK7set9yTJJcmmrS8RT01kWKpyS0nHsUSysA0EUWB+oO88b15mSYiOwnhGx2as0aDKRmsexx4hciAg==
X-Received: by 2002:a5d:59a9:0:b0:2bf:95d6:4789 with SMTP id
 p9-20020a5d59a9000000b002bf95d64789mr4253209wrr.2.1676987099104; 
 Tue, 21 Feb 2023 05:44:59 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 g2-20020a5d4882000000b002c55521903bsm7705276wrq.51.2023.02.21.05.44.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 05:44:58 -0800 (PST)
Message-ID: <a728cf1f-49b5-ef09-cd68-57179a44438e@linaro.org>
Date: Tue, 21 Feb 2023 14:44:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>
Cc: qemu-ppc <qemu-ppc@nongnu.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Subject: hw/ppc/mac_newworld: Problem with Uninorth IRQ lines
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Hi Mark,

The mac99 machines use the same PIC input IRQs for the Uninorth
output IRQs:

379     if (PPC_INPUT(env) != PPC_FLAGS_INPUT_970) {
380         /* Uninorth AGP bus */
381         for (i = 0; i < 4; i++) {
382             qdev_connect_gpio_out(uninorth_agp_dev, i,
383                                   qdev_get_gpio_in(pic_dev, 0x1b + i));
384         }
385
386         /* Uninorth internal bus */
387         for (i = 0; i < 4; i++) {
388             qdev_connect_gpio_out(uninorth_internal_dev, i,
389                                   qdev_get_gpio_in(pic_dev, 0x1b + i));
390         }
391     }

Did you mean to use an OR gate here?

Thanks,

Phil.

