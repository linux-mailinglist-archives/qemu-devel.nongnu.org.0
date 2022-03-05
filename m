Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2534A4CE47A
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 12:19:14 +0100 (CET)
Received: from localhost ([::1]:35708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQSRN-0001o5-8E
	for lists+qemu-devel@lfdr.de; Sat, 05 Mar 2022 06:19:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQSPk-0000IK-FL
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 06:17:32 -0500
Received: from [2607:f8b0:4864:20::633] (port=37816
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQSPi-0005T0-UH
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 06:17:32 -0500
Received: by mail-pl1-x633.google.com with SMTP id n2so427709plf.4
 for <qemu-devel@nongnu.org>; Sat, 05 Mar 2022 03:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=pWzWk8DO4l6Z72pk+OutOf4EBCoqXtVOTYIzH8E2BXU=;
 b=VRz97xP/eUXX9Fzq1o4WmsdlVBqvkK33T3gOwfHb1p6Vga7t9jLvxpPvLPT57kCjVs
 3SqNnjzyqBbclTxY6EWpaJ5by+T0snPB/Fqj+Xj4ButO9s1Q0zqDEOv+QZGJ1qYPFGMr
 MiwzO0wALAve3UGSSvej9QVKHJzIRZB2+lwm50+1IBe3UwXx9J3Z/07rJzHeQ+3IdDbW
 VzCstF9anbnASgRc0DKyHZUvr6xpkZ8+7NrpX/IF3dVaV9J83gyLlAwTs7l6WQjz7R4u
 HYS2LzWDtjtqPt9ohSNpIRrh13/Me6b0ziMMvpcbFY7SG5+n6faadx2u9D87IkAp66Cp
 A6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pWzWk8DO4l6Z72pk+OutOf4EBCoqXtVOTYIzH8E2BXU=;
 b=HTvwtQXs0RVIf5MB5yuPJTO692C3htfUIzjWzczT4Xd7VUB+KfZBdaqgVMw/Ji8mbt
 4oMLyX9hG/Ii4ynM9QjatyKuOuw7qcb3SGOU8we4ezU0quPwuXRi3h3y2+DppgnrEupY
 hDMbiPRDVz3/E+BRM3y3ADllULh/amrzpd0EghFRDm/evSQm34KIPCQqRtSpzOMeeF8L
 JeWyjLqZJFE1OZSPUHxf9SGwC/4wTn2EZPzRgEquzXLgRip3CiMpxgr9414yp0/jHyDz
 hyAw2TZ92vP4gJNUMtYdddxV0a6U8ztKu9nETif6SkmDEkxmF47KebMEc+X/i4bHpMFv
 BxxA==
X-Gm-Message-State: AOAM5332J59/aamDyu2O7LVqWLGSQmgL9n8Hg8MJ1znQ9twbxP6RP717
 nOSBK/9yj2uIB4bYRhSfnlo=
X-Google-Smtp-Source: ABdhPJyMR7v7CpyqY9X38yquReE0QLw5aFGR/AoCcJohu6T4Gk/AC+Ho+ApubSqK6qYGoOamqh2Vxg==
X-Received: by 2002:a17:902:6b0c:b0:151:41d2:7f84 with SMTP id
 o12-20020a1709026b0c00b0015141d27f84mr3002083plk.51.1646479034691; 
 Sat, 05 Mar 2022 03:17:14 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a056a0026ca00b004e17b1da847sm8971106pfw.167.2022.03.05.03.17.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Mar 2022 03:17:14 -0800 (PST)
Message-ID: <632d58b4-bd7c-bd5a-7c12-c75c29ce3335@gmail.com>
Date: Sat, 5 Mar 2022 12:17:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 2/3] nsis installer: Suppress "ANSI targets are
 deprecated" warning
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220305105743.2384766-1-peter.maydell@linaro.org>
 <20220305105743.2384766-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220305105743.2384766-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Stefan Weil <sw@weilnetz.de>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/22 11:57, Peter Maydell wrote:
> When we build our Windows installer, it emits the warning:
> 
>     warning 7998: ANSI targets are deprecated
> 
> Fix this by making our installer a Unicode installer instead.  These
> won't work on Win95/98/ME, but we already do not support those.
> 
> See
> https://nsis.sourceforge.io/Docs/Chapter4.html#aunicodetarget
> for the documentation of the Unicode directive.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   qemu.nsi | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

