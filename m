Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFD46690EB
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 09:30:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGFRg-0002vw-9Y; Fri, 13 Jan 2023 03:29:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGFRe-0002sJ-0x
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 03:29:50 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGFRc-0001lj-Ec
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 03:29:49 -0500
Received: by mail-wm1-x335.google.com with SMTP id ja17so14745686wmb.3
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 00:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xl7ANcUOhvcQDGRK8PtfcfEdCD/BZwntMpZfT4Vsl/8=;
 b=s6ZhPlXrpoU66b9h0sB3pfJ2lr2mRUN0rX9XTgZfBQ7vUymGGJUPjczH9nRk2erJCY
 6oQ3OLmdEreyqNpkl1b0TZN7ooeir7/pShdG2HeD2z5diomFddLz4st/uduEbk8gu12a
 cdZNc/rHSSzxV07lCSQMq7EJW6tb+Pi1AfftmzsXtT+CEcKG8awtEKBsqeJpi+w5Ln59
 KhQfBuC8De2XGDq+hb28ZonixRgzC4WZ3R7sWq9D9gdq95eNNrF3m1+fjysxSdKUFr0y
 pLsj36ToS1vAp9w2omNnYSbvvxkiCm8ss1opManyY/LDxnYUBpF4TDk4EosZgCnf2+3i
 mTdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xl7ANcUOhvcQDGRK8PtfcfEdCD/BZwntMpZfT4Vsl/8=;
 b=NI72Ju5pGmI/85kE6omEWSQFUz/9ABVtvGJQmRRIopK2u8UEUDRaLoBlEGgGZYFu0J
 LnGtKkKbKEY0Uwl/eErlgUadM2lksIQ6c8CJ3rAMJqi+S82KpMDuLkgPQvXA0riRjRAj
 cLpDGFRRo1D402sS0gUGce7a+HZZoPqmb+MOv2d4xYcWX+yLdKzjViMtOcUyqpOM/MDk
 sRNp3Txz+yc2h3aALYqpJ9XyuW0A1MG+ix59iB2kGuD3yC+4hw0/4qBTQsCgTd4biA9m
 /W++3iaBa3zzCnv19s0hBaF9lDVXPk0TCLYtfS9l8DfnqouZxCdWN8LP6XTiZWVwGSEi
 CPsg==
X-Gm-Message-State: AFqh2kpi/VZ6nrg1mJh82AYNP556VY5MwiPtnD224g/2TUnTONKjLXyW
 tXX8d5U5cGNccH07tAeInxYv5Q3TTtP9i5KS
X-Google-Smtp-Source: AMrXdXtrGyUIyhxYkRZlMrIRkbqD7QjgVVWqt4oTKgvQUxtxEuxGfoxvD8NkeFMup4reF7rcY10bAg==
X-Received: by 2002:a1c:5442:0:b0:3cf:7385:677f with SMTP id
 p2-20020a1c5442000000b003cf7385677fmr56163695wmi.35.1673598586494; 
 Fri, 13 Jan 2023 00:29:46 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 bh13-20020a05600c3d0d00b003d358beab9dsm23922126wmb.47.2023.01.13.00.29.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 00:29:46 -0800 (PST)
Message-ID: <54783a31-17a2-bcd3-7783-d55f4b2ee4ff@linaro.org>
Date: Fri, 13 Jan 2023 09:29:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 0/6] hw/mips/gt64xxx_pci: Fix endianness swap on
 big-endian hosts
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Bernhard Beschow <shentey@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20230104133935.4639-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230104133935.4639-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

On 4/1/23 14:39, Philippe Mathieu-Daudé wrote:

> Philippe Mathieu-Daudé (6):
>    hw/pci/pci_host: Trace config accesses on unexisting functions
>    hw/mips/malta: Split FPGA LEDs/ASCII display updates
>    hw/mips/malta: Trace FPGA LEDs/ASCII display updates
>    hw/mips/gt64xxx_pci: Accumulate address space changes
>    hw/mips/gt64xxx_pci: Endian-swap using PCI_HOST_BRIDGE MemoryRegionOps
>    tests/avocado: Add tests booting YAMON ROM on MIPS Malta machines

Applied to mips-next.


