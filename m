Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A53CE304286
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 16:29:55 +0100 (CET)
Received: from localhost ([::1]:39360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4QHy-000080-4o
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 10:29:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4QGt-00089F-Fl
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 10:28:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4QGl-0004Ff-Tz
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 10:28:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611674917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oENcu0Icku4yq8SY3smnf1h41nVKkT12QLs+GcZiABs=;
 b=KjwExC9ZsvHT8vDQv+gGkNYpovVEU8urdpmAQ+DMY1u3FYNeHhmMVt7BLEiGHyIHBv0GL/
 suGYj5nKzbF4JpL/tPdJhQM3k4Ukza89cUPS13+em/CG2WFjHxnXmpXHnjHp9pR+skBS/F
 NZDMsrbbXobOTLOwTFUrUaz7RwO423g=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-fe2cI-NEP0W8EvS33Nk_zg-1; Tue, 26 Jan 2021 10:28:35 -0500
X-MC-Unique: fe2cI-NEP0W8EvS33Nk_zg-1
Received: by mail-ed1-f69.google.com with SMTP id j11so8777813edy.20
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 07:28:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oENcu0Icku4yq8SY3smnf1h41nVKkT12QLs+GcZiABs=;
 b=ZZEnbJ1Hu/7newahiYkmk0FFfmNpcFHnWGxaa9vE/WdzBw4Tln/C10Mb2/+ShNmGff
 3FSHRcTTIFmwDoiAJuXZS/brtPoOQy6hw2hjw8jnqGNDXrPGXIrFVYVIATUVJEx9e6uW
 uHe0xSUWiFryGqSGBEZQPN25UikPxlixSyz41PxL2e9csbJAn1vXvxJS23coVgyjvA5b
 dKw4JuUrB9qWpzs/lSFtaFkf5oKjM38WPbBAfc2xcHCAbVU5HYyul60d62Dq800N7ecX
 wN2h9KFbBDI46077Kpv9o/fqy9pBPLR7bWRzc5TQmFJRX0Y/PY3mPpXeOgcZbobjS2ms
 Fvrg==
X-Gm-Message-State: AOAM53232QxXMMnkTfGtrc1sluQf0n+KQZOsjsNbS9acDyDCwLdYgZWC
 YTOXH7Hej8m18kKMM45ILZycgzWRN84MJ5wTx/VwjempRUOZ6fimdLP/1qj9OvU0y0/iy+TVNWg
 DHV7uMtEU/y8hX6xmpHMz7GftCgUpexvXzHcyV75TmLBwkOLm0ZoNI72apSYGGhHO
X-Received: by 2002:a17:907:1b27:: with SMTP id
 mp39mr3763738ejc.519.1611674913938; 
 Tue, 26 Jan 2021 07:28:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0BMHE6zmzTu1lwPL8cb38QAXdKuJxtoI2TbUoRfWSq49lVhrRXIgxYgANdLb2f4iqvtsi+w==
X-Received: by 2002:a17:907:1b27:: with SMTP id
 mp39mr3763714ejc.519.1611674913718; 
 Tue, 26 Jan 2021 07:28:33 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id hs18sm9521166ejc.45.2021.01.26.07.28.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jan 2021 07:28:33 -0800 (PST)
Subject: Re: [PATCH v2 00/12] buildsys: Do not build various objects if not
 necessary
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
References: <20210122204441.2145197-1-philmd@redhat.com>
 <87eei7ycbu.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <33307716-5ef8-ba62-428b-c136ec0f19db@redhat.com>
Date: Tue, 26 Jan 2021 16:28:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87eei7ycbu.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/26/21 3:57 PM, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> In this series we deselect a bunch of features when they
>> not required, so less objects are built.
>>
>> While this reduce pressure on CI and slow systems, this is
>> particularly helpful for developers regularly testing multiple
>> build configurations.
>>
>> All CI tests pass:
>> https://gitlab.com/philmd/qemu/-/pipelines/245654160
>>
>> Supersedes: <20210120151916.1167448-1-philmd@redhat.com>
> 
> Series looks good to me but I guess you need some sub-system feedback.

Yeah, I will wait for Markus feedback on qapi/ before respining (with
target/ fix), ...

> I've sent a few more patches that might be worth rolling in to better
> handle check-tcg/softfloat.

... including your patches if they aren't merged before.

Thanks for having a look,

Phil.


