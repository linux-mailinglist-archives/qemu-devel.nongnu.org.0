Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B2E36DF67
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 21:14:35 +0200 (CEST)
Received: from localhost ([::1]:52860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbpdq-000400-B5
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 15:14:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbpcK-0003KV-A3
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:13:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbpcD-0000YK-W7
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:13:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619637172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m0zACldXEPEyo/1LI189tVspnKoaL+R5f+aeOUHi2fM=;
 b=G3ssXOPvxof5kaWlPr7/9MXL5TvYv03913J0mwDtoH7ubiy6QqCjnV+oIOspbPMLzNCbHY
 GAEYVVe1RD3nKdUYwanhHwJkofrpcWgoN7601VomS17DVQp1AbZM5q6JB41pzKj/L7tp9r
 6vz+y5+D09iHbSrT13NzMvm3vn2lxbo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-HfaxjSs8P0G9_P1ogfVDeQ-1; Wed, 28 Apr 2021 15:12:48 -0400
X-MC-Unique: HfaxjSs8P0G9_P1ogfVDeQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 65-20020adf82c70000b0290107593a42c3so11245107wrc.5
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 12:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m0zACldXEPEyo/1LI189tVspnKoaL+R5f+aeOUHi2fM=;
 b=TInAo4Idcq9DTvOe9OHx8xcxlaOlh15VzFzUy8cv1qDPcu5YUmVZHPCSXwqt13nk+9
 ZlIcfgrve2WRPEWV+zElPzQ0wHIcA/FbOaYi2zu+0tNSBp98Dw5b8/ICOyoiJAfhtMb6
 zK3YhrjhD/ORp1y61n2WcHbibnc1huZIE7sjRWmr2Hwwp4Jqry0DnkHOp7rWHtyFbC0g
 p0VlPAcB1Kap6d067NCwmFG4Lief5PjLUoATxquAv+JCQfNuqdQZHb3MoAC/WlFFWQBf
 tsC6nIcxy/yh7xNQTQ3stI0o8+kUuptTGRG5S53dAQrHjo9Dw5LdCqvkb3ELtEZX/A++
 DF8g==
X-Gm-Message-State: AOAM531v06NWbnXJWUNYPWGtUUnF16rPKzw2HGWCPC2ETKwUecWuadid
 IOvpkzQYFPLHgNNY4IFb+vq3o51VDeWD2fZYEJRWJirb4SJVRMllLPUbnnGhdu1E+aY+L8AlEVc
 jTa+i2zHifFyUPqQ=
X-Received: by 2002:a7b:c444:: with SMTP id l4mr33088151wmi.36.1619637167042; 
 Wed, 28 Apr 2021 12:12:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDLCjhxNcQmlFYAKZ4QYQK+3IjtRcSGDiUm6TXDN3ltXjt6IU7Zal3zFaaROtuELxgHR9I5g==
X-Received: by 2002:a7b:c444:: with SMTP id l4mr33088112wmi.36.1619637166758; 
 Wed, 28 Apr 2021 12:12:46 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id m184sm742916wme.40.2021.04.28.12.12.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 12:12:46 -0700 (PDT)
Subject: Re: [PATCH v4 12/12] tests/meson: Only build softfloat objects if TCG
 is selected
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-13-philmd@redhat.com>
 <03eed9c3-0670-f262-a2fa-172639b8ad77@redhat.com> <874kfqs5gl.fsf@linaro.org>
 <763dbed9-35e9-0f85-3b94-01bffc7fcbf8@redhat.com> <871raus00j.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <97b2e23c-bbb2-f2cc-bddd-6047d0cbe0be@redhat.com>
Date: Wed, 28 Apr 2021 21:12:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <871raus00j.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 "Emilio G . Cota" <cota@braap.org>, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/21 9:04 PM, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> On 4/28/21 7:06 PM, Alex Bennée wrote:
>>> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
>>>
>>>> Alex, Richard, do you mind reviewing this one please?
>>>
>>> Isn't it already merged (with my r-b tag no less ;-)
>>>
>>>   f77147cd4de8c726f89b2702f7a9d0c9711d8875
>>
>> See ...
>>
>>>   Author:     Philippe Mathieu-Daudé <philmd@redhat.com>
>>>   AuthorDate: Fri Jan 22 21:44:31 2021 +0100
>>>   Commit:     Paolo Bonzini <pbonzini@redhat.com>
>>>   CommitDate: Mon Feb 8 14:43:55 2021 +0100
>>>
>>>>
>>>> On 4/15/21 6:33 PM, Philippe Mathieu-Daudé wrote:
>>>>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>>>
>>>>> The previous attempt (commit f77147cd4de) doesn't work as
>>
>> ... ^ this comment :(
> 
> Ahh - my tooling was confused having searched by the subject title ;-)

Oh I see, I'll rename as:
"tests/meson: Only build softfloat objects if TCG is selected (again)".


