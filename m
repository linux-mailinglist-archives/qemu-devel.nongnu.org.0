Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E8B4D54B2
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 23:39:52 +0100 (CET)
Received: from localhost ([::1]:54348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSRRn-0000yr-LI
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 17:39:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nSRPP-0007JD-Bj; Thu, 10 Mar 2022 17:37:23 -0500
Received: from [2607:f8b0:4864:20::432] (port=38609
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nSRPN-0004RG-U8; Thu, 10 Mar 2022 17:37:23 -0500
Received: by mail-pf1-x432.google.com with SMTP id f8so6332565pfj.5;
 Thu, 10 Mar 2022 14:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WEB5Guoebq/o/GFYDyYRwa2n7RLftrv874f54EF+fs0=;
 b=EQEPkxpbJj3F9gS+gQmKLakhEebRzthbqr198DY7YPaODrw8099tzQMvosg26uQylP
 Qfb7QrsieT+HGYELfojNLfsFXQXrzrWQfBUYg/CPLSMEUGjOmYcgYJSIUtEDzYy8Jkd+
 uqgPO4puYShT3J0PJ/p91axVCByk1lMCS16Y1LICyfEfNBZ2jmfABf4ty7KJI5hZWPNq
 Tl7azwdLwBsYAWxVVJfxy2EqCSGM4EJu7HLRZfIuByEOorTXqSx87+T7CjgdM9FS/V7l
 uq9ne+fr253hHZE5JpfMQATdl6LMF9ejsevUpsW3hE9lEc0d/tIuoWOUed5f0nBniw5V
 8QmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WEB5Guoebq/o/GFYDyYRwa2n7RLftrv874f54EF+fs0=;
 b=I9tqRWXP3vLqLAWON8BD5TIwOcaYApeURTXzTeU0eMLUqbzG3OMM7gke566Yvcf8Ya
 hnIBJA5DbMWSBbG3Yb3ulqcsdll9osqDGE321i7FV11aFQ8eEGeOLgejKcPa95/Fva7e
 c022MImBbwCFjGrLINHQQys/GxgicUzqU7BlmLp8f54oh0CYYk4WYHhRWlslto0OYhZc
 Grxb8F960h2HIATkbWZruBDFEVlMQG715ohJ4p5ix5fLJxm1wo7kOBKiy8fhibUvraHr
 BqqY46kKucJvq0vC3sRb34artM4WICjgW9m9sSy43o4LuRORzVnCB4vASeAsAohD+K9V
 r3jg==
X-Gm-Message-State: AOAM533wO+Rft0UbenLuo3HA1u0D1kfNi9w8WNPgSuqsKUU9sITnUb6M
 IE62hpSNwNCJ9avcf/EWUcM=
X-Google-Smtp-Source: ABdhPJwdS/ZoTM4HKrK0FQSN7cbqFYBX0M+1in8JB8rpP2GW+3vxWTSVxK6cYviBKOOSd1aNSDIqqw==
X-Received: by 2002:a63:db14:0:b0:380:e306:de7d with SMTP id
 e20-20020a63db14000000b00380e306de7dmr4234510pgg.469.1646951840179; 
 Thu, 10 Mar 2022 14:37:20 -0800 (PST)
Received: from [192.168.1.34] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 y5-20020a056a00190500b004f104b5350fsm8356136pfi.93.2022.03.10.14.37.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 14:37:19 -0800 (PST)
Message-ID: <ebd6fddb-5549-11e7-fd06-16a2e34f2276@gmail.com>
Date: Thu, 10 Mar 2022 23:37:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 8/9] avocado/ppc_prep_40p.py: check TCG accel in all tests
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20220310183011.110391-1-danielhb413@gmail.com>
 <20220310183011.110391-9-danielhb413@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220310183011.110391-9-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x432.google.com
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
Cc: muriloo@linux.ibm.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au, farosas@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/3/22 19:30, Daniel Henrique Barboza wrote:
> All tests in the file times out when running in an IBM POWER host and
> --disable-tcg with an error like the following:
> 
>          Command: ./qemu-system-ppc -display none -vga none (...)
> -machine 40p (...)
>          Output: qemu-system-ppc: Register sync failed... If you're using
> kvm-hv.ko, only "-cpu host" is possible
> qemu-system-ppc: kvm_init_vcpu: kvm_arch_init_vcpu failed (0): Invalid argument
> 
> Since we don't have a way to detect whether the host is running kvm_hv
> or kvm_pr, skip all tests if TCG is not available.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   tests/avocado/ppc_prep_40p.py | 6 ++++++
>   1 file changed, 6 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

