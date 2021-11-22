Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A14458BBE
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 10:45:40 +0100 (CET)
Received: from localhost ([::1]:47802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp5tL-0003RZ-BU
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 04:45:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mp5rd-0002b2-HU
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 04:43:53 -0500
Received: from [2a00:1450:4864:20::330] (port=46639
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mp5rb-0007t5-Px
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 04:43:52 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 b184-20020a1c1bc1000000b0033140bf8dd5so13008253wmb.5
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 01:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BCAz8rMFGmSy4j0/Vt1IMc0fHBSXO9yNkRpaAc0MvFs=;
 b=hd+rOlY7asFPI1+jWwYem1T9si1+m/TQZ1Ci8n9avlcxfR6Pt0VR3lSPpFczSzwWKc
 iCdAqW3yndtI0jRgT9yMolIy3YgtiTov5pCyTevfZv28KeFTxkq5iBqAXoZegcBd1IGh
 mO9RjRUVv2OAPNs4mkjjNbmaGmM7FyizC7npuxiOUo2UW/QL2gFoYiTYD60oLEqAW5Co
 cnzUUTIEAOJ8u3d5l/AAoiYSZmN0k4/tjPg8AmyOenNWBxy0+2VjV5bop1Jb7xlXDj8d
 AYzdy1J38ngp4HU4k9EUBjhlkJ14+NIKy9LWRmrMBGelV9NsCAhh2yURxh1V82IPNyfk
 +xig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BCAz8rMFGmSy4j0/Vt1IMc0fHBSXO9yNkRpaAc0MvFs=;
 b=zzFxfauyFSF5FnBM2KqjUtTw63g5P1wDG5Js/WcxLgOwtj5jdV5YiVzrgQ6jcUiZyu
 QRzwpRXinMXVB9SP39ooD2I1dc5Qw9j/9jFG9in00YJBmRiPmX7WrbRnCUazXDIj/NT1
 QhoE+qnwyeaHFvV1dDnjqefv+eTJukmT8ZmWS1QozmuB3cPx9wSR3FJfR3VmtC+psc59
 xKhzAEzLtghKLuT2PvydHQ7TPkz1/xKL+CKahyRpIS1l+rpzGuMT11Cf3OAN6placbzt
 Lczs+/HzXu59nElG2QXkor94HprWsyQeJJTOYSl5fPTBN+e/J94tYgaPNwnIgNBEpDzb
 ORSQ==
X-Gm-Message-State: AOAM53351IVroO7Pzgps6Rv9v3ULJ5XM8b+VARPRz+c8PZ9/OK200yIX
 9abWwxlMYYK2Q4oL8tdbpvqbRw==
X-Google-Smtp-Source: ABdhPJyFwZxqjdsd48S22rWen4pvc7aMEcJFDrhSUpYGb14MvUu9dI0dvWsV9OMlx3C12pVUFeeVbQ==
X-Received: by 2002:a1c:a711:: with SMTP id q17mr27791652wme.158.1637574230303; 
 Mon, 22 Nov 2021 01:43:50 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id o12sm11372571wrc.85.2021.11.22.01.43.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 01:43:49 -0800 (PST)
Subject: Re: [PATCH 35/35] test/tcg/ppc64le: Add float reference files
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
References: <20211119160502.17432-1-richard.henderson@linaro.org>
 <20211119160502.17432-36-richard.henderson@linaro.org>
 <41eda524-8e61-88e6-71ff-757fae97bc9b@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0e4d4227-4a67-7a6e-4f45-6416faebbc93@linaro.org>
Date: Mon, 22 Nov 2021 10:43:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <41eda524-8e61-88e6-71ff-757fae97bc9b@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 11/21/21 6:47 PM, Cédric Le Goater wrote:
> I am getting an error with this test. See below.
...
>   ### Rounding to nearest
>   from single: f32(-nan:0xffa00000)
> -  to double: f64(-nan:0x00fff4000000000000) (INVALID)
> +  to double: f64(-nan:0x00fff4000000000000) (OK)

Well that's disconcerting.

I can replicate this failure on an x86_64 host, but do not see the same error on a power9 
ppc64le host.


r~

