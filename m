Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB82B4A3BC4
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 00:39:36 +0100 (CET)
Received: from localhost ([::1]:41902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEJnD-00005f-So
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 18:39:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEJkw-00068b-6C; Sun, 30 Jan 2022 18:37:14 -0500
Received: from [2a00:1450:4864:20::432] (port=38548
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEJku-0004As-7c; Sun, 30 Jan 2022 18:37:13 -0500
Received: by mail-wr1-x432.google.com with SMTP id c23so22016193wrb.5;
 Sun, 30 Jan 2022 15:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CzkPakoi0PJ0ai7zLwa78NGbtgZh3QjahtLwMCd1yJk=;
 b=WM+FdkSxKiqWm8htA3J8Qv3ZKwK+fWUwvbEPP2ZUso7Qz6vRiESWqLE5kgW5C9D/7u
 dNxdNflaM0Z/ieqjXGz6rZsxEqclvTdeUMpsigxWyr8R5k+jBDltsgxgk2HGtVuQikcL
 0iRgyIE7AQLbbhnwuW+NmY4IkcTq2ccN/7eXzFYcMffAF2TAaZB6hwOicebR90WcVIDd
 EX676wQ6F86HveODAK8kQdMQ6l+6/skBCaKBuvfvS7AkoNSPu4Cf2kO4kBhEvpdL2Ufh
 1p1qssyFXywp2eYvVB+eQlO0DFHvcPUASKgJM5qjX4UUFF/yZoGV5tLUscsQdraReCGs
 21EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CzkPakoi0PJ0ai7zLwa78NGbtgZh3QjahtLwMCd1yJk=;
 b=mR4LU7YqaVdGS5YM5I3qwaiJdCqREJfWOhP6LJ5D9RfdeHEyMyUjB2tIiV2PJw5XxJ
 azNdFZKnOoogEuNTc30kHr9zvAuyr1f2ynf/Ly9jzmOaJdVHVgjoxR/sufpaCn1viDl6
 /m4i6b56Kzg+jy7y5b1sHvNdF3ckxsKhRIeY2f2FXAw4EbMaI2bidtKxBW0rW657FHFF
 s2vz3VEY4YCTRyO1CqpTIxmz/ic3uI0gb6OsEft8EL7BFdF0WmaAKdx7X7fTeixLZzy4
 ulcSgQUQ+esjptHvaQ2ApSkoHNT+iyzPRqMgtM9q4e7TH4NMGVYiLke1pLDa4Nys/eN2
 uv9A==
X-Gm-Message-State: AOAM532OI61TVF7RZ42j7KIq0KCv1rf6pyo7KzEq5l+pQ+lbC3VlZN7W
 ZrW5NFF/JSyXEN34geCVXYM=
X-Google-Smtp-Source: ABdhPJxb3Ex20Of164IUGDF+1d3K/pQKIURO8H7NtIJRIQRtNZmblDPPYnxXd2buHAITeeDZnqVVQQ==
X-Received: by 2002:a5d:4a0d:: with SMTP id m13mr15646252wrq.171.1643585825619; 
 Sun, 30 Jan 2022 15:37:05 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id l6sm10873446wrs.51.2022.01.30.15.37.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jan 2022 15:37:05 -0800 (PST)
Message-ID: <376cacec-fcb5-3b92-1cd3-d8a352c414af@amsat.org>
Date: Mon, 31 Jan 2022 00:37:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH v1 6/6] hw/arm/xlnx-zynqmp: Connect the ZynqMP APU Control
Content-Language: en-US
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, luc@lmichel.fr,
 sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, richard.henderson@linaro.org,
 francisco.iglesias@xilinx.com, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org
References: <20220130231206.34035-1-edgar.iglesias@gmail.com>
 <20220130231206.34035-7-edgar.iglesias@gmail.com>
In-Reply-To: <20220130231206.34035-7-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 31/1/22 00:12, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Connect the ZynqMP APU Control device.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>   include/hw/arm/xlnx-zynqmp.h |  4 +++-
>   hw/arm/xlnx-zynqmp.c         | 25 +++++++++++++++++++++++--
>   2 files changed, 26 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

