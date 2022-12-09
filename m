Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF26647EF2
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 09:08:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3YPf-0006aW-Gh; Fri, 09 Dec 2022 03:07:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p3YPZ-0006Yz-HD
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 03:07:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p3YPX-0003OD-Ds
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 03:07:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670573228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/P+F1mg8Gt4uSrCC0NGz/RJToIhkspQz1OFeT4BzGbw=;
 b=OAKdbbP0LpxV+JSrGF9QNMZ8v/Cud0EuaaW4TY7qCckTEcmC+39g2auZr8sZURWFd15tky
 jAMsGd4DsApP9UEzrlLTu4EhGizM31JmPyH3RUYQB5zfUVQ66lfWR5SLQPPGZyuyyWCVG6
 TNTNRFD8qf4SrYmTQkA5WLGC9+hYmsI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-135-DynoqJaVOBGrnlM1jNDGOA-1; Fri, 09 Dec 2022 03:07:06 -0500
X-MC-Unique: DynoqJaVOBGrnlM1jNDGOA-1
Received: by mail-wr1-f69.google.com with SMTP id
 a7-20020adfbc47000000b002421f817287so816328wrh.4
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 00:07:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/P+F1mg8Gt4uSrCC0NGz/RJToIhkspQz1OFeT4BzGbw=;
 b=JAApysaclf0bRvletYizidMG1j+Fiebkx5Zei+6qkgoJ1HzTv8cViqb7OHszN3MFho
 8HtOdpYcIlx2zhWya0RgPl/9EiY6qWdNLvbMwtioX4POmChl4YxggrEhfAf9VdC0ZnTW
 WvAVChGblgvFJZHLWYEMhyCLkKaxZ0Ra7lO+Kl4R3X2m+OSLCOZPCHjzlxdIjcMxHo6q
 1dgvQ9unLyn0UsLS0/P0ON3Ba24xW1hZ3aRMFz69IiSoAcH0Z0beBECYQpP1eHBPf0i/
 5wriLbyePBLQ98FUgxfr/Lfr7D2Lm+pNYv0TyuIDdx8TPUSecvXkmB+Q8Oa+bYqI2Wqo
 AuqQ==
X-Gm-Message-State: ANoB5pnJLT1FukqwHePAwDBZBzbidcIe/gOGZokRFQcMMbhgOyWgmBgS
 pB3k5ZA4ryEln1o8AtkU7Wj45t+ZrkONakOnX5uiSozvBjb9bniNKv2yUB556MjbVpqV3e3gynT
 CAMpz8YVkdS/WoLE=
X-Received: by 2002:adf:dbd2:0:b0:232:be5a:f593 with SMTP id
 e18-20020adfdbd2000000b00232be5af593mr3880915wrj.29.1670573225448; 
 Fri, 09 Dec 2022 00:07:05 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4r5XcE4rA9rx23+cAIBj4q+Kbtrdah9UBeVa1SXj7bMzyBdlYv53YgDlsO2AUto1s1iDGrdA==
X-Received: by 2002:adf:dbd2:0:b0:232:be5a:f593 with SMTP id
 e18-20020adfdbd2000000b00232be5af593mr3880893wrj.29.1670573225126; 
 Fri, 09 Dec 2022 00:07:05 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-177-15.web.vodafone.de.
 [109.43.177.15]) by smtp.gmail.com with ESMTPSA id
 l11-20020a5d526b000000b002422202fa7fsm729741wrc.39.2022.12.09.00.07.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 00:07:04 -0800 (PST)
Message-ID: <a8557e8d-72b9-f1d7-5e47-6d17de94b534@redhat.com>
Date: Fri, 9 Dec 2022 09:07:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Michael Roth
 <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20221128092555.37102-1-thuth@redhat.com>
 <Y4TqEDYs+T4z6PX/@redhat.com>
 <4bf10f82-03a4-42e6-a66b-e78e182a83a8@redhat.com>
 <Y4dH71Z+Zg29Erl3@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 for-8.0 0/5] scripts/make-release: Decrease size of the
 release tarballs
In-Reply-To: <Y4dH71Z+Zg29Erl3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.266, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 30/11/2022 13.09, Daniel P. Berrangé wrote:
> On Wed, Nov 30, 2022 at 11:49:50AM +0100, Thomas Huth wrote:
>> On 28/11/2022 18.04, Daniel P. Berrangé wrote:
>>> On Mon, Nov 28, 2022 at 10:25:50AM +0100, Thomas Huth wrote:
>>>> Our release tarballs are huge - qemu-7.2.0-rc2.tar.xz has a size of 116
>>>> MiB. If you look at the contents, approx. 80% of the size is used for the
>>>> firmware sources that we ship along to provide the sources for the ROM
>>>> binaries. This feels very wrong, why do we urge users to download such
>>>> huge tarballs while 99.9% of them never will rebuilt the firmware sources?
>>>> We were also struggeling a bit in the past already with server load and
>>>> costs, so we should really try to decrease the size of our release tarballs
>>>> to a saner level.
>>>
>>> The main reason for shipping the source in the tarball was to
>>> guarantee license compliance for anyone who is distributing
>>> qemu release tarballs, including ourselves.
>>>
>>> Splitting off the firmware source, but not the firmware binaries,
>>> means people are now at risk of not complying with the license
>>> but failing to provide complete and corresponding source.
>>>
>>> Technically the license requirement is only critical for GPL
>>> licenses ROMs, but as good practice we do it for all our ROMs.
>>>
>>>> So let's split the firmware sources into a separate tarball to decrease
>>>> the size of the main QEMU sources tarball a lot (which should help us
>>>> to safe a lot of traffic on the server).
>>>
>>> With my distro maintainer hat I would rather QEMU ship neither the
>>> ROM source, nor the ROM binaries.
>>>
>>> Still the binaries are convenient for people doing their own QEMU
>>> builds from source.
>>>
>>> How about shipping two distinct options:
>>>
>>>     qemu-x.y.z.tar.xz          (QEMU source only)
>>>     qemu-bundled-x.y.z.tar.xz  (QEMU source + bundled ROM binaries + ROM sources)
>>>
>>> though I'm not sure how much of an impact that will have on the download
>>> traffic - depends what is causing the traffic.
>>>
>>> Another option is
>>>
>>>     qemu-x.y.z.tar.xz        (QEMU source only)
>>>     qemu-roms-x.y.z.tar.xz   (bundled ROM binaries + ROM sources)
>>>
>>> though this is slightly more inconvenient for users, and there's the
>>> risk they'll use new QEMU with old ROMs.
>>
>> Maybe that would work for distros, but I don't think that these are good
>> options for the average users who just want to download and recompile the
>> latest version of QEMU on their own.
>> I assume that most users don't have an environment with cross-compilers or
>> for running things in a container, so I think they still want to use the
>> pre-built binaries. Thus, if you bundle the binaries along with their
>> sources, people will still continue to download the big tarball and we
>> haven't gained anything.
>>
>> So do you really really think shipping the binaries in the main tarball is a
>> problem? Honestly, it's not a problem for us as long as we publish both
>> tarballs together - and if someone wants to mirror the main tarball to their
>> webserver and fails to mirror the rom-sources tarball, too, it's their
>> fault, not ours.
> 
> I think we would be contributing to mistakes by providing a tarball
> that contains a mixture of sources and binaries, but not all the
> sources for all the binaries.
> 
>> Anyway, what about splitting the binaries into a separate tarball, so we
>> would have three tarballs:
>>
>>      qemu-x.y.z.tar.xz               (QEMU source only)
>>      qemu-roms-x.y.z.tar.xz          (ROM binaries)
>>      qemu-roms-sources-x.y.z.tar.xz  (ROM sources)
>>
>> That should make it hopefully obvious that the two qemu-roms* tarballs
>> belong together. Would that be OK for you?
> 
> Yes, I think that's better, as it is cleanly separating the
> binaries and sources.

I pondered about this idea quite a while now, but I think that will 
definitely be a decrease in the user's experience, e.g. "make install" won't 
work by default anymore if the user did not download the binaries before. 
Sure, we can instruct the users to download and uncompress the roms tarball 
here or there ... but still, it's getting more cumbersome for the users this 
way. Thus I think I'd rather would like to avoid packaging the binaries in 
an extra tarball.

> The downside is that there's the risk of ROMS not matching
> the QEMU version, if people updates to latest qemu tarball
> but forgot the corresponding ROMs tarball. Most of the time
> a mismatch would not matter, but we should think about if
> there is a way to make it easier to diagnose such a
> mismatch if only for easier bug triage.

Yes, that's another disadvantage which will lead to very subtle bug reports 
if we don't prevent it from happening somehow.

> Perhaps the ROMs should install into a versioned subdir
> of /usr/share/qemu, instead of the root of it, and the
> QEMU binary preferentially look at the versioned subdir
> Maybe that's overthinking things though, and we would
> suffic to have a /usr/share/qemu/ROM-VERSION.txt file

I don't think that a text file will be sufficient to prevent people running 
into the problem. Having versioned subdirs might help, but it has the 
disadvantage that it might cause lots of old files lying around in the file 
system if the users forget to delete the old versions after an upgrade.


... Ok, let's start again from scratch. So what we are trying to solve is 
that our tarballs are too huge and cause a non-neglectable traffic on the 
server. A huge part of the tarball size is caused by the edk2 sources. And 
we don't want to separate the GPL firmware sources from the binaries. ... so 
what if we just move the edk2 sources (and maybe skiboot sources) into a 
separate tarball? These sources are not licensed under a strong copyleft 
license, so it should be OK if we don't ship the sources for these binaries 
in the main tarball (similar to my v1 series, but I was rather completely 
removing the sources there instead). We could call the tarball with the 
separate source like qemu-extra-rom-sources.tar.xz or so?

  Thomas


