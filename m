Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 243E74994BA
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 22:03:10 +0100 (CET)
Received: from localhost ([::1]:43458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC6UY-0004bx-2Z
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 16:03:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nC66X-0005ma-5H
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:38:21 -0500
Received: from [2a00:1450:4864:20::435] (port=39584
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nC66V-0006Tu-09
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:38:20 -0500
Received: by mail-wr1-x435.google.com with SMTP id s9so24043wrb.6
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 12:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rxRFLvA9NNs/ryz25gbrKTCpfqm+gzmR29cxfKVYCXY=;
 b=HtLqikM59exWDeFp3TNb88tsOno1yC/j36Kki+NT7UqQTNXsAQTcWms525XumAY8QY
 LL31FNI+T9EViCzhzxgpreEzqv4Nd2ayqcHK2N4a4aPWO1mb981aPvTl30c7J1YXdr9l
 xESaY4WYeN4CG8JyvHPn7tETDlBJPEl3zak4jUqGJsHTPpG0ucAyDqqq3ncHcVgeFoHa
 kZHi1u37wyrvUcryyjf3thuVu9Wv9Fftwz8xs924J8wJtpNNa9/Yzgt37ETZVWZG3S+D
 rjqjbct1E54ueWewa7iY8nxjn/fsBw3MQhyq5201bqTje0lwFQRJj7UxDWsLX4n0gpGJ
 HomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rxRFLvA9NNs/ryz25gbrKTCpfqm+gzmR29cxfKVYCXY=;
 b=cSV+ALDkp0KLsK+PV2K9yLtlI1X3r4zqlS3ek7Fv1Jpq+m6vKe3ISkgiOa4yx2dDfw
 9Wdew6N0bFvqNtOP0Mm00fQnnAQZrlsG9T5s2sbulxSP2CccwpA136vnuiEmu33YAdnx
 Wq3nwprbRXJBwDhaaQ20C0f6nWmV/bdDVtPoSDwIO+epInc17fCv0GHkxSGMiYPwb8sL
 y25epc8dS+LlDVhd8kGJvzEfb+iyHsnxCFIKYYBUMiZ8M3oR0waxZXR63K5WlKWYhl6S
 pQ4m2ikFWh06y0d/QJDfHzIHV3rwcAY5XakDGwv2YpNgId+xLX/bcsjKHom9cB+5qpAb
 AbnA==
X-Gm-Message-State: AOAM533ZYeZUR9+1oZJCEzl7Mta5xrBeFoPVgQ87wFlmtj6xsYLG4q54
 2VD0RqnvAIUm1LNoqgY+dV4=
X-Google-Smtp-Source: ABdhPJx2+JDW2Jn2RiotqZPIwVrc2Kaubnh9V4ex6qkzavjsKM+oYrBVI7H+vPuR9fI6XvQJqfN0XQ==
X-Received: by 2002:a5d:6947:: with SMTP id r7mr15967268wrw.510.1643056696521; 
 Mon, 24 Jan 2022 12:38:16 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id w8sm15116126wre.83.2022.01.24.12.38.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 12:38:15 -0800 (PST)
Message-ID: <5ab5bfa8-e87b-7aa5-4135-13afb8cf5afc@amsat.org>
Date: Mon, 24 Jan 2022 21:38:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 01/22] tests/Makefile.include: clean-up old code
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: aaron@os.amperecomputing.com, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 Luke.Craig@ll.mit.edu, kuhn.chenqun@huawei.com, ma.mandourr@gmail.com
References: <20220124201608.604599-1-alex.bennee@linaro.org>
 <20220124201608.604599-2-alex.bennee@linaro.org>
In-Reply-To: <20220124201608.604599-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>



On 1/24/22 21:15, Alex Bennée wrote:
> This is no longer needed since 5516623020 ("meson: convert migration
> directory to Meson")
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/Makefile.include | 4 ----
>  1 file changed, 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


