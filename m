Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E52D8458F44
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 14:19:21 +0100 (CET)
Received: from localhost ([::1]:51482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp9E9-0001CO-23
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 08:19:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mp9A4-0007Yo-8N
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 08:15:08 -0500
Received: from [2a00:1450:4864:20::42d] (port=36454
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mp99v-0005eh-Jb
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 08:15:07 -0500
Received: by mail-wr1-x42d.google.com with SMTP id s13so32692217wrb.3
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 05:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=L9x0/c9M2Sm45a9NNENS8kLjGHy8Pe4jmi4Vih4arng=;
 b=r3Gt8Tv8c+Y80wd6o67FYTxKRqFdwXiw25/qHLmzM9G+gTu1oCCmGqa9mP/+jdGpca
 EeDZmQRMPiPKI0LqooLradVBPqP4Cy1hsbFPYHjviF3BIVcwGmcMdgTkAszU6JAoewQa
 yYGdCXqBC4H2CUgmKQsHM2D0IN64Nza2NQ/GitpbzSyVTW3e0QV3BS5J3OqFckvuGgIz
 KQt7bvR+7wGMQtdDz/A+UPVwuCMaFUsmlepcYw4TAZIla7VDrqDPj2dTZ96D7xCFnwe7
 s0/mXojtM+hovoExK1ChADIx9ZtYx7IL06jotX6ut44KwUqbKNCxymSzF4BcuO1AkHDt
 m9RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L9x0/c9M2Sm45a9NNENS8kLjGHy8Pe4jmi4Vih4arng=;
 b=LTWyVO1gRLVSyrm7cCwkx98qx+BADU45xJQ0J5FBbViDrZr3GGIGVHEvfGaWmyGXIm
 Vw19i+avI0IJP7Mn/kJR6IKZT/7+QCrmg07751J3Gw9e56kokCLTiBZb/GszBjWlLVgW
 z0Sw5envGX3JOtrM2V0eqRrO9d+pnkRY46STXduKyQxOVfZ0Fu6e3mOi1QRaUveUsroh
 XHdhGIZJi2DkGtzoL2zVvAY3cjeb/CUvqwfclp877/8N+yrGTNNav3VpEgfQqRQEVE0d
 tMh2KuUn57rWMW/GR5lkigX7FHwlVH+BvjUOIGFMNTGgxuU/WbSMow2vfjqzeuZY9ww5
 bcpQ==
X-Gm-Message-State: AOAM531FDbeVv3IR/tecVb5kmwpobT2sLVcSnZiXX6ipBt/UkDzuQL1T
 dvVizvX618Pbpz3DKRzgj5kMUQ==
X-Google-Smtp-Source: ABdhPJxfDnlI0M/ma+LfjpEBXPO0mILc8El8lW7IMhuM2NJv4EAcHFqZm6UZiyxbz2ZynNvM131MfQ==
X-Received: by 2002:adf:f5ce:: with SMTP id k14mr36778591wrp.100.1637586898158; 
 Mon, 22 Nov 2021 05:14:58 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id c16sm8684917wrx.96.2021.11.22.05.14.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 05:14:57 -0800 (PST)
Subject: Re: [PATCH 35/35] test/tcg/ppc64le: Add float reference files
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
References: <20211119160502.17432-1-richard.henderson@linaro.org>
 <20211119160502.17432-36-richard.henderson@linaro.org>
 <41eda524-8e61-88e6-71ff-757fae97bc9b@kaod.org>
 <0e4d4227-4a67-7a6e-4f45-6416faebbc93@linaro.org>
 <45a736de-efe4-1638-65c7-28764c93248a@linaro.org>
 <673145cf-f64c-2520-3ed5-dae2a16704e7@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <333b8968-bdfd-bd79-51d7-edaba09e5e92@linaro.org>
Date: Mon, 22 Nov 2021 14:14:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <673145cf-f64c-2520-3ed5-dae2a16704e7@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/22/21 2:04 PM, Cédric Le Goater wrote:
>> But this alone of course causes other "failures", because we've got some incorrect 
>> reference files.
> 
> Looks fine. Will you send this patch independently ?

Yes.

> The patchset doesn't seem to break anything.

You may not have docker cross-compilers enabled.
The hexagon reference files have incorrect contents.
I'll pursue an update with Taylor.


r~

