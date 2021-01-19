Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC312FB9B3
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 15:42:53 +0100 (CET)
Received: from localhost ([::1]:51802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1sDc-0000bA-7r
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 09:42:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1sBj-00084j-Qm
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:40:55 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:43266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1sBi-0004pE-4v
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:40:55 -0500
Received: by mail-ej1-x62a.google.com with SMTP id a10so12192772ejg.10
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 06:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=q2xDhSUMG28AcAyaM6YYqaEikCCBflKCZ438PJ741YE=;
 b=OzHmUcPgA0yUGGuFz5AEnjCTnBYeO2Xz05k4OCLO0thm6qlL9rsftPkKb+xk5Yr5MA
 yOW4Yjtry4ncDWDWSupmDnzVhsSsC79ZtFDbzEkmHKqvoDptL7a/TBvtfP/zNg3ZA1I4
 YCUqk2gi+sh3gX0+7by32qgRgkjeFOOWWazc05pSYVTZDGqCI/4s1XftImMlGfggF4Pl
 8HfTH/d5F2La50D4AN2nOSybizQtpAyNODHI0fKXZ9HHcWfLf8N+Qbul8kdsuhU2ftj5
 Zqm7BiXoc7faZV4wQwi1jHJx0EYuLAbh3+WfJsph+QiOG9Ofzvo+7Xr0IwpSdqACMEfn
 KXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q2xDhSUMG28AcAyaM6YYqaEikCCBflKCZ438PJ741YE=;
 b=cn7CnBzkMPA1kNf4oTApUAlC5kcWtIS4z5Cl90jKTB2UZ1NJvpzvDQl/p+/ujmPnCM
 lcKpSAlKVV9nKSeeWDynLA/aVeWm5Q+IAYL2/uwpUyhSVgBZqhlD1XsFGzt2JY8A3Rhz
 J+9Obv1D8Zcrsh9Qcl8Dlk9qxP7pLL2Eai6IM5Y18VoOAMqDcS5lvyg0xESodDd+bob9
 3XlA2hsJQlIq+tfut4vaDS560+yFpE2qFurt3TnnPnDDiUjgEP/LXFkfzmp4VOcXVnDX
 bFUzLwJqldHvIJPQt2eOE0qb5sKdgZ54eVZ4kc0v1oV0jQLGXTZbdZoZ0EdFNeyPe3GB
 EmYg==
X-Gm-Message-State: AOAM533IkNUq6MlCioLRECF6wrXiJMo0iZwQ/Rz+G1jVyKHtL1afJmob
 W4GHwJWmV/CNellHFbfOvBw=
X-Google-Smtp-Source: ABdhPJyYPmNqMe+PnUNzsBuS0of/DsQdCMrsJEur6MGKInggphHNUzmQqHG6IwVCFdUBZrycP5F5pw==
X-Received: by 2002:a17:906:3c41:: with SMTP id
 i1mr3250148ejg.443.1611067252719; 
 Tue, 19 Jan 2021 06:40:52 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id n2sm10881307ejj.24.2021.01.19.06.40.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 06:40:51 -0800 (PST)
Subject: Re: [RFC PATCH] tests/docker: Allow passing --network option when
 building images
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210119054502.531451-1-f4bug@amsat.org>
 <878s8puprg.fsf@linaro.org> <f34c7ff5-cd02-83b4-d3d8-c2ec7ac4334f@amsat.org>
 <20210119142030.GD2335568@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <bdd4613c-219d-e06d-09e3-bc46aeb58c59@amsat.org>
Date: Tue, 19 Jan 2021 15:40:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210119142030.GD2335568@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/19/21 3:20 PM, Daniel P. Berrangé wrote:
> On Tue, Jan 19, 2021 at 02:40:13PM +0100, Philippe Mathieu-Daudé wrote:
>> On 1/19/21 12:27 PM, Alex Bennée wrote:
>>> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
>>>
>>>> When using the Docker engine, build fails because the container is
>>>> unable to resolve hostnames:
>>>>
>>>>   $ make docker-image-debian-s390x-cross NETWORK=host ENGINE=docker
>>>>     BUILD   debian10
>>>>   #6 9.679 Err:1 http://deb.debian.org/debian buster InRelease
>>>>   #6 9.679   Temporary failure resolving 'deb.debian.org'
>>>>   #6 16.69 Err:2 http://security.debian.org/debian-security buster/updates InRelease
>>>>   #6 16.69   Temporary failure resolving 'security.debian.org'
>>>>   #6 22.69 Err:3 http://deb.debian.org/debian buster-updates InRelease
>>>>   #6 22.69   Temporary failure resolving 'deb.debian.org'
>>>>   #6 22.74 W: Failed to fetch http://deb.debian.org/debian/dists/buster/InRelease  Temporary failure resolving 'deb.debian.org'
>>>>   #6 22.74 W: Failed to fetch http://security.debian.org/debian-security/dists/buster/updates/InRelease  Temporary failure resolving 'security.debian.org'
>>>>   #6 22.74 W: Failed to fetch http://deb.debian.org/debian/dists/buster-updates/InRelease  Temporary failure resolving 'deb.debian.org'
>>>>   #6 22.74 W: Some index files failed to download. They have been
>>>>   ignored, or old ones used instead.
>>>
>>> I'm confused by this one as it currently works for me. That said I
>>> thought the actual behaviour was meant to be networking is enabled by
>>> default and explicitly disabled by the run step (which shouldn't be
>>> pulling extra stuff down).
>>>
>>> This was last tweaked by Daniel in 8a2390a4f47
>>>
>>> Have the defaults for docker engine changed?
>>
>> No idea as I'm not following their development, but TBH it
>> becomes harder and harder to use without tricks (I had to
>> add systemd.unified_cgroup_hierarchy=0 to kernel cmdline
>> to keep using it).
>>
>> Maybe I should switch to podman which is the recommended
>> engine on Fedora.
>>
>> Cc'ing Marc-André who added podman support (Daniel is in Cc).
> 
> I'm using podman exclusively since Docker doesn't work well with
> modern distros that use Cgroups v2.

OK this probably explains it.

Ideally we could add a check for this ("modern distro" -> docker
engine not recommended) but I guess I'm the only one using this
feature on Fedora (as nobody complained) so not a problem. I'll
see how to use podman.

Thanks,

Phil.

