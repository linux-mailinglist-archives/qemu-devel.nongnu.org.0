Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C56AB2A9693
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Nov 2020 13:59:53 +0100 (CET)
Received: from localhost ([::1]:41114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kb1LM-0000ps-DF
	for lists+qemu-devel@lfdr.de; Fri, 06 Nov 2020 07:59:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1kb1KF-0000Gn-Vh
 for qemu-devel@nongnu.org; Fri, 06 Nov 2020 07:58:44 -0500
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:34219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1kb1KE-0006qk-Ck
 for qemu-devel@nongnu.org; Fri, 06 Nov 2020 07:58:43 -0500
Received: by mail-il1-x131.google.com with SMTP id p2so1000143ilg.1
 for <qemu-devel@nongnu.org>; Fri, 06 Nov 2020 04:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1onDJE/Qdado236lOXN+DWcoXdprPNVoKz0B01rK16A=;
 b=tTv5O5eg3ftGNTklPULL8nUW5y5TNopxEcc8WqgHb6lP5qHL8Qk/mCfwstM3GIi3Gw
 fPlj/XXQ/ZPMB4HzQ2Od9qKGQZih/8VzHhfPeHrDnQF2uJnIM/7pb2G5ZdJHOUim9MAU
 A6oth4r8QgNhTZp8qCZbsuRYcWn+xS5zMEm46Fg+UyjVeSBK4h3iYdQRyelLK7kZWrA2
 KUSP0II1FbJrUsZXIPxHcJALIUVV1PJnQzGNrmua448qdCs5lWtIGXF5sEiRghdV90ue
 ar9yo2xQ88kTcS/ve2jzltBt0MLDNJO3rt/087JjKxcZE9xOh5DLO5jNDQgFtYAhTxZU
 Sisg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1onDJE/Qdado236lOXN+DWcoXdprPNVoKz0B01rK16A=;
 b=OyFCKGtztznHRJyd7DFD7w1JCwoV/oKFXZkPy9cVy9n+JhvqHXS8KSjgbWgknIAK6I
 UukLEYMjg2BuM7mPXc6babKt2mGtjf6/BDWTuB56YOZ/QJNBqN3MCZDXzClef8qCs3/a
 wYzmPGa8iQlLZjTnNZu4gfqnVUsRakmD6wV6OoYR1gG0GMIq5Yw6zPXmPACxmq90UNJT
 /a3B7CIMIZ40kbXxaRM8fJDn5ztig2oNgDS70GTRAz/O1jBfRs8tXQKcRPjpLxXa7LQR
 SEjM6cVbmUYlVru4X3rYPro/WPJrLY8qOF1plmeaVZJxFcaCJvr8A2io950Y7fMuHCPz
 rOvg==
X-Gm-Message-State: AOAM533q5MmTRxRsgMUfOkODF9Nh3fIRgIsUvTIWeBHucEYeSXxJmbJZ
 OYih2xLbT/qOZFXQqu6wJe9j/IysY0cX+Mo6WGQ=
X-Google-Smtp-Source: ABdhPJzXzf589mwt2Xp90doj7Jjd5LAGCVsS15asIDEmsDTRTnhxZkZiKzhfA/9TMHtGDQMeaHusTZkJ7+V9p9iGrVU=
X-Received: by 2002:a05:6e02:12ab:: with SMTP id
 f11mr1185232ilr.89.1604667521073; 
 Fri, 06 Nov 2020 04:58:41 -0800 (PST)
MIME-Version: 1.0
References: <CAJ+F1CJ7KpB8C6-_+Gdh6twqjjRMweERUapw4tfjKyMqa6AM0w@mail.gmail.com>
 <CAFEAcA86UyXfir3JA3E2vuJNZBGOhbxzvomemaCLg6uwOB3c8Q@mail.gmail.com>
 <20201105163605.GX47859@linux.fritz.box>
 <CAFEAcA_ff6bRythvzJWs0McUSz3=2=1=hV9wX_BTv00jPfSHsw@mail.gmail.com>
In-Reply-To: <CAFEAcA_ff6bRythvzJWs0McUSz3=2=1=hV9wX_BTv00jPfSHsw@mail.gmail.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Fri, 6 Nov 2020 13:58:28 +0100
Message-ID: <CAM9Jb+gRjznE9VbEe4jPrOt5DtzMqS=0UQostv24iZ4PqpCqsw@mail.gmail.com>
Subject: Re: Documents not in sphinx toctree
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-il1-x131.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Sergio Lopez <slp@redhat.com>, Kashyap Chamarthy <kchamart@redhat.com>,
 QEMU <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jens Freimann <jfreimann@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > >> By running sphinx over the docs/ directory (like readthedocs.org pre=
sumably does), it finds a couple of rst documents that are not referenced:
> > >> - cpu-hotplug.rst
> > >> - microvm.rst
> > >> - pr-manager.rst
> > >> - virtio-net-failover.rst
> >
> > Given the current structure of the content in
> > https://qemu.readthedocs.io/en/latest/,
> > would adding this as a new bullet in "QEMU System Emulation User=E2=80=
=99s
> > Guide" be the right thing to do?
>
> Adding which?
>
> For cpu-hotplug.rst:
>  I guess the system manual. The document has a bit of a
>  "tutorial" feel which doesn't entirely fit the rest of the
>  manuals.
>
> For microvm.rst:
>  docs/system/target-i386.rst should be split into
>  documentation for each of the machine models separately
>  (as a list of links to docs in docs/system/i386/, similar
>  to the structure of target-arm.rst and docs/system/arm/).
>  Then microvm.rst can go into docs/system/i386.
>
> For pr-manager.rst:
>  The parts that are documenting the qemu-pr-helper invocation
>  should turn into a docs/tools/ manpage for it.
>  The other parts should go in the system manual I guess.
>
> For virtio-net-failover.rst:
>  Should go under the "Network emulation" part of the system
>  manual, I think.

Maybe existing memory emulation 'txt' files need to be converted into '.rst=
',
and along with virtio-pmem.rst could be moved to a new section?

Thanks,
Pankaj

