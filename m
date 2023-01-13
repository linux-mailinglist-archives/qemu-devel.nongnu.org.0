Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CB7669CCD
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 16:48:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGLgm-0002WX-R3; Fri, 13 Jan 2023 10:09:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1pGLgJ-0002E7-IM
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:09:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1pGLgH-0006My-LF
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:09:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673622559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f1gHgRrky4XVlWiTf87zX6ZyxiOa7UGwM9EUPdL/iBQ=;
 b=Qones6/9Inorz7ojWQVVv8kjkKiViHFVgkptJ9m0hjVEh2GD0XIYrF0/dwXIi6saneLxWI
 QxRB3Bi/sXTqnBZ2DwFsdVOghMulQ7FVKpK5cLNMP25UqyF9qglQMgo37QxwGfWlvk7zx2
 znfUPfBu86F0zbGPIr/4+XONJ7FXAYk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-hHsJe7LOO6OjWRmDpf1NHg-1; Fri, 13 Jan 2023 10:09:16 -0500
X-MC-Unique: hHsJe7LOO6OjWRmDpf1NHg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD8BD100F90F;
 Fri, 13 Jan 2023 15:09:15 +0000 (UTC)
Received: from pinwheel (unknown [10.39.193.126])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 536B22166B26;
 Fri, 13 Jan 2023 15:09:13 +0000 (UTC)
Date: Fri, 13 Jan 2023 16:09:05 +0100
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Alexandre Iooss <erdnaxe@crans.org>,
 peter.maydell@linaro.org, Markus Armbruster <armbru@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 John G Johnson <john.g.johnson@oracle.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH 4/4] docs: add an introduction to the system docs
Message-ID: <Y8F0EYFYcqW98Cxv@pinwheel>
References: <20230113133923.1642627-1-alex.bennee@linaro.org>
 <20230113133923.1642627-5-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230113133923.1642627-5-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Jan 13, 2023 at 01:39:23PM +0000, Alex Bennée wrote:
> Drop the frankly misleading quickstart section for a more rounded
> introduction section. This new section gives an overview of the
> accelerators and high level introduction to some of the key features
> of the emulator. We also expand on a general form for a QEMU command
> line with a hopefully not too scary worked example of what this looks
> like.

Thank you for this improvement!

The rendered version you shared on IRC looks quite good already.

https://qemu-stsquad.readthedocs.io/en/docs-next/system/introduction.html

The only main comment I have is to use -blockdev (instead of '-drive')
for the examples of overriding default firmware further below.  Two
reasons: consistency and IIUC, '-drive' is slated for deprecation in the
future.

Besides that, just a couple of small nits below, feel free to pick and
choose what you prefer :-)

> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---

[...]

> +Introduction
> +============
> +
> +Virtualisation Accelerators
> +---------------------------
> +
> +QEMU's system emulation provides a virtual model of a machine (CPU,
> +memory and emulated devices) to run a guest OS. It supports a number
> +of hypervisors (known as accelerators) as well as a dynamic JIT known
> +as the Tiny Code Generator (TCG) capable of emulating many CPUs.

Nit: might want to expand JIT as well (although if someone is reading
this page, they'd already know what it is).  So up to you :-)

[...]

> +There is a full featured block layer allows for construction of

Nit: s/allows/that allows/

> +complex storage topology which can be stacked across multiple layers
> +supporting redirection, networking, snapshots and migration support.

Speaking of which, consider hyper-linking this doc:
https://qemu.readthedocs.io/en/latest/interop/live-block-operations.html

[...]

> +For the common accelerators QEMU supported debugging with its
> +:ref:`gdbstub<GDB usage>` which allows users to connect GDB and debug
> +system software images

Readability tweak for the first part of the sentence:

    For the common accelerators, QEMU supports debugging with its [...]

> +Running
> +-------

[...]

> +While the project doesn't want to discourage users from using the
> +command line to launch VMs we do want to highlight there are a number

Nit: small tweak:

    [...] to launch VMs, we do want to highlight that there are [...]


[...]

> +We then tell QEMU to multiplex the :ref:`QEMU monitor` with the serial
> +port output (we can switch between the two using :ref:`keys in the
> +character backend multiplexer`). As there is no default graphical
> +device we disable the display as we can work entirely in the terminal.
> +
> +.. code::
> +
> + -serial mon:stdio \
> + -display none \

Nice that you mention "-serial mon:stdio" which doesn't terminate QEMU
on Ctrl-c (while "-serial stdio" does :-)).

> +
> +Finally we override the default firmware to ensure we have have some
> +storage for EFI to persist its configuration. That firmware is
> +responsible for finding the disk, booting grub and eventually running
> +our system.
> +
> +.. code::
> +
> + -drive if=pflash,file=(pwd)/pc-bios/edk2-aarch64-code.fd,format=raw,readonly=on \
> + -drive if=pflash,file=$HOME/images/qemu-arm64-efivars,format=raw

Here, -blockdev.  (I don't have a replacement invocation off-hand,
afraid.)

Regardless of whether these are addressed, this is a strict improvement:

Reviewed-by: Kashyap Chamarthy <kchamart@redhat.com>    


[...]

-- 
/kashyap


