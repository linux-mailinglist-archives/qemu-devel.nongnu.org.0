Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 097DC4EEE9E
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 15:56:42 +0200 (CEST)
Received: from localhost ([::1]:55480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naHlZ-0002qw-5B
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 09:56:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1naHP0-0007Pa-P4
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 09:33:23 -0400
Received: from [2607:f8b0:4864:20::22b] (port=34379
 helo=mail-oi1-x22b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1naHOy-00009R-VN
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 09:33:22 -0400
Received: by mail-oi1-x22b.google.com with SMTP id v75so2846723oie.1
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 06:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=NVK/zeo+8149NhaV5iUMxzoJsaLWHaFF4vdGykbL+Yg=;
 b=OyZSfrohwY0j+RLrsuWMazQ24la3vxoiiAseTmB69DGqWcHUeczTN2/CvHMwApTvLh
 S/TzmJDyYcdBf+MlvYqOU9AKLsjhpFicnib2pdtY/qBdHcZ/moe0mz0hYsR0i/Jf5kn8
 2nqiiVrxptN4HQvoHA8ClhYvcamwjQqpC2PY5+2URAS7Lxt6MKC5HbC7Z097afd9ytsS
 PJu3P7GsxTPEGp0WYW9Fc+58yLcLOrBlzXq5iW/IphpAC1LKJfHAYA2knXvEphqyb5lT
 dwRaKjK0Q7iqbakOQweI6cQMNeupSE1sIbAFpoZ8adaHJtAHeYpxYvGE/z2DsImrd5iN
 FeBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NVK/zeo+8149NhaV5iUMxzoJsaLWHaFF4vdGykbL+Yg=;
 b=67VGoRIfy0C/LkdrTA5oRiqFouwmBjibbdlg0+yj4MyogkJcMTVMxs5a/Bp//vq8S9
 MObEs0f/1ci8N2D+isoOfQ7u49pxymK5krrz+C6R8c0hivXMPe/cCG0Hlxm86xdPB1kj
 EwhvOU7rTFI21VD+HnSZBvSRNKW5BKL9HSnJhmQJtg9ivF4gDneIi8EH1EihIsvwul06
 GKjMY+8o99tc4tv4fIXLqGAcW+alvGkkBO+m2QBXoCWbEuCCRCXIyxat6ZFnrH0GFIpY
 hjFtObdYku1N9KsW1Sb5hFh8szYLlOeb4sNne2jhRrJehYnGYresrFfcxymO2BhmySIQ
 JJJg==
X-Gm-Message-State: AOAM530CVWkZsXo5x9uu66Csu88Z9A3Xl5lfgu+9itz9PbZIdmF0I4TS
 Nf2PLr6P9uSbcgHsTLrSctr/mA==
X-Google-Smtp-Source: ABdhPJywTBsKhTfesEpdoGUJF2RQiYcppQ4gqrRq95mV5qvsGwirogOpfkiGonYE/8dtjktaUP4mDg==
X-Received: by 2002:a05:6808:1413:b0:2ef:4a81:2ee8 with SMTP id
 w19-20020a056808141300b002ef4a812ee8mr4621682oiv.125.1648819999680; 
 Fri, 01 Apr 2022 06:33:19 -0700 (PDT)
Received: from [10.10.117.62] (fixed-187-188-190-73.totalplay.net.
 [187.188.190.73]) by smtp.gmail.com with ESMTPSA id
 d3-20020a9d2903000000b005cda765f578sm1119011otb.0.2022.04.01.06.33.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Apr 2022 06:33:18 -0700 (PDT)
Message-ID: <d2bb08df-68db-c70e-8de9-81965d31fab3@linaro.org>
Date: Fri, 1 Apr 2022 07:33:16 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PULL 06/29] softfloat: Move compare_floats to
 softfloat-parts.c.inc
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210603214131.629841-1-richard.henderson@linaro.org>
 <20210603214131.629841-7-richard.henderson@linaro.org>
 <CAFEAcA9tV_3VMwgAgN4BKc1GW9w59kwHB-xFhn1pi4pBH2YxrQ@mail.gmail.com>
 <aeaebbd2-1d63-d392-9f3f-30419cb09e0f@linaro.org>
 <CAFEAcA9cwmv3xFP+T6UOhbRL+pWxOAqqc2Q_Uk1cZKHofxGS+Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9cwmv3xFP+T6UOhbRL+pWxOAqqc2Q_Uk1cZKHofxGS+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22b.google.com
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/31/22 12:06, Peter Maydell wrote:
> PS: while you're there, there are also a bunch of new TCG related
> issues where it alleges array indexes being out of bounds. I
> suspect these are false positives, but it's probably faster
> for you to analyse them. (I have a feeling Coverity can get
> confused and claim an error because it's looking at an array
> size it has cached from one target's NB_MMU_MODES value and
> a code flow for a different target with a different NB_MMU_MODES.)

Given the placement of one of the notes,

1760 static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
1761                                MemOpIdx oi, int size, int prot,
1762                                uintptr_t retaddr)
1763 {
     	1. assignment: Assigning: mmu_idx = get_mmuidx(oi).
            The value of mmu_idx may now be up to 15.
1764     size_t mmu_idx = get_mmuidx(oi);

the range check in based only on the mask applied within get_mmuidx.
I'll try adding an assert vs NB_MMU_MODES within that function.


r~

