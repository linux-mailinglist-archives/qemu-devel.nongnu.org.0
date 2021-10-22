Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2BA4378DD
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 16:16:12 +0200 (CEST)
Received: from localhost ([::1]:49206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdvL9-0001Zy-Fd
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 10:16:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mduzb-0002Pt-P9
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:54:03 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:43564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mduzZ-00064p-Kz
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:53:55 -0400
Received: by mail-wr1-x436.google.com with SMTP id r7so2390392wrc.10
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 06:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kOti6YM7lMMUmmuS0dcW6PImBR4j2dlAHzSDry/ZX9M=;
 b=UkhOnoUfdGeMATPlid2nm2R+lZHh0wk7LIwA0ZfPijG+wjYk9wiXWK3LY4hyp85Uol
 ARiPYGnNYKPSFGD+GbJNtx9zxF0QzDbbbpfWTiPIp0viL4lW35bkyhMtXCW6lHCUr7gA
 2zel8pKpTl8bTdptYikCms0rNKEQ+GIQzbn000QPLtdtj2ghxTA/bm7zdqYIEt4Z1RY3
 1o7b8Jjl2ibvdAZgzZscdE8aKnbv9+icziljYfQd5oTkQEft5kbv1+lvK2e09u0btPg7
 IMsTo9iS+CVjtY+IBpCiCi2IBOmzikVwBrzOjw0YW7ZLrFTD92VF4Ul+O19MYR4WqytG
 u3/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kOti6YM7lMMUmmuS0dcW6PImBR4j2dlAHzSDry/ZX9M=;
 b=ZIEGKfE3XLklYAzGWmi/MqKjgany9GucD8ZwJKvHT9OJ0dmPoKEZxBVqKvGX2F1+7B
 tPBQfxxAMsaD8c8W1pKONJLXWrTGPkVUbVLYBP/sokCt4lwcBr/7XE+F2VOcp+xmtB/3
 GV4jdYHRGo5pM3q/fJZh2K6WHL9GrXybapR/XTEdPqJvPr8p368tZ7UYHQ10gEtc3HQ6
 wboEFiZ8t+HHy8ut5FgEVrdHh875nHbH+xXfN4tG6c+mQuVObRogG7J+yhjGqH3TlWT+
 s5ADuwNOEaS3m/FjWyJjLdRtt/PIx2eMwj5qPY4ge+O1vaoBF32LfqMwBYed2cSLeJvJ
 Y0ng==
X-Gm-Message-State: AOAM531c1ZKGLRRA3xoVRA7S+eP20cVFDYdyp00GTeAwzzIe0m5Bn6+A
 xIpgEGwxYwHF3qXgJUa3KVI=
X-Google-Smtp-Source: ABdhPJxNF/n4HvJFEa9sdQG8NgOSXh+YLJiswiTPS+4pm+2e22i0mAxSecJi7F88zYaoRhtNNYr5aQ==
X-Received: by 2002:adf:f98d:: with SMTP id f13mr11012912wrr.301.1634910832329; 
 Fri, 22 Oct 2021 06:53:52 -0700 (PDT)
Received: from [192.168.50.34] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id p188sm4094636wmp.30.2021.10.22.06.53.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 06:53:51 -0700 (PDT)
Message-ID: <6225be68-8e97-cfbc-f34b-3599565174d9@amsat.org>
Date: Fri, 22 Oct 2021 15:53:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 10/48] tcg/optimize: Change fail return for
 do_constant_folding_cond*
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-11-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211021210539.825582-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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
> Return -1 instead of 2 for failure.
> This us to use comparisons against 0 for all cases.

Typo "This is to use ..."?

> 
> Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 145 +++++++++++++++++++++++++------------------------
>  1 file changed, 74 insertions(+), 71 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

