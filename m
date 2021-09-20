Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A1A412627
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 20:53:12 +0200 (CEST)
Received: from localhost ([::1]:40216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSOPe-0004Or-Rz
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 14:53:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSOOH-0003hI-W4
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 14:51:46 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:43810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSOOF-0001eW-7t
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 14:51:45 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 k23-20020a17090a591700b001976d2db364so663767pji.2
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 11:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZjWCpYneco8VBdYmD1Wcjb+QpZudxYIhAqVb3togtoI=;
 b=aJsDLNUCiTNKLmzBsZFGXO4JhCSJrjnTGA8ZNxpfd0aS6gLTBqQAUFXDKjLjmaolxd
 PaiDL2b12zbWKCmPBvtFKjzE3xxyTG/4ZRDFJoY/72Ho0LLWKDd2idv0J1ihz64uwII+
 /UwOXjAcjxHwkmSxq4DyNwde9n4JsGTv4HNpTh5SMoyka9i+bAbADvfuN+Vj/iZvFcaj
 EdOKnjhSDvh4MLAG5OL1lr5bNNQwa1vDG6U6KyGHHNS5yGquoNmIHDVNg6YU2UnMJrqr
 ApSWtKtJeUDbLzho+thU9sXI55qHZp7zgwhcjVpAKqbOSHnrOJtt0xEcmL+mFUq7zY5c
 xtbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZjWCpYneco8VBdYmD1Wcjb+QpZudxYIhAqVb3togtoI=;
 b=3w8ZspQWthAbvBCpX3HZBH0bzo8axjpr5mp4ReDt7/sywbeZ2MHhrR8L3lGwPxacbV
 zgStufu+JhYZY3L90QTredYgo4EJXgCuKjrQvTG4y99HVyjPBDRyN/27k9jh9aVTzH0y
 8NmbNtoYDZyFvoX1TphwroBoI2163GJEUZ48ctHlnuo9tXzdb3j2mkU3wn+q+EXAKFQS
 qxV0+RDbb9KmD9JxegGR6L9RWPR3uUztLSo9/wZ+2Cq2uv+JmckCESvOY+i5pNVaLSt8
 NATHho/UtehAHmneOOX8Kdzmq8DfEzvVqLSbxim42lJFvcvVT31v8z3H4/QlJlcGnYIt
 PWFg==
X-Gm-Message-State: AOAM530nz6jkxGuFlBdeObkspYWvIDQuNkO/rGvvWjiFbRcY0+M2xb31
 zGw09QPawL43nfwyFksx7b8WqA==
X-Google-Smtp-Source: ABdhPJxXX9eG/e349XAfsd8Kh/tn83jugi5Hhwyk461AFV6DbExmjMGTCyTOeSxd6WDOsSdFbigB9A==
X-Received: by 2002:a17:90b:3a8a:: with SMTP id
 om10mr496047pjb.223.1632163900564; 
 Mon, 20 Sep 2021 11:51:40 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q18sm15284225pfj.46.2021.09.20.11.51.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 11:51:40 -0700 (PDT)
Subject: Re: [PATCH v6 01/21] target/loongarch: Add README
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1631866380-31017-1-git-send-email-gaosong@loongson.cn>
 <1631866380-31017-2-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <eaf6063a-a45d-a45a-c989-c80999bfc90d@linaro.org>
Date: Mon, 20 Sep 2021 11:51:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1631866380-31017-2-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, philmd@redhat.com,
 yangxiaojuan@loongson.cn, laurent@vivier.eu, peterx@redhat.com,
 f4bug@amsat.org, alistair.francis@wdc.com, maobibo@loongson.cn,
 pbonzini@redhat.com, bmeng.cn@gmail.com, alex.bennee@linaro.org,
 chenhuacai@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/17/21 1:12 AM, Song Gao wrote:
> This patch give an introduction to the LoongArch target.
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> Signed-off-by: XiaoJuan Yang<yangxiaojuan@loongson.cn>
> ---
>   MAINTAINERS             |  5 ++++
>   target/loongarch/README | 76 +++++++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 81 insertions(+)
>   create mode 100644 target/loongarch/README

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

