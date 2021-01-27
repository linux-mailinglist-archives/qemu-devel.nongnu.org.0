Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 170573063FA
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 20:26:00 +0100 (CET)
Received: from localhost ([::1]:51222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4qRz-0005G5-4v
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 14:25:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l4qPa-0004Vy-J5
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 14:23:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l4qPX-0003vT-98
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 14:23:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611775406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C+rl00A2An4GB0I2UpFEnl27jdehmwR2FFVeqKNtALA=;
 b=P2ttcJTBciuTvgDvAYqhJGZ2oUuEqWDRgvkM3VFNmYwAhR7G3Hl6S7bDccLeULjrNJiV47
 Iy3K8g+/EyG/R4o3FESmz34enVWtSTHc6YKEJ338rgkGnCT9pp+qv1RUUZem5Yk8gua6OA
 o9Zwtf2Q/SPZnPKg02ZVufHYBnOoQUo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-xRPvyVspPh6RnHcepzMdrg-1; Wed, 27 Jan 2021 14:23:23 -0500
X-MC-Unique: xRPvyVspPh6RnHcepzMdrg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 096A593E710;
 Wed, 27 Jan 2021 19:22:59 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6345B5C1D5;
 Wed, 27 Jan 2021 19:22:43 +0000 (UTC)
Subject: Re: [PATCH v2 8/9] tests/docker: Add dockerfile for Alpine Linux
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210118063808.12471-1-jiaxun.yang@flygoat.com>
 <20210118063808.12471-9-jiaxun.yang@flygoat.com>
 <20210118103345.GE1789637@redhat.com>
 <929c3ec1-9419-908a-6b5e-ce3ae78f6011@redhat.com>
 <551e153e-34da-28bd-c67f-d2a688ad987b@redhat.com>
 <20210127095846.GC3653144@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <356e39c9-7515-ba53-f652-524d5e1d9d9b@redhat.com>
Date: Wed, 27 Jan 2021 14:22:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210127095846.GC3653144@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>, qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Kevin Wolf <kwolf@redhat.com>, qemu-ppc@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/27/21 4:58 AM, Daniel P. Berrangé wrote:
> On Tue, Jan 26, 2021 at 04:38:57PM -0500, John Snow wrote:
>> On 1/19/21 8:41 AM, Thomas Huth wrote:
>>> On 18/01/2021 11.33, Daniel P. Berrangé wrote:
>>>> On Mon, Jan 18, 2021 at 02:38:07PM +0800, Jiaxun Yang wrote:
>>>>> Alpine Linux[1] is a security-oriented, lightweight Linux distribution
>>>>> based on musl libc and busybox.
>>>>>
>>>>> It it popular among Docker guests and embedded applications.
>>>>>
>>>>> Adding it to test against different libc.
>>>>>
>>>>> [1]: https://alpinelinux.org/
>>>>>
>>>>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>>>> ---
>>>>>    tests/docker/dockerfiles/alpine.docker | 57 ++++++++++++++++++++++++++
>>>>>    1 file changed, 57 insertions(+)
>>>>>    create mode 100644 tests/docker/dockerfiles/alpine.docker
>>>>>
>>>>> diff --git a/tests/docker/dockerfiles/alpine.docker
>>>>> b/tests/docker/dockerfiles/alpine.docker
>>>>> new file mode 100644
>>>>> index 0000000000..5be5198d00
>>>>> --- /dev/null
>>>>> +++ b/tests/docker/dockerfiles/alpine.docker
>>>>> @@ -0,0 +1,57 @@
>>>>> +
>>>>> +FROM alpine:edge
>>>>> +
>>>>> +RUN apk update
>>>>> +RUN apk upgrade
>>>>> +
>>>>> +# Please keep this list sorted alphabetically
>>>>> +ENV PACKAGES \
>>>>> +    alsa-lib-dev \
>>>>> +    bash \
>>>>> +    bison \
>>>>
>>>> This shouldn't be required.
>>>
>>> bison and flex were required to avoid some warnings in the past while
>>> compiling the dtc submodule ... but I thought we got rid of the problem
>>> at one point in time, so this can be removed now, indeed.
>>>
>>>>> +    build-base \
>>>>
>>>> This seems to be a meta packae that pulls in other
>>>> misc toolchain packages. Please list the pieces we
>>>> need explicitly instead.
>>>
>>> Looking at the "Depends" list on
>>> https://pkgs.alpinelinux.org/package/v3.3/main/x86/build-base there are
>>> only 6 dependencies and we need most of those for QEMU anyway, so I
>>> think it is ok to keep build-base here.
>>>
>>>>> +    coreutils \
>>>>> +    curl-dev \
>>>>> +    flex \
>>>>
>>>> This shouldn't be needed.
>>>>
>>>>> +    git \
>>>>> +    glib-dev \
>>>>> +    glib-static \
>>>>> +    gnutls-dev \
>>>>> +    gtk+3.0-dev \
>>>>> +    libaio-dev \
>>>>> +    libcap-dev \
>>>>
>>>> Should not be required, as we use cap-ng.
>>>
>>> Right.
>>>
>>>>> +    libcap-ng-dev \
>>>>> +    libjpeg-turbo-dev \
>>>>> +    libnfs-dev \
>>>>> +    libpng-dev \
>>>>> +    libseccomp-dev \
>>>>> +    libssh-dev \
>>>>> +    libusb-dev \
>>>>> +    libxml2-dev \
>>>>> +    linux-headers \
>>>>
>>>> Is this really needed ? We don't install kernel-headers on other
>>>> distros AFAICT.
>>>
>>> I tried a build without this package, and it works fine indeed.
>>>
>>>>> +    lzo-dev \
>>>>> +    mesa-dev \
>>>>> +    mesa-egl \
>>>>> +    mesa-gbm \
>>>>> +    meson \
>>>>> +    ncurses-dev \
>>>>> +    ninja \
>>>>> +    paxmark \
>>>>
>>>> What is this needed for ?
>>>
>>> Seems like it also can be dropped.
>>>
>>>>> +    perl \
>>>>> +    pulseaudio-dev \
>>>>> +    python3 \
>>>>> +    py3-sphinx \
>>>>> +    shadow \
>>>>
>>>> Is this really needed ?
>>>
>>> See:
>>> https://www.spinics.net/lists/kvm/msg231556.html
>>>
>>> I can remove the superfluous packages when picking up the patch, no need
>>> to respin just because of this.
>>>
>>>    Thomas
>>>
>>>
>>
>> You can refer to my post earlier this January for a "minimal" Alpine Linux
>> build, if you wish.
>>
>> My goal was to find the smallest set of packages possible without passing
>> any explicit configure flags.
>>
>> I wonder if it's worth having layered "core build" and "test build" images
>> so that we can smoke test the minimalistic build from time to time -- I seem
>> to recall Dan posting information about a dependency management tool for
>> Dockerfiles, but I admit I didn't look too closely at what problem that
>> solves, exactly.
> 
> I'd rather we avoid layered images entirely as it creates extra stages
> in the gitlab pipeline, and also makes it more complex to auto-generate.
> 
> Once this initial alpine image is merged, then I intend to add it to the
> set which are auto-generated from my other patch series.
> 

OK, happy to defer to you here for best practices.

--js


