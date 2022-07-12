Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5432D571113
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 06:06:25 +0200 (CEST)
Received: from localhost ([::1]:38514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB7AD-00072B-CO
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 00:06:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB72I-0008RV-91
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 23:58:10 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:37779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB72G-0007J1-SQ
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 23:58:10 -0400
Received: by mail-pf1-x436.google.com with SMTP id w185so6441936pfb.4
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 20:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=K8phF6ZPRrDfAt+KfhyUv6MaTyLc+8Mm/KgnG27att8=;
 b=G3DqGVJfF+DiVwrPZk34WYw4HS4mWNxH1ssgYVqE5blI9VY9lmC9BoHc2UBFMOsCa7
 DJmMmhfB1kk8sNksIPe+9rsDaza8Nc664KA3OzWTrEEwugHww7neq9CIDneKoaQ4w9Hj
 7wgU6Rtxmq/+ee20aU/kdk4qq/k9ENyxaz8oLSt6tVz6vZ+lTx3Dsd/damsc9TsyUjoy
 MVav9Qs5kQeXvdRl57Q2EdfS9HOAlH5MuUpFe7sAXMl9qjZBC5GyObl4TsoyQqU4fYHf
 GKFjCloG3DInkRUhrB3Lv3b1Mds8zrAtKOCILBuSb3cKE4daanY4l98tdo2G93SRjFUo
 E9Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=K8phF6ZPRrDfAt+KfhyUv6MaTyLc+8Mm/KgnG27att8=;
 b=P2FrCP0CoSAs6bNZ1fIvaSLcAmZ7xGF1bh0f7hPhx0KWyBeMNDUM0EJOj2gh+QF1M9
 BspUbgdbAn04bP6A0w1iN18YR0ubw9H8thoCEcS9y3pfiCpTNZsVc4AscW8i3TNU/d2Z
 g8npU3wSODGKpJoagYs+lvwfbOiP07gLxw3pR12R2TKE8z1ZjLg5qm04e7AulYQv9AcT
 aoZWPBwr+BydKwS9Cy0afk1CqaMbr0MUILZmMjdd9Stl4+NqvP28EFDLjK5xr+Emd9lw
 UQgIPLMtZ+tWB677t2FveTJ6kIi3X5fzzd6PtSX7KXGqWh2lTruA0uMQsp4nYKDYKT0h
 ebuA==
X-Gm-Message-State: AJIora/otejdrOiIc8sTGqL4EHUsTywS2037SiOpLPcEmaNA46ln3Oon
 pF9a3Ke2gT8JeaCehTJDPRuWZA==
X-Google-Smtp-Source: AGRyM1sAT5WJXcflB2YSH+N78MBvgDu028qmC7//C79RGZxNsceKQ3SuiXKtMHAKIy7vOH5ubhs9vA==
X-Received: by 2002:a63:e202:0:b0:412:7a7a:53e9 with SMTP id
 q2-20020a63e202000000b004127a7a53e9mr18593008pgh.624.1657598287629; 
 Mon, 11 Jul 2022 20:58:07 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 o127-20020a625a85000000b0052ab602a7d0sm5568097pfb.100.2022.07.11.20.58.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 20:58:07 -0700 (PDT)
Message-ID: <e49f9bc2-d425-aeee-8602-f6f1be3ff3d7@linaro.org>
Date: Tue, 12 Jul 2022 09:28:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 02/12] tests/vm: use 'cp' instead of 'ln' for temporary
 vm images
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Daniel Berrange <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Michael Roth <michael.roth@amd.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20220708153503.18864-1-jsnow@redhat.com>
 <20220708153503.18864-3-jsnow@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220708153503.18864-3-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/22 21:04, John Snow wrote:
> If the initial setup fails, you've permanently altered the state of the
> downloaded image in an unknowable way. Use 'cp' like our other test
> setup scripts do.
> 
> Signed-off-by: John Snow<jsnow@redhat.com>
> Reviewed-by: Thomas Huth<thuth@redhat.com>
> Reviewed-by: Daniel P. Berrangé<berrange@redhat.com>
> ---
>   tests/vm/centos | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

