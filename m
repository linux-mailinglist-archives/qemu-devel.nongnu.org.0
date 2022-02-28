Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD9E4C6EA1
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 14:54:42 +0100 (CET)
Received: from localhost ([::1]:56448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOgU4-0006XT-TW
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 08:54:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOgCT-0005RI-5o
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 08:36:29 -0500
Received: from [2607:f8b0:4864:20::62d] (port=33320
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOgCR-0004bj-PB
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 08:36:28 -0500
Received: by mail-pl1-x62d.google.com with SMTP id c9so10778314pll.0
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 05:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=xB6kNi1U5adbcBbbVsdzBMA0Ai+rjKLE+BlXnHJbYts=;
 b=U5xQ0FUvl4hVan+nPDjp2jrkmmWYokZkN60vNAFHmSdPA/9gokl0siosjuEZ4MIT6q
 iGtv0Yov/OXgGl/Wzve+LoO34yGY69pASukXac2afCkSTb1GdP7qF4zXAtd8tX6mD90L
 h//lIYA/QUCALxYJfsGEMu6r2sR/CB4oJiELKQ7TkbM6+izgHWHpLe6dSprnbWsfB0NS
 bSxr5OI98FK66XVZbpK3eQuZmn5E60xNX8qcCi06h+OavO9/5eDEp52iF7MXCgHAzQTg
 sfnCm6iNAiSBYkUkw9tTwIW9lbyGgfIXXvtBnAY5VVOLScTzWfUBIytWWcmUhibY2oFK
 p7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xB6kNi1U5adbcBbbVsdzBMA0Ai+rjKLE+BlXnHJbYts=;
 b=eScj7og33syGNVGvGJuLcUNaROpX3uH0SP9vC9wFAHGWS3xZc4Zn4jKFWzhL6LG176
 A0o6Ebikb6YOB7j9pT+MLgI5TIjSKwGKyDsdcfTqxLK1tPZt/QedZvlTOf6AIG9gmaHu
 zC/qxOjwJWPkFBwKcP8/WMua3PeSNrZHYq0oE3gjGii6cNywDO5vjWsWNCDDXujxa3Rj
 bgNwEmaMRW0yQNh98xpre6ZdyPe3gurj89Czq3kpslcHq8K6Tq1kMv+TuRQVyx67pwJ3
 ZnMNQMYsqY+4ROlQNP9WbPXYq/q3fSOvt0peBZO0lfNZUyygKa/tSQLbekIPvT+W/hjD
 LQ3Q==
X-Gm-Message-State: AOAM532hal7ummqf9R1Ilw0LHkK+MTbzKC4JHT0LEFZVtiI1By3h4V6P
 b4DMfW0D9c8CS5zgL0oqQmE=
X-Google-Smtp-Source: ABdhPJyjNwqysdAl1o4aBeg9CapYssA9sNRyDMEzjtaUZCOnDcLi7Wqd8go5fXv/ki/J6rxuWSIOAg==
X-Received: by 2002:a17:90a:8911:b0:1bd:395e:40e5 with SMTP id
 u17-20020a17090a891100b001bd395e40e5mr7173879pjn.121.1646055386248; 
 Mon, 28 Feb 2022 05:36:26 -0800 (PST)
Received: from [192.168.64.175] (22.red-95-127-166.staticip.rima-tde.net.
 [95.127.166.22]) by smtp.gmail.com with ESMTPSA id
 j16-20020a63e750000000b00373598b8cbfsm10408902pgk.74.2022.02.28.05.36.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 05:36:25 -0800 (PST)
Message-ID: <3151a3bb-1c36-8c96-df03-33aa09561c9e@gmail.com>
Date: Mon, 28 Feb 2022 14:36:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH] x86: cleanup unused compat_apic_id_mode
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20220228131634.3389805-1-imammedo@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220228131634.3389805-1-imammedo@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62d.google.com
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
Cc: pbonzini@redhat.com, thuth@redhat.com, richard.henderson@linaro.org,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/2/22 14:16, Igor Mammedov wrote:
> commit
>    f862ddbb1a4 (hw/i386: Remove the deprecated pc-1.x machine types)
> removed the last user of broken APIC ID compat knob,
> but compat_apic_id_mode itself was forgotten.
> Clean it up and simplify x86_cpu_apic_id_from_index()
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>   include/hw/i386/x86.h |  2 --
>   hw/i386/x86.c         | 16 +---------------
>   2 files changed, 1 insertion(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

