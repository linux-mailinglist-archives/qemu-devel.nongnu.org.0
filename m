Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAAC4ECC52
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 20:33:14 +0200 (CEST)
Received: from localhost ([::1]:34010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZd85-0005pv-VO
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 14:33:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZcqZ-0004c1-Ft
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 14:15:10 -0400
Received: from [2001:4860:4864:20::2d] (port=33974
 helo=mail-oa1-x2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZcqX-0007E8-4z
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 14:15:06 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-df26ea5bfbso5280525fac.1
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 11:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=M9XnbDKhxBbAPalBxdtZ6tDJ4U6Nsj7d39ey+7cljqI=;
 b=PwGpMclm65aoP2SONFelpSOiL6zQMhwdUG7C3/lJysvh1so4JyZpH7HlzyTv28iq/5
 H/QGY4Q2dmc8MXftepthTLMMYf383qbjoHbyNIgkDY+YpWwzeXLkO4oEJW5JejAjsI68
 udqkxnUFrqCYuyhSI49E9aiNKwz12uUE6LQSlG9ax3pulLK0f8cHUrcU9iIehi6FNePs
 j7KJxofZLkgDC85LMmVC1ZEpleWO1+Ixxi7IHj3CA4zXuxBtRtpfS5MAcZPI4lkmdt6T
 XxFSPus336Ur/tciIt6qcrsLQKkgiwtLMYWc4in9Eam1nfsuLIaUErhgyBtpG/utIzCM
 BLtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=M9XnbDKhxBbAPalBxdtZ6tDJ4U6Nsj7d39ey+7cljqI=;
 b=hknIWpSzqbHV4Z6qnOVq5NLfbwb3jWcGXWk24o/fLOiA1hy1iVcKCcbKhfHbKnWcZ1
 XNBJRoQaPvxrXh5Bt0na8l4Aet7Z5En2JtDBHMlOg4bH5AJvb65d86jf5Ikl/hrrO/uC
 7JCbjgu1h3Bc/WHv9eKtNgpABzfIZM0p61hEZoiT0zrpd6tO/fyatgPMuZRphDBtPdS4
 4F7KLh5FJCNsIJszyAoCxsIEJPrsiF8EfwsyNRI1qMuaXtJvz+/o4bJO+gc+quBmN4zI
 0QyB+UH4mN/0Unq6Y2HDGWfTg1ZnUpR4gD0sD5Wh7vhSiUg23nOoS1sPdwEEXeviXIBV
 IGHw==
X-Gm-Message-State: AOAM5311KEi5tNpu+peYlMkGxuGQBZg8S/KKZqw1hZKQc48o+1k0lhZU
 eaWwcztCBSlM+llFOjlyNcYEsA==
X-Google-Smtp-Source: ABdhPJwVuazTBduTEBwOGFv+Bo+sfRN/I0GO3OrBx701xuplLNPES7m0mrvIHp62b+nLvrnQA8gyXg==
X-Received: by 2002:a05:6870:d191:b0:da:371a:fbea with SMTP id
 a17-20020a056870d19100b000da371afbeamr468951oac.179.1648664101931; 
 Wed, 30 Mar 2022 11:15:01 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 h8-20020a056830400800b005cdceb42261sm7988742ots.66.2022.03.30.11.14.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 11:15:01 -0700 (PDT)
Message-ID: <6044f9af-5c21-a1fe-a7b8-c66bc6918133@linaro.org>
Date: Wed, 30 Mar 2022 12:14:58 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 6/8] softfloat: add float128_to_int128
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220330175932.6995-1-matheus.ferst@eldorado.org.br>
 <20220330175932.6995-7-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220330175932.6995-7-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::2d
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, danielhb413@gmail.com,
 groug@kaod.org, clg@kaod.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/30/22 11:59, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Implements float128_to_int128 based on parts_float_to_int logic.
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   fpu/softfloat.c         | 64 +++++++++++++++++++++++++++++++++++++++++
>   include/fpu/softfloat.h |  2 ++
>   include/qemu/int128.h   |  2 ++
>   3 files changed, 68 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

