Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBB832CB26
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 04:47:02 +0100 (CET)
Received: from localhost ([::1]:40266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHex2-00006q-LE
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 22:47:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.leslie@gmail.com>)
 id 1lHevs-000831-Kc
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 22:45:48 -0500
Received: from mail-ej1-f52.google.com ([209.85.218.52]:40542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ben.leslie@gmail.com>)
 id 1lHevq-0000GC-NB
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 22:45:48 -0500
Received: by mail-ej1-f52.google.com with SMTP id ci14so27606151ejc.7
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 19:45:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=hTDnoB80bOsp3j+ZuJXH6CJtqKO0pOlxQ9UsKOK9q6M=;
 b=t6f0Gt+2pbJqSLumDU9QZckwOPwhV00es7pDp26n7dPR6PssqpqaULoreuK6rzRKRT
 9T3MKr3T72TYMi5m6svdmNXPq1+ylQYm77ruUajl554316bWEMaavENEoPDOZLAvXHP4
 66/keb8D7Pk2Z801UrC6kTFE80dnvhg3wiHRwYNOm+lAANbC0m67Qre+9uUKX0FtmDJS
 K/CbL4trLOEQutbBhAJnl5CwufA3JnD7ophJlM2MRz1Wfs0xYovJ5+TXyN5WGbD8OIcD
 A6nrHP1ttANb7tYM39JqLgYCy1XTcctfHLsHEqPXXp7vJRXkkqh8GQP22V4h3AcNBP0W
 gz4Q==
X-Gm-Message-State: AOAM530lQy5tv+JfrQJXlbJ6kLgX1aOXkdGqGUgsGhkN2dR3ddWdm4RE
 4JG7J10E1U+QjGZLec+4q8TNd2sPitPuQbFz8TgkMwAZ3v884w==
X-Google-Smtp-Source: ABdhPJzrFiuc5ZO1NBqAC/NJT8k7ol/0tGkIMWLfnD4Ybr7cLjCpGQ4KL913NLVw4Dam319Dzmc6rQkojLD6kUxPTLM=
X-Received: by 2002:a17:906:a101:: with SMTP id
 t1mr2110993ejy.182.1614829544173; 
 Wed, 03 Mar 2021 19:45:44 -0800 (PST)
MIME-Version: 1.0
From: Ben Leslie <benno@benno.id.au>
Date: Thu, 4 Mar 2021 14:45:32 +1100
Message-ID: <CABZ0LtBrGynOoYr=xbT3zNGe3UQg=Dr39_8d9V6+XgGzpnQrsw@mail.gmail.com>
Subject: USB port claiming / set configuration problems
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000005a72f105bcadcdab"
Received-SPF: pass client-ip=209.85.218.52; envelope-from=ben.leslie@gmail.com;
 helo=mail-ej1-f52.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005a72f105bcadcdab
Content-Type: text/plain; charset="UTF-8"

I have encountered a number of devices (mostly mobile phones) which seem to
get very confused if a "SET CONFIGURATION" control transfer (for the same
interface) is performed twice.

Specifically, after receiving a 2nd SET CONFIGURATION (for the same
interface) the device times out on future bulk output transfers. (Sometimes
PING-NAK continues until the overall transfer times out, in other cases the
PING itself timeouts after ~200 PING-NAKs).

While I'm fairly confident in saying that the USB firmware on these devices
is broken they seem to work enough to be operable when running a native
operating system.

Unfortunately when running the same operating system virtualized under Qemu
we are able to trigger this bug.

This was originally found using an older (4.2) version of Qemu. It seems
like that the patch bfe44898848614cfcb3a269bc965afbe1f0f331c was able to
solve the issue for some of the devices we see. Specifically, this avoids
actually performing a SET CONFIGURATION control transfer if there is only a
single configuration. The commit message "Seems some devices become
confused when we call libusb_set_configuration()." seems to confirm some of
the behaviour we have been seeing.

Unfortunately, while this appears to have solved the issue for devices with
a single configuration we still appear to have problems when hitting
devices with multiple configurations (which is not surprising given that
the commit only changed behaviour for single-configuration devices).

To attempt a work-around and validate the theory I change the
`usb_host_set_config` function (in host-libusb.c) such that it first checks
if the current active configuration matches the request configuration, and
if so skips performing the actual SET CONFIGURATION control transfer.

Would a patch of this nature be the right approach?
Perhaps this check could replace the number of configurations check?

Taking a step back here, the larger problem is that Linux host performs
various control transfers prior to qemu (and therefore the guest operating
system) gaining control of the device.
This means the sequence of control transfers with the device is inherently
going to be different when the guest OS is virtualized as compared to
running natively. For well behaving devices this really shouldn't matter,
but not all devices are well behaving!

USBDEVFS has support for `USBDEVFS_CLAIM_PORT` (and
`USBDEVFS_RELEASE_PORT`) ioctls. From the definition this seem designed to
limit the interaction that Linux kernel might have with a device on a
claimed port, which seems perfect for this use case. This in fact used in
previous version of qemu if we go back to the host-linux.c days, but with
the change over to host-libusb.c this functionality was lost.

Was this intentional? Would adding support to host-libusb to use these
ioctl to claim the port be beneficial? Based on a simple test program and
hardware USB traces for a device connected to a 'claimed' port the kernel
does indeed leave the device in an unconfigured state. (Although it still
performs some basic control transfers to gather descriptor, and strangely
seems to in this case make an explicit SET CONFIGURATION transfer, but sets
configuration to zero, rather than an actual configuration, which, at least
for the devices I was able to test with, avoided the problems of calling
SET CONFIGURATION (1) twice). Integrating this support back into
host-libusb.c is a little more involved than the work around described
above, so I'd appreciate any feedback before going down that path.

Thanks,

Ben

--0000000000005a72f105bcadcdab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I have encountered a number of devices (mostly mobile=
 phones) which seem to get very confused if a &quot;SET CONFIGURATION&quot;=
 control transfer (for the same interface) is performed twice. <br></div><d=
iv><br></div><div>Specifically, after receiving a 2nd SET CONFIGURATION (fo=
r the same interface) the device times out on future bulk output transfers.=
 (Sometimes PING-NAK continues until the overall transfer times out, in oth=
er cases the PING itself timeouts after ~200 PING-NAKs).</div><div><br></di=
v><div>While I&#39;m fairly confident in saying that the USB firmware on th=
ese devices is broken they seem to work enough to be operable when running =
a native operating system.</div><div><br></div><div>Unfortunately when runn=
ing the same operating system virtualized under Qemu we are able to trigger=
 this bug.</div><div><br></div><div>This was originally found using an olde=
r (4.2) version of Qemu. It seems like that the patch bfe44898848614cfcb3a2=
69bc965afbe1f0f331c was able to solve the issue for some of the devices we =
see. Specifically, this avoids actually performing a SET CONFIGURATION cont=
rol transfer if there is only a single configuration. The commit message &q=
uot;Seems some devices become confused when we call libusb_set_configuratio=
n().&quot; seems to confirm some of the behaviour we have been seeing.</div=
><div><br></div><div>Unfortunately, while this appears to have solved the i=
ssue for devices with a single configuration we still appear to have proble=
ms when hitting devices with multiple configurations (which is not surprisi=
ng given that the commit only changed behaviour for single-configuration de=
vices).</div><div><br></div><div>To attempt a work-around and validate the =
theory I change the `usb_host_set_config` function (in host-libusb.c) such =
that it first checks if the current active configuration matches the reques=
t configuration, and if so skips performing the actual SET CONFIGURATION co=
ntrol transfer.</div><div><br></div><div>Would a patch of this nature be th=
e right approach?<br></div><div>Perhaps this check could replace the number=
 of configurations check?</div><div><br></div><div>Taking a step back here,=
 the larger problem is that Linux host performs various control transfers p=
rior to qemu (and therefore the guest operating system) gaining control of =
the device.</div><div>This means the sequence of control transfers with the=
 device is inherently going to be different when the guest OS is virtualize=
d as compared to running natively. For well behaving devices this really sh=
ouldn&#39;t matter, but not all devices are well behaving!</div><div><br></=
div><div>USBDEVFS has support for `USBDEVFS_CLAIM_PORT` (and `USBDEVFS_RELE=
ASE_PORT`) ioctls. From the definition this seem designed to limit the inte=
raction that Linux kernel might have with a device on a claimed port, which=
 seems perfect for this use case. This in fact used in previous version of =
qemu if we go back to the host-linux.c days, but with the change over to ho=
st-libusb.c this functionality was lost.</div><div><br></div><div>Was this =
intentional? Would adding support to host-libusb to use these ioctl to clai=
m the port be beneficial? Based on a simple test program and hardware USB t=
races for a device connected to a &#39;claimed&#39; port the kernel does in=
deed leave the device in an unconfigured state. (Although it still performs=
 some basic control transfers to gather descriptor, and strangely seems to =
in this case make an explicit SET CONFIGURATION transfer, but sets configur=
ation to zero, rather than an actual configuration, which, at least for the=
 devices I was able to test with, avoided the problems of calling SET CONFI=
GURATION (1) twice). Integrating this support back into host-libusb.c is a =
little more involved than the work around described above, so I&#39;d appre=
ciate any feedback before going down that path.<br></div><div><br></div><di=
v>Thanks,</div><div><br></div><div>Ben<br></div><div><br></div><div><br></d=
iv><div><br></div><div><br></div><div><br></div><div><br></div><div><br></d=
iv><div><br></div><br></div>

--0000000000005a72f105bcadcdab--

