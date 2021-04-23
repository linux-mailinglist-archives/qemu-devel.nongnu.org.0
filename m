Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4E5369D28
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 01:09:40 +0200 (CEST)
Received: from localhost ([::1]:33854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la4vb-0006kv-Bn
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 19:09:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1la4qm-0001CH-UP
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:04:41 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:44907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1la4qi-0004tE-UK
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:04:40 -0400
Received: by mail-pl1-x633.google.com with SMTP id y1so10293671plg.11
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 16:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XNXkOINcXen37tnkvyIgtpHMmC9ReT3bukLj/NOpMGY=;
 b=pIXPMb4dugDP+x4w5Civ+4lo5fbwM9bBSWEtTlEB8OhPD2KvAgdgCQPG/umOBFyU1X
 aMNlzxhMwgNx/qcVb/BRM36/E6pQARtrXf6GPWmXc2uU1vYNajHGLr61Up51a11PTJP5
 3zxRB9uLno56+L/R+i69HjDXTiX+qIxfwOLosWGx5NzJ7BbpNDrmRVH7vGu5ijMB9sjr
 KCEDab5zcmvFu0OB+WQOZTfGQy7ALFoDgRY/dNAq6cm2/BVouUXckE2MlXnq9a6n0UV0
 iD48p6Qeu6FfFJpnabmogra9wsn2CEx6IsFwUEmHwiEdsYYleaKwpbTEMW1TOo6fJ94a
 O+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XNXkOINcXen37tnkvyIgtpHMmC9ReT3bukLj/NOpMGY=;
 b=aUunVTuEGxKD0KB3oN7yu5hUyDQLiITzkg7EDCFG6LcyWYwn+SKrbACOHvvhitDlaX
 X1XxhcH8i4LM3nb8Ml8LbjQ7j1ulMe4eG0pTkz/gZzZf9spARICUP6AdLO/sABoMIJAP
 rpR6NsPTM5dhSU7FaABkBQGYVHqQ4RYFJPhK4Lcc8lT8SLIICO4bbC8NFkKIlHmQ7hKv
 IA2oUOUYsNqh7NPeJnhLv4JWJweyfTMLSC62EZEXkUnzgjAyogkKISFXFt6Bscf3QUg5
 dDXDlB6oE1YVqqh8ofRIvZbX14RP4kBb9KKrlFM86x3VO6nrJS7PNxur1hCt+GjQwAY5
 FWYw==
X-Gm-Message-State: AOAM532hRnmpvqj/E3YfyAmNvPONsdjnf3NahozbzIko3OTJ2tSRaSBs
 4zxRuAMUkzyXpzvHGDbirK7s+cuXOX7ikw==
X-Google-Smtp-Source: ABdhPJx7jQGcDNhBPR/QVb84fYdOQsZuXXqlSeHebyQAyFzJcnwqd2GaI9jKo7s+GzKxGu90hn6oIA==
X-Received: by 2002:a17:90a:950c:: with SMTP id
 t12mr8151392pjo.135.1619219075760; 
 Fri, 23 Apr 2021 16:04:35 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id u4sm5138861pfk.56.2021.04.23.16.04.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 16:04:35 -0700 (PDT)
Subject: Re: [PULL 09/24] bsd-user: style tweak: use C not C++ comments
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210423203935.78225-1-imp@bsdimp.com>
 <20210423203935.78225-9-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <36e8e605-77e3-e461-95e9-27ba109ddbc3@linaro.org>
Date: Fri, 23 Apr 2021 16:04:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210423203935.78225-9-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Cc: kevans@freebsd.org, arichardson@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/23/21 1:39 PM, imp@bsdimp.com wrote:
> From: Warner Losh<imp@bsdimp.com>
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/main.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


