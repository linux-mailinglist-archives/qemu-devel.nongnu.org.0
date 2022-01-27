Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAD849DBFB
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 08:52:45 +0100 (CET)
Received: from localhost ([::1]:58456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCzaG-0007Zs-Ei
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 02:52:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCzQ2-0002cZ-Kb
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 02:42:11 -0500
Received: from [2607:f8b0:4864:20::42d] (port=42996
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCzQ1-0007ES-5S
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 02:42:10 -0500
Received: by mail-pf1-x42d.google.com with SMTP id i65so1895330pfc.9
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 23:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=RWGr3R2peXxKS+E7P6amSBA/jqnrU+x+19SZRS5Bwx0=;
 b=zrHJgggdkaMgM9BNwLyrX8LvZxqhmmAQXowsq27RH/3ZK7ujyqyt8lpGrbmCcMB3Vz
 rCXXfpAPS81cj+kowVeaqhNU25Y1GFXp+s1edrL4xRouIDxVUdIFcbLR4jJFikYryre6
 Axndd6vzSkDXnakpi0cY5Yt/6i0dz5UeGSHm5ixdoBDnZ69Her16t22NBu8LxSEEUqD3
 UjadlncyDruAwwt0MF85JJEiZrYcV2hab4HUKfuUOryAahkKT/RepQ2F5Ptg3f8zZDNe
 uL5Gd/SM26Q9QfFpMyyPW1EPagXm3juoXqV4Dxm/Po+KQKY82IqGtLt63SimeRrtzhc4
 XabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RWGr3R2peXxKS+E7P6amSBA/jqnrU+x+19SZRS5Bwx0=;
 b=IOlCFPAJZuN/Ivk5h4DHTo6RkhxxGNWJZgkhTH/CtbGi7Qw6iX6gimKr84rgWBx9GM
 jdWPKGjbue80vVyUoKAIwWMn1AkRRt0HI3EcQIqHgEOmM7dEbkGsVayCHEjZNvJ95WVH
 CBg4MyGtmdIFpN/p3fp7KAjxTFcPWREUNtgje3eLxrmVM0lTx1P5Jm0BJ8YafXaOAv06
 gL2X7hFPQz78RV/9pV4Jtx+WqPZmDpz59j3cizKD/JiER1gVS71YGlWMjvQcvZVFO3IH
 2UTQ7DnDQY1LOWxyQh2K5xddWV22KPX+GXMfJjM46Hd/hQjYKg2JZv+Ng167ld0r+Ycf
 4vEw==
X-Gm-Message-State: AOAM530d2thHgnNrXCvsJ0XbidPWpsmSEBBd1DaGl78rmhRc9OrIgM3E
 15VzkigXjRmDWlviqkTGhthplw==
X-Google-Smtp-Source: ABdhPJw5Y2uvG1C/odu4MlJtN2RaSVFd2QoWfAMtd+l9z3fIcbjw/F+mX9WEk5kd35KYvUMXq+rWXg==
X-Received: by 2002:a63:e418:: with SMTP id a24mr1896042pgi.169.1643269327341; 
 Wed, 26 Jan 2022 23:42:07 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id l12sm5162515pjq.57.2022.01.26.23.42.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 23:42:07 -0800 (PST)
Message-ID: <56697115-d51c-1fb1-abf5-945cde976d14@linaro.org>
Date: Thu, 27 Jan 2022 18:42:00 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 26/40] bsd-user/signal.c: Implement host_signal_handler
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220125012947.14974-1-imp@bsdimp.com>
 <20220125012947.14974-27-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220125012947.14974-27-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, def@FreeBSD.org,
 Stacey Son <sson@FreeBSD.org>, jrtc27@FreeBSD.org,
 Kyle Evans <kevans@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/25/22 12:29, Warner Losh wrote:
> Implement host_signal_handler to handle signals generated by the host
> and to do safe system calls.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Kyle Evans<kevans@freebsd.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/signal.c | 105 ++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 105 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

