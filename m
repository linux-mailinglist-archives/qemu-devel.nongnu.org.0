Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0E32CA848
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 17:31:50 +0100 (CET)
Received: from localhost ([::1]:44852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk8ZB-0002AF-7d
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 11:31:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk8Xk-0001Y8-A1
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 11:30:20 -0500
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:41237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk8Xi-0003nY-S9
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 11:30:20 -0500
Received: by mail-ot1-x32e.google.com with SMTP id j21so2082379otp.8
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 08:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZzzWUC50TZMNaTGo82ioEJhlh7JNxEQOqJmrUcBK0yA=;
 b=BW6BwoWbNK9Lz47KIXDOqD0wcdJDGDWzrNV3lllk9FwGfpI2Xh5QIWCrfN6HeSeGdn
 jc6gIYx48nye0Q/bupeA9l8HbpvRj/UkYr065ZY0043nPsgFKMiSXFoyPVNBxOG3U0Hg
 g8duVJ4Eo/odhFIumj5AHmQABZDMz5/RWu0MT9mBxznVbPnOTvOn44EESZ6rex7R6IUd
 m2DfhWO/DlyKj/513+A436LSoP65AdATu5zGTQPjsl/ZbP2tUKQugRqx8EsQe0Wo8pEC
 mN7VuGJsa9pcgszc/kNOi628pecsI02LcjIdDu0V/FyrTSXl0wmsBvyAuJbx08aph4ft
 FUvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZzzWUC50TZMNaTGo82ioEJhlh7JNxEQOqJmrUcBK0yA=;
 b=H3vM0MJI7dMImsSgP88lR+jL4suP4U81EXzB3J6y0KqIYs5O1dUf49L2QP+b5AScIn
 FbRvkVT7pPO4gnwPX4ybVPcpnIpDsQMUzIJI8SDmwEJkCKHCP+mYmyUuVO/GXWB42jvl
 reLrl6RE4Zd8X3kzwGvSk/N+RWYf8JqwmZJjz4LX7tybrFJTHEPPxX8brQGLNiJJ+29V
 UbvoncsoJ8IW18DsEMSKsnOgnSvL7aoUf3vxNc/CnVp3xFnrgVS+uWeX5ygMA+0OxGCU
 PVlilgmslFU/qgTIRTDcDk0l8NEep314ozOLKlTJoCz2+n0o7ItiiazXck1X2nAl4RY5
 Kh+A==
X-Gm-Message-State: AOAM533pGoFVbWF6gkeGbGW2n9/RuQ0Atv9G2k6cRf9eML9HjRbPZyiL
 zjsSCVxK4ZtUOebn+6EaHT/00A==
X-Google-Smtp-Source: ABdhPJwJ99nDXEarAG/ukNx+6mlhca90rGtex6vmfYFuKuYFAJBc1d5wpc7m+ZkZgjSjoZrAPytyKA==
X-Received: by 2002:a05:6830:1199:: with SMTP id
 u25mr2397404otq.323.1606840217666; 
 Tue, 01 Dec 2020 08:30:17 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id b23sm48945ooa.13.2020.12.01.08.30.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 08:30:16 -0800 (PST)
Subject: Re: [PATCH 0/3] target/mips: Add some CP0/MMU missing definitions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Huacai Chen <chenhc@lemote.com>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20201201132817.2863301-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <63cb8ada-0e82-abc9-3954-9474fb593be5@linaro.org>
Date: Tue, 1 Dec 2020 10:30:14 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201201132817.2863301-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32e.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/1/20 7:28 AM, Philippe Mathieu-Daudé wrote:
> Add some MIPS3 and R6 definitions to ease code review.
> 
> Philippe Mathieu-Daudé (3):
>   target/mips: Add CP0 Config0 register definitions for MIPS3 ISA
>   target/mips: Replace CP0_Config0 magic values by proper definitions
>   target/mips: Explicit Release 6 MMU types

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

