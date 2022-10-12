Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C785FC862
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 17:26:45 +0200 (CEST)
Received: from localhost ([::1]:37406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oidd6-0000JT-Cz
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 11:26:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oidaU-00075j-Vs
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 11:24:03 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:43569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oidaS-0007Cd-U1
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 11:24:02 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 r3-20020a05600c35c300b003b4b5f6c6bdso1448773wmq.2
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 08:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VJybZ1DgSDwSOK4GXWNs5OkrH8F/qzj0mhQBABven1A=;
 b=OhY8NQbug21NXXZYTESu/iEfMQ4zvFjk6+XOS4zvCaw3N/Sr8BCateUxgHrhXVU3d8
 x5Pt35Nqzo7Viq2/aTlQMBYPWv4IVwrDsjIPBHfIBOgws3omoQO6y6RDtt7JCs27Osyy
 w6tEP0Lv/QBHnVuR12QSl9owSD+QRjjPBIat9mc3h8yGV4N1TzxcAV7LqKFZnjJlVGAo
 3w1YniD0uuifHBdqZ9yUINTiVmP1zD5/1nRUioCGWqs+KB0IduqBvWoHNlQ4KXAxRgny
 4QBak63+kdGNMIkl/58BdfYWZgEdwcXoYowccvQM0NOecwImzlPzETx/61yiW7k1EYpn
 jFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=VJybZ1DgSDwSOK4GXWNs5OkrH8F/qzj0mhQBABven1A=;
 b=CMYU1C/PJTDiHH2/GssiQQW7XXzpkVLNdkp1fDvw3zvw6W0MzkUxnvBlfEd3qZgUUt
 USJjChB18Xx9LUNgbZLsi7gFPAJyqH8/VgUOo3i34+5xFBWirRn+DfPgtAqu76A8ok4l
 FR8Ok3LWG3XZeOdpKC0IP8at/CzFyVwteu3/+8NBvBuo4H6A/aSpvgivf+oPsytJyuqh
 YIEMj3WTh0HRnnwca930DN95ORYWXwiilVORfGLQPaFclN5hNKURK0ZkaFEuE/YTwTjF
 XQwPHhXXc4gOTb15ReH2qFh8RxmEt0Y/GtW6OEHPOYbTWeDkDRnMoqgX8MFjFqxWmuec
 MxCA==
X-Gm-Message-State: ACrzQf3jPI11+Ip5rl/OX3aTrTRxh241qTptHKeS4szqmLba+0gwR3cM
 OqVO8bOjhFojXzApQkxfptIvG6nDEzSS3w==
X-Google-Smtp-Source: AMsMyM7xhDXmQWkTXfySBmeyJLXTfT3E3eK+xnffM56tVB/XxeZhQTnebgtOL8VSpj9FGB2wW4km8w==
X-Received: by 2002:a1c:f009:0:b0:3b4:9398:49c9 with SMTP id
 a9-20020a1cf009000000b003b4939849c9mr3227959wmb.174.1665588236954; 
 Wed, 12 Oct 2022 08:23:56 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a5d64a3000000b00228cbac7a25sm14293911wrp.64.2022.10.12.08.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Oct 2022 08:23:56 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9E8C91FFB7;
 Wed, 12 Oct 2022 16:23:55 +0100 (BST)
References: <20221012090855.359847-1-pbonzini@redhat.com>
 <878rllqlq5.fsf@linaro.org>
 <b30292a6-7508-5bc9-ae7f-1a7d4e3ea23a@redhat.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] build: disable container-based cross compilers by default
Date: Wed, 12 Oct 2022 16:21:55 +0100
In-reply-to: <b30292a6-7508-5bc9-ae7f-1a7d4e3ea23a@redhat.com>
Message-ID: <87zge1oyk4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> On 10/12/22 14:17, Alex Benn=C3=A9e wrote:
>>> Container-based cross compilers have some issues which were overlooked
>>> when they were only used for TCG tests, but are more visible since
>>> firmware builds try to use them:
>> We seem to have dropped our gating somewhere. Previously if a user did
>> not have docker or podman on their system none of the container stuff
>> would run.
>
> It's still there:
>
> container=3D"no"
> if test $use_containers =3D "yes"; then
>     case $($python "$source_path"/tests/docker/docker.py probe) in
>         *docker) container=3Ddocker ;;
>         podman) container=3Dpodman ;;
>         no) container=3Dno ;;
>     esac
>     if test "$container" !=3D "no"; then
>         docker_py=3D"$python $source_path/tests/docker/docker.py --engine=
 $container"
>     fi
> fi
>
> I think what's happening is that podman is there but there's no support
> for rootless containers, so "podman run" fails.

Ahh so we could improve our probe code then? I'm afraid I don't have
much personal testing coverage for podman stuff - I thought rootless
support was the main reason Fedora had transitioned to it.

>
> Paolo


--=20
Alex Benn=C3=A9e

