Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 319684DB5B4
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 17:13:40 +0100 (CET)
Received: from localhost ([::1]:50812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUWHL-00067j-AO
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 12:13:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUW6o-0004a4-4b
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 12:02:46 -0400
Received: from [2607:f8b0:4864:20::532] (port=44821
 helo=mail-pg1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUW6m-0006zT-8v
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 12:02:45 -0400
Received: by mail-pg1-x532.google.com with SMTP id c11so555408pgu.11
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 09:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mpUnT8/uMbSmg3Gb8ufRStKXl/ghXTCE44J+mp5OPcc=;
 b=LMtu9OWE2zYVnZiH5aeGPjaEkHZ5uW7XM6M7aaIIdVujnHY6TpfAIE2F9eQoqBP8PN
 IED9CWQvIHcvB+g5+Mrl6DTGw5e1miReHeNSxdUAF1oZ0Ai4e+UKc3XdFRtcpp4reeYx
 WDmpliI/HjW19uwtwCqL5QCV/wrrVE2ovOZw6181/IxpC0pmpcTXcxbbrbBqmRVElwRs
 JkwbYIm7SbwsUdIkgb+vUT2XJHz2RuE2w11RaHZIOI1Q6Qc9miadFUIe50y5W6T/X7cW
 NCnAu6AODNDypbZJrLAFxhEqkDJqSogjOCDNKpeFfc9TVDA6huQA4NSuWhiOr2Ck1fIY
 fyPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mpUnT8/uMbSmg3Gb8ufRStKXl/ghXTCE44J+mp5OPcc=;
 b=kznotrHazqGejH5ceeqmp6b1OIEt+ZQ1Qohe9oNeIKTZXarKGi0tRfLFw8YwyESynU
 7VDZuYQvaMuWvJcWeScBw8q0nJqPdwxIWNUd6ZMw6vHPLo65hdmKSSMYjbbtDFGTJg+w
 /CCAyFFBUT3QTICmVfNoy+V+hiiaY7zn1HrOgbi81jHj39WTe5enUhyREws6bVQj8cJH
 GG9q6CRkngAHuwEjCMJrIvhGiOZvLLUrxAG8blLR9a9syGxctZxjC7d0OHl+fqpMn+ln
 9mPzOsS0CvMX7d8owRkBvKKURDTuNCtc97ym9pQmQJfiItnBqSlVJKipTqGrb6UBpGop
 jMmA==
X-Gm-Message-State: AOAM530diO6exoOquMqxs4r3/5U0xdwsxd5qiOjKPoKYyfYLX4Ehc95/
 BK3PZQvarBdwE6QdY4D5tz0=
X-Google-Smtp-Source: ABdhPJx+DxoRQCXH+vl+kqV3omU65WntjcbDhbs+V3jwFCIL4MrYN/IJVHfBpb8X6dgeQOrtYqlDXQ==
X-Received: by 2002:a62:18cc:0:b0:4f6:fdff:5440 with SMTP id
 195-20020a6218cc000000b004f6fdff5440mr518948pfy.35.1647446557288; 
 Wed, 16 Mar 2022 09:02:37 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 x190-20020a6286c7000000b004f6bf60b958sm3471349pfd.125.2022.03.16.09.02.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 09:02:36 -0700 (PDT)
Message-ID: <dbecd60e-9c63-11b8-76fc-4ceda7efa3f4@gmail.com>
Date: Wed, 16 Mar 2022 17:02:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [RFC uncompiled PATCH] cocoa: run qemu_init in the main thread
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220307151004.578069-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220307151004.578069-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::532
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x532.google.com
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
Cc: peter.maydell@linaro.org, akihiko.odaki@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/3/22 16:10, Paolo Bonzini wrote:
> Simplify the initialization dance by running qemu_init() in the main
> thread before the Cocoa event loop starts.  The cocoa_display_init()
> code that is post-applicationDidFinishLaunching: moves to the
> application delegate itself, and the secondary thread only runs
> the rest of qemu_main(), namely qemu_main_loop() and qemu_cleanup().
> 
> This fixes a case where addRemovableDevicesMenuItems() calls
> qmp_query_block() while expecting the main thread to still hold
> the BQL.  The newly-introduced assertions in the block layer
> complain about this.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   softmmu/main.c |  12 +++--
>   ui/cocoa.m     | 122 +++++++++++++++++++------------------------------
>   2 files changed, 53 insertions(+), 81 deletions(-)

I got this building and it indeed fixes the issue reported here:
https://lore.kernel.org/qemu-devel/cecef6bd-951a-aab6-e603-96e3551e3e9e@gmail.com/

I will post as v2 and let you iterate :)

