Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D79B303741
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 08:20:36 +0100 (CET)
Received: from localhost ([::1]:55194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4IeR-0004WY-B4
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 02:20:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4IUA-0006Of-17
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 02:09:58 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:42562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4IU8-0007s8-4Q
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 02:09:57 -0500
Received: by mail-ed1-x533.google.com with SMTP id z22so3798619edb.9
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 23:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=K9l1SNjRx17M3bfshCDLwU5dnHRefQD4/nWqUPuTm30=;
 b=Axnx2SubnsrYrUEycloLYKHpjgIzFodFISC7o0//boya+o68Pb48IPnATEe4kjbvKP
 LlvQR7wxEZ2W0AheTTcLjtXnkjyycD7SqBOHBGrzPvAtaVQVl95h2tJj1x0cWGT/+yPj
 UE8nly1ElsKnckmH3jJMyS/3G6imiaEcIk4iVGYnHksEKQO4X8F24dKyvCE6lsXrUvTA
 htHmOjnd7/0JIs/6kwpL3+AfTuAm9f3Z1QldFldhL3MXfjCc9C3HNGF4jfiOD2Jsgi67
 7sOaWBsA2pc6MPyUgboHI2vRhArCDELALedOWpnslS4xc5Ok25N9X5RsVh5HP/IqgIA0
 0LFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K9l1SNjRx17M3bfshCDLwU5dnHRefQD4/nWqUPuTm30=;
 b=bvqoHScPpMPtqgzz4THITpMQTXYkSioj9DfyvBgiD5IZRCMKzjruolpL6mBK6hnk4V
 F+2Tg9MAMkHYzK8vR2zf1wgMl0y1JTaqcBN1puq9TvvY09AnF5M4qkRgVfwJa+RMtv0A
 xdhrUtkE0XRvaGrt7jyMIFM41VPeZ1sXuNE2K07vJ5XBClnxX6qWtO4ZZEGxSe6oBDJD
 4yafw9qBBKvk1N7qFQn0VWYCdjelvHubo8+ruh0+uLgngx6w9356AsFB6diWziynU22n
 C4m56nlmczYq8XrCpVjUr1l27SO+M7cem/ZRmpNhEC+oKsQZSyRb9AD8h1anWqLWM4oW
 EKzQ==
X-Gm-Message-State: AOAM532j074pntQ2haPOtp8AhHqDsy9LFdr5itzMZwFe9G8SdNDmpYb2
 Yr0euWcJ50qes9s5lbvvpaQzzM2hOS4=
X-Google-Smtp-Source: ABdhPJzEDDtF1LrjBhGIdZfo6X4b9fQqcngzG+ZQsYgZ30x8zSzZEf6c9sDDt1WkVU4mnn3RV4l3Pw==
X-Received: by 2002:aa7:cfda:: with SMTP id r26mr3393971edy.142.1611644993613; 
 Mon, 25 Jan 2021 23:09:53 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id i26sm12149803eds.55.2021.01.25.23.09.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 23:09:53 -0800 (PST)
Subject: Re: [PATCH v9 10/11] darwin: detect CoreAudio for build
To: Joelle van Dyne <j@getutm.app>, qemu-devel@nongnu.org
References: <20210126012457.39046-1-j@getutm.app>
 <20210126012457.39046-11-j@getutm.app>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <73160b6a-9c5e-7df9-c685-28d2ed52c9e7@amsat.org>
Date: Tue, 26 Jan 2021 08:09:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210126012457.39046-11-j@getutm.app>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/26/21 2:24 AM, Joelle van Dyne wrote:
> On iOS there is no CoreAudio, so we should not assume Darwin always
> has it.
> 
> Signed-off-by: Joelle van Dyne <j@getutm.app>
> ---
>  configure | 35 +++++++++++++++++++++++++++++++++--
>  1 file changed, 33 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

