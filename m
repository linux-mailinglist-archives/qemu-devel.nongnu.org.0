Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C1B3AD92C
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 11:53:18 +0200 (CEST)
Received: from localhost ([::1]:53752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luXfB-00088p-Tu
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 05:53:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1luXZH-0006Lb-Eq
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 05:47:11 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:44848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1luXZF-0002wR-Rv
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 05:47:11 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 h21-20020a1ccc150000b02901d4d33c5ca0so5148557wmb.3
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 02:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oGnbQ5hoPww93NmO21xAvav2jKFUgnEyK92VKV5Fvuw=;
 b=bYDw2rsszg4Ui6Cx+fyfpYzdFTx0N4m4n9MBF/dcuL7Ikc8i1rjDt3fuXYS61eRLyY
 6iQP20BasmFnay4PSoHQ8jjdxLEECkOIXsu//eHGz5uHAnBiPEDT98UsDSAZAPxIqvRP
 NqtT8FnbSo2Y9U47wE3MG9R3WdkE3wig3wCQAOZs8RaehDvaubVdVPgk5rphqLkl3iuo
 LpQXCXM8/VugCAXQ6Q10TY5J6hD6+W94yPB4i5kvo1ymh2pRtlYc02fF/p0AVu4RY5ha
 aZsYKDhmoawrCvkTah4NecazyqMj3SkmbhKVkiuQVf75HhZxwwRIhjBiab7xbxLvcNTM
 vPRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oGnbQ5hoPww93NmO21xAvav2jKFUgnEyK92VKV5Fvuw=;
 b=Jo4nkQ7s4BTmsClLpC6FsCg40wsl62MXtN+P9CrIFjXUoaBNxO5CSQ5cdrz7jJHExi
 UwKlYrJAkx2wd170fCI8jUE0QXfOni+mxcBxnMYWtQwpUOEYkNuZEqyKP22B/3WSIywq
 TN43iEgvef0cOpfiKKtAK4NjDDBLq8rwdMs1GUpGdYguob7u66PtpOcr1ar+0UGDwkjY
 ESuzADuGutlYDfdu49A2SPuFhN7JFS6H6RKuR1KG9WyOQffY0klGwRqh/8uoymbW5D3L
 DW6qO+FfUiTnEk90DZdDWnD+NyAZejm2dOBOF7hj8BtsYRUdblqFiy+XWEzLpTJjmW18
 Zl4Q==
X-Gm-Message-State: AOAM531ceJBJbMr/em+/Xxr05sefeyYwobXAzVFqGxcxshO+TQpwYOVn
 PYlu/m9AF74mHGX68Zfmg4k=
X-Google-Smtp-Source: ABdhPJw99bg6tjbGajDkBJOr/8kbuc0GJnbgOwzipb4eBL5pqZIShy0+gXvbDuze6zl5cDdwGi74Jg==
X-Received: by 2002:a1c:7907:: with SMTP id l7mr15804817wme.147.1624096028244; 
 Sat, 19 Jun 2021 02:47:08 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id k42sm13908546wms.0.2021.06.19.02.47.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Jun 2021 02:47:07 -0700 (PDT)
Subject: Re: [PATCH 01/12] linux-user: Fix style problems in linuxload.c
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210619034329.532318-1-richard.henderson@linaro.org>
 <20210619034329.532318-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9bb41549-5001-9249-6c6a-12c4a6228042@amsat.org>
Date: Sat, 19 Jun 2021 11:47:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210619034329.532318-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.202,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/19/21 5:43 AM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/linuxload.c | 42 ++++++++++++++++++++----------------------
>  1 file changed, 20 insertions(+), 22 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

