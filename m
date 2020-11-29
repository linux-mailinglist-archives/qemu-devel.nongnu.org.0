Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3B82C79AE
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Nov 2020 16:11:49 +0100 (CET)
Received: from localhost ([::1]:39660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjOMe-0004Gr-4m
	for lists+qemu-devel@lfdr.de; Sun, 29 Nov 2020 10:11:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kjOKx-0003Xc-Ug
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 10:10:03 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:37773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kjOKs-0001LB-NB
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 10:10:03 -0500
Received: by mail-ot1-x341.google.com with SMTP id l36so9002196ota.4
 for <qemu-devel@nongnu.org>; Sun, 29 Nov 2020 07:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=9kn53s19bIzGLvN+daRtn9qEDbHA5l+9d/NSyNKlf+E=;
 b=sS89AcBYsjybCiuX/QV8LtrEX9ZILP4+0qNPFKnZCRTafox+sN8PBYlQrS7LHYde/y
 kTu/VG0+4Ucw+wfACx0hzopVWGRdLTw1itpKQ5RGNpXivQQgnDW9BdzK9XT993P1jgIT
 ZUUa/uMZXhXmTkSGw7E2KXDMrq1gozYMNEwdGR+7+/8pJHgsdOp0kC9N4b6lymcRAxoO
 vgLG83BeKBvRxKZOGDwmAvnn0cJLDx7S60TwGaPj4owgF4pyJvBPaf48htuJXH/1/MAM
 Nz1ybO8hslJ/H5OV9Ne0RyIq026QlU60qRF5pIeVt3kieSQclOpz6dfBnOtueb0ap6Xg
 QqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9kn53s19bIzGLvN+daRtn9qEDbHA5l+9d/NSyNKlf+E=;
 b=XcRHyiBPKygxCXtHYhehg+xJMhAS0pf3zmuPEuAxj4Ypq/PsFbFntXdbVh7pEkgqGD
 ZCIkHlUuMqLnHgvyJbL7LNC0+WZYYjEnXWC2RRWTrMtVnCJW4wbndEF5D5IMM4WE6O+i
 hAypAdTnymF9rBIMLe9AkzYs+eSVT8X08MgizP2EhWpBkq62YgRZvklSvXifnmXXIT17
 QTsw69rZ/wnFcLValV4nThrQ1LxYq8bp+WssfT4ctg70kj7+netSC3PU0ozTidYzvbuD
 bhqbJuczr0D98UYBcBDJyASjYCkA2mVeGFNJYcXO1YbeJmM6eCLCwKeA0lhtOtDPIXDU
 eXVg==
X-Gm-Message-State: AOAM531fhtO8jTkpdjwzYI0aXGr0VDmZOBBRaOaGlBGuHljXD/nKdWIS
 P/V+GzkG6YG0aYvGrnktPEsg0Bnx8bBb9N1+
X-Google-Smtp-Source: ABdhPJzAXrgBDwHqz1pQba9scJ65/3jShSw/50lM6dNd2rl5aA2TCm5XedvyRqjaOsXleMpay9mRtQ==
X-Received: by 2002:a05:6830:1286:: with SMTP id
 z6mr13137151otp.334.1606662596019; 
 Sun, 29 Nov 2020 07:09:56 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id l7sm8376782oth.73.2020.11.29.07.09.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Nov 2020 07:09:55 -0800 (PST)
Subject: Re: [PATCH v2 25/28] target/mips: Extract Toshiba TX79 multimedia
 translation routines
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201123204448.3260804-1-f4bug@amsat.org>
 <20201123204448.3260804-26-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0264c996-6cb1-6fd5-a220-d62713e5215f@linaro.org>
Date: Sun, 29 Nov 2020 09:09:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201123204448.3260804-26-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x341.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/23/20 2:44 PM, Philippe Mathieu-Daudé wrote:
> Extract 600 lines of the the Toshiba TX79 multimedia
> translation routines to 'vendor-tx-mmi_translate.c.inc'.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.c                   | 568 +--------------------
>  target/mips/vendor-tx-mmi_translate.c.inc | 573 ++++++++++++++++++++++
>  2 files changed, 574 insertions(+), 567 deletions(-)
>  create mode 100644 target/mips/vendor-tx-mmi_translate.c.inc

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


