Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB3F400EB7
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 10:41:05 +0200 (CEST)
Received: from localhost ([::1]:56812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMni4-0001qA-JF
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 04:41:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMngS-00010B-Gh
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 04:39:24 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMngQ-0000jg-To
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 04:39:24 -0400
Received: by mail-wr1-x436.google.com with SMTP id b10so5038906wru.0
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 01:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Zr5j0NGFJBIVNj98TsAO8Fi3qIacsELtevlMCVaCERE=;
 b=mORnKW3dXCIZAUfPgIHFj+mtmwlm3nfTMaCQzKb13ZdMeM1OyH2TeoBuCYASgQPYXF
 gZ4sftdnpBckC0K9tM0AchsbH7yYOYILXPTCc14AgXVepAOjmgMSZjqXZzmDWmoxQUGL
 FXFlqh1qJGcGu45KhpV6e7num/HWkeTDz/E38Evpu7WGSKnlBkC8esCLSuacErJ28hEs
 AX3owFgg1izCR5SQj7gZ/NC4BHnu4x7jAA8cuD+U8KD6lQrujQs7m+XKS3Vu68T4w2bp
 6wOpdBFZ5BZmYG5Hu6lFUaleHH32rPOmqB8j3QJmTJUw/HacBWKbbCGEhfDywpNOEQ+F
 Kzbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Zr5j0NGFJBIVNj98TsAO8Fi3qIacsELtevlMCVaCERE=;
 b=pd9vnHMc+QooWh48LIURuZev6mTSrE5oDiHf86K7irmvDHHwOqcfwHix9GRo9kVmMD
 kImjPiWYXD8HFfelZaAhL+7gvMPC7hZ7pm2gaj/akgujXDxjTuvVWkAnIMKZUz6s2Ck2
 lFmlCYy0OIL/rnwyJlTuoC9+Ft0rLg2N/y0BvtTXhGWOlHTo53Uj/LC3qpbNqDKNPQHq
 J9rGEOFGg0tYblDqJwYGopugEFt9GogL74U4nUmP4Rxo/PnsqZl7dgzr1hYSuzKT/ejn
 DC41XIQ/Bf67rQcB8xaAYjEtDM0npsTqrkdzBGYnF5mNP/tO7Ep0LWYV7E8QIXpbt0MP
 ZbgA==
X-Gm-Message-State: AOAM533yAGAx7WDNEGJz2xoLeIuxWtSiIrZEya+aMeb41RYBlMRUNzS5
 SMwqBjuM3NZ51CugddytwCfEjw==
X-Google-Smtp-Source: ABdhPJyb0kxi3ktYUOiTNZf0Bp4N5lQiiKlh5WdhjvbLdFGoxzZZ2LBZ5GH05wD/I5LHEG9ThmNbpQ==
X-Received: by 2002:adf:cf05:: with SMTP id o5mr7314468wrj.270.1630831161480; 
 Sun, 05 Sep 2021 01:39:21 -0700 (PDT)
Received: from [192.168.8.105] (206.red-2-143-78.dynamicip.rima-tde.net.
 [2.143.78.206])
 by smtp.gmail.com with ESMTPSA id j20sm4484675wrb.5.2021.09.05.01.39.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Sep 2021 01:39:20 -0700 (PDT)
Subject: Re: [PATCH v4 09/21] target/loongarch: Add fixed point extra
 instruction translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1630586467-22463-1-git-send-email-gaosong@loongson.cn>
 <1630586467-22463-10-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c0c11b58-8337-2a7b-b5ac-b219b0bc2332@linaro.org>
Date: Sun, 5 Sep 2021 10:39:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1630586467-22463-10-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.832,
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
Cc: peter.maydell@linaro.org, yangxiaojuan@loongson.cn, david@redhat.com,
 bin.meng@windriver.com, mark.cave-ayland@ilande.co.uk,
 aleksandar.rikalo@syrmia.com, jcmvbkbc@gmail.com, tsimpson@quicinc.com,
 alistair.francis@wdc.com, edgar.iglesias@gmail.com, chenhuacai@gmail.com,
 philmd@redhat.com, atar4qemu@gmail.com, thuth@redhat.com, ehabkost@redhat.com,
 groug@kaod.org, maobibo@loongson.cn, mrolnik@gmail.com, shorne@gmail.com,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au,
 kbastian@mail.uni-paderborn.de, crwulff@gmail.com, laurent@vivier.eu,
 palmer@dabbelt.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/21 2:40 PM, Song Gao wrote:
> This patch implement fixed point extra instruction translation.
> 
> This includes:
> - CRC[C].W.{B/H/W/D}.W
> - SYSCALL
> - BREAK
> - ASRT{LE/GT}.D
> - RDTIME{L/H}.W, RDTIME.D
> - CPUCFG
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> Signed-off-by: XiaoJuan Yang<yangxiaojuan@loongson.cn>
> ---
>   target/loongarch/helper.h                 |  4 ++
>   target/loongarch/insn_trans/trans_extra.c | 88 +++++++++++++++++++++++++++++++
>   target/loongarch/insns.decode             | 25 +++++++++
>   target/loongarch/op_helper.c              | 26 +++++++++
>   target/loongarch/translate.c              |  1 +
>   5 files changed, 144 insertions(+)
>   create mode 100644 target/loongarch/insn_trans/trans_extra.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

