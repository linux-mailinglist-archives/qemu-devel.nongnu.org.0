Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CA34D22F3
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 21:54:34 +0100 (CET)
Received: from localhost ([::1]:50246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRgqn-0007af-IG
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 15:54:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRgpf-00066d-Cw
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 15:53:23 -0500
Received: from [2607:f8b0:4864:20::632] (port=40550
 helo=mail-pl1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRgpd-0002Fq-PL
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 15:53:23 -0500
Received: by mail-pl1-x632.google.com with SMTP id z11so179640pla.7
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 12:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=pmDKZBhErSli4fyN7gE30WOOyUaBF6IUn7KICTu1OME=;
 b=UcEL2U5OCrFYLpQm+lgNaPK6IhVghHPvDfYGgUnNkxTNRhknp97w7l0RGdXU1luFtW
 tQ3suP1rQAGRKXaN65TmVa8CF19tHVxBAi5KVMbgzXjgo/bCX2XANK0uaXg4ZzcWyDqj
 /LEqKvJmHCJkiinbC4RV+aOFMjb7P+EwU/v5h7szinYLwVDdG+jXctGV3u01ktnFIc19
 Q3M3OV1E9DAaKdPxhbOoswXl6/3+zDcl/z6VFXyb3SoCdPjmN9UOs9HqEn++PXK3g41L
 HAfyxORFRjq4YReJHspJOQt6gfO/gwOuZjTpWrboswRS+3/MMCQU0h5FT04wfnk7UR5y
 H1jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pmDKZBhErSli4fyN7gE30WOOyUaBF6IUn7KICTu1OME=;
 b=O433c3x3gGM5gm5brwa9EszubzYoEVuV7vq2JtM4yK2hvWrIgvWBnT3xxrUPABGLNv
 B1ylsLsKuxGEZcMxArCtkwWf396F16548HTKt9uvt6TLoeOzi+CKmXl3vJp3wG7yN3Ro
 LpDP4cvpUo3Ctx97c4ntWJ6xVG1T7ucfsYM96hJQOOwJKrBPD1VI/b39oAuG5mzP1mwI
 1t9WViidh89yPZD2vyBZIRZS3QrpuqJvszQ3Qi1nJcVnrQffCike+/OapRTDbZOODajR
 SufGDUwHonluTeM4V1Dol7EIcVSNuR8cVW7TAcMMcIv+4dwXC6ID3IRYOrWf/b2So9D9
 6GRA==
X-Gm-Message-State: AOAM5333S2wb51DGGLBiK/uCIhys6EZlsZkz+sxiUmFQs18xQWzyDXIN
 kmrp0O5YJB2D3umCTyKPuUmtwg==
X-Google-Smtp-Source: ABdhPJxsgA1XqxlZASCJwYn29KQGu5QOWx9OBFFdmE84QAKcPL973Qnj2WnR2S75sYoUyl/j2h1xQQ==
X-Received: by 2002:a17:90b:3ec8:b0:1bf:ddf:92f0 with SMTP id
 rm8-20020a17090b3ec800b001bf0ddf92f0mr6663252pjb.161.1646772798792; 
 Tue, 08 Mar 2022 12:53:18 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 8-20020a056a00070800b004e14ae3e8d7sm20750811pfl.164.2022.03.08.12.53.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 12:53:18 -0800 (PST)
Message-ID: <e11b8c90-a889-3243-3242-7cdd5cc2012c@linaro.org>
Date: Tue, 8 Mar 2022 10:53:15 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 22/33] target/nios2: Introduce dest_gpr
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220308072005.307955-1-richard.henderson@linaro.org>
 <20220308072005.307955-23-richard.henderson@linaro.org>
 <CAFEAcA9PyqbGEYHbetdrkaCzXnnCUDp61dBWyF=_0PEwRc2HjQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9PyqbGEYHbetdrkaCzXnnCUDp61dBWyF=_0PEwRc2HjQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::632
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/8/22 01:07, Peter Maydell wrote:
> I assume the TCG dead-code elimination will mostly throw away the
> write-to-R_ZERO stuff, but here for rdctl I suspect it won't.

I believe it will.  We don't indicate that normal load has side effects (as opposed to 
guest load), so it should all fall out of unused values.

> But probably real code doesn't do that kind of silly thing.

Indeed.


r~

