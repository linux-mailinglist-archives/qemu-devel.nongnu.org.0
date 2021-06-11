Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 936053A4798
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 19:15:21 +0200 (CEST)
Received: from localhost ([::1]:60878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrkka-0000kv-2M
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 13:15:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lrkir-0007vK-A8
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 13:13:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lrkin-0007vv-U5
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 13:13:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623431609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mmu2BfqGBR4RfnVhwzwu6LOQ8i+eOG0k7q4q6SUKcnU=;
 b=ZjzcXwo+Tw0OhZCfqlYYZOXQILgcsmYn0SdKsAFmCz0WpszKIyLYlIbWQ5V6zM0jMtCtAb
 kPyPIF7gxRF23aKQ1a/udVIsofsdCeolplUuVPXlK/nwsfZgnRAJPVEveGQhx+3LZnuXkU
 DO7M6Qo5Ajv9+IRrwsEIni0J1z50phQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-ta4aPK3gMJySC95gmS5_PA-1; Fri, 11 Jun 2021 13:13:26 -0400
X-MC-Unique: ta4aPK3gMJySC95gmS5_PA-1
Received: by mail-ed1-f72.google.com with SMTP id
 t11-20020a056402524bb029038ffacf1cafso6834980edd.5
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 10:13:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Mmu2BfqGBR4RfnVhwzwu6LOQ8i+eOG0k7q4q6SUKcnU=;
 b=lCwcI7deJtxMbtAaAvoTRZTG2aWW1b8ng/tccJ7/40lWMJlDDHLv3CGIGE5NAcyL2A
 slN3Pl0Ewv07EMhXLNvIM0jNCR/ZVBrXkHehMZVNphzq1DBRxdyqyFMoI9aDkt2Cv4A3
 AGNZR3VIEOiWfIQX3ciluDRCgWrEXvIcymM6O4WXwTFR8qUE1M2gEPafftsCsiaT7VYP
 m3YeR6FK0qreyhUl9QlwXXUGqfNlIkHbLH2HY4Nw7wS+mAKm7gCc9txMe6aOxA75Ydn/
 6TbUVnkdvviGnGB7+H1FgNwtPqqhl+vDbPkFR/it4iVLTIKReJWCy45py2cKChBQZIz4
 9xfQ==
X-Gm-Message-State: AOAM532zECUsBH7GBdm07UoQGbXBgzHlBQHh1yHCp+CamwyyjOFSSQMs
 TO/RKBkJzBAfMyUF1q/lGzqNqW7WDVOkxJe0K6KF5Lb7Vb4R5bUb98UlrmvXyDoHINEQp7BT5S4
 Qek9HbKv7lT5TcsupLA6Y7vXwc5zIWmVdkYbKPEhb9Gc14g96uMymz9JGOO267/knEqk=
X-Received: by 2002:aa7:dbc3:: with SMTP id v3mr4837349edt.63.1623431604581;
 Fri, 11 Jun 2021 10:13:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqxoN1BtLFqmJEzj+UwDTtirnSqWCqd9rfPf3Tfd1MyA2a2mgADxqA09ighj98pJv6t7r0OQ==
X-Received: by 2002:aa7:dbc3:: with SMTP id v3mr4837323edt.63.1623431604316;
 Fri, 11 Jun 2021 10:13:24 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id q14sm2825726eds.2.2021.06.11.10.13.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 10:13:23 -0700 (PDT)
Subject: Re: tb_flush() calls causing long Windows XP boot times
To: Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <BCB8773B-FC54-4C25-9B60-92C263165D38@gmail.com>
 <CAFEAcA-YuyZ9kyivh1dL_chxrtvBF=jOf3L59JuroL2U-e+Xsg@mail.gmail.com>
 <1ee4b7cf-d445-6497-705f-510009fc74f8@ilande.co.uk>
 <874ke4iqf8.fsf@linaro.org> <3D29C466-BB81-4BCA-96E9-A46721B1ED59@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d9109542-dd68-3e8b-4f53-a09576e16b1f@redhat.com>
Date: Fri, 11 Jun 2021 19:13:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <3D29C466-BB81-4BCA-96E9-A46721B1ED59@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/06/21 17:01, Programmingkid wrote:
> Hello Alex,
> 
> The good news is the source code to Windows XP is available online:https://github.com/cryptoAlgorithm/nt5src

It's leaked, so I doubt anybody who's paid to work on Linux or QEMU 
would touch that with a ten-foot pole.

Paolo


