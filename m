Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A64CB36E850
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 12:02:22 +0200 (CEST)
Received: from localhost ([::1]:60496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc3Uz-0002gm-GB
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 06:02:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lc3Si-0001ZY-N2
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 06:00:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lc3Sg-00039s-9k
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 06:00:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619690394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Kx727WIucwkDcckyJ6vuO/37KfphZxgMqdMCq8ygO/Y=;
 b=bOEsqP8go2ENmkyITfQ751zB4RQQCPLdbLmiyDXCh3PlpMhlJLwjF8nj4/b7mqJvEf0lqx
 yNGmR9MCfFBkK3mPGNdWT865OObXchbIv8JUQcz32b7G3lZp73rOHoTfbWu1c9ppTz2LcG
 Zqv1+xZHA7bahkrScZPt0nf6PbMpUmI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-FQzLdl5XOp691LrHOeH3VQ-1; Thu, 29 Apr 2021 05:59:52 -0400
X-MC-Unique: FQzLdl5XOp691LrHOeH3VQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63E356D246;
 Thu, 29 Apr 2021 09:59:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EFB4C6BF6B;
 Thu, 29 Apr 2021 09:59:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6AD3C113525D; Thu, 29 Apr 2021 11:59:41 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: Let's remove some deprecated stuff
Date: Thu, 29 Apr 2021 11:59:41 +0200
Message-ID: <87y2d1csxe.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, dirty.ice.hu@gmail.com,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If you're cc'ed, you added a section to docs/system/deprecated.rst that
is old enough to permit removal.  This is *not* a demand to remove, it's
a polite request to consider whether the time for removal has come.
Extra points for telling us in a reply.  "We should remove, but I can't
do it myself right now" is a valid answer.  Let's review the file:

    System emulator command line arguments
    --------------------------------------

K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n:

    ``QEMU_AUDIO_`` environment variables and ``-audio-help`` (since 4.0)
    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

    The ``-audiodev`` argument is now the preferred way to specify audio
    backend settings instead of environment variables.  To ease migration t=
o
    the new format, the ``-audiodev-help`` option can be used to convert
    the current values of the environment variables to ``-audiodev`` option=
s.

K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n:

    Creating sound card devices and vnc without ``audiodev=3D`` property (s=
ince 4.2)
    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''=
'''''''

    When not using the deprecated legacy audio config, each sound card
    should specify an ``audiodev=3D`` property.  Additionally, when using
    vnc, you should specify an ``audiodev=3D`` property if you plan to
    transmit audio through the VNC protocol.

Gerd Hoffmann:

    Creating sound card devices using ``-soundhw`` (since 5.1)
    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

    Sound card devices should be created using ``-device`` instead.  The
    names are the same for most devices.  The exceptions are ``hda`` which
    needs two devices (``-device intel-hda -device hda-duplex``) and
    ``pcspk`` which can be activated using ``-machine
    pcspk-audiodev=3D<name>``.

[...]

Alistair Francis:

    RISC-V ``-bios`` (since 5.1)
    ''''''''''''''''''''''''''''

    QEMU 4.1 introduced support for the -bios option in QEMU for RISC-V for=
 the
    RISC-V virt machine and sifive_u machine. QEMU 4.1 had no changes to th=
e
    default behaviour to avoid breakages.

    QEMU 5.1 changes the default behaviour from ``-bios none`` to ``-bios d=
efault``.

    QEMU 5.1 has three options:
     1. ``-bios default`` - This is the current default behavior if no -bio=
s option
          is included. This option will load the default OpenSBI firmware a=
utomatically.
          The firmware is included with the QEMU release and no user intera=
ction is
          required. All a user needs to do is specify the kernel they want =
to boot
          with the -kernel option
     2. ``-bios none`` - QEMU will not automatically load any firmware. It =
is up
          to the user to load all the images they need.
     3. ``-bios <file>`` - Tells QEMU to load the specified file as the fir=
mwrae.

[...]

    QEMU Machine Protocol (QMP) commands
    ------------------------------------

Myself, but I only documented it; it's actually Kevin Wolf:

    ``blockdev-open-tray``, ``blockdev-close-tray`` argument ``device`` (si=
nce 2.8.0)
    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''=
''''''''''

    Use argument ``id`` instead.

    ``eject`` argument ``device`` (since 2.8.0)
    '''''''''''''''''''''''''''''''''''''''''''

    Use argument ``id`` instead.

    ``blockdev-change-medium`` argument ``device`` (since 2.8.0)
    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

    Use argument ``id`` instead.

    ``block_set_io_throttle`` argument ``device`` (since 2.8.0)
    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

    Use argument ``id`` instead.

Myself:

    ``blockdev-add`` empty string argument ``backing`` (since 2.10.0)
    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

    Use argument value ``null`` instead.

Myself, but I only documented it; it's actually Kevin Wolf:

    ``block-commit`` arguments ``base`` and ``top`` (since 3.1.0)
    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

    Use arguments ``base-node`` and ``top-node`` instead.

Kevin Wolf:

    ``nbd-server-add`` and ``nbd-server-remove`` (since 5.2)
    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''

    Use the more generic commands ``block-export-add`` and ``block-export-d=
el``
    instead.  As part of this deprecation, where ``nbd-server-add`` used a
    single ``bitmap``, the new ``block-export-add`` uses a list of ``bitmap=
s``.


[...]

    System emulator CPUS
    --------------------

Thomas Huth:

    ``moxie`` CPU (since 5.2.0)
    '''''''''''''''''''''''''''

    The ``moxie`` guest CPU support is deprecated and will be removed in
    a future version of QEMU. It's unclear whether anybody is still using
    CPU emulation in QEMU, and there are no test images available to make
    sure that the code is still working.

    ``lm32`` CPUs (since 5.2.0)
    '''''''''''''''''''''''''''

    The ``lm32`` guest CPU support is deprecated and will be removed in
    a future version of QEMU. The only public user of this architecture
    was the milkymist project, which has been dead for years; there was
    never an upstream Linux port.

    ``unicore32`` CPUs (since 5.2.0)
    ''''''''''''''''''''''''''''''''

    The ``unicore32`` guest CPU support is deprecated and will be removed i=
n
    a future version of QEMU. Support for this CPU was removed from the
    upstream Linux kernel, and there is no available upstream toolchain
    to build binaries for it.

Robert Hoo:

    ``Icelake-Client`` CPU Model (since 5.2.0)
    ''''''''''''''''''''''''''''''''''''''''''

    ``Icelake-Client`` CPU Models are deprecated. Use ``Icelake-Server`` CP=
U
    Models instead.

Philippe Mathieu-Daud=C3=A9:

    MIPS ``I7200`` CPU Model (since 5.2)
    ''''''''''''''''''''''''''''''''''''

    The ``I7200`` guest CPU relies on the nanoMIPS ISA, which is deprecated
    (the ISA has never been upstreamed to a compiler toolchain). Therefore
    this CPU is also deprecated.

    System emulator machines
    ------------------------

Philippe Mathieu-Daud=C3=A9:

    Raspberry Pi ``raspi2`` and ``raspi3`` machines (since 5.2)
    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

    The Raspberry Pi machines come in various models (A, A+, B, B+). To be =
able
    to distinguish which model QEMU is implementing, the ``raspi2`` and ``r=
aspi3``
    machines have been renamed ``raspi2b`` and ``raspi3b``.

    Device options
    --------------

    Emulated device options
    '''''''''''''''''''''''

Stefan Hajnoczi:

    ``-device virtio-blk,scsi=3Don|off`` (since 5.0.0)
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    The virtio-blk SCSI passthrough feature is a legacy VIRTIO feature.  VI=
RTIO 1.0
    and later do not support it because the virtio-scsi device was introduc=
ed for
    full SCSI support.  Use virtio-scsi instead when SCSI passthrough is re=
quired.

    Note this also applies to ``-device virtio-blk-pci,scsi=3Don|off``, whi=
ch is an
    alias.

    Block device options
    ''''''''''''''''''''

Myself:

    ``"backing": ""`` (since 2.12.0)
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    In order to prevent QEMU from automatically opening an image's backing
    chain, use ``"backing": null`` instead.

Myself:

    ``rbd`` keyvalue pair encoded filenames: ``""`` (since 3.1.0)
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    Options for ``rbd`` should be specified according to its runtime option=
s,
    like other block drivers.  Legacy parsing of keyvalue pair encoded
    filenames is useful to open images with the old format for backing file=
s;
    These image files should be updated to use the current format.

    Example of legacy encoding::

      json:{"file.driver":"rbd", "file.filename":"rbd:rbd/name"}

    The above, converted to the current supported format::

      json:{"file.driver":"rbd", "file.pool":"rbd", "file.image":"name"}

Daniel P. Berrang=C3=A9:

    ``sheepdog`` driver (since 5.2.0)
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    The ``sheepdog`` block device driver is deprecated. The corresponding u=
pstream
    server project is no longer actively maintained. Users are recommended =
to switch
    to an alternative distributed block device driver such as RBD. The
    ``qemu-img convert`` command can be used to liberate existing data by m=
oving
    it out of sheepdog volumes into an alternative storage backend.

    linux-user mode CPUs
    --------------------

Alex Benn=C3=A9e:

    ``ppc64abi32`` CPUs (since 5.2.0)
    '''''''''''''''''''''''''''''''''

    The ``ppc64abi32`` architecture has a number of issues which regularly
    trip up our CI testing and is suspected to be quite broken. For that
    reason the maintainers strongly suspect no one actually uses it.

    MIPS ``I7200`` CPU (since 5.2)
    ''''''''''''''''''''''''''''''

    The ``I7200`` guest CPU relies on the nanoMIPS ISA, which is deprecated
    (the ISA has never been upstreamed to a compiler toolchain). Therefore
    this CPU is also deprecated.

    Related binaries
    ----------------

Eric Blake:

    qemu-img amend to adjust backing file (since 5.1)
    '''''''''''''''''''''''''''''''''''''''''''''''''

    The use of ``qemu-img amend`` to modify the name or format of a qcow2
    backing image is deprecated; this functionality was never fully
    documented or tested, and interferes with other amend operations that
    need access to the original backing image (such as deciding whether a
    v3 zero cluster may be left unallocated when converting to a v2
    image).  Rather, any changes to the backing chain should be performed
    with ``qemu-img rebase -u`` either before or after the remaining
    changes being performed by amend, as appropriate.

    qemu-img backing file without format (since 5.1)
    ''''''''''''''''''''''''''''''''''''''''''''''''

    The use of ``qemu-img create``, ``qemu-img rebase``, or ``qemu-img
    convert`` to create or modify an image that depends on a backing file
    now recommends that an explicit backing format be provided.  This is
    for safety: if QEMU probes a different format than what you thought,
    the data presented to the guest will be corrupt; similarly, presenting
    a raw image to a guest allows a potential security exploit if a future
    probe sees a non-raw image based on guest writes.

    To avoid the warning message, or even future refusal to create an
    unsafe image, you must pass ``-o backing_fmt=3D`` (or the shorthand
    ``-F`` during create) to specify the intended backing format.  You may
    use ``qemu-img rebase -u`` to retroactively add a backing format to an
    existing image.  However, be aware that there are already potential
    security risks to blindly using ``qemu-img info`` to probe the format
    of an untrusted backing image, when deciding what format to add into
    an existing image.

    Backwards compatibility
    -----------------------

I'm not sure there's anything to remove here, but anyway, Peter Maydell:


    Runnability guarantee of CPU models (since 4.1.0)
    '''''''''''''''''''''''''''''''''''''''''''''''''

    Previous versions of QEMU never changed existing CPU models in
    ways that introduced additional host software or hardware
    requirements to the VM.  This allowed management software to
    safely change the machine type of an existing VM without
    introducing new requirements ("runnability guarantee").  This
    prevented CPU models from being updated to include CPU
    vulnerability mitigations, leaving guests vulnerable in the
    default configuration.

    The CPU model runnability guarantee won't apply anymore to
    existing CPU models.  Management software that needs runnability
    guarantees must resolve the CPU model aliases using the
    ``alias-of`` field returned by the ``query-cpu-definitions`` QMP
    command.

    While those guarantees are kept, the return value of
    ``query-cpu-definitions`` will have existing CPU model aliases
    point to a version that doesn't break runnability guarantees
    (specifically, version 1 of those CPU models).  In future QEMU
    versions, aliases will point to newer CPU model versions
    depending on the machine type, so management software must
    resolve CPU model aliases before starting a virtual machine.

    Guest Emulator ISAs
    -------------------

Philippe Mathieu-Daud=C3=A9:

    nanoMIPS ISA
    ''''''''''''

    The ``nanoMIPS`` ISA has never been upstreamed to any compiler toolchai=
n.
    As it is hard to generate binaries for it, declare it deprecated.


