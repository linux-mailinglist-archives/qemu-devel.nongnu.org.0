Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCB83F2FF0
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 17:46:04 +0200 (CEST)
Received: from localhost ([::1]:35922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH6iZ-0008Um-5u
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 11:46:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mH6gm-00073T-MX
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 11:44:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mH6gj-0000Mf-0Y
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 11:44:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629474247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qPs+5XRzR//7CLL5+d+83u+qSd7ZPJjPahmYwzHw8V8=;
 b=c+k+F6/5fiKyzxIIrSkOMLD0wyzieJfDT3rAVykqulO2dYtUI4Kl1aacUCv0JSW1nk4JwV
 0GFAwCMgv5ZQ/q6yJ126QtPBhrKqWSCUjdTX8ikP79y0FND4AnQboWvM5ChBiajq4CHk36
 2jvM1+FaGzAECjg4cm89qouocAOX998=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-5P-OXfrsNpaxPt5kbYEszw-1; Fri, 20 Aug 2021 11:44:06 -0400
X-MC-Unique: 5P-OXfrsNpaxPt5kbYEszw-1
Received: by mail-ed1-f72.google.com with SMTP id
 e3-20020a50ec830000b02903be5be2fc73so4714492edr.16
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 08:44:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LjVAgdspACEk/M/9kucGCJPhavjrT1MmieV9qL/h00s=;
 b=E1iH/vlqhA2GiMMDtttC67USm8QeTXsp7z4jEtblziu8RwCvFEfH9B2+SnINrZSDOk
 meOSSSTB89of//Ts7KijmCmKJluup+/OS6IzS7IAqT5gAN82Kbdw3r8SIoqaNhmt0yOX
 x7Aa9lgCydYXrFVFSELUrMfJUXJqzDbXX40Zr2FkYLJOsh86u7l1Bj3weHQ6bPkUkv3X
 bz5RqPNn++TVmacid7cD+OHcVJokq8Q7T+tK4hGM/5RDJSQS8ToT3m9J+aO4JDPwQDL1
 TkrUS4tGVNoruDCEKv295w4csYoZHHSnyxpPYf7kdKlEteblHqdmC8QmRfW2QcEsbKAH
 1zsg==
X-Gm-Message-State: AOAM532g+JgkM5tCDZGnEmr7v/HrRA+tZhLbW9TsAt4WUgfZhFtm3Dse
 pG+1DKtHF+mRgVyvt6+xNpsozoxBNldNOJQvF7FQ5lO/81xP8xNSziU6xZrmMwPG7MfNACUhGfg
 tEXeqETYsqyihujI=
X-Received: by 2002:a17:906:1f8e:: with SMTP id
 t14mr22224809ejr.313.1629474244949; 
 Fri, 20 Aug 2021 08:44:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5V4q4p4hSWMVJdd0SU1Hwz5E6WPfUBUFF/OR8dx3em9AdgrSmw8k7gAoF7oZz1K5kNwOg0A==
X-Received: by 2002:a17:906:1f8e:: with SMTP id
 t14mr22224767ejr.313.1629474244628; 
 Fri, 20 Aug 2021 08:44:04 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id cq12sm3728868edb.43.2021.08.20.08.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 08:44:04 -0700 (PDT)
Date: Fri, 20 Aug 2021 17:44:02 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: xilinx-zynq-a9: cannot set up guest memory 'zynq.ext_ram'
Message-ID: <20210820174402.47a14625@redhat.com>
In-Reply-To: <CAFEAcA8MqYQiTJkKyWGkcKR=J2FD9SDWvHm9vxZq3g2HJ8ch3w@mail.gmail.com>
References: <CAEUhbmUhKFFxSspve+t2BeppCGPegpb_Z5g-w8M5t-JMLy3Zsg@mail.gmail.com>
 <869f8be9-b76f-e315-9591-9c452bedf922@redhat.com>
 <CAEUhbmUE4fb2NewE+Cze3Le5xOeH53NDbwdnKH==dnZeKGPQeQ@mail.gmail.com>
 <e833a774-d3bf-62d5-91d8-b24cbee0bfc4@redhat.com>
 <CAFEAcA8MqYQiTJkKyWGkcKR=J2FD9SDWvHm9vxZq3g2HJ8ch3w@mail.gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: David Hildenbrand <david@redhat.com>, "Richard W.M.
 Jones" <rjones@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 20 Aug 2021 15:39:27 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Fri, 20 Aug 2021 at 15:34, David Hildenbrand <david@redhat.com> wrote:
> >
> > On 20.08.21 16:22, Bin Meng wrote: =20
> > > Hi Philippe,
> > >
> > > On Fri, Aug 20, 2021 at 10:10 PM Philippe Mathieu-Daud=C3=A9
> > > <philmd@redhat.com> wrote: =20
> > >>
> > >> Hi Bin,
> > >>
> > >> On 8/20/21 4:04 PM, Bin Meng wrote: =20
> > >>> Hi,
> > >>>
> > >>> The following command used to work on QEMU 4.2.0, but is now broken
> > >>> with QEMU head.
> > >>>
> > >>> $ qemu-system-arm -M xilinx-zynq-a9 -display none -m 40000000
> > >>> -nographic -serial /dev/null -serial mon:stdio -monitor null -devic=
e
> > >>> loader,file=3Du-boot-dtb.bin,addr=3D0x4000000,cpu-num=3D0
> > >>> qemu-system-arm: cannot set up guest memory 'zynq.ext_ram': Cannot
> > >>> allocate memory =20
>=20
> > -m 40000000
> >
> > corresponds to 38 TB if I am not wrong. Is that really what you want? =
=20
>=20
> Probably not, because the zynq board's init function does:
>=20
>     if (machine->ram_size > 2 * GiB) {
>         error_report("RAM size more than 2 GiB is not supported");
>         exit(EXIT_FAILURE);
>     }
>=20
> It seems a bit daft that we allocate the memory before we do
> the size check. This didn't use to be this way around...
>=20
> Anyway, I think the cause of this change is commit c9800965c1be6c39
> from Igor. We used to silently cap the RAM size to 2GB; now we
> complain. Or at least we would complain if we hadn't already
> tried to allocate the memory and fallen over...

That's because RAM (as host resource) is now separated
from device model (machine limits) and is allocated as
part of memory backend initialization (in this case
'create_default_memdev') before machine_run_board_init()
is run.

Maybe we can consolidate max limit checks in
create_default_memdev() by adding MachineClass::max_ram_size
but that can work only in default usecase (only '-m' is used).

However if user creates backend explicitly, there aren't any
clue about machine limits. We basically don't know what
backend is created for at the time it's initialized
(which includes RAM allocation, it might be created for VM's
RAM or ram/storage for some other device).

>=20
> -- PMM
>=20


