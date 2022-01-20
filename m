Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FAB49555F
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 21:23:06 +0100 (CET)
Received: from localhost ([::1]:43212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAdxZ-000707-FU
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 15:23:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAZr6-0002pt-Ut
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 11:00:14 -0500
Received: from [2607:f8b0:4864:20::1034] (port=52024
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAZr5-0002Lf-52
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 11:00:08 -0500
Received: by mail-pj1-x1034.google.com with SMTP id q63so1604535pja.1
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 08:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=E2NwPvpw7/Iv0hZpGbR5lbFjImW1o2Zu5gl8KC+aX7o=;
 b=nUQaR+b1LILfSYlXkzauOew2bBDdyxqsTrz4d9/0nlxIRhjDr/BhNjhDAa/AJ1AYVj
 2baKJVOLgo54ayalTfijBo9odMW43wSD0nbAMg2NFj4vUcU4aSTme3NYLZaJ24GwCb0S
 SfzGOvulX8+RyfYgIMCVe/R9Bk8xX5P9vqpT66w7oq+ornQU6lCcskkXworF5TxDiavv
 vMQ4eHIwqTjOrfLfZb0mvI6HWdMeAPfqf+znabctIt3SmW8nxrW0Akzhrr4O70CA+XRL
 9jpfPyA2KNURo/cbTW9jY44k4jaBavEj2CfrQcAVz2Kl0DUKHvYbqkrcwM5O37qOp9qb
 hJXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=E2NwPvpw7/Iv0hZpGbR5lbFjImW1o2Zu5gl8KC+aX7o=;
 b=CybB+2MLXJXPSu+hZ6w7fiA7rIlNDn0v3r31zKLSlDnKvPcO9iEMGY/eKa3E/4WYls
 YSIiiACxJP3xrBrk+RugRjs4yXYSvxVje1BLUIcWsQ99FY+hU49+P27cRM6nlXJRk1yr
 lw0RhfHUiyHspo784CWGjgQ+oi8HveB3lhYaf72sx59U/VD1m1qjrerJlrvxgVWSCNnd
 cq79Lrp7EJcf067n4j9j2aqf23WXkZb2V3jkjsEyCyy1LSSCyoq3Hjh5y4fb7Jrm7CsD
 AR8UhAIZx/Dj3h0g1IeaA1JfkJvC6VJst4PzZiLhk7I+hm9EAsYbbCF5JfaIHuiyigGY
 u2Sg==
X-Gm-Message-State: AOAM533cC4sA2KClJf1EQlzjxk4ffO1U8PvbhdboWAiRDGAUxkqb7hsQ
 mAB0uBoJ1+wx8wwHlFL4Bg0=
X-Google-Smtp-Source: ABdhPJw3qFIVZoNspR8XYKA1fCYhAij7AVSvxCxXdAmNroCAmil6vBo8Ff1jQ6N55gbhr1JPeoXxJg==
X-Received: by 2002:a17:90a:fa88:: with SMTP id
 cu8mr11397194pjb.110.1642694405045; 
 Thu, 20 Jan 2022 08:00:05 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id g9sm4242225pfc.12.2022.01.20.08.00.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jan 2022 08:00:04 -0800 (PST)
Message-ID: <f073d8e1-3de1-29c8-29d6-005c615163da@amsat.org>
Date: Thu, 20 Jan 2022 17:00:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH v3] qapi: Cleanup SGX related comments and restore
 @section-size
Content-Language: en-US
To: Yang Zhong <yang.zhong@intel.com>, pbonzini@redhat.com, berrange@redhat.com
Cc: qemu-devel@nongnu.org
References: <20220120223104.437161-1-yang.zhong@intel.com>
In-Reply-To: <20220120223104.437161-1-yang.zhong@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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

On 20/1/22 23:31, Yang Zhong wrote:
> The SGX NUMA patches were merged into Qemu 7.0 release, we need
> clarify detailed version history information and also change
> some related comments, which make SGX related comments clearer.
> 
> The QMP command schema promises backwards compatibility as standard.
> We temporarily restore "@section-size", which can avoid incompatible
> API breakage. The "@section-size" will be deprecated in 7.2 version.
> 
> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   docs/about/deprecated.rst | 13 +++++++++++++
>   qapi/machine.json         |  4 ++--
>   qapi/misc-target.json     | 22 +++++++++++++++++-----
>   hw/i386/sgx.c             | 11 +++++++++--
>   4 files changed, 41 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

