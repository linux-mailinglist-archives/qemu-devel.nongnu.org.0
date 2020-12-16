Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C18112DC6EE
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 20:15:37 +0100 (CET)
Received: from localhost ([::1]:45656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpcGu-00089n-NY
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 14:15:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpcCv-0006OS-VE
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 14:11:30 -0500
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:43948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpcCt-0007on-1p
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 14:11:29 -0500
Received: by mail-ot1-x331.google.com with SMTP id q25so24141722otn.10
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 11:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wUEtvnD61Vorajlz86xYDcBFAytLuZvYAf6cqBmPa14=;
 b=mV6Ly/XQhVjmyR6U1cuLChMSf+msSjwsWcwEbUqX3rnjoQxW/qU789OdftAz4yrn6Q
 1zR0GyYo64GzpVnTvweTjMULKf3IQxWYDhRoTdipJJrSF0uIxO7TYxtaVUpmlhYwJXNF
 O6sCmZYwVvGrV3hUuYGEV/F0ZqRWO0fwFhT7riHQJX92NlRE+fXpmKLYWwCTogxpC6Y2
 gcCYkcV7RRrBc7Ny+M06FkvejQnbjvqcM5ECxxkIy/XlVutP0DgvS4Td/FtfhPS0FB7G
 UMdeng4rk1lhEEymNjZV5c0WlSERFocplmRExkk7iz2/OfKY6zIIbTFSNLtRzMn7YRQy
 wm8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wUEtvnD61Vorajlz86xYDcBFAytLuZvYAf6cqBmPa14=;
 b=ggEXSby2BhkPc5xV1y2dLZ5ltgZ8XRQ9BSf3Bi6rxXc5c/L1iQxAyx1Ho101hRMsFR
 ep4Hxg+qPKqTMfab9sVoOx27iMIhRlIYPy2qCYhsuLxmo7Z+68idwusHZITZHWHrBq5q
 aFNWpi9YCQHfDzzvP6HiDwOqwuRrzY9ZBtgI3+HPmSdfz+RXo3DLxjitjTTk1G+rdQwa
 SZK8NWar8OCirQbbrXCuHCj5tK7lYtfGcZQ3vIEGg2GX48ot+7bqKpPSttQvUfuK+9H6
 vuuCytd/mZFxC/DF30nbeA521NVjMTkRN1ZJuVFo2dG6iej11pxaCgm5/dv1Is8b9Jth
 ANzw==
X-Gm-Message-State: AOAM531U/0vlBA8bwxFewgo8yomFgiC4WsMmMBm8eQg8BmQJ/dTsV46O
 XinduN7rSDtDnjSles1wLQZCiw==
X-Google-Smtp-Source: ABdhPJzDejT4LVlKRd3bUnCDeYy5lBSNZGzg0s6fkOTpH2L0taD89SIVwSTcRD+Le2knxcdvpGgAzg==
X-Received: by 2002:a9d:1cae:: with SMTP id l46mr10983345ota.249.1608145885153; 
 Wed, 16 Dec 2020 11:11:25 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id o49sm635849ota.51.2020.12.16.11.11.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 11:11:24 -0800 (PST)
Subject: Re: [PATCH v2 01/12] target/mips/mips-defs: Reorder CPU_MIPS5
 definition
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201216162744.895920-1-f4bug@amsat.org>
 <20201216162744.895920-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <865b7777-27ff-a32b-ef39-bd19a206b689@linaro.org>
Date: Wed, 16 Dec 2020 13:11:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201216162744.895920-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x331.google.com
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
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Laurent Vivier <laurent@vivier.eu>,
 Paul Burton <paulburton@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/20 10:27 AM, Philippe Mathieu-Daudé wrote:
> Move CPU_MIPS5 after CPU_MIPS4 :)
> 
> Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/mips-defs.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

