Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C402FBC50
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 17:24:33 +0100 (CET)
Received: from localhost ([::1]:46044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1to0-0006qr-9j
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 11:24:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l1tls-0005vG-Nd
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:22:20 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:43249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l1tlq-0005CY-UK
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:22:20 -0500
Received: by mail-wr1-x432.google.com with SMTP id y17so20322025wrr.10
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 08:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=2qFugp9RXsy65SAkwpqhbGfnMPJqmEcKUyQAaRmQLTA=;
 b=txqubDSOujig0oqp/+oBcOe+Z2XkY3AJ+toXwhK99qpV2SbLtXWF95/X8FmouVOfsM
 IZI1DEHnSf/JdAZV1ehKzpkvd15lRt0DU/iw8o6UbXvAYNHY0ZFIyEpR+piLj5FCohCP
 Xq5k91F2Z9tinIYi6ugKE9m54gO/cYiYMOtvVkLABb3OOGvRJdJ1PZLeiE1tc7IfsOTI
 uR/vffIwNu1gwFNx+hmBFGU2zJkRGE2HCyQokNsoMJKLGCuHbOeap2xqIDVZTYX5ojfo
 VATdZuCSlwn3j/v1s7R+LWLyOGZzlsiecoSdbwfvTuFynYsWDdHamU5TaEiRaZn/mQKC
 Cm1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=2qFugp9RXsy65SAkwpqhbGfnMPJqmEcKUyQAaRmQLTA=;
 b=OYiXU1jjVU/UhMTuZW3vSuJmRCjQPTpzPBiTsn/v1PUCjt/UfHEIZNSKVOaT2gZUVq
 0tAN/mIPO42gZFhMKed3kOW/b7h05N2CivZO2PIDLWweKA6LTee3ymAwzTg7ygZW67tJ
 Rgv+QOsipxgMqP15xLDIdw8Inl3Ue9P4hUYHQqNKg5geAsO5ryqw764ODK4uku743v4j
 dtJhcMwZRRjSmw2PSFOCk5SoZvniSYLg/EwN2U3AzI6RJ9xW96ZuaBEimTVRYCX9MM9U
 TbAhbOkBikndVLsaJrhUOmYrQgWiA2T8sRsrM9dBkXyb8ZsmCHMjqfBABhcODYd3wcUm
 3Umg==
X-Gm-Message-State: AOAM530rrBtuk7fvAsHFH1Q3gNniGXI7nv8X6NHDHltJAcJQxMN+pfU2
 7Dc+ftkrq5U3SRAiuv/E0rtDYw==
X-Google-Smtp-Source: ABdhPJzakLuHcZhTjyCtwizEljCK3ne51CBVVDCiZKGXn7z3fLEw8rJSw59IVsSVLX6Gllt7ShuZJg==
X-Received: by 2002:a05:6000:114e:: with SMTP id
 d14mr5078547wrx.176.1611073337431; 
 Tue, 19 Jan 2021 08:22:17 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s19sm35060885wrf.72.2021.01.19.08.22.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 08:22:16 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 937B11FF7E;
 Tue, 19 Jan 2021 16:22:15 +0000 (GMT)
References: <20210119054502.531451-1-f4bug@amsat.org>
 <878s8puprg.fsf@linaro.org>
 <f34c7ff5-cd02-83b4-d3d8-c2ec7ac4334f@amsat.org>
 <20210119142030.GD2335568@redhat.com>
 <bdd4613c-219d-e06d-09e3-bc46aeb58c59@amsat.org>
 <20210119144632.GH2335568@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [RFC PATCH] tests/docker: Allow passing --network option when
 building images
Date: Tue, 19 Jan 2021 15:58:32 +0000
In-reply-to: <20210119144632.GH2335568@redhat.com>
Message-ID: <87y2goucaw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, =?utf-8?Q?M?= =?utf-8?Q?arc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Tue, Jan 19, 2021 at 03:40:50PM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
>> On 1/19/21 3:20 PM, Daniel P. Berrang=C3=A9 wrote:
>> > On Tue, Jan 19, 2021 at 02:40:13PM +0100, Philippe Mathieu-Daud=C3=A9 =
wrote:
>> >> On 1/19/21 12:27 PM, Alex Benn=C3=A9e wrote:
>> >>> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:
>> >>>
>> >>>> When using the Docker engine, build fails because the container is
>> >>>> unable to resolve hostnames:
>> >>>>
>> >>>>   $ make docker-image-debian-s390x-cross NETWORK=3Dhost ENGINE=3Ddo=
cker
>> >>>>     BUILD   debian10
>> >>>>   #6 9.679 Err:1 http://deb.debian.org/debian buster InRelease
>> >>>>   #6 9.679   Temporary failure resolving 'deb.debian.org'
>> >>>>   #6 16.69 Err:2 http://security.debian.org/debian-security buster/=
updates InRelease
>> >>>>   #6 16.69   Temporary failure resolving 'security.debian.org'
>> >>>>   #6 22.69 Err:3 http://deb.debian.org/debian buster-updates InRele=
ase
>> >>>>   #6 22.69   Temporary failure resolving 'deb.debian.org'
>> >>>>   #6 22.74 W: Failed to fetch http://deb.debian.org/debian/dists/bu=
ster/InRelease  Temporary failure resolving 'deb.debian.org'
>> >>>>   #6 22.74 W: Failed to fetch http://security.debian.org/debian-sec=
urity/dists/buster/updates/InRelease  Temporary failure resolving 'security=
.debian.org'
>> >>>>   #6 22.74 W: Failed to fetch http://deb.debian.org/debian/dists/bu=
ster-updates/InRelease  Temporary failure resolving 'deb.debian.org'
>> >>>>   #6 22.74 W: Some index files failed to download. They have been
>> >>>>   ignored, or old ones used instead.
>> >>>
>> >>> I'm confused by this one as it currently works for me. That said I
>> >>> thought the actual behaviour was meant to be networking is enabled by
>> >>> default and explicitly disabled by the run step (which shouldn't be
>> >>> pulling extra stuff down).
>> >>>
>> >>> This was last tweaked by Daniel in 8a2390a4f47
>> >>>
>> >>> Have the defaults for docker engine changed?
>> >>
>> >> No idea as I'm not following their development, but TBH it
>> >> becomes harder and harder to use without tricks (I had to
>> >> add systemd.unified_cgroup_hierarchy=3D0 to kernel cmdline
>> >> to keep using it).
>> >>
>> >> Maybe I should switch to podman which is the recommended
>> >> engine on Fedora.
>> >>
>> >> Cc'ing Marc-Andr=C3=A9 who added podman support (Daniel is in Cc).
>> >=20
>> > I'm using podman exclusively since Docker doesn't work well with
>> > modern distros that use Cgroups v2.
>>=20
>> OK this probably explains it.
>>=20
>> Ideally we could add a check for this ("modern distro" -> docker
>> engine not recommended) but I guess I'm the only one using this
>> feature on Fedora (as nobody complained) so not a problem. I'll
>> see how to use podman.
>
> I'm not sure we need to block it. If someone has docker installed
> then its reasonable to assume they have ti working. We prefer
> podman if both are installed.

From my point of view podman is the odd man out (I run upstream
docker.com packages on Debian Buster). I had to jump through some hoops
to get podman installed on my Gentoo box but I think it's currently
broken because it's Gentoo.

IOW I assume the people that really care about podman will shout if it
breaks. It would be nice if we could catch cases in the CI though.

>
>
> Regards,
> Daniel


--=20
Alex Benn=C3=A9e

