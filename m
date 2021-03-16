Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F1133E1A6
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 23:48:07 +0100 (CET)
Received: from localhost ([::1]:37310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMITu-00074Q-V1
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 18:48:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMISn-0006DS-0C
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 18:46:57 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:45699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMISl-0004BE-HY
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 18:46:56 -0400
Received: by mail-wr1-x429.google.com with SMTP id 61so8261270wrm.12
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 15:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZbHUrN2SOFgaVESciuL/65E+R0whHvi090C8Qc1RXYk=;
 b=i69895Zf3AAPp3i25jyqEFuNk5k/8UT3mwEVApNX4dQNduA8R+Quct85h0QGpa563O
 rNdfkIKqB1g2Y7+FoScIPUdHVVR2r21TQ3H316sEGdkkk6m+VF1m50Lp8CAzCPJAILVS
 8ugl951Nk2P0/tZ8d+VS391Anl4j98MNA/2xHL7D+9fxHqO23ckv7Rw8tNP7B2sW4TTt
 AvCdwJi6zZTxr5O96/IHgdixny8APhLvM0Br7Wi+Rf52/P2Lq/XipAVJmr9zc96i6R2M
 c/gudGcwqNBzNJaPa+31wMNE0+C4UIuPURZ5llQSW5HG5bwgF5wdsnuQJYaxWQAJDiry
 W9sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZbHUrN2SOFgaVESciuL/65E+R0whHvi090C8Qc1RXYk=;
 b=QRsY70sq4HV+wAy50Uw4wzY+h99CH3PntbWZc/rp2mQ3prQCR7jOnW2LvqOgK5oc5V
 Rq1lCcKu8LX+KuIhFE5Mt959xeXlHBCbNeXa8OfnC1uPMfwZ4W3yQrJkmVFQZVdxTib/
 FcPV8BQb2/u0vUhyvBlZQCT6Dpp3tYsuQM4t80vdv6ZFxrzRJ3CjaNdUi3ACylOvA/YQ
 610K6URVpew8jR7Mdl7UkfAGOqJzU9oOHs8tk+zgxLC3GG2SApq/v8i12OCwc75cLtIk
 O9JpSx4/CiXadhjazl9XhaaW15dup/V90q3WZuUcXypDB+NRPON5C3S+Fx9zJjqg0l8v
 8rTA==
X-Gm-Message-State: AOAM5302SCeHkqqRMyf0zYjuWaMe3Y+6dFG5QkuCJzc63fKYLeU/VSu+
 GMJF3FdpN8uQOADoaVflt2ULVcnvrpX7tQ==
X-Google-Smtp-Source: ABdhPJz0yQ7A1exeRTRrC2gTEJx5xPFv824qQ86qnperDUpJymSUIo0HoLtIR+5Bqx6gg5EXiDa9fA==
X-Received: by 2002:adf:c70b:: with SMTP id k11mr1223051wrg.165.1615934814168; 
 Tue, 16 Mar 2021 15:46:54 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id u8sm15026936wrr.42.2021.03.16.15.46.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 15:46:53 -0700 (PDT)
Subject: Re: [PATCH v5 02/57] tcg/tci: Rename tci_read_r to tci_read_rval
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311143958.562625-1-richard.henderson@linaro.org>
 <20210311143958.562625-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7f8cf941-ad7b-f2f6-38ba-92a4b63b83cd@amsat.org>
Date: Tue, 16 Mar 2021 23:46:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311143958.562625-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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

On 3/11/21 3:39 PM, Richard Henderson wrote:
> In the next patches, we want to use tci_read_r to return
> the raw register number.  So rename the existing function,
> which returns the register value, to tci_read_rval.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci.c | 192 +++++++++++++++++++++++++++---------------------------
>  1 file changed, 96 insertions(+), 96 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

