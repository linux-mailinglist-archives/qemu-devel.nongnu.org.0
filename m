Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4DD5085A1
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 12:17:10 +0200 (CEST)
Received: from localhost ([::1]:47174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh7OX-0000Jh-Vn
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 06:17:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nh7La-0007OX-5b
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 06:14:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nh7LW-0003eu-N7
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 06:14:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650449640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5jvHCysnOkFzHsoBtWfFb65yx1TTAys/zH1+Poi7+AY=;
 b=EFBQfsDlUT/1zN784GEw8LQOjG5JfpqOmMN7UonPWWS8SMid7Vw0MuSA2StmZSIaBfv7kM
 WnoJ7fAI10opbfGdcczJ+/mnARQPWY5y+UGlR0wzOxnEVy6YBal+KgLud6Ka8m5qio6I/o
 fBSdhg+du+Xuw+h6Gy9HZ43dGsEsB5I=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-166-adVxZFByNmOZKOQRlm99fg-1; Wed, 20 Apr 2022 06:13:59 -0400
X-MC-Unique: adVxZFByNmOZKOQRlm99fg-1
Received: by mail-wm1-f72.google.com with SMTP id
 i66-20020a1c3b45000000b0038eab4e0feaso713337wma.9
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 03:13:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5jvHCysnOkFzHsoBtWfFb65yx1TTAys/zH1+Poi7+AY=;
 b=gLjLhmTjd1Czl0M8qAwkZneE3IyuzyiPcbyTutLBCr6zaGKqbMDSd9hyvimu5LKPsw
 l6GTdGQMfF/CpB8c7SaLpuoh2H6Q9IDSKwXejksXrRuBanpe3cm/Pu9gP/tmUGHK4uy0
 R4pbVMNfH8qFr5/5jsHMu5braY+xHMuWpnVrqqVFFwEOFxfvSRDHSFrWLOoam1lefR1d
 Pqaf9MDNshnD1nDCyMsCaKKVGr208kQeOSVoSuJar2kFcy3LBqT8c6h8lFX8reSgsUU7
 2fe12rXAnoLQKq9fcC5Gzj/RsqcGaaWwsnpJtbc6Wx0KcH/BWaZ6UR5xL/KkiL6IPfT8
 l1XQ==
X-Gm-Message-State: AOAM530qH/rHY/v8SAnoV9qH4L2JDEKb95u9GWXSDpzPXPy27rDBPqf/
 xtpw4S3twM2qIn4VEWDuxCQ9ZlqkiPlGky4VyO0v1PvxKIKfjpbsgYumfJnSm43/MfwR6xc0mBo
 7EFd/NJ24lS6VlRQ=
X-Received: by 2002:a5d:4d82:0:b0:207:a0da:8f06 with SMTP id
 b2-20020a5d4d82000000b00207a0da8f06mr15042947wru.680.1650449638068; 
 Wed, 20 Apr 2022 03:13:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBm/ecP/AJzEPDp0qXxoTvKy9FCid+Yinegb45bElq6eetWBpOa0RJeRXNjOMmROsP2CW7+Q==
X-Received: by 2002:a5d:4d82:0:b0:207:a0da:8f06 with SMTP id
 b2-20020a5d4d82000000b00207a0da8f06mr15042924wru.680.1650449637674; 
 Wed, 20 Apr 2022 03:13:57 -0700 (PDT)
Received: from [192.168.8.102]
 (dynamic-046-114-174-058.46.114.pool.telefonica.de. [46.114.174.58])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a056000010f00b00207a217a500sm14730355wrx.88.2022.04.20.03.13.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 03:13:56 -0700 (PDT)
Message-ID: <952c223e-a4de-3200-959f-420a46e8a6db@redhat.com>
Date: Wed, 20 Apr 2022 12:13:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH for-7.1] Remove the slirp submodule (and only compile
 with an external libslirp)
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220408164749.534758-1-thuth@redhat.com>
 <72fe734a-8bf6-adc6-474a-47f2006c2f6d@comstyle.com>
 <CAFEAcA-NdeN8S0JXqfrpTiDoUmfZHBXUtdAuRAdDRooTpnYipA@mail.gmail.com>
 <b701aa9f-4dff-4a67-92a5-529fd07a7f1d@comstyle.com>
 <07a2ce65-41b9-7313-d7cc-51c2edb8cfd3@redhat.com>
 <Yl7iOlknz21QVPXx@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <Yl7iOlknz21QVPXx@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/04/2022 18.24, Daniel P. Berrangé wrote:
> On Mon, Apr 11, 2022 at 08:55:19AM +0200, Thomas Huth wrote:
>> On 11/04/2022 01.50, Brad Smith wrote:
>>> On 4/10/2022 5:06 AM, Peter Maydell wrote:
>>>> On Sun, 10 Apr 2022 at 05:51, Brad Smith <brad@comstyle.com> wrote:
>>>>> On 4/8/2022 12:47 PM, Thomas Huth wrote:
>>>>>> QEMU 7.1 won't support Ubuntu 18.04 anymore, so the last big important
>>>>>> distro that did not have a pre-packaged libslirp has been dismissed.
>>>>>> All other major distros seem to have a libslirp package in their
>>>>>> distribution already - according to repology.org:
>>>>>>
>>>>>>              Fedora 34: 4.4.0
>>>>>>      CentOS 8 (RHEL-8): 4.4.0
>>>>>>          Debian Buster: 4.3.1 (in buster-backports)
>>>>>>     OpenSUSE Leap 15.3: 4.3.1
>>>>>>       Ubuntu LTS 20.04: 4.1.0
>>>>>>          FreeBSD Ports: 4.6.1
>>>>>>          NetBSD pkgsrc: 4.3.1
>>>>>>               Homebrew: 4.6.1
>>>>>>            MSYS2 mingw: 4.6.1
>>>>>>
>>>>>> The only one that still seems to be missing a libslirp package is
>>>>>> OpenBSD - but I assume that they can add it to their ports system
>>>>>> quickly if required.
>>>>> I wish I had seen this earlier as our 7.1 release was just tagged.
>>>>>
>>>>> I have whipped up a port of 4.6.1 for OpenBSD as it was pretty simple. I
>>>>> will
>>>>> see about submitting it in a number of days when the tree opens.
>>>> How awkward would it be for an end-user who's on OpenBSD 7.1 to
>>>> build a QEMU that doesn't have libslirp? (That is, is it easy
>>>> and common for an end user to pull in a port of libslirp that only
>>>> came along in a later OpenBSD, or would they instead have to
>>>> manually compile libslirp themselves from the upstream sources?)
>>>>
>>>> (I'm asking here because if it's painful, then we should perhaps
>>>> defer dropping our submodule copy of libslirp a little longer.)
>>>>
>>>> thanks
>>>> -- PMM
>>>
>>> They would have to pull down a -current ports tree and build it. No package
>>> would exist for the release. It is possible, but not "supported". I have
>>> not looked
>>> at the CI bits to see how difficult that would be.
>>>
>>> Our release cycles are 6 months and the next release will be in the middle
>>> of October.
>>
>> OK, thanks for the update, Brad ... so I guess we should defer this patch to
>> QEMU 7.2 (to be released in december) instead?
>> (which would be fine for me - I just wanted to get the discussion started,
>> that's also why I've marked this patch as RFC)
> 
> Perhaps make 7.1 simply issue a warning message in configure if
> the bundled slirp is used, to give people a heads up that they'll
> want to install libslirp-devel soon.

Not sure if people will notice a warning in the output of "configure" ... 
but I've put some sentences in the ChangeLog here:

https://wiki.qemu.org/ChangeLog/7.0#New_deprecated_options_and_features

(which we could repeat for the 7.1 release again)

I hope that helps to make people aware...

  Thomas


