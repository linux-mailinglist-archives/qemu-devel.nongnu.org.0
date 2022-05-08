Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EAB51EB3E
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 05:19:45 +0200 (CEST)
Received: from localhost ([::1]:50172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnXSS-0008PX-FX
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 23:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnXQH-0006gY-ID
 for qemu-devel@nongnu.org; Sat, 07 May 2022 23:17:29 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:36826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnXQG-0008Pb-5l
 for qemu-devel@nongnu.org; Sat, 07 May 2022 23:17:29 -0400
Received: by mail-pg1-x532.google.com with SMTP id g3so9318340pgg.3
 for <qemu-devel@nongnu.org>; Sat, 07 May 2022 20:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=QPxHCX9FWhdoNmgF0BebYOnIdk/vH1d5aDwbLsAaDco=;
 b=NYH+doS4LqKhQjl38JixzU5slHzykNxOEL02w9h8zQcNc1+OjBbTE2tQ9+7DLbdLDN
 7IgmxxE5nwVIGrHnfPVFz+dGtHPik8zwuBDI6nhqugLnfsApqFskJINEtgFGFrWMMYcD
 /uWKB6T454qRad0L1NvPfTwW49ttm6drSyiWExJGXLXD8rPtq+8qKyo7VQclakbBQNGZ
 FEMLtW3wxonA7W315yNfvhu3NTpHxrDGcwcAtsaDiRag5pVWOhEbk8epBpUNffZcuejE
 zcbvSa+pJc9y/L0PlpV/5oyEOVo4YZ9pvunu2Uvz9ky12kC4IzOrFUvyy2GPMbqDJ0aB
 PsfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QPxHCX9FWhdoNmgF0BebYOnIdk/vH1d5aDwbLsAaDco=;
 b=nwJhmhNil0DkAgXlJbLo2QXKiUXYL1rhwOpwFKoyJOqRYQbdjr8KQ7grNx4I+smEfB
 4NcpL3Z/t5n5MRoQ2lmzuWaq/VG6qYLN4nbmAXKTSFoiM3iGbggYYWTWmHvPiS8HzWvc
 xABaOTf0E42E0viMOs027td7HJ0QcKHyYYD4h4GncqfZtSQDqaLPIxn3ipt9Suw+Aouz
 rz8cJSzc3nCT9gBRQjE5vv7u2Yol6uUZGcareOrVimR1t9GzilogM/L4DgWhb1wqGedw
 1TJHiSq6zkjA8GxXh9hJSd7Bfo1k+5k2dc4+jkL0nhEkAwCIssNjkoqpILKrCLg71RWY
 xhig==
X-Gm-Message-State: AOAM532Fz9Mr2lPfLnO/EDHyaSUZYfjSSnZ5Zhz9A+vrNo6+y2YilWDM
 Y8UdojaWIwp98ERAUi+/0k0ngw==
X-Google-Smtp-Source: ABdhPJxoWgMh1ErBVj020Rb2ju6ixb4iYPCx4cs7r0lxsxpxTU36oa8fyW/QRXD2etgzhLRqE8ldzA==
X-Received: by 2002:a62:cec4:0:b0:50d:9030:722c with SMTP id
 y187-20020a62cec4000000b0050d9030722cmr10115170pfg.41.1651979846800; 
 Sat, 07 May 2022 20:17:26 -0700 (PDT)
Received: from [192.168.4.112] (50-233-235-3-static.hfc.comcastbusiness.net.
 [50.233.235.3]) by smtp.gmail.com with ESMTPSA id
 k18-20020a170902761200b0015e8d4eb2d3sm4309306pll.285.2022.05.07.20.17.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 20:17:26 -0700 (PDT)
Message-ID: <d88e8d9a-282a-f51d-09cc-4bf32ff5041e@linaro.org>
Date: Sat, 7 May 2022 22:17:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 46/50] hppa: move enable_lan() define from hppa_sys.h
 to machine.c
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-47-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504092600.10048-47-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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

On 5/4/22 04:25, Mark Cave-Ayland wrote:
> Now that the board configuration is in one place, the define is only needed when
> wiring up the board in machine.c.
> 
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller<deller@gmx.de>
> ---
>   hw/hppa/hppa_sys.h | 2 --
>   hw/hppa/machine.c  | 3 +++
>   2 files changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

