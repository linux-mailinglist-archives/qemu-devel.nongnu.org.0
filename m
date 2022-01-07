Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4B0487944
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 15:52:53 +0100 (CET)
Received: from localhost ([::1]:56998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5qbs-0004rY-6U
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 09:52:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5qMO-0005cx-0T
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 09:36:53 -0500
Received: from [2a00:1450:4864:20::32e] (port=41931
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5qMM-00005L-LI
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 09:36:51 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so939183wme.0
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 06:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xjEgdyrSfgm1eJL6sb6/RcT9bsbI/Wp78u8ITtA9ecg=;
 b=ZnPKdBzFSvjdLdDOiZYbBEXx664n/DQ0JX41Rx2/VwMoDEdxEpfkrTkxnVz5FN+L9l
 ZPtmAHCi2GcLJxSkSRbWOa7UBnLpwYHXShLvlMqrTfLxp0zbIEyHyhjRAtCOxItqBDGN
 6sWBZqfvz+kB4x7o6F3GPNGdb1+roL4YhQKAbuiaP/ERHxNQAq73ubOabQVRyAjls51N
 +A9VKggU0kXA3icwaS6a2TFjEr9DxEumnzSk9vP0tXQHGuCHRNpOok4ou5GLoM0J6nv0
 aaLq+4AYN53NWgXBNR+Fy9NOEenyorpKaJ5C0jjPbzJgErbR9s1WOUJcxGRG7yzp5nvD
 UDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xjEgdyrSfgm1eJL6sb6/RcT9bsbI/Wp78u8ITtA9ecg=;
 b=P5VS1JZBF4QEKlFXRaLjELkRkiXT7P2PZ0ItZ9RHcjdctp0RAb6RPU05neIRn+z68W
 E8+hCFwzxOwAf+VG3AECDWDzx0k4zB9edrVfsjmRcVaXqs4x4v7i6cwVDvHt9Y3vkMgQ
 GID0pTYpXZCZEWPC7/Nab/gccP6uK3SkPXYafpznvo5RszmShBmDAYnybVZ+9O3Wqst1
 LQNMfIRWHCf/wiMKiDofu3quACfv+5q1k5kC7C4Khr4ZM+zufHU5/diOOPc2ofEeXG5I
 JZr8/FlEvHmA2EmLMiJDG03xmt06EouANLM/Myg/kn0Nl1Gg5Ho4BQvYHfkKJyaXUPwH
 55ow==
X-Gm-Message-State: AOAM532GqjHdlGDNCOigIcAsGhdJ8h2mOkVVVKpIBsb5l8k0F76zor4l
 Xaoyl5MNyHPr2zRgDblMI2A=
X-Google-Smtp-Source: ABdhPJwXrhV/V8bbiX2Bb7FTMtLBXQ/Ws+d7Qn3YwOIH6cVE6LHs9nqr+RlVhy/c/x2x8spq+y4h1w==
X-Received: by 2002:a05:600c:219a:: with SMTP id
 e26mr11673057wme.136.1641566209437; 
 Fri, 07 Jan 2022 06:36:49 -0800 (PST)
Received: from [192.168.1.33] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id g9sm5215511wmq.22.2022.01.07.06.36.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 06:36:49 -0800 (PST)
Message-ID: <b4ecefed-9fce-5759-8cf0-c107e70907c4@amsat.org>
Date: Fri, 7 Jan 2022 15:01:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH 2/4] linux-user: Map signal number in PR_GET_PDEATHSIG
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220106225738.103012-1-richard.henderson@linaro.org>
 <20220106225738.103012-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220106225738.103012-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/1/22 23:57, Richard Henderson wrote:
> Convert the host signal number to guest signal number
> before returning the value to the guest.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/syscall.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

