Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B344378FA
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 16:22:25 +0200 (CEST)
Received: from localhost ([::1]:34030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdvRA-00024P-9W
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 10:22:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdv49-0003F6-1T
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:58:37 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:43602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdv47-0000Au-HV
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:58:36 -0400
Received: by mail-wr1-x42a.google.com with SMTP id r7so2411451wrc.10
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 06:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pxjhcN0Da3ZoVzsFU2qm73Ezk1t4ZDNGs5634UZ8yFc=;
 b=iF8FMAeyH7EvpBNCxFB39D0RSbrpjQipC9zU+di+95r0YuelW7ZzIwyp1/Wd+T3lfU
 ZJgft4wxSfrzJ2q9eeeS2V4GvQzLmPhYGu2dWG+ywAAq7U6pwOf+65OfPC21PNoXahS7
 NF49EMlC+sMPc/cF1IosGzp7g//IVR3Nq4E5UZkf5XV3k5dWdr0uSsvSep0crELy2ePR
 8YrSqJpYcNfMb42JsYSmYFWBxvgg20HRPprPrfwOhbEgUjOThbS8sWcUQ5l5SGsOOjX6
 tcwq+0vfjn59lbfyvbjopqTRHRP/U7d2tPR9/kuh9lMlBdClO1BX653bFRXhajndZdBl
 nAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pxjhcN0Da3ZoVzsFU2qm73Ezk1t4ZDNGs5634UZ8yFc=;
 b=5+c38imCYJmL9UuRFmXPyhzOAkXT7HnogkTjp0kBPa8sYIuhw8ij5VlTpmniNCtjcM
 bRVJil2KhEgRS65nLWkKYsFjyS839/j2zLPK9fCJ21T3qZBXiulIIC/9n16eDi19Ukib
 7lxEs5qS28on1tO6CXltzlwaRR44EL7eljSvvKbiXZRNjUzibpCcsoqFEk5yQ5SqaJ6V
 zWDdbjSXb5otAkC4VilJcuZmfMbyxBZZt08pph9hL0WK6N1wOMWv7gmqvI82qx6RON4A
 vLzsJokrrT/hOa96h12r5vSSl/CxNEaY2hBD0egnzhZaoRVY/LIWl4VDBiWfz7N9dzhg
 qUsw==
X-Gm-Message-State: AOAM533KPX2jcLZSQTD8goiF6YWjkRnSjxMIIuY77afS9xCkvxclI0Mc
 Gz4nLDdn0yY5F/mVZ3iGRc8=
X-Google-Smtp-Source: ABdhPJz9OUkiJvuuS+pblwBeAGcg4qsyPo70ag2kd4gIRbpvZ69h0S0g/2EuwzwPIFvn6Y5EqLL4Uw==
X-Received: by 2002:adf:f5ce:: with SMTP id k14mr53044wrp.256.1634911114375;
 Fri, 22 Oct 2021 06:58:34 -0700 (PDT)
Received: from [192.168.50.34] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id t11sm7827724wrz.65.2021.10.22.06.58.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 06:58:33 -0700 (PDT)
Message-ID: <4d012316-e5b2-eefe-ce7f-ed20d6acb20e@amsat.org>
Date: Fri, 22 Oct 2021 15:58:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 18/48] tcg/optimize: Split out fold_brcond
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-19-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211021210539.825582-19-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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
> Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 33 +++++++++++++++++++--------------
>  1 file changed, 19 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

