Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D52CE507A0B
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 21:13:47 +0200 (CEST)
Received: from localhost ([::1]:43346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngtIJ-0000Xl-0o
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 15:13:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngtGQ-0006RO-HZ
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 15:11:55 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:53244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngtGN-0006mZ-3b
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 15:11:48 -0400
Received: by mail-pj1-x1031.google.com with SMTP id 2so16325081pjw.2
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 12:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vFTCsEIV6EL3RwAV2jCDJdH5UB+gq94QdOFyJ5r8pOY=;
 b=FSRIUr0mCEOFBqy++LyqdN0uuJfhn5iktdmB3DVV00rM3Axy6fvB0X3q+bxu7aCucB
 EcjmrUQ6ezFVaH5dZnQ/qg2qAkVBu4X6+UpfAs7YXTFjX8jOJ3oYPvKahC8oMpdXwLUp
 F3KC7/KnxOgQgURzEI5oyPbc40NO3cuwJEebkM5Jo61yEEb4XNBex6AsrxDu6uz9vdEb
 qu3j83U126sInu/Iwjl6K9RIkNJv7YRTZEeSfHYeE7FYrPbaP5xlS/6TrukfxLH1NyxT
 lhuPVnR/r2U10Fp83okr+fHPTZnq2cwwJadhRSVxT621jPyPasrOKU72AyKungEgEL3L
 j2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vFTCsEIV6EL3RwAV2jCDJdH5UB+gq94QdOFyJ5r8pOY=;
 b=huqYxlQtvY+F9cVI0/J6VZvVtnV/6sJVWWAe4dgjCb4EA5mfu8ZGSeaGmjds2R3hjx
 EQ2uA14acwSWCdeQPtUpcvul9vdcuuZgZKyoeYGnV7D2AvMRVoZoO2cvdYnv1N1lVULN
 x8FX9F95kOZ59UiyPWnjpC3AegaB8ZLy4/t+1CA2EbSxWAFoXGAeta8Yz/eCwo9h03ds
 9zIcZAdyG9x5TzPe95S9W3Jt/Tuq9UjQM5Hc8eGOVkC85pnBLejOT5UytHAE3dT/91Sj
 Ym5+MpE7LVnXGqmEyc5wOFsp1DF7iX3JQb7LrvpQHPDRE7oMcNx71fDJldxuL1q+XK22
 0tpw==
X-Gm-Message-State: AOAM532FVtwmnPpB8NLAFP8hpcTQ6spxM9Wrzj+jVusU67v3V+/f/wNW
 zliTxlcwpBS34PgjOlBOezwLDg==
X-Google-Smtp-Source: ABdhPJz4oY9TOlZ1Ak2pv80QMPR8dD84tie8KhgibH16K8xBHP7z1ZM3Vt3PNMMthhryR6RusxNWjA==
X-Received: by 2002:a17:90a:5298:b0:1ca:7fb3:145 with SMTP id
 w24-20020a17090a529800b001ca7fb30145mr94919pjh.200.1650395505615; 
 Tue, 19 Apr 2022 12:11:45 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 ch10-20020a056a00288a00b0050a51a95e91sm11519379pfb.201.2022.04.19.12.11.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 12:11:45 -0700 (PDT)
Message-ID: <54976487-de0a-46d4-9a3c-efca60d71f84@linaro.org>
Date: Tue, 19 Apr 2022 12:11:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1 21/25] tests/tcg: remove duplicate sha512-sse case
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
 <20220419091020.3008144-22-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220419091020.3008144-22-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, Eduardo Habkost <eduardo@habkost.net>, berrange@redhat.com,
 f4bug@amsat.org, stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/22 02:10, Alex Bennée wrote:
> We already generate the sha512-sse case in the i386 makefile which
> works for both i386 and x86_64.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Fixes: f8a4c6d728 ("tests/tcg: add vectorised sha512 versions")
> ---
>   tests/tcg/x86_64/Makefile.target | 7 -------
>   1 file changed, 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

