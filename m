Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1020F4378C9
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 16:11:25 +0200 (CEST)
Received: from localhost ([::1]:38498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdvGW-0002ip-39
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 10:11:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdv6z-00074C-7i
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 10:01:33 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:36743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdv6w-0002JO-CK
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 10:01:32 -0400
Received: by mail-wr1-x429.google.com with SMTP id o20so753697wro.3
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 07:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=f6qAY0AM9bX1QQHxhbksjfvAOXb2yYP4RBlSJvIi7w0=;
 b=NNFmWKHhdZmXA2OL7G5yJ2oTnD0N3dzwEttuKp+IPSRhuX41RAkNclGF/QbgstoPnd
 guxFsQ0puxSvs9kkHaWe3IAZ6nFHqHWdYSJGrrvDedYXNU/JEC3tf/a0AXUU1V7+McUP
 Z7oQX7wUbteKUVjG0DgmNC9fK2tUaFADBHTURPyN96cZGhsM3hoIGT40Ntkf/8hd1fpz
 le2itY25qawrBRFKAQs5zDKla0l8Ep+N3dgPqigZ9IKdH7goCEAw6AkYq6F1A2ZCOaD/
 3mneRUj6oF6whNNxsg5V/5ipJPmklCoOb3p6R9hkwuhCt83ucRq6eY5UcjvXUL4kWKHj
 Oxjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=f6qAY0AM9bX1QQHxhbksjfvAOXb2yYP4RBlSJvIi7w0=;
 b=W0O60Cl6DSiOeiFucaR/U299RYydHJUu+tYAK7ihck125xWIGSwFI4uu+SNlCg60Ou
 VbNmFg1GExFEZ4Ht3wlvNZiHhtwbv/JDQQnuYiZ4PB4i8hPBNTxcw0VcpgkEpb2MSM9w
 ARFo8zc/HNu9miWUAexGRHPxKBxzevbDpRop6oqJgn5/6xY4ad+Ejb6IYAtuGreV/o1i
 Vn7o6rAR4Yk0ACJubc5+eePWQeRgRgYlhO0YeUpKzwM6VWtRqFuiZOcP9ZNTmSN25Zip
 oRfTAtgMIa4SFFu7lAb70c9NilYkQUmwmi4Vmq6J4KkGtR21nrTQoNmrJRngJDNmdpCm
 GIiw==
X-Gm-Message-State: AOAM532UTtjB+UtmqBQil5Ql+4ySuS75YU0rE2Afj2uhbkCbyBKlUFov
 y2wjJqlBLDYxSuXKAG9OJEY=
X-Google-Smtp-Source: ABdhPJzwrW+OLYbx71ejcv9pw6yQypfIgYkGpFVnuKLGpq40kWSGpeAsq9gLOErv6q9ACjcitrekYw==
X-Received: by 2002:a5d:614d:: with SMTP id y13mr20173wrt.199.1634911288903;
 Fri, 22 Oct 2021 07:01:28 -0700 (PDT)
Received: from [192.168.50.34] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id c17sm1935876wrv.22.2021.10.22.07.01.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 07:01:28 -0700 (PDT)
Message-ID: <bf31a18c-176c-098b-332d-98757b9be961@amsat.org>
Date: Fri, 22 Oct 2021 16:01:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 21/48] tcg/optimize: Split out fold_addsub2_i32
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-22-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211021210539.825582-22-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.742,
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 23:05, Richard Henderson wrote:
> Add two additional helpers, fold_add2_i32 and fold_sub2_i32
> which will not be simple wrappers forever.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 70 +++++++++++++++++++++++++++++++-------------------
>  1 file changed, 44 insertions(+), 26 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

