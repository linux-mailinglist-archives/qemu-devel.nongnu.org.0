Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E6631BF6E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 17:35:59 +0100 (CET)
Received: from localhost ([::1]:44324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBgqs-0004th-Ny
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 11:35:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBgp8-00048G-Dq
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 11:34:12 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:36817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBgp2-0001kL-K6
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 11:34:08 -0500
Received: by mail-pf1-x42c.google.com with SMTP id z15so4482013pfc.3
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 08:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uE+s2aGipq1emTyCb2JE5v7ry69+ArFvwbcUgM52uW0=;
 b=GYh+cFMGqtrczNGxFc53ZfHOgwwG4FioFpG/iPILFckKm4J1ypXrjDVae3T9zghP4F
 SiolbCiOIbNVbmm+kiiVWPxnW/ZDlYGCtC5LW8QEc5rM3gW97g1sGB1Ihidlk0YrpeU4
 sz2t/+aowHw0P9jxrWMb200VLDfzcnyOb/EJPM+gMJOyYr06lixDRc2V3280WuukjNl+
 /rbJ8CRdUs5Gm1jr7yTmaoBzrRgM5AZlM6VBKoXLFhmPttQKak5JC9VFbQre7FQcowU8
 DU7Yf+B5tS6yQYJCiKKarFRgQ81ZkPZ5HRk7kpyoW5t16hpKPr1o2ZWoMgmH11kZv0FG
 cf2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uE+s2aGipq1emTyCb2JE5v7ry69+ArFvwbcUgM52uW0=;
 b=UBt5s9oScqICmbFtOP7hv0UpnppYFhT27tuPHZMUfP83VG+Hs2IdqsoSoc0SjTEqwn
 zb84BV6n0KFliOnmRRgCInud29c5eitSK9Ak+VGBs+lTim0xDlKGOWIjGNsP2qLoA+ys
 fpMIAzFlleaxH/DHXb+ayRRvDwkBZXS4WpOFduyS//22O+D08zH7tGfcq7Pixg+GP2Wn
 4tVJnAErvb3HbF2WzttPVnFNmJoN6oDuIB+jQ6li8a/599FtadRlxWLyaIU7Ed4KldU8
 ee6OZ3wp4zkQDYhyFRdP4mR+g3ntKA30Ax8uDd6LdNeug+TuVLRfUc6buiaXZo3yp9mK
 jdgw==
X-Gm-Message-State: AOAM532bCmu3Z29QGd6swGAgwSqCYq8/e0gwPh81CzMy70DtgZd2mic4
 a6juOsCqcL6E2Y9bukr8YdBTlg==
X-Google-Smtp-Source: ABdhPJwMDuVm7OPkCX3Ez3gNESSUAlPjwr0427MC+bUbhpjMmbL4+Vx+2wQJwmzqmTRrpvHmd/ZSHg==
X-Received: by 2002:a63:da4a:: with SMTP id l10mr15595612pgj.222.1613406840769; 
 Mon, 15 Feb 2021 08:34:00 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 194sm19067786pfu.165.2021.02.15.08.33.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 08:34:00 -0800 (PST)
Subject: Re: [RFC PATCH 14/42] target/mips/tx79: Salvage instructions
 description comment
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-15-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <734c7bc8-9115-d0f3-99e7-e41ace021210@linaro.org>
Date: Mon, 15 Feb 2021 08:33:58 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210214175912.732946-15-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Fredrik Noring <noring@nocrew.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/14/21 9:58 AM, Philippe Mathieu-Daudé wrote:
> This comment describing the tx79 opcodes is helpful. As we
> will implement these instructions in tx79_translate.c, move
> the comment there.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.c      | 160 -----------------------------
>  target/mips/tx79_translate.c | 188 +++++++++++++++++++++++++++++++++++
>  2 files changed, 188 insertions(+), 160 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

