Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5264C5F94
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 23:50:56 +0100 (CET)
Received: from localhost ([::1]:45028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOSNT-0002Nu-Up
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 17:50:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOSLC-0001S2-Kr
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:48:34 -0500
Received: from [2607:f8b0:4864:20::529] (port=44747
 helo=mail-pg1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOSLA-0005E9-S1
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:48:34 -0500
Received: by mail-pg1-x529.google.com with SMTP id c1so9857935pgk.11
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 14:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+ssaf5bAUloR7nHVWDMNoMySjfyHC81vogdB7iu6kCY=;
 b=aLDmrIPV3jDJ0vTulrHM5TC4k7LW0iF75C35fpJ1j1eLDdOOlv4eV+8XpIkEhIWRxU
 jooo2xXrCOKMChqg/LjeJz7HbHGu0rZkbcJJ5VifAWuRcrEHphUK072hpsPiBBC8anwC
 ghW1GNj4UXHz9ilwdVvagxzruFUWs56gUHJvxNxW70yemCRtxTt3/N1vXUxpS1MqBUsk
 f2kJ/Sbscvo3YMRCt49F2Fw13vXE15megbpjHLSkCwO0UXpDjroNwtRiY7h5agBundrs
 FHTfoBOPWcSCbnLIG6Md83GR9y6p6gHfwioioFKbdz+sR1O07+8mHa0UySSsNgictcOq
 R62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+ssaf5bAUloR7nHVWDMNoMySjfyHC81vogdB7iu6kCY=;
 b=kcqoQKqTJIl6IQvBz684GoYU4zorAayPVAn39QKC0Ol9F18+YlI6OkgOJluLR7TZDJ
 2ejM142j2n7F+jN3dzuYWs9uotWkwMwcomLmLabxrpPaOL3sDC7sDwtC79nYT2xgf/bZ
 YuPnRE5C6tM3q2sY+FNtyWRfQVDAE+f5UdK0IRJkXANQso0TlAx0eoqG9CTW1UV2fArN
 Cj4y6SnAqA/aoC7AF3dDGAPpg/4lWF6gcvLR+iaAnlHFvWq2RF5My7M+aJRM8NB8SAXn
 YvRPDGdr9oSks0W8A+/p1ykNK9xpUL/XQQyJNV7vLWS2i9XLbsB1u4e/5DxL5+Y72YrF
 yfUw==
X-Gm-Message-State: AOAM533aSY/ylXD1MzCr49nfVPDq5d8Patkfi9VEGB/BzW/AvGgmo5YK
 Ch6vAdaF6rZZUkWMEWZIvic=
X-Google-Smtp-Source: ABdhPJzNnv7nkzPH9wfbVXpG/GPW5vFaqOhzLmmU7k/2UUBRQd/pnaLz6oLVkt1AOtrtWSjZ1gvaNQ==
X-Received: by 2002:a63:d642:0:b0:378:a4c2:7b94 with SMTP id
 d2-20020a63d642000000b00378a4c27b94mr1901392pgj.218.1646002111484; 
 Sun, 27 Feb 2022 14:48:31 -0800 (PST)
Received: from [192.168.1.115] (32.red-88-28-25.dynamicip.rima-tde.net.
 [88.28.25.32]) by smtp.gmail.com with ESMTPSA id
 v66-20020a622f45000000b004f129e7767fsm10179673pfv.130.2022.02.27.14.48.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 14:48:31 -0800 (PST)
Message-ID: <b16475f2-ed31-8499-c976-ea030adf9092@gmail.com>
Date: Sun, 27 Feb 2022 23:48:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 5/9] linux-user: Support TCG_TARGET_SIGNED_ADDR32
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220227020413.11741-1-richard.henderson@linaro.org>
 <20220227020413.11741-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220227020413.11741-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::529
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/2/22 03:04, Richard Henderson wrote:
> When using reserved_va, which is the default for a 64-bit host
> and a 32-bit guest, set guest_base_signed_addr32 if requested
> by TCG_TARGET_SIGNED_ADDR32, and the executable layout allows.
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/cpu-all.h |  4 ---
>   linux-user/elfload.c   | 62 ++++++++++++++++++++++++++++++++++--------
>   2 files changed, 50 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

