Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFF82ADB8E
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 17:22:31 +0100 (CET)
Received: from localhost ([::1]:37076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcWPe-0003Ha-Ph
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 11:22:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcWBD-0005FD-Ll
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:07:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcWBB-000579-Bf
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:07:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605024451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hUsvqffhEGkQnfJhytjqQHqax8YE4hOVqjC0Dgp2+pI=;
 b=d8Er7j0ceIFNXAqIlTWlz8q20kD4JblDkqb0z2GtCqkbB0N7z4BMc6vA6mzCABHUtXRngR
 x13FGDRa3y6Dn41dOeUQgG7GoLZURO9qk9A/30Wt2k1J6ShWNm/ZNSCjtyZWdMMycJWLyX
 RkC/K5ruUfyMgBP2y5TCbFOjD3WkVKc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-SD1w8E2-OE-lhso1Up_QPQ-1; Tue, 10 Nov 2020 11:07:29 -0500
X-MC-Unique: SD1w8E2-OE-lhso1Up_QPQ-1
Received: by mail-wr1-f69.google.com with SMTP id f4so2830415wru.21
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 08:07:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hUsvqffhEGkQnfJhytjqQHqax8YE4hOVqjC0Dgp2+pI=;
 b=phlmMoAwu5MXtE/puswTZR9TUj+PK+NHvFLG8eFk77NwGKqx0dkWbwzeE7V2GkMJwz
 XpgNiCdNBlda0iNg5Qbg1QKpm2TCS37kpr8c5Sy3E0SnL+CIXPl6i7Xj1p7YiBMfKO2E
 /jxhIkwpl3a0Rcn/nuMiQgIacqJCJARhlW/+Jrw2coO3BDNDx69bo/yfa46ZsXHvezsQ
 S6nqj4oGQj967ZnIk8UFe0XSg87t8k2eeLlXFLS6NAuROTi/s/LRtK8eMU/55YsWPz1i
 P5aq07Dm8cAUGDniMzC8exlALfBgaZasHd8d23NYKHNb8tx1QvTSp+7+bypfcVxRyKFg
 Lfzw==
X-Gm-Message-State: AOAM533wux4+pyEQVPXvn6PaINTbCtxvP08QJ99ZIdiEFD5p2+WMUF9f
 UuZE/iKgKq0r+PItBZ9PUNZgSCDhk94T/AGKNaPqVFucEMzXRmMywzpZM7f7OOER1cnDMy6gx/w
 8T3koUHPQySt3y/s=
X-Received: by 2002:a1c:b157:: with SMTP id a84mr456622wmf.34.1605024448497;
 Tue, 10 Nov 2020 08:07:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzZtYkvK+yVeTLNIihMouWI18TsNeQNHdRC7Ezzh1yYtbs8uruxAIeHb60FZCpQxSsoARl3CQ==
X-Received: by 2002:a1c:b157:: with SMTP id a84mr456583wmf.34.1605024448261;
 Tue, 10 Nov 2020 08:07:28 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id n10sm18185765wrx.9.2020.11.10.08.07.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 08:07:27 -0800 (PST)
Subject: Re: [PATCH-for-5.2 v4 00/17] ci: Move various jobs from Travis to
 GitLab CI
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20201108204535.2319870-1-philmd@redhat.com>
 <878sb98aut.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <963f94d3-5312-18ed-914d-cce8e9a22ebe@redhat.com>
Date: Tue, 10 Nov 2020 17:07:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <878sb98aut.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 00:21:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/20 4:55 PM, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> We have various job covered on Travis-CI, but recommend the
>> community to use GitLab, so build failures are missed.
>>
>> We need help to move the jobs to GitLab (we will keep the s390x
>> and ppc64 containerized jobs on Travis as there is no similar
>> offer on GitLab). Start moving jobs.
>>
>> Resulting pipelines (96 jobs in 71 minutes and 4 seconds)
>>   https://gitlab.com/philmd/qemu/-/pipelines/213351318
>>   https://gitlab.com/philmd/qemu/-/pipelines/213378500
>>
>> Patches 1-3 are included because without them some jobs are
>> failing; but they will be merged via different trees.
> 
> Which trees? I'm currently holding 2/3 in my tree as I kick the tyres
> although I dropped 1 following breakage and discussion on IRC.

Well I'm not sure... The point of this series is not to fix GitLab
(as it will keep failing) but to move jobs from Travis to it. I
simply wanted to show a green GitLab.

I suppose they belong to Michael Tsirkin (vhost-user, ACPI).

Regards,

Phil.


