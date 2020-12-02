Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BC02CBBC1
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 12:46:11 +0100 (CET)
Received: from localhost ([::1]:47422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkQaH-0006pK-Vg
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 06:46:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kkQ7I-0007ZL-U8
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 06:16:12 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:33506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kkQ7G-0007cP-Kx
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 06:16:12 -0500
Received: by mail-wr1-x42a.google.com with SMTP id u12so3424334wrt.0
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 03:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=D9Npibd+VnW6S5YChiZJIkfFEGuYAGpaH07qeklhH/Q=;
 b=Y23mwfbJ4EiQHIFry8B7wsf3QWneVLWirQAOT9CgbIqZ2qGp1yBAQTOeud83lDvn/d
 ZcmHLkW1599qLbu7NxwpKccyC8i5P6P7LE+MPh9bHG3WFz4luhV4XpyxohWgF0TCGqrv
 l8g0naUktGgaxSCSKUBiKHh+YDAhfBtAkuVBzOEG/vCigTzAZ+J4CXJWyKFflZZFjGOd
 +QKZEizE3K8EZ6LN4qdxcY27OHyufOGutVL0ej855zJpZ1RsfX0EtGhY3mAZvmN+Hxtl
 2Kbx4unMqa3S04biiswb0TQOw1tinzCnJGYNFz4y+uHPnHdJ3H4NKG18jijzhGltjwTK
 vMAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=D9Npibd+VnW6S5YChiZJIkfFEGuYAGpaH07qeklhH/Q=;
 b=X6df0KuzaXZ3l4YodvzLHncp9+hcWdZvsCdnP46JIuhxgryAbImkf2gkbd4M58Mm9H
 KkNjPoE0g15cI1aiDGL/BQtXcFSSJWhjT3oCrKLXHMr9eG03hMGEHdgI1F91+HNX8GG2
 TJBF8/wIH87wlJxiL+e4nHGJ8WPsj2y4549R5/lgMVe+xgAJqAu0RZNyn9nAWCICr32v
 ygq/7j2zDRNrE+5Zmfd81jVYZcALAUf9UUc7WDvJXQZnMUlRxvouCezT3IvdZ1hldtJZ
 CAw1m5SULcJODEy7ZfnXC7kvRlm3rKVjheEXpQtATAlXYfC9pKWx87xkLprB1kgAqht+
 yURQ==
X-Gm-Message-State: AOAM531Dq6TfyWFbno7kJ9oIAOP9TNoZyzz5vtPNX+fUicXo5cA9ItG/
 Y/A/Nr1g9mRXDawK99ZAElfy6ihhqPxSew==
X-Google-Smtp-Source: ABdhPJxrj4kqttHgfts1kuyw2T39/rd2XeR/SnbaEamUIM9cLrCWRhZbVOUtwsne0wM2iAyCfjOMKw==
X-Received: by 2002:adf:fe82:: with SMTP id l2mr2749576wrr.232.1606907767528; 
 Wed, 02 Dec 2020 03:16:07 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s8sm1617873wrn.33.2020.12.02.03.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 03:16:05 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B9C2A1FF7E;
 Wed,  2 Dec 2020 11:16:04 +0000 (GMT)
References: <f14c22bf-aecb-3e38-347b-1b9119ad8baa@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: check-tcg errors (build-user, build-user-plugins) again
In-reply-to: <f14c22bf-aecb-3e38-347b-1b9119ad8baa@suse.de>
Date: Wed, 02 Dec 2020 11:16:04 +0000
Message-ID: <87v9dksbkb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud?= =?utf-8?Q?=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> Hi Alex and all,
>
> when trying to use check-tcg (master), I am getting often these errors:
>
> $ ../configure --disable-system --disable-tools
>
> $ make -j12 check-tcg
>
> ERRO[0000] cannot find mappings for user claudio: No subgid ranges found =
for group "claudio" in /etc/subgid=20
> ERRO[0000] cannot find mappings for user claudio: No subgid ranges found =
for group "claudio" in /etc/subgid=20
> ERRO[0000] cannot find mappings for user claudio: No subgid ranges found =
for group "claudio" in /etc/subgid=20
> Trying to pull registry.gitlab.com/qemu-project/qemu/qemu/debian11...
> Trying to pull registry.gitlab.com/qemu-project/qemu/qemu/fedora-cris-cro=
ss...
> Trying to pull registry.gitlab.com/qemu-project/qemu/qemu/debian10...
> ERRO[0000] cannot find mappings for user claudio: No subgid ranges found =
for group "claudio" in /etc/subgid=20
>
> [...]
>   TEST    linux-test on x86_64
> timeout: failed to run command =E2=80=98/home/claudio/git/qemu/build/qemu=
-x86_64=E2=80=99timeout: : No such file or directoryfailed to run command =
=E2=80=98/home/claudio/git/qemu/build/qemu-x86_64=E2=80=99
>
> [...]
>
>
> Is there some pre-configuration on the host necessary to be able to
> run check-tcg?

There shouldn't be but those errors remind me of some of the tweaks I
had to make to me Gentoo system when using podman (instead of docker).
In the end I think I just ended up adding the lines:
=20=20
  alex:100000:65536

to /etc/subgid and /etc/subgid-

Marc-Andr=C3=A9 may have some better pointers as he added podman support to
the builder scripts.

The main difference between the images on the registry and the local
versions is most add the current user so there is a clean mapping
between the container user and the host file-system. It's the last step
of the build so we still use the cached layers from the registry
versions.

> I see these errors in gitlab also for
>
> build-user
> build-user-plugin
>
> Maybe this is what Philippe mentioned before though, that this is
> expected at the moment due to a temporary Meson shortcoming?

That is odd - I'm not seeing anything like that on the master builds:

  https://gitlab.com/qemu-project/qemu/-/jobs/883985106
  https://gitlab.com/qemu-project/qemu/-/jobs/883985113

AFAIK GitLab is still using Docker to build it's containers (albeit with
BUILDKIT enabled).
=20=20
>
> Ciao,
>
> Claudio


--=20
Alex Benn=C3=A9e

