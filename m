Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0AD47466C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 16:27:44 +0100 (CET)
Received: from localhost ([::1]:58242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx9iR-0004Gu-2r
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 10:27:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mx9gs-0003Rv-US
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 10:26:06 -0500
Received: from [2a00:1450:4864:20::433] (port=40734
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mx9go-0004lJ-1y
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 10:26:06 -0500
Received: by mail-wr1-x433.google.com with SMTP id t9so32995645wrx.7
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 07:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wy9An3NACZ0F8lFNFF9XjOAlCrfEzUGNrT60wBzSdiA=;
 b=Ij0OfPh7uU76mNXfX53meVpj0W5jM+f96e3FDKKv7h2bsgdLZV1AnVHlNt8U+R4U1Z
 SOJm8urqrAtI7Hp4OBuKnS/syYQI+dpSn6YDYNJuCmHbDY4PjBxs+Y/OBif2e08EAv/u
 3OWm566XZdHWoAAOkmBVx/3ml4FDN4EPHRj0J6+g4bkbozx7mXdbCvv3poSZ7rTg9wPK
 sg/WeiFC1RVC1Q68kQjzsZjXTJTd1e0kXfN7c18uz2p+txZRsykSvBp1rWRqRPJGffW5
 uc42TDKsemwqkGjnn84ng5Q7zoIJVnNZdblUYZZStDC//JXa3Yup1hBO1z1Apf1fsNNd
 JyFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wy9An3NACZ0F8lFNFF9XjOAlCrfEzUGNrT60wBzSdiA=;
 b=WixrgTUzQlGo9hc2BsEaEanR4JNi21mD7j4xJ8fwO7a3N12cYMS3fy1AovF+3rqFiU
 JBTWxzFRL1eJTT0mOIq+q64/7S+nH+H3hjkaQnlUXoRXHHW/s0k3Qda1p2QevBmmIXng
 qkn3Ttc4WKP3I8S5y2agH7qPMUwXZjV+MjO45Jg0LLJFNGeHoECCcNMOSFWCa5mTULTV
 RjG+C2qHrs1uB7NgMpzZ1JayzpnXRL+VqV9q7I8vlzbUuYQzl15y+1U6+d9mStl3bHKU
 /5M3o9XsRQB6iDKuluUpWILnR+d+m9mUwDHkNSeiQMFX1we4OOGprDsxeyI/gIGUnPHP
 VkPQ==
X-Gm-Message-State: AOAM530izBhxmqU54HfvQ7+rGRKZxT7x043dc+a54CvR9WZ1vhUrC+1C
 dumX5EZV22wSlru5J9XqoxM=
X-Google-Smtp-Source: ABdhPJz8dkmjl1JkUm+PgLF4WoD+ZSAOhzulMhYboMDdVi7V0NaoSZQ/sPBJhZSaORtloHgdZ8ELZw==
X-Received: by 2002:a05:6000:1809:: with SMTP id
 m9mr6350050wrh.678.1639495558349; 
 Tue, 14 Dec 2021 07:25:58 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id n13sm176958wrt.44.2021.12.14.07.25.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 07:25:57 -0800 (PST)
Message-ID: <ade0fae4-1041-f0aa-23f7-d270638b1557@amsat.org>
Date: Tue, 14 Dec 2021 16:25:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v7 03/15] linux-user/host/mips: Add safe-syscall.inc.S
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211214002604.161983-1-richard.henderson@linaro.org>
 <20211214002604.161983-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211214002604.161983-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.962,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: git@xen0n.name, laurent@vivier.eu, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/21 01:25, Richard Henderson wrote:
> Reviewed-by: Warner Losh <imp@bsdimp.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/host/mips/hostdep.h          |   3 +
>  linux-user/host/mips/safe-syscall.inc.S | 148 ++++++++++++++++++++++++
>  2 files changed, 151 insertions(+)
>  create mode 100644 linux-user/host/mips/safe-syscall.inc.S

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

