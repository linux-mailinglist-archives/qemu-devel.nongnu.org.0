Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D334D0985
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 22:35:24 +0100 (CET)
Received: from localhost ([::1]:55614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRL0l-0003PV-R3
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 16:35:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRKzg-00023e-6q
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 16:34:16 -0500
Received: from [2607:f8b0:4864:20::431] (port=35804
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRKze-0002wF-PQ
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 16:34:15 -0500
Received: by mail-pf1-x431.google.com with SMTP id a5so3944777pfv.2
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 13:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nKmyVg/iNk4ZU/nlCMSj3Nbh17pATEHv1sYrg/Cw0iQ=;
 b=hs3rnSV+jKanlR1/0H97rLHXQHkbp5JwEMfumo3ye91CjFRFAjBbfEUpJxwCy2EQzk
 rAQDS0w2KDnpi2v2INy4XOWJv7eK6sws2T+7whl7hEwyqIEZjqEQ2wLLpa3qn2Bf20b1
 HOTxuTWUEJqYaLNUriQ3nog1cOgsqOJb/xr3x8D3GKR1EOJ9OYDjXOcNX4rGgajGexNf
 KWOHwWiXIovCpfzowQpZtlx/VL+q1ij2IfU4IrRkZaf2JEMvi/O9GakvIzHg9eFjG0wn
 wkmzr2AJMWptNVCfZ8TBQaw7gO0QSaAWbKiWygBKRk2EdZquq7f/D2a8uKKWQoZVC8bv
 jbDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nKmyVg/iNk4ZU/nlCMSj3Nbh17pATEHv1sYrg/Cw0iQ=;
 b=ufWftm5LfA4Y50wqeOpqfG9bbgwRffmv2DIlf7y19UobsYnmqAztYEiVOWZBDQvEms
 CRKsa5Ec+xOFJIFl9W1bdLjs2Z5Rs4fsvLnsYnkrNuBwgbqZgkCMYE9Cnd87gyy+Te8h
 /RcFgRc0HaysORJnXlocxxFBWDfXhGThdcVXdLM9JCB+0oCrHady5TizSAahtUuwtwxo
 Kr6XZpqQpL9PPzRSl7BMHwQfNCJHbc0Zhm/K4nQV0n/geyoF0/S0JXIua3x8AYF45mqE
 qAOGxFTX4oAQ/UxD83H0kbxOx371g+ERLSF8zOhkrNPc+IgfRA+diUy1g32G40zyyvcU
 2eLQ==
X-Gm-Message-State: AOAM532XKVyqiV+ByTpFoKfO7MrxyDV2VVWiTvR/na08mgUq1TQ6FrFH
 kfkhN86Te2hp+fnK+1a3o/S/pg==
X-Google-Smtp-Source: ABdhPJxicOHahddW4jS0R44vuqAPwz7TkFnBEsm1PkFNNdsE3C00k2Jm+31s9BqIg++NAZhrzz4d5A==
X-Received: by 2002:a05:6a00:1a04:b0:4e1:786c:cce3 with SMTP id
 g4-20020a056a001a0400b004e1786ccce3mr15095167pfv.81.1646688853436; 
 Mon, 07 Mar 2022 13:34:13 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 132-20020a62168a000000b004f40e8b3133sm18197418pfw.188.2022.03.07.13.34.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 13:34:13 -0800 (PST)
Message-ID: <2cbad6a2-1c95-88c8-0e0b-e97bffab58d4@linaro.org>
Date: Mon, 7 Mar 2022 11:34:09 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 6/7] target/s390x: add S390_FEAT_VECTOR_ENH2 to cpu max
Content-Language: en-US
To: David Miller <dmiller423@gmail.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20220307020327.3003-1-dmiller423@gmail.com>
 <20220307020327.3003-7-dmiller423@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220307020327.3003-7-dmiller423@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com, farman@linux.ibm.com,
 pasic@linux.ibm.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/6/22 16:03, David Miller wrote:
> Signed-off-by: David Miller<dmiller423@gmail.com>
> ---
>   target/s390x/gen-features.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

