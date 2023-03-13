Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FDB6B81E8
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 20:55:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pboFa-00083S-RV; Mon, 13 Mar 2023 15:54:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pboFY-00081P-3f
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 15:54:28 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pboFW-0003NG-Ad
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 15:54:27 -0400
Received: by mail-oi1-x231.google.com with SMTP id y184so10279587oiy.8
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 12:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678737265;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VIpFUh9hDZjh5tguJ/2ESixnRx3Op8WfAVRCoCHNAyg=;
 b=Udeks7R9nP5GaOcOwTIihMw2rBIRYRKVsJX3zOV39mzyutdDSdX6msorONwSKP6sbc
 ZtAGi62JarVTfzVJPyUAOELA/wXMOL5eEDdPxUm22GGNkSwRHzxCYGSKuYYASEj6mnFm
 vTsoHFlVHha+c9kufTza8ecbuJUrMHtdvTu3mTSqBfmWcN5znfz8N3mdBrfMe2JsS48I
 q0GSpzn0pInDOAzToyGtcy3bzUYr5El5FRLKfBAAk6CXeKeVoOS2Q6R+5vzakDLpTDIQ
 GncxyaIcmnQXXmF7uorunXz8fB1mvD05IWmpFDz3YFq9R8YD03AB4RXIyWXxGQabrLa7
 heTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678737265;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VIpFUh9hDZjh5tguJ/2ESixnRx3Op8WfAVRCoCHNAyg=;
 b=Woes5aBa0SpJkxrhCFLezA14WVw/Xy9+AXEh2SaueVdyvqraFA+j4nJm0q7iDtAoAx
 JviSdCbommUsO8fWDQsZAlOCDI7oOD93zdS5eQrPXhGiIU7XoS7xEz3z1O/1PoK+Sg8o
 PigT3HKSV/1XwiRb1gJ4Ua82UwFXRNVqK8gIEovDPlqjKQmC/3AoByDWHx/v+P4+iT4Z
 MkLnPsYwzU9veOSwRmzCY1nqJic+fszmNigBcKbYxrDx6fdNU4iJ++XDS/8sJVbZWFXd
 XfxXXC9oBUboUWjea0hKxehmKOq/ovWwwkjpJL4t7EWrJBqJTjNbHDCjmduQ8FTbf9KJ
 Lwnw==
X-Gm-Message-State: AO0yUKXMiqQVdC5LuNYKlt3eCgaOAHQWpDru5RX9e9EfA5umgbnbbswl
 gyxFEzEY5OF260m2q11QODY4OQ==
X-Google-Smtp-Source: AK7set+0NRj9VZuA64rXTt+mw1/Iwf9BemrawoCFnqHDzR8T2u2pbfXI/9DIuEA/hy+SW7IO6Kq7wA==
X-Received: by 2002:a05:6808:1153:b0:37f:b48d:cd80 with SMTP id
 u19-20020a056808115300b0037fb48dcd80mr6432264oiu.4.1678737264787; 
 Mon, 13 Mar 2023 12:54:24 -0700 (PDT)
Received: from [172.20.4.181] ([50.232.40.61])
 by smtp.gmail.com with ESMTPSA id
 i17-20020a9d6251000000b0069457b86060sm359435otk.47.2023.03.13.12.54.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 12:54:24 -0700 (PDT)
Message-ID: <03e24997-82e6-2554-8962-bbc02c8d86be@linaro.org>
Date: Mon, 13 Mar 2023 12:54:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 01/12] target/s390x: Handle branching to odd addresses
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Harold Grovesteen <h.grovsteen@tx.rr.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>
References: <20230313153844.9231-1-iii@linux.ibm.com>
 <20230313153844.9231-2-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230313153844.9231-2-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x231.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/13/23 08:38, Ilya Leoshkevich wrote:
> Let branching happen and try to generate a new translation block with
> an odd address. Generate a specification exception in
> cpu_get_tb_cpu_state().
> 
> Reported-by: Harold Grovesteen<h.grovsteen@tx.rr.com>
> Reported-by: Nina Schoetterl-Glausch<nsg@linux.ibm.com>
> Signed-off-by: Ilya Leoshkevich<iii@linux.ibm.com>
> ---
>   target/s390x/cpu.h | 9 +++++++++
>   1 file changed, 9 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

