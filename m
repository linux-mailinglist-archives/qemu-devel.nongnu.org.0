Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 953314714D9
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Dec 2021 18:08:45 +0100 (CET)
Received: from localhost ([::1]:48984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mw5rY-0001eY-N9
	for lists+qemu-devel@lfdr.de; Sat, 11 Dec 2021 12:08:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mw5oB-0007ER-2K
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 12:05:15 -0500
Received: from [2607:f8b0:4864:20::1031] (port=39758
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mw5o7-0004l3-Jf
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 12:05:13 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 y14-20020a17090a2b4e00b001a5824f4918so11618004pjc.4
 for <qemu-devel@nongnu.org>; Sat, 11 Dec 2021 09:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2cK4eO3PkO75IrPjq0tOFF/OpEhfQlLViPMeww+giDc=;
 b=BCmwi8o1GQhnoqoePqjDYE0fZTQ05OKlCcHMWMVpst3vEsN32ypi1zxc95nzTbGJXU
 8fjepwk4bOp6prByBAZz1FvTnArBB/iG+l9KUhHQCYJYdY1swSQe++0hQefQaP7jCbNx
 jE9ULAeo43wVw4cz9CXbITaGCKKkOeGg1l1sSzclCIJUOiseQEZvVKGFjK1y85mF8ej2
 3m0ohdyEeUnA+yAsRDKz0H1qzuVZ0hFGBR4V4AaDJEH2pQcteDnXbZwEW6r/QllHN10Z
 94R9HM83lswORPQEf2WdYNu7ARpYfrAH5/su3MfE8yjkGQRrqeA8pQNZx6LQEuHyNs4E
 NvfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2cK4eO3PkO75IrPjq0tOFF/OpEhfQlLViPMeww+giDc=;
 b=M5c97YUZSim5ixdPVVD4eg++u3MJ1j6GUm4+esWro8Zz0hy1NK4+lERsWE2236nwg4
 czgIGFhrqufMZ1pymmKhc0rKnYx6MQwNWqVqeTs6Ywyi8i2Z186IKmcXUH+SgZ1j6HF8
 eMmBWlEk28vy7cCiNC1dPX5kpj5wXSJxQsPEF/Nlq3qIkY6xMPBSX/yAplo8s1q7WV5C
 SLA66q0XeGwvGpKTFv4mFznJH+pcTgjVgnLuQriqn006HULo4mog/mEUIbrk+D4g6xMz
 XXdjfa0vhkx2LGXxeh/DBsmQr1qG3rqYRbkoUselAEyEmsSQFW/wfpcz/voDtEW82x0j
 BU6w==
X-Gm-Message-State: AOAM532rIkn9xznTtV8oaq1k+djyKmnUEBKbFYGIc2goYAC0cyhnUXOr
 NAtXNEz5vsfDGEl19rPEfdBAJkgfDk2B1Q==
X-Google-Smtp-Source: ABdhPJyCfm5S+fMjiHHIME5OA3zzOKJbs2Awu+AZpKy6brpH79oVFDRpCKGSlfbWVo1pG4lHzjKjDw==
X-Received: by 2002:a17:902:bc85:b0:143:954e:8548 with SMTP id
 bb5-20020a170902bc8500b00143954e8548mr82264749plb.82.1639242308989; 
 Sat, 11 Dec 2021 09:05:08 -0800 (PST)
Received: from [172.20.1.20] (45-19-222-18.lightspeed.sntcca.sbcglobal.net.
 [45.19.222.18])
 by smtp.gmail.com with ESMTPSA id o62sm6462113pfb.211.2021.12.11.09.05.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Dec 2021 09:05:08 -0800 (PST)
Subject: Re: [PATCH 3/4] target/ppc: fix xscvqpdp register access
To: Victor Colombo <victor.colombo@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20211210141347.38603-1-victor.colombo@eldorado.org.br>
 <20211210141347.38603-4-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ef6ea7ef-e07b-8336-fe3c-8dca1f8c9ddb@linaro.org>
Date: Sat, 11 Dec 2021 09:05:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211210141347.38603-4-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.317,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: danielhb413@gmail.com, matheus.ferst@eldorado.org.br, groug@kaod.org,
 david@gibson.dropbear.id.au, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/21 6:13 AM, Victor Colombo wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> This instruction has VRT and VRB fields instead of T/TX and B/BX.
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/translate/vsx-impl.c.inc | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

