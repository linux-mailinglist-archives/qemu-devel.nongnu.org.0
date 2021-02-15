Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD4A31B3DE
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 02:13:20 +0100 (CET)
Received: from localhost ([::1]:49356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBSRz-0000ri-Fk
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 20:13:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBSQI-0008Pf-MM
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 20:11:34 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:35145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBSQH-0003d0-3f
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 20:11:34 -0500
Received: by mail-pg1-x535.google.com with SMTP id t25so3347059pga.2
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 17:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xbtGwtUL1TOtLGrzZyKJllCvVqmp5b8OV5RN0kef+Ac=;
 b=qI19R0Wi62JgD2/qHWcxlQ/DqTFUmnirMsSmxAKNxengrNTzs42WpU6sjr4f/Y1fMI
 1m8ndhZlw0kgyqZErdyoU/4WqSxbya4w7CSMNX/q5Xg6JnJeT4K6AvN/OKVB3KkhcuyT
 6tdnAye+rLF85f+g0KNdQHUMg+ZFUj9xE3j/tVFCnjn2pc+haXImIDxLrb4Zmeja931C
 gQHKBO/xrnawKA3/P0L66+XGHssJX9kPgLvVe5EsBGLUkf8cfZE3iMq0k6H6PxTpg7QC
 qmaxA2tONALeeaPLCd/uEqhgnUBGTGcSHjspWVncviVyq6dVBUryF+TFwMnXq9BPLf+0
 J/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xbtGwtUL1TOtLGrzZyKJllCvVqmp5b8OV5RN0kef+Ac=;
 b=IU5x4eISp3ZRKucpCxoNt5GL7y63iCmQfSV2cZEXa/3A3zsp8OIcbPXOAtFaKuFCmQ
 1FRmBL6HU6mjpZd4IkQTDpCfs31E+Vj0rR+oQugGcFL+Hr+CEC3Wxa8StlnPaYgbR9wK
 Da0iggMHkfU53N4dtI8ZY+xWYKNVYCgooM/mT94wNRbGeeL+5azBuvac+9LwV3WaYN4o
 2MlxbgtvO1wlEMiqMvggaEKaqeZjxP7tDAWyKkQfp8OL0kc/sFco4Wd01R+TB8F8lhkE
 GNYEdLRmgKZSBb/WbhIHyRg1FF3O/voOSdu/6GIWjpit+B9l9WdwRyCzoUGoO/4XY83+
 vsCQ==
X-Gm-Message-State: AOAM532pLCahA/SdS7ovUDfEiapG22dvEeY9VZLaz1LC9xXqfzITtSma
 oFZWr+IeydG88t4rEsMwDgKW6yynEd7TFw==
X-Google-Smtp-Source: ABdhPJzpvAHmzah0JDgWA/G9a33Yapq+rjYCgZu3DX60mZSOrnrTL8druRvw/dIf6xBD9G9DyZxWUQ==
X-Received: by 2002:a63:4082:: with SMTP id
 n124mr13106494pga.340.1613351491686; 
 Sun, 14 Feb 2021 17:11:31 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 y16sm15678229pgg.20.2021.02.14.17.11.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Feb 2021 17:11:31 -0800 (PST)
Subject: Re: [PATCH v8 34/35] Hexagon build infrastructure
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-35-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0202f0c5-f415-c039-c8c4-2d6e74d78cbf@linaro.org>
Date: Sun, 14 Feb 2021 17:11:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1612763186-18161-35-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Cc: ale@rev.ng, alex.bennee@linaro.org, philmd@redhat.com, laurent@vivier.eu,
 bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/7/21 9:46 PM, Taylor Simpson wrote:
> Add file to default-configs
> Add hexagon to meson.build
> Add hexagon to target/meson.build
> Add target/hexagon/meson.build
> Change scripts/qemu-binfmt-conf.sh
> 
> We can build a hexagon-linux-user target and run programs on the Hexagon
> scalar core.  With hexagon-linux-clang installed, "make check-tcg" will
> pass.
> 
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

