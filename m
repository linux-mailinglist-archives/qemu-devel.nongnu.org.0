Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDE44AA815
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 11:33:59 +0100 (CET)
Received: from localhost ([::1]:54140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGIOE-0001Ma-01
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 05:33:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGIMn-0000C0-B7
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 05:32:29 -0500
Received: from [2607:f8b0:4864:20::1033] (port=35721
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGIMl-0003XX-Qg
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 05:32:28 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 z14-20020a17090ab10e00b001b6175d4040so15469180pjq.0
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 02:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MXqskXjlRTgffCfAb4cuF4AJ8viewcZWawNHt0ERLkg=;
 b=MNVscICg5TD3F2JscP4mc4PSsot7vqnLignSeZ84AJTEvjdb3uYHCCksm9Iv0XViD/
 5KntQmsqDXpCyw4yD4+rzG0QTiVqaWUMEuO/t1OEkwy51yC4SNnzJhAD8mXBJYvgspM3
 l41haoS2zoYpeN0bQtMB5re0VZLduUcuCCIWvmflUCInKcYhCssgQhrSFo+czSpSpyq1
 eWpvYwE+uVXY6sJDCzYFcsm3Sy/KMEerla5RAvhKJZrSmRV16dbLxM9Ux4nAAv6tWGA+
 VZY9UsBYJfRjGeGJN0G7PQLuwnGb11o/UTV8XE9OSyKUTaAfFOZLExg81aitkguZndwv
 agzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MXqskXjlRTgffCfAb4cuF4AJ8viewcZWawNHt0ERLkg=;
 b=MKuxNDsPSfuWyw+gCpL3xyedAS38Tb1RWbFXCsaUkwn5TUEQp8GY6cEa3xDJvuFA26
 CALKdp7ej8p2bm+HQYHSzCoJGob26pLlFruhHHUb0ySCww7dxrJagwt3Qjn3S3Um27BL
 BNiGP6XCNl074w/5c04YQC433sPY/NphnuoYtsTGHyXbGwEX1Iv1ZclEm5EZE2P+3tmA
 vKnQnurqPT4D3cdD19pVeHIsRxuYajnUKWrJ0hV/LUwp15SlL6jATKS7DvDeALGPek4a
 fZ5xUsDRtie283+Y/cfDro191NztokHei4hJSYoiT07pIweK2sbwUqZ+o0WtG0ffN1//
 b6lw==
X-Gm-Message-State: AOAM5300lktbVxmks9ArNGpO3zi2tU9hr33gPYFSiafFQBQb23wGtw2Q
 bIA3LIKajGYir8SGWJHZK0U=
X-Google-Smtp-Source: ABdhPJyRyZQw75aTX4xH24LxMrU5bNuanPT0us9eaCBMXV+WAH1YAkiYGyMfRYw8SIpZk/hK5QBKyw==
X-Received: by 2002:a17:902:7606:: with SMTP id
 k6mr4095649pll.56.1644057145449; 
 Sat, 05 Feb 2022 02:32:25 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id s12sm5165029pfd.112.2022.02.05.02.32.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 02:32:25 -0800 (PST)
Message-ID: <f4544f90-4fb4-dfad-48ef-8631cf3c7666@amsat.org>
Date: Sat, 5 Feb 2022 11:32:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v3 1/2] hw/i386: Attach CPUs to machine
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Yang Zhong <yang.zhong@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
References: <20220131233507.334174-1-f4bug@amsat.org>
 <20220131233507.334174-2-f4bug@amsat.org>
 <CABgObfY6+-GjEi9hfFs2x6CRctPHFBt3hxwRK_73tL8Hm4on5A@mail.gmail.com>
 <7cd97d2e-30a6-3857-464e-f39ddd98a407@amsat.org>
 <CABgObfb8EQxObAnBJKSq=OMCFhkL7FzNFCn1H=HoCyxz03R2Fw@mail.gmail.com>
In-Reply-To: <CABgObfb8EQxObAnBJKSq=OMCFhkL7FzNFCn1H=HoCyxz03R2Fw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

+Igor

On 5/2/22 10:21, Paolo Bonzini wrote:
> It broke check-system-debian in CI.

OK. This is odd because I am using Ubuntu 20.04 x86_64 host and
can not reproduce. I'll investigate.

> Il ven 4 feb 2022, 20:31 Philippe Mathieu-Daudé <f4bug@amsat.org 
> <mailto:f4bug@amsat.org>> ha scritto:
> 
>     On 4/2/22 18:59, Paolo Bonzini wrote:
>      > This is causing breakage in the acpi-tables-test, sorry.
> 
>     $ make check-qtest-x86_64
> 
>     Ok:                 49
>     Expected Fail:      0
>     Fail:               0
>     Unexpected Pass:    0
>     Skipped:            7
>     Timeout:            0
> 
>     $ make check-qtest-i386
> 
>     Ok:                 52
>     Expected Fail:      0
>     Fail:               0
>     Unexpected Pass:    0
>     Skipped:            4
>     Timeout:            0
> 
>     I am confuse, how do you run it?
> 


