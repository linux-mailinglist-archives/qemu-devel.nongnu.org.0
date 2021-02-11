Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C31B31858D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 08:13:01 +0100 (CET)
Received: from localhost ([::1]:45670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA69s-0005wX-9d
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 02:13:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1lA5p0-0003eF-Rk
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 01:51:27 -0500
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:33024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1lA5ou-00017o-KI
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 01:51:26 -0500
Received: by mail-ot1-x329.google.com with SMTP id c16so4299114otp.0
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 22:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vgknhrMr+wo5FxITNEEdxEN2/Hml+rMNcXY6i4AXFYk=;
 b=TaGJZ5uduqk/WmNAB50EuoKZJ/PQ9BPpuWM8D41/YtYfVl9QoLDKm1MEvbL961nuSF
 7L39MGJBX5fHA4U8jPUT2tI4iCCFveJ0XQXkNZiHR5INtP16SG3GRhJgFoELQu6dep63
 KpTLynHmx+ZeYBdRjWlXRKlfuyq4SD2gxX+Rqg2rb1eg3IIDwuwwM8+u6TinUxOCcmPq
 JbcNraFoSCr/sL+9UYk1RGr71eo1MtZIZhqcje5kpj1BAlkElMcYE2s9tyWSzZdME1zz
 38IVxlGKbJQY3RERgP8SIRlKEZf8mEcvlAaJGYQf8AoNI6PGXh7Duj1Kq65PiijT5P/A
 YWlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vgknhrMr+wo5FxITNEEdxEN2/Hml+rMNcXY6i4AXFYk=;
 b=m4VgQoIXhs3G/oJvpinXeAExFXbqvru/xnotHpKzci7mK2p3osklU+WvvUn4R9LETt
 GB7HKeNpekHQU0b8dIMsOOHkIin0l+CXKsCCyTUbHs/CIenxT/5nqAX3YtZmXqFxH/RR
 tAOPcv751iME1RjaYw+iGxYd3Y9l/P5USZT3c0hnVvcLO0BtyR2/jlMYqf/PD81+bXdY
 jwbVBetkdwbBtND4FKpFwk4h7n9/xWiiJeXYUr820jHimO2G2sCBJwZKMdGud72zWh4G
 U98uYKGWCEyVqbioNpm4iyr9M0z9mHcQMgYl9HfO0/EW0GJL7BYvpML6WkP+gAuqXqvr
 ZwJg==
X-Gm-Message-State: AOAM533IIFaBkfEINFts+8hwKcc+oKjA4zKDDCCvPu1E/4Yf47PsYvXz
 1BUA8bxC6/OeM+jUzUCE4/N0tDPGNq2+1w3H7Ww=
X-Google-Smtp-Source: ABdhPJw7mgkLn+t1ZYnN1ng/S6e+F003iwaQH606kTJrlL9a+KwS5v4ty+5B/Ib39wx+zpSNJNmiNfZyb01SFuwPmgQ=
X-Received: by 2002:a9d:8ef:: with SMTP id 102mr4873426otf.75.1613026278468;
 Wed, 10 Feb 2021 22:51:18 -0800 (PST)
MIME-Version: 1.0
References: <20210205164106.6664-1-phillip.ennen@gmail.com>
In-Reply-To: <20210205164106.6664-1-phillip.ennen@gmail.com>
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Thu, 11 Feb 2021 07:51:07 +0100
Message-ID: <CABLmASGzRf+VWAy79jGst7U_TN9Wy=DxFCn9Uc8zRVF=j+m6-w@mail.gmail.com>
Subject: Re: [PATCH v2] net/macos: implement vmnet-based network device
To: phillip.ennen@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=hsp.cat7@gmail.com; helo=mail-ot1-x329.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 jasowang@redhat.com, qemu-devel qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, phillip@axleos.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 5, 2021 at 5:54 PM <phillip.ennen@gmail.com> wrote:
>
> From: Phillip Tennen <phillip@axleos.com>
>
> This patch implements a new netdev device, reachable via -netdev
> vmnet-macos, that=E2=80=99s backed by macOS=E2=80=99s vmnet framework.
>
> The vmnet framework provides native bridging support, and its usage in
> this patch is intended as a replacement for attempts to use a tap device
> via the tuntaposx kernel extension. Notably, the tap/tuntaposx approach
> never would have worked in the first place, as QEMU interacts with the
> tap device via poll(), and macOS does not support polling device files.
>
> vmnet requires either a special entitlement, granted via a provisioning
> profile, or root access. Otherwise attempts to create the virtual
> interface will fail with a =E2=80=9Cgeneric error=E2=80=9D status code. Q=
EMU may not
> currently be signed with an entitlement granted in a provisioning
> profile, as this would necessitate pre-signed binary build distribution,
> rather than source-code distribution. As such, using this netdev
> currently requires that qemu be run with root access. I=E2=80=99ve opened=
 a
> feedback report with Apple to allow the use of the relevant entitlement
> with this use case:
> https://openradar.appspot.com/radar?id=3D5007417364447232
>
> vmnet offers three operating modes, all of which are supported by this
> patch via the =E2=80=9Cmode=3Dhost|shared|bridge=E2=80=9D option:
>
> * "Host" mode: Allows the vmnet interface to communicate with other
> * vmnet
> interfaces that are in host mode and also with the native host.
> * "Shared" mode: Allows traffic originating from the vmnet interface to
> reach the Internet through a NAT. The vmnet interface can also
> communicate with the native host.
> * "Bridged" mode: Bridges the vmnet interface with a physical network
> interface.
>
> Each of these modes also provide some extra configuration that=E2=80=99s
> supported by this patch:
>
> * "Bridged" mode: The user may specify the physical interface to bridge
> with. Defaults to en0.
> * "Host" mode / "Shared" mode: The user may specify the DHCP range and
> subnet. Allocated by vmnet if not provided.
>
> vmnet also offers some extra configuration options that are not
> supported by this patch:
>
> * Enable isolation from other VMs using vmnet
> * Port forwarding rules
> * Enabling TCP segmentation offload
> * Only applicable in "shared" mode: specifying the NAT IPv6 prefix
> * Only available in "host" mode: specifying the IP address for the VM
> within an isolated network
>
> Note that this patch requires macOS 10.15 as a minimum, as this is when
> bridging support was implemented in vmnet.framework.
>
> Signed-off-by: Phillip Tennen <phillip@axleos.com>
>
Hi Phillip,

Thank you very much for this patch. As you wrote it should apply from
10.15 upwards. I have no problem building on Big Sur, but Catalina
stumbles. See below. Latest Xcode installed, other requirements
installed through brew.

Thanks for looking into this,

Best,
Howard

[1181/2135] Compiling C object libcommon.fa.p/net_vmnet-macos.c.o
FAILED: libcommon.fa.p/net_vmnet-macos.c.o
cc -Ilibcommon.fa.p -I. -I.. -I../capstone/include/capstone
-I../dtc/libfdt -I../slirp -I../slirp/src -Iqapi -Itrace -Iui
-Iui/shader -I/usr/local/Cellar/libffi/3.3_2/include
-I/usr/local/Cellar/glib/2.66.6/include
-I/usr/local/Cellar/glib/2.66.6/include/glib-2.0
-I/usr/local/Cellar/glib/2.66.6/lib/glib-2.0/include
-I/usr/local/opt/gettext/include -I/usr/local/Cellar/pcre/8.44/include
-I/usr/local/Cellar/glib/2.66.6/include/gio-unix-2.0
-I/usr/local/Cellar/libusb/1.0.24/include/libusb-1.0
-I/usr/local/Cellar/pixman/0.40.0/include/pixman-1 -Xclang
-fcolor-diagnostics -pipe -Wall -Winvalid-pch -std=3Dgnu99 -O2 -g
-iquote . -iquote /Users/hsp/src/qemu-master -iquote
/Users/hsp/src/qemu-master/include -iquote
/Users/hsp/src/qemu-master/disas/libvixl -iquote
/Users/hsp/src/qemu-master/tcg/i386 -iquote
/Users/hsp/src/qemu-master/accel/tcg -m64 -mcx16
-DOS_OBJECT_USE_OBJC=3D0 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64
-D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef
-Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common
-fwrapv -Wold-style-definition -Wtype-limits -Wformat-security
-Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body
-Wnested-externs -Wendif-labels -Wexpansion-to-defined
-Wno-initializer-overrides -Wno-missing-include-dirs
-Wno-shift-negative-value -Wno-string-plus-int
-Wno-typedef-redefinition -Wno-tautological-type-limit-compare
-fstack-protector-strong -DSTRUCT_IOVEC_DEFINED -MD -MQ
libcommon.fa.p/net_vmnet-macos.c.o -MF
libcommon.fa.p/net_vmnet-macos.c.o.d -o
libcommon.fa.p/net_vmnet-macos.c.o -c ../net/vmnet-macos.c
../net/vmnet-macos.c:54:10: error: use of undeclared identifier
'VMNET_SHARING_SERVICE_BUSY'
    case VMNET_SHARING_SERVICE_BUSY:
         ^

