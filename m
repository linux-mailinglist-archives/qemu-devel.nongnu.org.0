Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4DC2F1227
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 13:11:46 +0100 (CET)
Received: from localhost ([::1]:55928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyw2z-0003Mc-63
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 07:11:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kyw1Y-0002pg-Ei
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 07:10:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kyw1W-000434-1p
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 07:10:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610367013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UxE5ezHhgoKlNGWNFScNQrbalNoziohZpuUamMzPxHc=;
 b=LhTSb8Ur86+O6VREWtPCHls+mPLsjIaMuLuNdMrivjpGoapcPyYGDU67mWvv3XlIrN/Ybu
 EAch9Qx02G0/ZoKFNUEUulKRghcDCpIsId0X+zvd2bsjYiA5V3CdiwrMt1G4a7oKTtrqM/
 uDJk7SBCANrHN1uWApbQwnKa38ZMnvQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-DuJbh8etPu-tpmoivzDh1w-1; Mon, 11 Jan 2021 07:10:11 -0500
X-MC-Unique: DuJbh8etPu-tpmoivzDh1w-1
Received: by mail-ej1-f71.google.com with SMTP id m4so4920684ejc.14
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 04:10:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UxE5ezHhgoKlNGWNFScNQrbalNoziohZpuUamMzPxHc=;
 b=PeDcVKsrUncK2BAzNXMlHi1+R1F6mQdlAsXRODovDRyz8M9I3fjrF2FHIDqH5NN+6c
 62j0aZS1Dpqs+R3AS0T6ZgrBeNGnFHJZfk5Uuk0C6n8iX2X48NpPG9DRAKX7MeepPtr2
 QoODvGSquBQvGAIzyuTNrZYEzav2k62fu5kUis2FXxa4raghGsflXx4qfnFtpNGDho6/
 ygUajZk3agMydEUBg5AJprr+BMCIXZcIvm8MmiBSvzxRwvXFvpXOcqF+//eY94mk72vP
 uo6WU7WyJTySNMc5Emh2KjdJTlTpgu1xsBoHf1eMy3wGxdcugvRpO6M37xrr4+dzVUSv
 2CMA==
X-Gm-Message-State: AOAM530rwyXKcxo6Rbu8jVKxs/wOITxkI18adOnXwRb8ds6gQ+IdmeNj
 dfC+Pz0uL3UFovrdF6vA3+xTK1LxXsMYAMAqTx2hS8IoiEUAhuOVGBf68iT6k0IrHqagV++tNFL
 WCgtDKezBtIK6Zyyvs4NfupariZfvAPfKBDbdYhg27or2iBBQDHUo+6m1i609L8ze
X-Received: by 2002:a17:906:af49:: with SMTP id
 ly9mr10158353ejb.38.1610367009550; 
 Mon, 11 Jan 2021 04:10:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwHaMxJNshztZNMpkTsR/b6sV455fSMEBxcYaSqE4HHuTGB4WT/vyvcExhDf5nbRY9mhNbYKg==
X-Received: by 2002:a17:906:af49:: with SMTP id
 ly9mr10158335ejb.38.1610367009189; 
 Mon, 11 Jan 2021 04:10:09 -0800 (PST)
Received: from [192.168.1.36] (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id z12sm7005960ejr.17.2021.01.11.04.10.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 04:10:08 -0800 (PST)
Subject: Re: [RHEL7 qemu-kvm PATCH 2/3] s390x: Fix vm name copy length
To: mrezanin@redhat.com, qemu-devel@nongnu.org
References: <cover.1610364304.git.mrezanin@redhat.com>
 <e1ad733af7b23929456d05aacae693ce6462d4b3.1610364304.git.mrezanin@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5acb5521-fdd2-e511-9cc3-176086183dd5@redhat.com>
Date: Mon, 11 Jan 2021 13:10:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <e1ad733af7b23929456d05aacae693ce6462d4b3.1610364304.git.mrezanin@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.012, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Hi Miroslav,

On 1/11/21 12:30 PM, mrezanin@redhat.com wrote:
> From: Miroslav Rezanina <mrezanin@redhat.com>
> 
> There are two cases when vm name is copied but closing \0 can be lost
> in case name is too long (>=256 characters).
> 
> Updating length to copy so there is space for closing \0.
> 
> Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
> ---
>  target/s390x/kvm.c         | 2 +-
>  target/s390x/misc_helper.c | 4 +++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
> index b8385e6b95..2313b5727e 100644
> --- a/target/s390x/kvm.c
> +++ b/target/s390x/kvm.c
> @@ -1918,7 +1918,7 @@ static void insert_stsi_3_2_2(S390CPU *cpu, __u64 addr, uint8_t ar)
>       */
>      if (qemu_name) {
>          strncpy((char *)sysib.ext_names[0], qemu_name,
> -                sizeof(sysib.ext_names[0]));
> +                sizeof(sysib.ext_names[0]) - 1);
>      } else {
>          strcpy((char *)sysib.ext_names[0], "KVMguest");
>      }

What about using strpadcpy() instead?

    strpadcpy((char *)sysib.sysib_322.ext_names[0],
              sizeof(sysib.sysib_322.ext_names[0]),
              qemu_name ?: "KVMguest", '\0');

> diff --git a/target/s390x/misc_helper.c b/target/s390x/misc_helper.c
> index 58dbc023eb..7c478b9e58 100644
> --- a/target/s390x/misc_helper.c
> +++ b/target/s390x/misc_helper.c
> @@ -369,8 +369,10 @@ uint32_t HELPER(stsi)(CPUS390XState *env, uint64_t a0, uint64_t r0, uint64_t r1)
>                  ebcdic_put(sysib.sysib_322.vm[0].name, qemu_name,
>                             MIN(sizeof(sysib.sysib_322.vm[0].name),
>                                 strlen(qemu_name)));
> +		memset((char *)sysib.sysib_322.ext_names[0], 0, 
> +		       sizeof(sysib.sysib_322.ext_names[0]));
>                  strncpy((char *)sysib.sysib_322.ext_names[0], qemu_name,
> -                        sizeof(sysib.sysib_322.ext_names[0]));
> +                        sizeof(sysib.sysib_322.ext_names[0]) - 1);

And here:

               strpadcpy((char *)sysib.sysib_322.ext_names[0],
                         sizeof(sysib.sysib_322.ext_names[0]),
                         qemu_name, '\0');

>              } else {
>                  ebcdic_put(sysib.sysib_322.vm[0].name, "TCGguest", 8);
>                  strcpy((char *)sysib.sysib_322.ext_names[0], "TCGguest");
> 


