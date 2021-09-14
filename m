Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5898240AFFE
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 15:57:36 +0200 (CEST)
Received: from localhost ([::1]:32900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ8wJ-0000dS-EY
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 09:57:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQ8ox-00089J-Kr
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:49:59 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:47054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQ8ou-0006N2-9R
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:49:58 -0400
Received: by mail-pf1-x431.google.com with SMTP id y17so12254195pfl.13
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 06:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iXHQxIJ6E0IG33jeuAJKGYWhX1dNIEuNRvbqhuOKXVI=;
 b=KHSPhUxTQbpAIBGLI5hyDUcB4VK+0VHxXvKSnkWP14hV5QFmUXziZUOaXip3IPGmrh
 Ajc2OQmXuzR7mjkwOumD4M3r033HIIP5PzSPOWcC5Tvz5MHoDYQ+1WVuiKd4X+K6QNp3
 NS293PRs7Xrf1kuBmWJNdbHqErBN0AaVGS4Pn1mrXPL9vPSkn8c1IqLuHmw7nx4ZgVnX
 r8VRenvK5U1nxiPOK2SknR1jIbmiJyWMPboSGzS98k/JbkK4P3IJ72hduK/Uf6o13QT0
 hjrwUPFzFXqUhPSiAGT+pYA2OUW/HzwVaiW5baA11lnLDei0Zz1YmRDi6O6FiS8Vmj55
 Z1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iXHQxIJ6E0IG33jeuAJKGYWhX1dNIEuNRvbqhuOKXVI=;
 b=xbIw3Zw+5WVQyq7wTHXUMbRkRQtPSrxyBjvmcQS0kzP9Fz1aoMcTdLJYbSoXsrMyCA
 sGeCNM7XQIGLuLAvmA7qRqfiLO6e0O4kTZRnZCO6kMbs8F+FoNBHPtfgBryyHKuaerfw
 Lo4bj1DAS2E87YH4n16K6TfBT+wEtrOsgyfnYT9aBJUcfI+dl7etuLBRkgIZHjjd4N1Q
 nvZeHoYRbMZb67LbTdmT9/PxB99d4Ebh5qea11735Bnl3V33I6fMtg14DUXsbM97yH6a
 IK9y5E0PXoeAC9vVjOymdYrExe4l1RGsmxBUw6WdPfLhPxdmKyclHpF82wcLBkB9aI4v
 +P9Q==
X-Gm-Message-State: AOAM532oLJD8uriIn0AtZwdk5F8owUc5QoNHbXZ/OtUMwKEVUQqTJ7bS
 FUxnKcmjSnNRZ+Dweilv5Ai/xw==
X-Google-Smtp-Source: ABdhPJyFbMFuvKlFwdwTidVeH/fdBSL8i3MPIIEGQX8l+fyxWLb1vZkm9Te3YRNIoKS4G4ya5pltjw==
X-Received: by 2002:a63:b40a:: with SMTP id s10mr15814550pgf.481.1631627394751; 
 Tue, 14 Sep 2021 06:49:54 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id x16sm11776300pgc.49.2021.09.14.06.49.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 06:49:54 -0700 (PDT)
Subject: Re: [PATCH v5 08/21] target/loongarch: Add fixed point atomic
 instruction translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1631624431-30658-1-git-send-email-gaosong@loongson.cn>
 <1631624431-30658-9-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ee51603e-a8fe-3324-e434-1be6082c119e@linaro.org>
Date: Tue, 14 Sep 2021 06:49:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1631624431-30658-9-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.969,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, philmd@redhat.com,
 yangxiaojuan@loongson.cn, laurent@vivier.eu, peterx@redhat.com,
 alistair.francis@wdc.com, maobibo@loongson.cn, pbonzini@redhat.com,
 bmeng.cn@gmail.com, alex.bennee@linaro.org, chenhuacai@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/14/21 6:00 AM, Song Gao wrote:
> This patch implement fixed point atomic instruction translation.
> 
> This includes:
> - LL.{W/D}, SC.{W/D}
> - AM{SWAP/ADD/AND/OR/XOR/MAX/MIN}[_DB].{W/D}
> - AM{MAX/MIN}[_DB].{WU/DU}
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> Signed-off-by: XiaoJuan Yang<yangxiaojuan@loongson.cn>
> ---
>   target/loongarch/insn_trans/trans_atomic.c | 133 +++++++++++++++++++++++++++++
>   target/loongarch/insns.decode              |  44 ++++++++++
>   target/loongarch/translate.c               |   1 +
>   3 files changed, 178 insertions(+)
>   create mode 100644 target/loongarch/insn_trans/trans_atomic.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

