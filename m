Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F67340132
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 09:50:30 +0100 (CET)
Received: from localhost ([::1]:41722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMoMN-0007Mw-IQ
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 04:50:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMoKx-0006qC-AY
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 04:48:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMoKt-0004ib-8r
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 04:48:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616057332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J6fmYp3FEG+beh0KNpb1D9xjcrOyOT/GTak1lD/yAAY=;
 b=JzoEkNpXpSxI/tzrNDfX8/7N8KZk9DaHFDEwYuKRquMRSFsOAO8ahmZ0N0K0I33xk+dx76
 88h5rR1SkKTBaGBS6o+0JwAZN7Ms6tWEZPzWp7cut7nHRGO5nr0W4Jp0Lgtbfhp/Kig6uO
 /cB4o6Vm+KgYKD03YRq1Sc6bsrsOnvs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-qjp7a5GwP_ClcHtoazsYJA-1; Thu, 18 Mar 2021 04:48:50 -0400
X-MC-Unique: qjp7a5GwP_ClcHtoazsYJA-1
Received: by mail-wr1-f70.google.com with SMTP id x9so19592971wro.9
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 01:48:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J6fmYp3FEG+beh0KNpb1D9xjcrOyOT/GTak1lD/yAAY=;
 b=dEXd0ouh8OacqrxWuOa/EvLul2E6i5ndDw41jDFk5tNLTQuZNn27Rifk03GsW+e1ff
 3HlNoxrt0RPmXGp5Ymtc5kFN3oy0XdY2pleJwt21YhZDQ2tQZlhUbbqOUztPtjRmT4KR
 xPRHXIoJ5498Ud3j5e4DnoEaB10i+n+1ufN7V+/Hsr09p8uk/+slRxLAVIexjfXCGtMZ
 hm75aqqNRf/TpKXAj7qc61DtsEpUVfmvfYNNpU8CMBdf7shKqw6OoTe0/95/DfxnqfwP
 ivRnPzgJF6CJn7ODX1tt6/CRCH7JUpmpKZ6IkWnRhRBGbLC/D/RhTIsU6hGW6WLihHew
 SW3w==
X-Gm-Message-State: AOAM531PKGMy5GYOjciZMCgwPBvw1ZjsqqiWSdcBtlTNGGfdaXIeBUn3
 KwU78myluaa3DlvEt12WENfTCvANudQ0hLtr9JNFEtD9rYSNUgJE3CJ5GwgdZko9vdMG7HmpgbQ
 ooX6m/vEP8y4q+Xs=
X-Received: by 2002:a7b:cb89:: with SMTP id m9mr2543345wmi.27.1616057329401;
 Thu, 18 Mar 2021 01:48:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0GOZ4Y5JV8Pcl/Gb3aWqOHJYftxLgtgLnDhlvYGnQCsbNHzqd/suCF1rAa6eWJ/aMhCJQ0w==
X-Received: by 2002:a7b:cb89:: with SMTP id m9mr2543323wmi.27.1616057329249;
 Thu, 18 Mar 2021 01:48:49 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id v2sm5723724wmj.1.2021.03.18.01.48.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 01:48:48 -0700 (PDT)
Subject: Re: "make check" broken with everything but tools disabled
To: John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org
References: <877dm7jkib.fsf@dusky.pond.sub.org>
 <f0e41b5f-c98f-db46-abc9-30530592ee26@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2ce3de5a-5530-bd43-d873-fb14d4e999f8@redhat.com>
Date: Thu, 18 Mar 2021 09:48:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <f0e41b5f-c98f-db46-abc9-30530592ee26@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/21 11:35 PM, John Snow wrote:
> On 3/16/21 9:28 AM, Markus Armbruster wrote:
>> Watch this:
>>
>>      $ mkdir bld-tools
>>      $ cd bld-tools
>>      $ ../configure --disable-system --disable-user --enable-tools
>>      $ make check
>>      [...]
>>      make: *** No rule to make target
>> 'tests/qemu-iotests/socket_scm_helper', needed by 'check-block'.  Stop.
>>
>>
> 
> One more thing to add a CI job to check, I suppose.

We have the 'build-tools-and-docs-debian' job, but
lack the 'check-tools-and-docs-debian' one.


