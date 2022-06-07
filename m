Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA96A53F871
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 10:45:00 +0200 (CEST)
Received: from localhost ([::1]:60420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyUpf-0000U1-NW
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 04:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhlcindy@gmail.com>)
 id 1nyUmR-0007A3-V8
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 04:41:39 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:44893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhlcindy@gmail.com>)
 id 1nyUmO-0002CZ-NC
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 04:41:38 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id y188so491375ybe.11
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 01:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yXFQqVMb1Lbu8SQsDHLB0hv8eGhC9gtVgNLgd2k9FAI=;
 b=TimPBgExfrjJxixgGLPLugHyWMllN6wgRcDtSSdTz2zl1SzyQlGwclEHLCkq/avaTK
 JG2pwUdIKNilgOe3sSfsd3PJVowB+uds/jYELBZFBy8vRxX6/JUiD3QluNhmUviXxyy8
 pUhep5UgSPXD0ObVy13kzLmhFhq9KAIcJWX+L1zkWlLanNodoeHix/5ubxCsIQJsApDD
 OpThnaYGb2uP7c/nIJFBkIqzp2clwFn4dDKesYNGl2mkxhU/5ul7M2XY0N9YnHR0zxH5
 GosDUmC+kggoA92YZq7WX5oCppSAWacib0+maMYvuG0k6ywpJRZ5D8P+nnkRhZKnUX6X
 ZnTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yXFQqVMb1Lbu8SQsDHLB0hv8eGhC9gtVgNLgd2k9FAI=;
 b=iqvcW3fd0ShX4+IdAdoZBI/ZfJ503yrKNI+6RK28IfhxhccOmBcXxUYc2lpNB/3PYe
 FGec1OUo9gWSIND/PxrIs9joWkKkQc351Mz2R7Ra4WZX69O3AGzN9LFjzVJ9HQ7bX2vy
 RNPB1RVuRCHxZeq0kA3iJbC8xf5Mzk+qySob057BTs1/eezIGjd7CEUjsDdeAwoY1sRR
 3053VwRFhm4k2CYtoXWT5Gmt8ysOppt8XclUO4tZpXWIQo5luLaco62Tpspmti7NnzHp
 wSaEyYGS77RcHPPdz4N6TWekc0N0dIIypDocahPuHH4ZaDkRpcutJhx2h8cygJSdF+nX
 eGhA==
X-Gm-Message-State: AOAM533m7pcDlr5ozer42MwQd5zFQ2VmGOJMOCqh8R0jGMDwOkTxSuO8
 0TNreYSP5RLsTYng8vDtaJsjzELC79J6+dFwHWg=
X-Google-Smtp-Source: ABdhPJyCrT62J1VudLzUa/VxXajUJpMXUkRAkotlFJbAE/icfIFr8HLROyNQfkvsnlumlGC14yGK5dtph+6yqkLOgWY=
X-Received: by 2002:a25:2246:0:b0:663:3ecc:923d with SMTP id
 i67-20020a252246000000b006633ecc923dmr15322464ybi.173.1654591295286; Tue, 07
 Jun 2022 01:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220520095602.17379-1-lizhang@suse.de>
 <CAAdtpL6Dx2k7v2LY0cte9Uq2yx5NPLVk=JEk4OEwP42itb5Dyw@mail.gmail.com>
In-Reply-To: <CAAdtpL6Dx2k7v2LY0cte9Uq2yx5NPLVk=JEk4OEwP42itb5Dyw@mail.gmail.com>
From: Li Zhang <zhlcindy@gmail.com>
Date: Tue, 7 Jun 2022 10:41:24 +0200
Message-ID: <CAD8of+q07mt2u_JMs94+qsLarosBkX9C7QgLHDS0jRcUQeWRFA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] Fix the coredump when memory backend id conflicts
 with default_ram_id
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Igor Mammedov <imammedo@redhat.com>
Cc: Li Zhang <lizhang@suse.de>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=zhlcindy@gmail.com; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Thanks Philippe.

Hi Igor,
Any comments about this patch?

On Wed, Jun 1, 2022 at 2:28 PM Philippe Mathieu-Daud=C3=A9 via
<qemu-devel@nongnu.org> wrote:
>
> Cc'ing Igor
>
> On Fri, May 20, 2022 at 11:56 AM Li Zhang <lizhang@suse.de> wrote:
> >
> > When no memory backend is specified in machine options,
> > a default memory device will be added with default_ram_id.
> > However, if a memory backend object is added in QEMU options
> > and id is the same as default_ram_id, a coredump happens.
> >
> > Command line:
> > qemu-system-x86_64 -name guest=3Dvmtest,debug-threads=3Don \
> > -machine pc-q35-6.0,accel=3Dkvm,usb=3Doff,vmport=3Doff \
> > -smp 16,sockets=3D16,cores=3D1,threads=3D1 \
> > -m 4G \
> > -object memory-backend-ram,id=3Dpc.ram,size=3D4G \
> > -no-user-config -nodefaults -nographic
> >
> > Stack trace of thread 16903:
> >     #0  0x00007fb109a9318b raise (libc.so.6 + 0x3a18b)
> >     #1  0x00007fb109a94585 abort (libc.so.6 + 0x3b585)
> >     #2  0x0000558c34bc89be error_handle_fatal (qemu-system-x86_64 + 0x9=
c89be)
> >     #3  0x0000558c34bc8aee error_setv (qemu-system-x86_64 + 0x9c8aee)
> >     #4  0x0000558c34bc8ccf error_setg_internal (qemu-system-x86_64 + 0x=
9c8ccf)
> >     #5  0x0000558c349f6899 object_property_try_add (qemu-system-x86_64 =
+ 0x7f6899)
> >     #6  0x0000558c349f7df8 object_property_try_add_child (qemu-system-x=
86_64 + 0x7f7df8)
> >     #7  0x0000558c349f7e91 object_property_add_child (qemu-system-x86_6=
4 + 0x7f7e91)
> >     #8  0x0000558c3454686d create_default_memdev (qemu-system-x86_64 + =
0x34686d)
> >     #9  0x0000558c34546f58 qemu_init_board (qemu-system-x86_64 + 0x346f=
58)
> >     #10 0x0000558c345471b9 qmp_x_exit_preconfig (qemu-system-x86_64 + 0=
x3471b9)
> >     #11 0x0000558c345497d9 qemu_init (qemu-system-x86_64 + 0x3497d9)
> >     #12 0x0000558c344e54c2 main (qemu-system-x86_64 + 0x2e54c2)
> >     #13 0x00007fb109a7e34d __libc_start_main (libc.so.6 + 0x2534d)
> >     #14 0x0000558c344e53ba _start (qemu-system-x86_64 + 0x2e53ba)
> >
> > Signed-off-by: Li Zhang <lizhang@suse.de>
> > ---
> >  hw/core/machine.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > index b03d9192ba..3867af7a8a 100644
> > --- a/hw/core/machine.c
> > +++ b/hw/core/machine.c
> > @@ -1290,9 +1290,17 @@ MemoryRegion *machine_consume_memdev(MachineStat=
e *machine,
> >  static bool create_default_memdev(MachineState *ms, const char *path, =
Error **errp)
> >  {
> >      Object *obj;
> > +    ObjectProperty *prop;
> >      MachineClass *mc =3D MACHINE_GET_CLASS(ms);
> >      bool r =3D false;
> >
> > +    prop =3D object_property_find(object_get_objects_root(), mc->defau=
lt_ram_id);
> > +    if (prop) {
> > +        error_report("Memory backend id conflicts with default_ram_id =
%s",
> > +                     mc->default_ram_id);
> > +        exit(EXIT_FAILURE);
> > +    }
> > +
> >      obj =3D object_new(path ? TYPE_MEMORY_BACKEND_FILE : TYPE_MEMORY_B=
ACKEND_RAM);
> >      if (path) {
> >          if (!object_property_set_str(obj, "mem-path", path, errp)) {
> > --
> > 2.34.1
> >
>


--=20

Best Regards
-Li

