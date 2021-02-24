Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07392323956
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 10:22:04 +0100 (CET)
Received: from localhost ([::1]:46816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEqMs-0000lU-Hc
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 04:22:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEqLU-0000Af-49
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 04:20:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEqLR-0000fP-GX
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 04:20:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614158431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5ltXVQwN7uwMFhQ5u5TQkn5wNNPVhhc4E7Tlr11t9L8=;
 b=b1UvICDxBLSMDoOcbiFiw2LS7Uwki9Vt1Lw4rMsjq2vewpHIG1RkbSqlPqFxTnd+UavWDW
 MvnCuLjjr+O/i8d/pyT8SIa541c8ivXMCTJeEs69jsZxBx1zTvGQc7o7Cv99TSgC6muuf/
 mxhIzJBaZ7OteDEjd4sQ4YoEWU5+4fI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-8UNSQIMXOaq37ip02zXleQ-1; Wed, 24 Feb 2021 04:20:27 -0500
X-MC-Unique: 8UNSQIMXOaq37ip02zXleQ-1
Received: by mail-ej1-f69.google.com with SMTP id mm18so581264ejb.7
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 01:20:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5ltXVQwN7uwMFhQ5u5TQkn5wNNPVhhc4E7Tlr11t9L8=;
 b=AzuF3AbH4wIQqNuKgCgHNZyiK9fMp26Gwgr+1oYZ7/b46t3VCBMTfGsveYJfpD6Nba
 +ZRRfCgQSXU1Cz3vH5njDPdhnZAASLxzG0uahyk1BvUj7IXSElPNj0IP9Ox9cxj5fmLG
 FKohcXMH1AdIqRAEmZe9pzXWWCNiMUHu+KkAX63Vga6u6bzWL6ADNbpg13MO49ziySlV
 K/zEXsM1jh1jsBAVDIybnaZvOHmDHfJee0PT1O7VyyObLN4Z9xi0CYgHX5toalNf55Rv
 kjO69Lh2YR9yc3oJgYzpD5CuWroqI5MlKcCCwR2icpsX2pZxX6nk664/gwk8oMwQ6sg3
 DiKA==
X-Gm-Message-State: AOAM5333wn63QWbMXyWqe95axsUU7rkJqdcbwiVQ1WO16VNwY6HhyQ98
 0dlgWszewSGdLEL9jYkSlOzT3OEGNHAw9N+Xa+1UyWOD0fYXuYI1+SvSj1qbPBkjjyd97A0Y7Of
 UFeaQLvopZUlbc0E=
X-Received: by 2002:a17:906:e84:: with SMTP id
 p4mr19191534ejf.30.1614158426504; 
 Wed, 24 Feb 2021 01:20:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy01Oc842+J9hV3lT8cQHyUL7ahHyhZ2TwlmqGBrjN9sCMpVc6eLiAJQXvx7XxmYv2uZEXJ1Q==
X-Received: by 2002:a17:906:e84:: with SMTP id
 p4mr19191528ejf.30.1614158426322; 
 Wed, 24 Feb 2021 01:20:26 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t8sm850844ejr.71.2021.02.24.01.20.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 01:20:25 -0800 (PST)
Subject: Re: softmmu vs sysemu [Was: Re: [RFC v1 06/38] target/arm: split off
 cpu-softmmu.c]
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Claudio Fontana <cfontana@suse.de>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20210221092449.7545-1-cfontana@suse.de>
 <20210221092449.7545-7-cfontana@suse.de> <87blcc57rj.fsf@linaro.org>
 <e7f21ff9-b2c6-668e-c973-d2949b81327e@suse.de>
 <2765ff1d-8b77-c2c8-c48a-dc2f582d80ff@redhat.com>
 <477a7799-cb25-afa7-c280-09d839a2b180@suse.de>
 <a6682a0f-5993-ed12-98d7-0c8f59385bbd@suse.de>
 <0a47d627-fda8-54c7-dbf8-2ebfc9000137@linaro.org>
 <9dee8138-2088-33ba-b941-494c64925004@amsat.org>
 <cbece07f-67ae-147b-98b7-62b37b16e808@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <52d854fa-120a-d748-2469-383b4b46f8e7@redhat.com>
Date: Wed, 24 Feb 2021 10:20:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <cbece07f-67ae-147b-98b7-62b37b16e808@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>,
 Claudio Fontana <cfontana@centriq4.arch.suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/02/21 01:06, Richard Henderson wrote:
> On 2/23/21 3:43 PM, Philippe Mathieu-Daudé wrote:
>> On 2/23/21 7:51 PM, Richard Henderson wrote:
>>> I just want the file naming done correctly, while you're renaming.  That is
>>> something you are actively changing in this patch set, so we should get it right.
>>
>> So what is the new directory structure?
>>
>> - user/
>> - sysemu/{tcg,kvm,}/
>>
>> or
>>
>> - tcg/a-user.c
>> - tcg/b-sysemu.c
>> - kvm/kvm.c
> 
> Personally I think this second one makes more sense, focused primarily on the
> accelerator and secondarily on the kind of emulation.

I agree.

I don't care _too much_ about sysemu vs. softmmu.  In any case if we 
want to go with sysemu it can be done in steps:

- easy: rename files and directories

- medium: rename sourcesets in meson.build

- harder (or just larger): rename CONFIG_SOFTMMU

Paolo


