Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C72E06DD7AE
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 12:16:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmB2B-0006k6-J6; Tue, 11 Apr 2023 06:15:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmB29-0006jI-2j
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 06:15:29 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmB27-0004Kr-7M
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 06:15:28 -0400
Received: by mail-wm1-x32b.google.com with SMTP id l16so3719083wms.1
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 03:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681208125;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O2XlqKXTumRHX50ynRDn7fmoklyLigV/ia8Z+fh4nYY=;
 b=mjkzjaJRaaXd7P6C1FNbl7LFfeaxMMoy/mS1qbRaZxEtfd31B1c23rlDq0BCfo4WM+
 2OnRO+Ju7X8gsYPvzYGmnfy0m3vDy/RAC6hCom964WNO9E51bpKCeiI8+umtPGY+OQZK
 gquKuRMjbWUdLgRFz3KKxdXtmL4rAJvG/dUG+cbrF0CDwnBoX01dyensyudrmygIE7CZ
 2jqfxFavjHRgtNH1W1ctlg/ixR3mVFZieu39pu1UpPH1/1tsaP7T+68LK9sTCs0sLVhb
 8I0a7/0g4v1aHyPamNokdmcRfcIippVcOKkmRWlTLDqwonay47LjD04MjhmCdrY1mdUo
 r+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681208125;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O2XlqKXTumRHX50ynRDn7fmoklyLigV/ia8Z+fh4nYY=;
 b=LR8DRfvJwS8piH3AU6mJ7DzXQebvl1Xt5xZ75n472ZIgOsqzjariqYLIpqBivxNtP3
 m4SQHmpnvOLf1GmVY1x74ldRe4TCRHHDptd3bwxNeXsIC2VQRQMeSvYoidyN1ADRiapb
 UuY+ejcBOtJsDKL335OFPoLgB6Do+ApzdPbV6ak0NMbQpYyEWeNK4udOw2OyzH4CFEeg
 QH+AgnJYTrN3xzzZbk0izTriF2HibIOsJ3cfvw0KCAzzbwGMSCE5xGTnPHaA8UJA8T9A
 PliW3B5FWVnXbHoXWj/rQFArRzVYeI3U5ddgfzjB9Wkz0lyxaRkLDLf3/3zdQWysyhKn
 RgTA==
X-Gm-Message-State: AAQBX9fVm1e2zU4NSvJ47O7QebN+q3ciYiyTssL49pGOmVFAhtIsdJlU
 F7CoHDen648KINjlGJk49mPZew==
X-Google-Smtp-Source: AKy350ZGUoQgg8rub+anz0Z58g/NjOTJxuwJrDQwrhurPIP1+Xlgi4eMKt/VlypjR2AnPZVQhjOayw==
X-Received: by 2002:a1c:7410:0:b0:3ea:ed4d:38f6 with SMTP id
 p16-20020a1c7410000000b003eaed4d38f6mr9044973wmc.4.1681208125441; 
 Tue, 11 Apr 2023 03:15:25 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.195.239])
 by smtp.gmail.com with ESMTPSA id
 l20-20020a7bc454000000b003ed1f111fdesm16365601wmi.20.2023.04.11.03.15.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 03:15:25 -0700 (PDT)
Message-ID: <7c306978-4236-4766-2d77-ad7008583b90@linaro.org>
Date: Tue, 11 Apr 2023 12:15:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH for-8.0] docs: Fix typo (wphx => whpx)
Content-Language: en-US
To: Stefan Weil <sw@weilnetz.de>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20230409201007.1157671-1-sw@weilnetz.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230409201007.1157671-1-sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.246,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 9/4/23 22:10, Stefan Weil via wrote:
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1529
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> I suggest to apply the patch for 8.0 because it fixes documentation.
> 
> Regards
> Stefan W.
> 
>   docs/system/introduction.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



