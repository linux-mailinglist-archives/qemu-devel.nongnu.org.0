Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7003143F6D1
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 07:51:54 +0200 (CEST)
Received: from localhost ([::1]:40302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgKnx-0007VS-Iu
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 01:51:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgKgL-0000kS-5e
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 01:44:01 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:43748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgKgI-00023C-Lh
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 01:44:00 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 67-20020a1c1946000000b0030d4c90fa87so6854739wmz.2
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 22:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uF+kf03qg8nlRIwjeJyFXpWbLl/JoWRqIOUTik/Vk8c=;
 b=l8jsRQIDou+hr5pjqEaw9knwPaebzNYvD1Qh708odjmlNGTK+I8FYaw/L9IWazIUi9
 FiapXWMOE2mvKZajRWvkKGnuP3gaY4N9MPLjvH1xCSafFql1TBf7/qnrseDv77g2UHiL
 Vsl2J+O2me5fcWhELDahMj7m5Xt3yh3GjdIO1VNtl8NLE62ImpJ/eZy8w945ofpfaaAA
 G1zPRUa0Xdwqc0pCWAeT9Y5KntnHAsDC9wbfsUsjse7eqsz5OAw3YIhYqcxQU5pxDuNo
 eNhz5vwaAQ+hanQKNRBCyAqI91URc2sM7SAF5j0HcYOtNnwt6gNc7brxOcH4c1uni+4j
 pO6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uF+kf03qg8nlRIwjeJyFXpWbLl/JoWRqIOUTik/Vk8c=;
 b=eKMmsZoL+LrCEijzF/HdNQkhCuiekut4sLyanN54v+KfmV64vvk9h2zmQBkvi8mVI+
 SS9ty7Qp8S10SjIa4SKWWs6PUYr/G46K5dyyNO0Z3Vb4/ajKWqxioY5jmsrI6aYI6aKO
 L1++wNBR9sl12b+j697knnvCYabEe19+FDfyjsHJgcpU3oBTUU9/vn7dxbA2yV8V1t9/
 9DV3VgzwRc6Z6gsr1bekIfCXrmP05NlmUsVYxgmwVPISpECvtqFRDdmitLfyBv1Qp3jb
 2RfPQ2YYoyquSOHoNDbDJHcsuJmY5gopz756RMII+BLp7oDwp/tgrFl4pwkIBL1/pR+D
 DveQ==
X-Gm-Message-State: AOAM532+atJfywBt4I2LRLzjVU2GNGntE6QparvI2kWCmYQmOEALjfUN
 azNimYmcWd/hC2CiGysBl3w=
X-Google-Smtp-Source: ABdhPJw8SecbSFaEp0JmTF9gevz+TJA9f9/EEI65BTYo6s7AqqO2RQHtRpm1YB4MnaMTOQh1PjCA9g==
X-Received: by 2002:a7b:cc8c:: with SMTP id p12mr9025407wma.158.1635486237035; 
 Thu, 28 Oct 2021 22:43:57 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id g2sm4880109wrb.20.2021.10.28.22.43.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 22:43:56 -0700 (PDT)
Message-ID: <e87299dd-f830-853a-01f6-d5f34e55acc9@amsat.org>
Date: Fri, 29 Oct 2021 07:43:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 14/23] hw/intc/sh_intc: Use array index instead of
 pointer arithmetics
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635449225.git.balaton@eik.bme.hu>
 <2ec93dee8471de623e6b0494adfd604cd59e4010.1635449225.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <2ec93dee8471de623e6b0494adfd604cd59e4010.1635449225.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.847,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/21 21:27, BALATON Zoltan wrote:
> Address of element i is one word thus clearer than array + i.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  hw/intc/sh_intc.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

