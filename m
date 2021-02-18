Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A05431F2FD
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 00:23:31 +0100 (CET)
Received: from localhost ([::1]:38522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCsdu-0000lp-C6
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 18:23:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCsbY-0007dR-Gc
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 18:21:04 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:34018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCsbX-0007yP-01
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 18:21:04 -0500
Received: by mail-wm1-x329.google.com with SMTP id o10so3642936wmc.1
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 15:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Cv20XUBME5BY//Ng5PpYpjgu8PKIaOpMQq/oajYrxxY=;
 b=GHD6iKi+YqSSFe8dh/G4pbEVJQpdrtp7ZxdqJjXRuCXh/8kbp4fiIdHntiRihUOo70
 tHqjGJJc0L958FPqFBpLuHMhrwxRUoy/wwguRGS+QpQD3RgPveIqdOHgy3Z+hayj6m7I
 TGKGfwSNVfClb/fsfd1cnZqL5IPMxf1jJTiMfwwVGO48e4Vn/L/IJ4Pdel0fkMOjCxfl
 i82UkWTTLcoBolFJAp5H7fC+3kwO7P9pjzwV353zGfFgWwEkHLgRPcH6VJ3KkM1/V0ny
 Cz7Cs8OcwNu4vHNKgsOL5Kl3J2v+RgCvIVL9MRZxjpld6AY3EQGxIwcHdtE7BqW0LMS5
 vrOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Cv20XUBME5BY//Ng5PpYpjgu8PKIaOpMQq/oajYrxxY=;
 b=bXWcPcXjqmMkp2lJ/EP4qijoA8F97G/dQ5pv88smiEdKb2Ff/NIet6w+6GbvW0BD0T
 n4MINwhG2/+NdkP7hMMxFeE1lo3Bv3p/EUDaGYs/gkaRfWeCEF6ItSmNEkN+bdpkoIcG
 J848+WZ4KUtRpr0mWKnN0vf7ZEdvfiW0c4+isH2KMF9qwVaoRMkDFP9ZMLpvuMiKXC2x
 g7SCTuPfXDh/TUuvO1ymQICnG72Y/a+wfiAqUR5xoThcEzeatx6/MG0DmqYoQfRrGKYE
 ubryju/Y5pgwkA08LQFP47hP9EjIKxViRruLs629OJmKncL4Sc3U8LKWuAkqgsTSAjO/
 pPcQ==
X-Gm-Message-State: AOAM530FIaXX5FcgoJoiQILPQbGoSQgQHUZovhJkh5+AT2oJfoCl5VUo
 WPyJ5XWM9lClX2HL18j8YGo=
X-Google-Smtp-Source: ABdhPJyoa9R309BfFL57MgeJqQ4l9psJKWXcFPMvK3h3pTRCjClhEEMfm+Xq/8CBB9q3962Cgy548w==
X-Received: by 2002:a1c:32c4:: with SMTP id y187mr5566615wmy.120.1613690460894; 
 Thu, 18 Feb 2021 15:21:00 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v12sm11848988wrv.69.2021.02.18.15.21.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Feb 2021 15:21:00 -0800 (PST)
Subject: Re: [PATCH v4 16/71] tcg/tci: Merge mov, not and neg operations
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
 <20210217202036.1724901-17-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <cd820669-f692-0a3b-ae0a-0f1cb18a4449@amsat.org>
Date: Fri, 19 Feb 2021 00:20:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210217202036.1724901-17-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/17/21 9:19 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci.c | 29 +++++------------------------
>  1 file changed, 5 insertions(+), 24 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

