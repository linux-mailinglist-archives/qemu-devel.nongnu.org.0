Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A65152EF735
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 19:18:54 +0100 (CET)
Received: from localhost ([::1]:36026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxwLd-0001rL-PS
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 13:18:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxwIy-0000Yi-QQ; Fri, 08 Jan 2021 13:16:10 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:35481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxwIx-00058q-DA; Fri, 08 Jan 2021 13:16:08 -0500
Received: by mail-wm1-x335.google.com with SMTP id e25so9223237wme.0;
 Fri, 08 Jan 2021 10:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kzW+etdvWCxLvil8pyMDDG+XQ0COh7mraCS06TiMlQo=;
 b=rPxwEtKl5X2ES8OdMBh3M43QyJn7qvrwbZRI+9RbAHrTlYrBzd4LuLco08OoQhnjTG
 mgZgY24rnM/lyvW7wtyC+yhDiQqP3rnl6Ajf99ejz0smdp8tQG9I4iX+pLpbYIC8eYDa
 hdpp7wmPVEXHBW23VoIBwtAvNc2IDuuoqSARyVwlS2CIiA6GbJVDamylEQAhe6LHjRh8
 5ABd4eshyhjwpilcN54XD4+/FpXsKP5xwW1PvuhfuVuR/o/6NypQr3XOruXjqL0UsYSU
 VEZE2RmmPyVcEpZa4YAjCY6Qcn5leZ2WDJj4ZR3Idok/ExVORp5yJeVJvg0uD9GIL0kA
 msiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kzW+etdvWCxLvil8pyMDDG+XQ0COh7mraCS06TiMlQo=;
 b=STJn958BNod7w3czjbBxrj2zszO6gkns+ZF6hx4ORBPXQMoLWs+QxRD0r2uCYpQBbS
 r3v7ThkxTiWt9p9TaTbx9D5hnC1kVi7bPh2KpjiRj7ukiCU8qd2icsqxpirkkUx5Q+jg
 4MCvFVDsuRBC0Nq6eTEb70y3Gz/m/TZeYaS9ZGcYQEI+izX3U74q02dpNVr8XU3ODWfx
 DzPJIDwta00q0VxIr28oLg2goxNddRk4BGVzEjijk/KALfJnHOyMawCG0fO73PMOIlhn
 g/A8VzyymIYO22/KhZCf6HUg6mhfVSNWIryMeN+vpFauhBNJOLmlHIOuALp4MIJCe8Xs
 7ECA==
X-Gm-Message-State: AOAM532ats1KyIdw0LL44cfBlB7Hf7j1vX5jSN0XRpPc6yN4EspcrXB9
 wBOYiJ5ydmmqPXefGyAJb55uk3rPYEQ=
X-Google-Smtp-Source: ABdhPJyeKi4FC5pRgnnJuTkiVTgJh3qpllLZKQeokr+WGasxdfO2T+bDVDgB0/suwymO6DY+a1kRzw==
X-Received: by 2002:a1c:6741:: with SMTP id b62mr4150526wmc.21.1610129765304; 
 Fri, 08 Jan 2021 10:16:05 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id s13sm14823188wra.53.2021.01.08.10.16.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jan 2021 10:16:04 -0800 (PST)
Subject: Re: [PATCH 2/2] hw/net/lan9118: Add symbolic constants for register
 offsets
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210108180401.2263-1-peter.maydell@linaro.org>
 <20210108180401.2263-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ee3de176-557b-11ef-282a-da84a1f52a71@amsat.org>
Date: Fri, 8 Jan 2021 19:16:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210108180401.2263-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.241,
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

On 1/8/21 7:04 PM, Peter Maydell wrote:
> The lan9118 code mostly uses symbolic constants for register offsets;
> the exceptions are those which the datasheet doesn't give an official
> symbolic name to.
> 
> Add some names for the registers which don't already have them, based
> on the longer names they are given in the memory map.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/net/lan9118.c | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

