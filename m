Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2A145A3A9
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 14:22:30 +0100 (CET)
Received: from localhost ([::1]:35464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpVkg-0002Ds-BB
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 08:22:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mpVgP-0007EE-Vi
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 08:18:01 -0500
Received: from [2a00:1450:4864:20::52c] (port=44770
 helo=mail-ed1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mpVgO-0007mr-77
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 08:18:01 -0500
Received: by mail-ed1-x52c.google.com with SMTP id l25so75131292eda.11
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 05:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bhA4zdZNqXIC+RZaaUHxcAuXQQWiYKj0LMdX+qPeZes=;
 b=ilxRpTKza2VY67j/A2f3p6rcdI6seo3emF4xWkaEeRuFrAbDzA3tYVd1aEQQ9p7NVk
 mkbqemy4TYNscka4Qw3elVteCr4pT5cqj6XJNYQ3VpzfB/w1O9GZJqO+s6btxQeOkeRG
 t5baPeNe1Q2jJtO/1wqNEIGXuX44ZhHSbWFgNLXWppm2CaJd+DXOjr4grabjyr14J4sw
 hCWqL/0RlTKZtDTGDR2Lz9/+vhvPVS/amrKFbefBlaJODdsPKIRvDHCf4fReEnfBwFJN
 Z9eyxn/WJy6bcuQ9FMH9Daxtj//7k1kpiuZ27E79x6PUvvDIC0qgsPKTouTF3Vv+4X+Q
 asTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bhA4zdZNqXIC+RZaaUHxcAuXQQWiYKj0LMdX+qPeZes=;
 b=BVN1g8dIRr3UldzNgkP957Vh6AdU1BSqa/Ejl1WyrTOEbg1e4k4y6GZriIKRwLJV6U
 WVij4dfHpf0ZwrPME0P6UWePC2zuqQ4+lpytR9KzFS/KycZ2EcwQ2eLuEHdRmtKagEEs
 07jSVitBJujcaouaQBc2rPpCMvCjNHAzronv+MivYeeCfNP2QIqpJxafWz5sBLcFyVt8
 3T3nGaKVqQ9KDSjlzSDp7OjYiI7OnwZLa1pUpsdfMpPB40AjPBxCD16yv+jdCs0dmc/V
 prH+17r3zO7SD4Zsk+Hi0jxZSLiY/X5+HCWmGisRoL3/Zc60h/vlytxlEYPWN9Ol8W9p
 84YA==
X-Gm-Message-State: AOAM532dJTMpPUEkRSviYb7rhgCTsHTHpiru/9MxnLLKRh5jyWqxL2wb
 /14EcIPZ83F2gbfak8jmRBM=
X-Google-Smtp-Source: ABdhPJxaPki59JHnQ+IckLWRALu2YO8Viuv8BOVYnTOjZqKRC+waI20Kxrsl6w7Ykn4OOXvhMtOHRg==
X-Received: by 2002:a17:907:94d4:: with SMTP id
 dn20mr7574038ejc.379.1637673476868; 
 Tue, 23 Nov 2021 05:17:56 -0800 (PST)
Received: from ?IPV6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.googlemail.com with ESMTPSA id bd12sm5756565edb.11.2021.11.23.05.17.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 05:17:56 -0800 (PST)
Message-ID: <6ce18451-892b-54cb-a0d3-5c7fd471ea98@redhat.com>
Date: Tue, 23 Nov 2021 14:17:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH-for-6.2 v3] qdev-monitor: Only allow full --global
 <driver>.<property>=<val> option
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20211119182644.480115-1-philmd@redhat.com>
 <87czmv1fof.fsf@dusky.pond.sub.org> <YZuZUVAho51eoVXA@redhat.com>
 <87ilwkjm63.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87ilwkjm63.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-3.515,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/22/21 15:32, Markus Armbruster wrote:
>>    qemu-system-x86_64: warning: global cfi.pflash01.secure has invalid class name
>>
>> what's going on here ?
> Off-the-cuff guess: cfi.pflash01.secure=on gets parsed as
> 
>      driver=cfi
>      property=pflash01.secure
>      value=on
> 
> Once again our "anything goes" attitude to naming wastes us time and
> thus money.

I'd blame more the sscanf parsing.  Anyway, -global 
driver=...,property=...,value=... works just fine in all cases, it's 
just more verbose---and it might even be easier to use for Libvirt, if 
it can use its usual QemuOpts-building facilities.

Anyhow, this patch breaks existing clients, as pointed out by Markus.

Paolo

> In contrast, QAPI restricts names to "only ASCII letters, digits,
> hyphen, and underscore" (see docs/devel/qapi-code-gen.rst section Naming
> rules and reserved names).

