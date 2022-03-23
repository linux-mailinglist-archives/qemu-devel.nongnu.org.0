Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D3B4E5B6C
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 23:44:37 +0100 (CET)
Received: from localhost ([::1]:45256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX9iW-0002H0-KC
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 18:44:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX9gl-0000jx-U4
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 18:42:48 -0400
Received: from [2607:f8b0:4864:20::534] (port=34693
 helo=mail-pg1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX9gk-0001Oy-Ca
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 18:42:47 -0400
Received: by mail-pg1-x534.google.com with SMTP id i184so2378343pgc.1
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 15:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=EHwvQtVGpnB2JIokdDZ3dK8zZlw3HM9XtV0BjWOsN4s=;
 b=KK0Qyil+d3CcEJDfff8E8Gj8nuDMDfUO9sw7G4rp6Txk+kVXxUEqGkc8BowyUTeZym
 POe7nMV5a2Il5G5pG6gKIo47qcRzbHp8S88kjBTQPA8ltba0abEbtFEO3DNQJDsQgiAP
 7Y3Y7CkEv6XTMcC/TSKj3DeBKZAJ7Ep0A5dYxwJ5btmpOgwBuWR1PRefjC/A+Gp6baf8
 eno1+W9usiucfCg4o/PnTlfnG6TcfgAomnDwMFFowIBf6UtsY0CE6uvboJ60ZxQH+MV8
 N6bfHnlnZixG+6KtWFRxlOeTJWNdFoqRZTJYu9dSqYsNvrLl1DQzu4W7orelE3LjPTcM
 owEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EHwvQtVGpnB2JIokdDZ3dK8zZlw3HM9XtV0BjWOsN4s=;
 b=JJeMoLTxhPX331F4JHXBWnjJJmGRM079Nmo9Eahulztd3VeJuZmzuWDQ9CNEJTKDce
 U06o3jrX9P6tY9G2Sg3WoPNEYTS5lM15IXAvcxugPbX1ZewXI3zbDrSIb6sdhb+D8ZoN
 +iolZ8e36zMoIyvbndTRfD2aW8iSUXL5xWiy8OZE72mhoUQnODvcFlRXVrHM0XTuL8rZ
 /wiE0jhhtuW5lYqF41G9tbePrz1ogUzwdP/s/yKAeC5NH+VihBO9lBRTyP1MUEkuLz4M
 GmRzQrFutjpo7gbZjbXDQsI7bjG3/yN6Sn/DlVAP0FXIiCyi8PxU8hZGlmodfskfQk5c
 l9Og==
X-Gm-Message-State: AOAM533XdKIfKQW+3ntToIkUsHgOZR1cEqnaVteiqY2ot4wGyE1TYTs4
 hNyWZjuH61q302hMoUP8IMA56Uu/FnrDYw==
X-Google-Smtp-Source: ABdhPJyKeEQaFL0Oxbs/oxpeQ9DKiPqAFxWMVVBQy+vPH6NOcRaG6Q6Cjvu/ZokScvL1ho4Lk9A67A==
X-Received: by 2002:a05:6a00:3496:b0:4fa:e48e:3d02 with SMTP id
 cp22-20020a056a00349600b004fae48e3d02mr2187440pfb.26.1648075364860; 
 Wed, 23 Mar 2022 15:42:44 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 g14-20020a63be4e000000b00382800d1528sm702466pgo.21.2022.03.23.15.42.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 15:42:44 -0700 (PDT)
Message-ID: <44145bf1-5402-c0d5-60f8-f99823cf616c@linaro.org>
Date: Wed, 23 Mar 2022 15:42:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 12/13] softmmu/cpus: Free cpu->thread in
 generic_destroy_vcpu_thread()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
References: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
 <20220323171751.78612-13-philippe.mathieu.daude@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220323171751.78612-13-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::534
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/22 10:17, Philippe Mathieu-Daudé wrote:
>   static void common_vcpu_thread_destroy(CPUState *cpu)
>   {
> +    g_free(cpu->thread);
>   }

Missing free of halt_cond.


r~

