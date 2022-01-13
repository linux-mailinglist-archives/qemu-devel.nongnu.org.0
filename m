Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9830B48D6AE
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 12:30:39 +0100 (CET)
Received: from localhost ([::1]:60018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7yJR-0001UQ-KG
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 06:30:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7yEm-0007fd-9j
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 06:25:48 -0500
Received: from [2a00:1450:4864:20::531] (port=36517
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7yEK-0000VO-9B
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 06:25:23 -0500
Received: by mail-ed1-x531.google.com with SMTP id 30so21904826edv.3
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 03:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AhTn5tErOStakJloWxpTif7+/n2aJkwbBII13f4WxMs=;
 b=HbXaOPRtesieH4QfZJ1ijoNKZPLMOZfUXk0oBASosG6oo6MqSJAo008m27KjUt2haC
 omikXaFA1wT8zPCTl6JtV1R5OSEjL8Iw72IuKni+3ggzxJDSvPYyfwWHnAbWvKaxp1A4
 GZdGkdajh1KiSeCSYSGx9MIfwWHmBFPuKkFN0/q9zkRFfoQW7ZRuadRUnrpG8dyWXhV4
 wGkjAOj5RUFTeK5DOC0jaKk8nbSoLXY74Y+nWRCiLP9ZdicZTvYPhXWnud390Lrrz29k
 nMB9cg9duBe7JhSZNmi5S9lHmKMr4MkXvE3Yvy6OzbPRsimnRJnwOjIat5Wrv6nWYZrE
 PCiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AhTn5tErOStakJloWxpTif7+/n2aJkwbBII13f4WxMs=;
 b=oJBAPmkZ5mwAvv7T1k9faQ/aWSZNhJijo0Y7nO1D6e9+TkMKqpW2c3UdpbGVuyJF97
 LHbjlgPDN1Lr1gzzDuW/rvtSgVo5FKEusMXjrfbwcWahKvrxD6u2xY4/+AvbsAPEpCae
 cdyMMW9VCcHzAK9Oo6Y7uHfsPfA+QbwQBp67/ieq8I4mV0gDyoDmk4x3Qks6FykN76q9
 fak8QKYUoZKYYvVZ5oC2AXMLGFU+iT3Hh39+GVnUnDxJSbxRJ83EzzljXdXr4K2/2yi3
 gvxfxJ6ZwggaiAFlFEfT4KEXla8FvoBtKvhK+3KoennkVTxkimbxgJANqFyntfmbIJAu
 o4Sg==
X-Gm-Message-State: AOAM531KMAAaOU21EcXjD6DYJIB8Vmh7dQm1yCoxhx9Roo2uJgL3cSv9
 k6AWc3pIwsE95eiSE++zzO8=
X-Google-Smtp-Source: ABdhPJxOekwazBvUY46424zkFdGuS3eZyDXgJUnsS+zwEqfVDD0SRmg6jtyabWMsxNjVpxa8PEjhug==
X-Received: by 2002:a05:6402:1159:: with SMTP id
 g25mr3842323edw.28.1642073117300; 
 Thu, 13 Jan 2022 03:25:17 -0800 (PST)
Received: from [10.101.1.234] ([185.224.57.167])
 by smtp.gmail.com with ESMTPSA id g11sm1036037edq.46.2022.01.13.03.25.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 03:25:16 -0800 (PST)
Message-ID: <6309c6bb-a211-6015-1c37-83a3395ec423@amsat.org>
Date: Thu, 13 Jan 2022 12:25:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH v2 3/4] include/qemu: add 32-bit Windows dump structures
Content-Language: en-US
To: Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
 marcandre.lureau@redhat.com, dgilbert@redhat.com,
 yuri.benditovich@daynix.com, yan@daynix.com, philmd@redhat.com,
 qemu-devel@nongnu.org
References: <20220113005248.172522-1-viktor.prutyanov@phystech.edu>
 <20220113005248.172522-4-viktor.prutyanov@phystech.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220113005248.172522-4-viktor.prutyanov@phystech.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/1/22 01:52, Viktor Prutyanov wrote:
> These structures are required to produce 32-bit guest Windows Complete
> Memory Dump. Add 32-bit Windows dump header, CPU context and physical
> memory descriptor structures along with corresponding definitions.
> 
> Signed-off-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
> ---
>   include/qemu/win_dump_defs.h | 107 +++++++++++++++++++++++++++++++++++
>   1 file changed, 107 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

