Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CB93D34BB
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 08:35:03 +0200 (CEST)
Received: from localhost ([::1]:59632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6oly-0005ZG-GS
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 02:35:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6olF-0004sF-MJ
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 02:34:17 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:33729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6olE-0005cq-5k
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 02:34:17 -0400
Received: by mail-pl1-x62e.google.com with SMTP id a20so2267109plm.0
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 23:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GzrVnV7SQIxWubzDmTcNnAWevcoYjfiXtCltfXCr4uc=;
 b=giYCK6f2n2hA295jUbSk8wkZp1bAZG0vM1bd0guGB5QHB+i8GBPbPX6Nw1DBylu34p
 f8JoQ8A4aHeIkJLw8chGNHVf+S2/MBXwMWEa0p+Mrc3Fh8BwGum74/fZbrO0Abt3JGPr
 +WYL+5KXJzJef+NSstp1vK0jcmb6PRexZppsD3grVr6tUb/SsqaUrmmI2VfyrQpg9sHr
 FTQA7UQoeLfPjjnvGUpvSTEDzfiY7B0wt6vyIIClWNKAdr+Zv6g8ALqNjwV8C89r9YcE
 IU+/emZ4sUrlz6cxi24L9zVQGZKeARKA4fAqgIG7oVecGAYmG/V9y0cyx061+fuuk/fp
 87GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GzrVnV7SQIxWubzDmTcNnAWevcoYjfiXtCltfXCr4uc=;
 b=MTDDhP03q9B3gGlXPDXpfVcTUk+kXC8Sc3Q0r7kmIVMBiKGHhXAGjREm7mXYtiAXa+
 iiW6o/7Mfc+yHmSST4Z2gGlyE0VQdLUJ4iQgiZq0UWPAnB342+k5gRLTwkKIKEAmkPxw
 jruZ4RLBJ7+sE+1x5Zz99V/2l2Lyufs758mzNXz2fPhe0e83YzlK8zchBqXT6GAfaXoJ
 nxTBCyHbibzeC6/Wda5OgWWSV1FXZcPZ8nDmzxzontC8Nvg94Y/HYknhAmj1X6fp3JzM
 OsuleH0b5MPWKz5ByLFN1gFxr5oyNhO/9wWPwKBBnAqySTsQmuQa8ahEFlU58NyuMgh1
 2DrQ==
X-Gm-Message-State: AOAM531Dvlq0DBQf8gIv+hxYFsy5Owau4dtWM6oRcKaEXOjIWX+MgUkZ
 O3SZ1lEqcun6cohtkdZOL0Xk0w==
X-Google-Smtp-Source: ABdhPJy7KzxhPEqeveVB0yWzrn2lkcVTd0EstWHNGVltVqEMcSJQG4AbbqdzAXYtGnQIn988G/15ZA==
X-Received: by 2002:a63:5963:: with SMTP id j35mr3462177pgm.341.1627022054596; 
 Thu, 22 Jul 2021 23:34:14 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id m24sm35828822pgv.24.2021.07.22.23.34.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 23:34:14 -0700 (PDT)
Subject: Re: [PATCH v2 17/22] target/loongarch: Add floating point load/store
 instruction translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-18-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <094be4d2-64ba-b295-8b13-342ceecad2a0@linaro.org>
Date: Thu, 22 Jul 2021 20:34:10 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1626861198-6133-18-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.203,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@gmail.com,
 philmd@redhat.com, yangxiaojuan@loongson.cn, laurent@vivier.eu,
 maobibo@loongson.cn, alistair.francis@wdc.com, pbonzini@redhat.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 11:53 PM, Song Gao wrote:
> +static bool trans_fldx_d(DisasContext *ctx, arg_fldx_d *a)
> +{
> +    TCGv t0;
> +    TCGv_i64 fp0;
> +    TCGv Rj = cpu_gpr[a->rj];
> +    TCGv Rk = cpu_gpr[a->rk];
> +
> +    t0 = tcg_temp_new();
> +    fp0 = tcg_temp_new_i64();
> +
> +    if (a->rj == 0 && a->rk == 0) {
> +        /* Nop */
> +        return true;
> +    }

This is not true.  This is simply a read from address 0 + 0 = 0.
Similarly for all of the other indexed memory operations.

And again, you should be using helpers to reduce the replication here.


r~

