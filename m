Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D1851955D
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 04:12:33 +0200 (CEST)
Received: from localhost ([::1]:52532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm4VE-0006cU-26
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 22:12:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nm4SX-0004Hb-FX
 for qemu-devel@nongnu.org; Tue, 03 May 2022 22:09:47 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:44792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nm4SW-0006ge-2q
 for qemu-devel@nongnu.org; Tue, 03 May 2022 22:09:45 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 m14-20020a17090a34ce00b001d5fe250e23so43993pjf.3
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 19:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Xhi0Zm23EaxqFhmwJ76V0iYSwOz2aTVPCyjxhuT5g+E=;
 b=on1NO5KjWa0J82CWRAu4v1q1xaaWrpugihRuThBTnQwysa50vNBiv1XL0OEFQre8Tu
 klbgOx0eK1RcGMdNcjWr6tNgNsumnIXUA1E+201H2P4l06+aF43I19jnx0MCANsQM3Gs
 t7f2sD8ExP3WIPI7Us/t1pQfUqr+hnhfloQBUrzDp/Wda92/qtVGf9NOOxwP+2Qgaz3z
 k1xSkXGukIwE8EHXwL1vfqkeAZCQgFmwj3mNBUS/XDu79lQdQyL19MG+VNWH/4djHf3y
 y6IUY5zQC4mpGDO7j8ducbAt7e8i+UKt84MU5pX2QPUQA49VpMtrrzdKDxizamO011xN
 jDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Xhi0Zm23EaxqFhmwJ76V0iYSwOz2aTVPCyjxhuT5g+E=;
 b=g2+rKdNKlnCc5sqoqrv601CRAE5tzJtvoUKQ19fU3pyaJ1pAvZNjl0R1L8CBGvLrld
 +tmndW0QU+bpT/iKdW6jGjI4ssQLB9f+VriINGtnC0RtMzEetueZgMcfBK0XCtjEzkG+
 NTxX25hwX2I+5Mde1o1ePEgZMJjpy0m/gbmFUaQPoKH64ctTkhb6poDlO2ViCWrNfDaT
 D81g0ZQo0OXO9qv9O4s1j/m57qZVRadRffX0nF3SR1GA3xTyS495RBtOMI1jwnOsojDE
 tVKDkxVKB6iHxCUV2trTGF9TZHNq8PwjgzEnLbS2CJatqd8pYXgSA9TtVPkMaVHcJF32
 ehiw==
X-Gm-Message-State: AOAM530KAo6v5j2rfNSEnnRh4XfEJNBhCPqjCY+TJpAJKcujUoK5pnbD
 tjD7XpxzNCFujuyNrpcUDTemkQ==
X-Google-Smtp-Source: ABdhPJyIEtVOpqe496XmB+jFNoy1f4orqItjkXMnM/FYeCiiDWvqZlbF1G/rwfIlIgY88rw4vRHWaw==
X-Received: by 2002:a17:902:da87:b0:15d:2e44:c1a6 with SMTP id
 j7-20020a170902da8700b0015d2e44c1a6mr20023821plx.85.1651630182225; 
 Tue, 03 May 2022 19:09:42 -0700 (PDT)
Received: from [192.168.4.112] (50-206-49-78-static.hfc.comcastbusiness.net.
 [50.206.49.78]) by smtp.gmail.com with ESMTPSA id
 z26-20020aa785da000000b0050dc762819csm6946217pfn.118.2022.05.03.19.09.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 19:09:41 -0700 (PDT)
Message-ID: <e9931d80-dcc6-725e-5b4a-be63b0eba298@linaro.org>
Date: Tue, 3 May 2022 19:09:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 21/21] target/ppc: Change MSR_* to follow POWER ISA
 numbering convention
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, balaton@eik.bme.hu
References: <20220503202441.129549-1-victor.colombo@eldorado.org.br>
 <20220503202441.129549-22-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220503202441.129549-22-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/22 13:24, Víctor Colombo wrote:
> Today we have the issue where MSR_* values are the 'inverted order'
> bit numbers from what the ISA specifies. e.g. MSR_LE is bit 63 but
> is defined as 0 in QEMU.
> 
> Add a macro to be used to convert from QEMU order to ISA order.
> 
> This solution requires less changes than to use the already defined
> PPC_BIT macro, which would turn MSR_* in masks instead of the numbers
> itself.
> 
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>
> ---
>   target/ppc/cpu.h | 87 ++++++++++++++++++++++++------------------------
>   1 file changed, 44 insertions(+), 43 deletions(-)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

