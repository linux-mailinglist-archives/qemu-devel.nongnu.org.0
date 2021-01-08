Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1552EF7A8
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 19:50:01 +0100 (CET)
Received: from localhost ([::1]:36174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxwpj-0000Po-M4
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 13:49:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxwoT-0007ul-HM
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 13:48:41 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:40296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxwoR-0007tN-HL
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 13:48:40 -0500
Received: by mail-pj1-x102a.google.com with SMTP id m5so6661881pjv.5
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 10:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HC5S6uiz52SdHS4127LBAv50ulR12xwKquHmHvBIoYc=;
 b=qkVvn3PxYttJGstCfF5OrvnfLYmAwjWMnV2kTorVX17AJcHc0HmgBG/xd2cvv4UvLW
 qsZ3KT1kg0U8wUoaI/asS1NIF3zwO1qgULSuJFk6zrC/FtgmhLBgXSKMNLfly7CauAR4
 vMHyIdqKhJtghBcqTj3pRG+whY9N+tkFLMAg99AR49+d60BwjVHj/g2R1QgD0uiE8gbb
 TxxTaC4lw+L3v3Ja+b0zq3y96j6eYSh2UY47QyBO5xxSiBuD2JDPP025sRB+YqCFPcAu
 IlLrDbY55mqtUYozpTubfRJC6q4vbJ2TA2OsShypbLDkCJpXAtDErBVRVA93mvaOQi0H
 9iMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HC5S6uiz52SdHS4127LBAv50ulR12xwKquHmHvBIoYc=;
 b=UVTNw4xY7eGZSNepADvRdnc/kHaetIBIisv07rN8Ul4MllM8lNx/H9gTXDBhAymN03
 TUNNwGNpNQqkwThzvRSstzUCNGDVbSpDdMpECe/i1ZJI5So86tIPjOOTKDyUm+RqvsYE
 6KeGT2B855ve3LMWi6dob9oy60Uzu20i/8l8WBzdirE4F4Y/03NV0fwnWS0MBC80oXaj
 oSZ4JDddo/l8xFL/FBjdkeWJFMU5S2QnpeiQgbc5yRtpmG2pufDZfXjCycLgrJzfl9lF
 rUPC+v5w+fnQo7V2NBXAbzfjkdn9y3+eOz1SI2qgh50Gd5Ewnc+XNXIu1gtgFbm/koY3
 rvig==
X-Gm-Message-State: AOAM530mh5nMevGJQDSU0p0V2wlkGmLt8LtD88akI6Kz+AIT4aBVKvx6
 89/cGf5yUSHBb6ihaujr1fuseg==
X-Google-Smtp-Source: ABdhPJwvxzSrqDVJ6/Kxg0c9EAy2XRNeftsg0G9A+00ngr+QY+Sua/D4qezhXXuEkYcBFhZOwRsJxA==
X-Received: by 2002:a17:902:9302:b029:da:f6b0:643a with SMTP id
 bc2-20020a1709029302b02900daf6b0643amr5150463plb.33.1610131717905; 
 Fri, 08 Jan 2021 10:48:37 -0800 (PST)
Received: from [192.168.3.43] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id a18sm9845141pfg.107.2021.01.08.10.48.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jan 2021 10:48:37 -0800 (PST)
Subject: Re: [PULL 00/66] MIPS patches for 2021-01-07
To: luoyonggang@gmail.com, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
 <CAFEAcA-6SD7304G=tXUYWZMYekZ=+ZXaMc26faTNnHFxw9MWqg@mail.gmail.com>
 <CAAdtpL7CKT3gG8VCP4K1COjfqbG+pP_p_LG5Py8rmjUJH4foMg@mail.gmail.com>
 <CAE2XoE8YWYnvap+Ox7hWaKfpRjDS+vEKpP61F0w3NkkKse5_iA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <82897c46-5cf9-387a-1c08-0f1c219bd9e4@linaro.org>
Date: Fri, 8 Jan 2021 08:48:32 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAE2XoE8YWYnvap+Ox7hWaKfpRjDS+vEKpP61F0w3NkkKse5_iA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.241,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 kvm-devel <kvm@vger.kernel.org>, Paul Burton <paulburton@kernel.org>,
 Libvirt <libvir-list@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/8/21 5:22 AM, 罗勇刚(Yonggang Luo) wrote:
>>> UnicodeDecodeError: 'ascii' codec can't decode byte 0xc3 in position
>>> 80: ordinal not in range(128)
> Can we always reading file in decodetree with utf8 encoding
> And convert all decodetree to utf8 encoding, and the problem should resolved.
> ```
>  scripts/decodetree.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/decodetree.py b/scripts/decodetree.py
> index 47aa9caf6d..8c9eb365ac 100644
> --- a/scripts/decodetree.py
> +++ b/scripts/decodetree.py
> @@ -1304,7 +1304,7 @@ def main():
>  
>      for filename in args:
>          input_file = filename
> -        f = open(filename, 'r')
> +        f = open(filename, 'r', encoding="utf8")
>          parse_file(f, toppat)
>          f.close()
>  
> ```

Thanks.  Would you like to send a formal patch?


r~

