Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFE54DCEDD
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 20:32:52 +0100 (CET)
Received: from localhost ([::1]:47634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUvre-0002tg-KU
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 15:32:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUvqU-0002DJ-QE
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 15:31:39 -0400
Received: from [2607:f8b0:4864:20::52d] (port=45587
 helo=mail-pg1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUvqT-00083B-44
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 15:31:38 -0400
Received: by mail-pg1-x52d.google.com with SMTP id o13so3421392pgc.12
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 12:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=NQ8VjlENd+PmsG1rzknrxmsomA33Ido3CDm31OPWI7A=;
 b=v/byvy/Of6xydfePaeRhHyLZXFbFYd+cl0poYetqN5ZLnZ0b9C63zvRKGorf4aYnJh
 IxmJRXFNAtJ0vAHlupCEO+smANWdOuxngVT2D67e961ArZpV86dSWNFkBlaGVWarxKzR
 hvHe//JQTIf1gv2Wm9YmtPY/OrwFXwoAjRJum7I3xfdRUM3hP8U8xBsFxvsfjlXidkUf
 /jxdtq1D5czbOHFo0hWwK+5xaVw2CbcG9RcoQKupxpKR7efcsJFCM/JdbsaFJAHqOYAE
 JlLvILSgLMefC79cozha0zKD4nEhjhiWzyU+3vF25tS/FsNCUDZBWPDzFARA87MuN2zX
 XhzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NQ8VjlENd+PmsG1rzknrxmsomA33Ido3CDm31OPWI7A=;
 b=Yw4afnY0izH8Gv7LEuFxuv4w9tRYBWiPRvkWwNNEdfVsTXyf4gVK+Z1WSFEVF3ct0S
 uCOVyAJ8PSwFo+JRUaZHBIMG0+rD1lDktqNRj0YkX/dFIueU9fbuP26zsaWJZj1cJMhu
 7CzlPpPWI9vglehuWRwJc9zc+biSEqLXalfEVr3fUpZC7NuElDqsupwTp0PwH3A4Ck/x
 IwIkfKTrpM4jwWonTwB7AZU1DgDd4cwbBGE1H4Qq86PMgkBle9bBXWBC2kcy6hFuMYzR
 3ysQMfF+kjQEFpema+Da2lNvLYYH/Lz4rxBsp//xAlYc5mqYW8RwzrBDjaBKxl/dFlIY
 7hXg==
X-Gm-Message-State: AOAM533Dium51CROzgLnLY+ylgQZ5RYUdTEKPmlDPts57rnJ+VrCnwam
 QSj3p4IDCsVWTlQjHDkFIeDTyA==
X-Google-Smtp-Source: ABdhPJyu3Igs4WlOQphprtUbZo7aO7pH98b7JrMNndMBRBulLXIE6zCRaJe9dyiNVdr4YdGz73Qt+Q==
X-Received: by 2002:a63:464d:0:b0:380:f8fd:50c5 with SMTP id
 v13-20020a63464d000000b00380f8fd50c5mr4953459pgk.475.1647545495535; 
 Thu, 17 Mar 2022 12:31:35 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 u18-20020a056a00099200b004f737cdd046sm7848732pfg.145.2022.03.17.12.31.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 12:31:35 -0700 (PDT)
Message-ID: <5dc9f996-44a6-cead-8e41-42ab9ef720ee@linaro.org>
Date: Thu, 17 Mar 2022 12:31:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH for-7.1 v6 41/51] target/nios2: Introduce shadow register
 sets
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
 <20220317050538.924111-42-richard.henderson@linaro.org>
 <CAFEAcA9y-hOK4TjmbjM_=foLQgeJAgBwqWLKNG1o1ogNgqu4aQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9y-hOK4TjmbjM_=foLQgeJAgBwqWLKNG1o1ogNgqu4aQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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

On 3/17/22 11:33, Peter Maydell wrote:
> The behaviour of r0 in the shadow register sets is definitely
> underspecified, but I really don't believe that r0 is a normal
> writeable register for everything except the crs=0 set, which
> is what you've implemented here. My best guess is:
>   * registers are implemented as a pile of RAM, including r0
>   * on reset the set-0 r0 is reset to 0, but nothing else is
>     (this bit's actually in the spec)
>   * writes to r0 are always discarded, except for the special
>     case of wrprs

Thanks for the insight.  It certainly sounds plausible.

> I'm tempted to suggest we should make our tbflags bit
> "we know r0 is zero" -- the guest doesn't have many ways
> to switch register set, basically I think just eret and taking
> an external interrupt, and those either happen outside the
> TB or are going to end the TB anyway. Can we make
> cpu_get_tb_cpu_state() simply set the TB flag if
>   env->shadow_regs[crs][0] == 0
> or have I missed something that means that won't work?

Yes, this is easy.

> (I actually wouldn't care to bet much money on wrprs being
> unable to write to register-set-0 r0. It would be interesting
> to test that on the real hardware.)

Indeed.  I'm tempted to treat them all the same.


r~

