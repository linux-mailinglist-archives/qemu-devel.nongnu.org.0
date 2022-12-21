Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D17E6652D27
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 08:07:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7tBS-0002Cn-NQ; Wed, 21 Dec 2022 02:06:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7tBH-00029M-AT
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 02:06:26 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7tBF-0006gh-9q
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 02:06:22 -0500
Received: by mail-wr1-x435.google.com with SMTP id i7so13974401wrv.8
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 23:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BO3D5TxSObyykwQ+uLG5Z+zydylBZh8Y5Wuxwtmdmts=;
 b=NP8ZB5Lt+4kuoV+KlPvoq+bg4ytfMyysb7xZ1+eNEA3s1c/fv6KUvp8+OTJFSMrqxR
 1+HoV4weV5h7ju6Jq8dRkqsoW9E0J0/eNlDrSvYcKl5HI+zWkBil4Yk/DrnVulZGSAjZ
 bYBpzXaNv6DTEyyJuc739NfExPBjcb19/lF4Xmdrb62WAfuLGewePuhdfQp+pFLeh3jM
 ZSqjtcjzgRDAR4Vh7kEw4HCMOe5Y7mdVyNpIVbt6z4hFYFK003Jwok6eQQb2i/aBMBGz
 f026CDoA3Ny9pbgZV/398Zv1yYB6te0a/1XG/UuVOK3MgpwaNT4znIiWex/7yDOlrsP7
 LltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BO3D5TxSObyykwQ+uLG5Z+zydylBZh8Y5Wuxwtmdmts=;
 b=rcePcvECwf7YI9z7T+lRFautajCgKMCrGYQmQMNghaZYazDORalt7sf0xRFF1e8X4G
 IT+igDt3gDlNiumY7U74tSU5iORvIJNojxdm6dHNRp0mMVWbMjWcBDnKiqcN8YZas+Zh
 Kg1OkAj0zdQUM+guHjeIQCbKJAp2CflUaIYLQLGfputzVh4ZPGj9JhCck/xcNoHoswyH
 VMtQP5JBH1qqvO9DTJIKqd2pc761q8gJZGin3fRzylU1uOqr/TWRoKb6poKfiEeYTPL1
 USmLOpx3CyRo8KnkKmcMWlWEkQJ59tpN5GKi28r1k3VVqJLQVB+tKt/KFQkzFRtzqgHO
 2JAA==
X-Gm-Message-State: AFqh2kqcbyV1ortXx2zzJnQuIemLNWVqKMbG0d1cln6QMgzcMuPHvCrH
 xCmD1/mMuTbauEoqYv6fkwAAZUK51jOmAQ7/pxY=
X-Google-Smtp-Source: AMrXdXucpglA8qbOyWNOKYaRUJbejWApGqLVb8+E3LxeaUTQrPtZMwMxuTUJh0cdYuL0eQCN9PfWtQ==
X-Received: by 2002:adf:e3c9:0:b0:253:62a0:2dbf with SMTP id
 k9-20020adfe3c9000000b0025362a02dbfmr340935wrm.62.1671606378318; 
 Tue, 20 Dec 2022 23:06:18 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j9-20020a056000124900b002422bc69111sm17243013wrx.9.2022.12.20.23.06.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 23:06:17 -0800 (PST)
Message-ID: <9b9ea50c-1407-d2d1-486e-be3740d65178@linaro.org>
Date: Wed, 21 Dec 2022 08:06:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v2 0/7] hw/mips: Make gt64xxx_pci.c endian-agnostic
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Huth <thuth@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20221220113436.14299-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221220113436.14299-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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

On 20/12/22 12:34, Philippe Mathieu-Daudé wrote:

>    hw/mips/Kconfig: Introduce CONFIG_GT64120 to select gt64xxx_pci.c
>    hw/mips/gt64xxx_pci: Let the GT64120 manage the lower 512MiB hole
>    hw/mips/gt64xxx_pci: Manage endian bits with the RegisterFields API
>    hw/mips/gt64xxx_pci: Add a 'cpu-little-endian' qdev property
>    hw/mips/malta: Explicit GT64120 endianness upon device creation
>    hw/mips/meson: Make gt64xxx_pci.c endian-agnostic
>    hw/mips/gt64xxx_pci: Move it to hw/pci-host/

Series queued to mips-next.

