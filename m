Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B414E400ED3
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 11:31:11 +0200 (CEST)
Received: from localhost ([::1]:57118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMoUY-0006nn-NA
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 05:31:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMoT6-0005hn-H5
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 05:29:40 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:41540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMoT4-0000b3-Vz
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 05:29:40 -0400
Received: by mail-wr1-x42b.google.com with SMTP id u9so5073724wrg.8
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 02:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8EnsYEYjptJ+cAP1hJTmCB4KeZ0ktjaYmWvVpLOdz0U=;
 b=sppJYeDcaSyJqicPkTonIO4Ajo4+CQE2kA0aQzbPnh8GWbkmtP/EfprCYAZju20UL1
 iI9/IQk0ERmPydSXcmBBWQ5Ftp+mmg+UQGzgl3iGan2G0caNTQGPS4+0+kiDun1XjpRr
 KGTsQC16iX0c9jjq/b52hIAJuZMLvJk+4Eqm63jg9a8YmliJTDfA+uC5jSJ3BVQKXFZ9
 NCSimIS4wKcBQzUsVxpwGZGtWskmW8S4b6wmRq1g639jKm0JKFiRR6QVxNT6TFijStdj
 /9wHwkwfaHOLN7PQlhMjRm+6jiJzPvTSBHjZzj5LnVzjhbLNME60rJ3ceGZwhGiRHvSF
 awPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8EnsYEYjptJ+cAP1hJTmCB4KeZ0ktjaYmWvVpLOdz0U=;
 b=XIaM9pkXZrtEbSufDIgMiPui4IdB5PIP45bHHzzLSo/fEyKDKhCU/+GtzhX7H8QN4R
 TkAipvZXOCKxsIBei7ls4x6brpjD52DqftAacH9dIQf9DlNpG1H+qKQhMRj92F15RnEr
 kMxRQ4Uebkg7r6+8uh2N2lSrzDGWjgTQrQpyhjBAQ0JlOZSkBk3Nh/2MYdeZyIICoAHC
 CQYxWYkgfs5ptTWMq/MrVxiUWymbdN+VHHm0LcCuktlzhAxF2y7K3zWTibaMUlXCWD5f
 logcJ4MAIRwqeiKqaOu8xVx8b4b2n0bU2DTSgKRgmeCfIZmByenzn3ksOhqTRGyiJ9z1
 AZLQ==
X-Gm-Message-State: AOAM531MYQnTLXKJ1A2c3jDO9lIfF/EEcFroQadAhh1Tfo0ghsqxs5hi
 3GiPYwnSrjk3Hz+FVbKfvyk6ig==
X-Google-Smtp-Source: ABdhPJzqEE87IPAj/E0cClmWcfaVWRD2o+quoDoHcXSTRGKeW+AJ+4lP1c86xxFIAY+SDUJ6Dhl1pg==
X-Received: by 2002:adf:c508:: with SMTP id q8mr7643244wrf.260.1630834176922; 
 Sun, 05 Sep 2021 02:29:36 -0700 (PDT)
Received: from [192.168.8.105] (206.red-2-143-78.dynamicip.rima-tde.net.
 [2.143.78.206])
 by smtp.gmail.com with ESMTPSA id f17sm5164446wrt.63.2021.09.05.02.29.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Sep 2021 02:29:36 -0700 (PDT)
Subject: Re: [PATCH v4 12/21] target/loongarch: Add floating point conversion
 instruction translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1630586467-22463-1-git-send-email-gaosong@loongson.cn>
 <1630586467-22463-13-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d930cb6a-7e35-af49-7713-9153e5c6b9e0@linaro.org>
Date: Sun, 5 Sep 2021 11:29:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1630586467-22463-13-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
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
> This patch implement floating point conversion instruction translation.
> 
> This includes:
> - FCVT.S.D, FCVT.D.S
> - FFINT.{S/D}.{W/L}, FTINT.{W/L}.{S/D}
> - FTINT{RM/RP/RZ/RNE}.{W/L}.{S/D}
> - FRINT.{S/D}
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> Signed-off-by: XiaoJuan Yang<yangxiaojuan@loongson.cn>
> ---
>   target/loongarch/fpu_helper.c            | 393 +++++++++++++++++++++++++++++++
>   target/loongarch/helper.h                |  29 +++
>   target/loongarch/insn_trans/trans_fcnv.c |  36 +++
>   target/loongarch/insns.decode            |  32 +++
>   target/loongarch/translate.c             |   1 +
>   5 files changed, 491 insertions(+)
>   create mode 100644 target/loongarch/insn_trans/trans_fcnv.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

