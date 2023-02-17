Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FCA69AB76
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 13:27:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSzpV-0006xI-C5; Fri, 17 Feb 2023 07:27:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSzpS-0006wp-NW
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 07:27:07 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSzpP-0003Hj-UC
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 07:27:06 -0500
Received: by mail-wm1-x331.google.com with SMTP id l25so1411076wms.1
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 04:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=meY+yVPg7EpBm29ZYRW3OnUm7aHYPwi/rSMY0zPvua4=;
 b=KjGPLrSSc94k3eeIb4CCJuWcNeQZCQg4ErnUyo5/kOBI5JE15ubYz1OTQaeOfITtAO
 EcOjr2tbEW8recET1RI9dy8u9qx4jvLJ87ImWXpOQpqjcyKcbWywbXV/X3bZ9uFzUyCH
 SRWdGyhp66z+6GPEHkLKMrs4fXf6lBrgvkAq87BB5QMXkPziuErbZxefOab2IsfTEKlg
 5L5YSkSBsRyVwuRGvFT3+ZLGebGq7dDZlGnrWRqPbZPI2pVhOEnFlB7DfxoO/CtRzYsR
 A++D/ktOosGy1xGXvEOo3Los3yg3OLAzaoV4j0i8gZotZ2NpKY5ZizRpsNI9Y+DUroe8
 /sfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=meY+yVPg7EpBm29ZYRW3OnUm7aHYPwi/rSMY0zPvua4=;
 b=AH9+vHWCOv5mBqWWZvDAZ1Wpfj88JILnbyPyvbTSdZW7XBhZsGkdGNbBHjFt7SAX7x
 cROtvwK+kPxIhYM9yVqiRAM9PPpu2OSpMO6L1gu/XGKS4n1PXyCsPggIt+MFcgLjvGbo
 dgYO+BhCzVgJx3egX4gBOXY+icytE08DYlwjSX6DYF9i3F8hptBBQMBK1vXEpXCYzvx3
 2/g3eELKBk4OwpLdzQ23hSh6EH14dPKd2qlcNbcslLnGedlnjJXauhT5sNbDeFy6YRLC
 6GCtbIObq/PXFwh+8S00pcQ1qVBRa++qvBgFpEtdF9z5Yut3MfQ0R5RbRbJd3Q1hPRSm
 J5Zw==
X-Gm-Message-State: AO0yUKUDrskFfDk05k4NwCal2Ixx1rkyINxiG0cD/uSdtZO5UGFUnPg7
 WtZ7cvuJYvUpUOASbstFkdAIhQ==
X-Google-Smtp-Source: AK7set+nvQmHotd9xwhcLVb39kZqT5heH7rntBeFRwDV8ba5yXUezrmuKxOISgHdbsLo3VZlug0Q9g==
X-Received: by 2002:a05:600c:a29d:b0:3de:b1ec:7f95 with SMTP id
 hu29-20020a05600ca29d00b003deb1ec7f95mr970298wmb.18.1676636821601; 
 Fri, 17 Feb 2023 04:27:01 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 q12-20020a7bce8c000000b003daf672a616sm4956751wmj.22.2023.02.17.04.27.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 04:27:01 -0800 (PST)
Message-ID: <3bfcd5cf-7564-6462-d1e6-65011e8bbe47@linaro.org>
Date: Fri, 17 Feb 2023 13:26:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] hw/ide/ahci: trace ncq write command as write instead of
 read
To: Fiona Ebner <f.ebner@proxmox.com>, qemu-devel@nongnu.org
Cc: jsnow@redhat.com, qemu-block@nongnu.org
References: <20230217103130.42077-1-f.ebner@proxmox.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230217103130.42077-1-f.ebner@proxmox.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.256,
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

On 17/2/23 11:31, Fiona Ebner wrote:
> Fixes: e4baa9f00b ("AHCI: Replace DPRINTF with trace-events")

Oops

> Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
> ---
> 
> Or should it be sorted alphabetically below execute_ncq_command_unsup?

No, there is no convention...

> I felt read and write belong close together and this reflects the
> positions in the code.

probably for this reason.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Thanks!

