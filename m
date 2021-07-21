Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C04A33D14B4
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 18:58:23 +0200 (CEST)
Received: from localhost ([::1]:60708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6FY6-0005Hf-Ry
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 12:58:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6FWs-0003ko-92
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 12:57:06 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:44673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6FWq-0007NU-7f
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 12:57:05 -0400
Received: by mail-wr1-x431.google.com with SMTP id f9so2910534wrq.11
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 09:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=LJlGfrsfB+rwVrxohSUCjOG8t2khLv37nI8YELUkoHM=;
 b=fb8e80XiZ10SCzYYfqVBtYsu4GAEk8j7BMxG2F5juLKzFL0Zw18tknvXZa/c0GA6xu
 28OFdZCJiLhKB9A4fsbmBaLIHvN2fEvonx4fwBuTLoXm8JuTJz4dvxApum/mmcPngSDx
 CCOumJAgynB2Sg15P4rAzoWfG6WDF2/gDs1JmoyNrN01xEGL4GUa/xc7RVLZxpafmd8R
 BgtYy4oQ+uY/UewuKLFOjssdUZm8yOkqq6kNrXMDQBkwjvYvNfayp/0awVLSbxMuVeqw
 3i/DlD39vcbLBUMljQZ2AExAAy/b1O+neqmYELMd/Mw9lJzkflDopGdk1Op574ZMXeCW
 WrWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=LJlGfrsfB+rwVrxohSUCjOG8t2khLv37nI8YELUkoHM=;
 b=iLJ5+vANebAFy0oG+b8N62I3wuCpPXRn2JD/9n2C32aNorHlk/CPo41R8fTVpISl3I
 GCGbyAeqqfEDcXiWr9vRIuTzrhFrNxxQO2jgR1v9YDqVaHkUMMrecz2SHiNpRka9Pkx0
 P5FxEf7jhKuFPjGo71ylN/fnn1AKYmrjwAPUXZ5Ho7p37F9DpVksQsN1xjJcfJsReCjL
 zjXaUnihRlyg/NJ1eJsT0SdC+8R4ft0ex/OPhH7w3rPgQOWlQMLdFaxnEUKWAXz/LvMC
 tSBiPZVllDwnk0EJdLsdak/nLnKiOYvQh+TWgmR0nhwzINWu7PPbNaqiPlS+bADWniO6
 oVtQ==
X-Gm-Message-State: AOAM530qen8xcXOy1QLKOxkei8OfoIrqFa46d2HYOq1Vku9px+f1Je48
 SI3XmXLlWfZ1aNJP0GxXE3N3WQ==
X-Google-Smtp-Source: ABdhPJwXCzj04NEyLsIbb2z3eAxASdQin3kT5HCsL33D1+gEJZT2+QDZA6sovDXJEaRwoy9B6+JBVg==
X-Received: by 2002:adf:dec4:: with SMTP id i4mr43736530wrn.191.1626886622568; 
 Wed, 21 Jul 2021 09:57:02 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q19sm387768wmq.38.2021.07.21.09.57.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 09:57:01 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 31C241FF7E;
 Wed, 21 Jul 2021 17:57:01 +0100 (BST)
References: <20210710005929.1702431-1-mathieu.poirier@linaro.org>
 <20210710005929.1702431-5-mathieu.poirier@linaro.org>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v3 4/4] docs: Add documentation for vhost based RNG
 implementation
Date: Wed, 21 Jul 2021 17:55:08 +0100
In-reply-to: <20210710005929.1702431-5-mathieu.poirier@linaro.org>
Message-ID: <87im13y59e.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mathieu Poirier <mathieu.poirier@linaro.org> writes:

> Add description and example for the vhost-user based RNG implementation.
> Tailored on Viresh Kumar's vhost-user-i2c documentation.
>
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  docs/tools/index.rst          |  1 +
>  docs/tools/vhost-user-rng.rst | 74 +++++++++++++++++++++++++++++++++++
>  2 files changed, 75 insertions(+)
>  create mode 100644 docs/tools/vhost-user-rng.rst
>
> diff --git a/docs/tools/index.rst b/docs/tools/index.rst
> index d923834a7398..9d80fa89eceb 100644
> --- a/docs/tools/index.rst
> +++ b/docs/tools/index.rst
> @@ -15,5 +15,6 @@ Contents:
>     qemu-nbd
>     qemu-pr-helper
>     qemu-trace-stap
> +   vhost-user-rng
>     virtfs-proxy-helper
>     virtiofsd
> diff --git a/docs/tools/vhost-user-rng.rst b/docs/tools/vhost-user-rng.rst
> new file mode 100644
> index 000000000000..7f69d7bb3c58
> --- /dev/null
> +++ b/docs/tools/vhost-user-rng.rst
> @@ -0,0 +1,74 @@
> +QEMU vhost-user-rng - RNG emulation backend
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Synopsis
> +--------
> +
> +**vhost-user-rng** [*OPTIONS*]
> +
> +Description
> +-----------
> +
> +This program is a vhost-user backend that emulates a VirtIO random number
> +generator (RNG).  It uses the host's random number generator pool,
> +/dev/urandom by default but configurable at will, to satisfy requests fr=
om
> +guests.
> +
> +This program is designed to work with QEMU's ``-device
> +vhost-user-rng-pci`` but should work with any virtual machine monitor
> +(VMM) that supports vhost-user. See the Examples section below.
> +
> +Options
> +-------
> +
> +.. program:: vhost-user-rng
> +
> +.. option:: -h, --help
> +
> +  Print help.
> +
> +.. option:: -v, --verbose
> +
> +   Increase verbosity of output
> +
> +.. option:: -s, --socket-path=3DPATH
> +
> +  Listen on vhost-user UNIX domain socket at PATH. Incompatible with --f=
d.
> +
> +.. option:: -f, --fd=3DFDNUM
> +
> +  Accept connections from vhost-user UNIX domain socket file descriptor =
FDNUM.
> +  The file descriptor must already be listening for connections.
> +  Incompatible with --socket-path.
> +
> +.. option:: -p, --period
> +
> +  Rate, in milliseconds, at which the RNG hardware can generate random d=
ata.
> +  Used in conjunction with the --max-bytes option.
> +
> +.. option:: -m, --max-bytes
> +
> +  In conjuction with the --period parameter, provides the maximum number=
 of byte
> +  per milliseconds a RNG device can generate.
> +
> +Examples
> +--------
> +
> +The daemon should be started first:
> +
> +::
> +
> +  host# vhost-user-rng --socket-path=3Drng.sock --period=3D1000 --max-by=
tes=3D4096
> +
> +The QEMU invocation needs to create a chardev socket the device can
> +use to communicate as well as share the guests memory over a memfd.
> +
> +::
> +
> +  host# qemu-system								\
> +      -chardev socket,path=3D$(PATH)/rng.sock,id=3Drng0				\
> +      -device vhost-user-rng-pci,chardev=3Drng0					\
> +      -m 4096 									\
> +      -object memory-backend-file,id=3Dmem,size=3D4G,mem-path=3D/dev/shm=
,share=3Don	\
> +      -numa node,memdev=3Dmem							\
> +      ...

Would it be worth pointing out how a guest may consume the randomness? I
appreciate this will be guest specific but currently I'm struggling how
to consume the entropy in a Linux guest.

  cat /dev/urandom > /dev/null

didn't seem to cause any to be consumed above what was during boot up.

--=20
Alex Benn=C3=A9e

