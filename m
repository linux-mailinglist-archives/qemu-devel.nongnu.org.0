Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD64F4B539A
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 15:44:38 +0100 (CET)
Received: from localhost ([::1]:52632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJcak-00079y-1N
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 09:44:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nJbsa-00052z-DC
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 08:59:00 -0500
Received: from [2607:f8b0:4864:20::1033] (port=50963
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nJbsY-0001xO-FH
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 08:59:00 -0500
Received: by mail-pj1-x1033.google.com with SMTP id m7so14678477pjk.0
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 05:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YXs9XcapqbRrbbu3RpAFFzZbK/SBgndo4A8gy4sXDEk=;
 b=P2e3D/hOWT//3jYFtnJPPKCmJyGCeGMZ6ZWIshHRlJT2Efkef9rVHzR8ed5svR3m14
 u3LYGpsXDNDOF5jPfLRYSnyG618NGUfrdLS8juGGCc3Xu2lkMfkHOlmO9q86WEQ0Wqlv
 4ztlV/nJO3bvn0JFZHhsAtNvh/mzhIsgU6Au7CDpxwP4/cFYiR9QZNgInFLC56Pe5aPq
 bXu79qh+D2Bw7t+gQUXIUdXWN+Z6cAclY1/A39kNnyxdyRZYvLWukvqX9harwpHhjo9V
 KSjLbDejGsagFZX6LuNO1mouhMQgVaRKiSbxitMo7CX4GRH6J3BtNH1mzr/16tZyo9gv
 6JjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YXs9XcapqbRrbbu3RpAFFzZbK/SBgndo4A8gy4sXDEk=;
 b=ZxQtQnirN8lVnUjCOb+UmfmTeGYd0lE4O+PYLMnjLIlW5n23GpSDV8mHtdehjWSSeG
 VQFzxp68Gdhe+RYnGigFUsRIvarTbLlIko6ie0i+onvKCgivwifY0s2IdG74xx63YPdK
 GIHr3YYxkoKF5YYwKwZd9N5qV6eHuPA7+X0MfW8DBPl+DMg5Fx6PQKUUg/vcWUP79BLg
 8xVsygL1CrL5kxRutVc2WySGcGmbCC9NM4FNiplziGOKULCCaWRSokotIYMp3q6JF6+6
 meSgqnKHBUn1qZXT+yM4hIkY9t3YGycPidJO3ogffAMcbkeFwBgu4I+pGrcuXEFVbFzi
 KzQg==
X-Gm-Message-State: AOAM533kkkOfZX1xam0EkPty27e6/os9FDQKkmDq71GHrDXIJKFG2X8Y
 J+YKFD3rCRPKinkVhWu+Hut9BnhAXPSYnwJklZI=
X-Google-Smtp-Source: ABdhPJxRoKBRwU6H58UKPrfPWH/lWAnZqPcS8tFwF6Z5U1+98PD7kW2pwrS2qsNPTRhvwzE1XWcOQLk38V2Q4vOBv0o=
X-Received: by 2002:a17:902:b089:: with SMTP id
 p9mr14100225plr.93.1644847136084; 
 Mon, 14 Feb 2022 05:58:56 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QX7O_auRgTKFjHkBbkBK=B3Z-59S6ZZi10tzFTv1_1hkQ@mail.gmail.com>
 <244647ca-a247-cfc1-d0df-b8c74d434a77@amazon.com>
In-Reply-To: <244647ca-a247-cfc1-d0df-b8c74d434a77@amazon.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 14 Feb 2022 13:58:44 +0000
Message-ID: <CAJSP0QVqvvN=sbm=XMT8mxHQNcSfNfTrnWJXXf-QgXwxAfzdcA@mail.gmail.com>
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2022
To: Alexander Graf <graf@amazon.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=stefanha@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
 Andra-Irina Paraschiv <andraprs@amazon.com>, kvm <kvm@vger.kernel.org>,
 Sergio Lopez <slp@redhat.com>, Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,
 John Snow <jsnow@redhat.com>, Alex Agache <aagch@amazon.com>,
 qemu-devel <qemu-devel@nongnu.org>, "Florescu, Andreea" <fandree@amazon.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, hreitz@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Rust-VMM Mailing List <rust-vmm@lists.opendev.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, "Eftime,
 Petre" <epetre@amazon.com>, ohering@suse.de, Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 9 Feb 2022 at 14:50, Alexander Graf <graf@amazon.com> wrote:
> On 28.01.22 16:47, Stefan Hajnoczi wrote:
> > Dear QEMU, KVM, and rust-vmm communities,
> > QEMU will apply for Google Summer of Code 2022
> > (https://summerofcode.withgoogle.com/) and has been accepted into
> > Outreachy May-August 2022 (https://www.outreachy.org/). You can now
> > submit internship project ideas for QEMU, KVM, and rust-vmm!
> >
> > If you have experience contributing to QEMU, KVM, or rust-vmm you can
> > be a mentor. It's a great way to give back and you get to work with
> > people who are just starting out in open source.
> >
> > Please reply to this email by February 21st with your project ideas.
> >
> > Good project ideas are suitable for remote work by a competent
> > programmer who is not yet familiar with the codebase. In
> > addition, they are:
> > - Well-defined - the scope is clear
> > - Self-contained - there are few dependencies
> > - Uncontroversial - they are acceptable to the community
> > - Incremental - they produce deliverables along the way
> >
> > Feel free to post ideas even if you are unable to mentor the project.
> > It doesn't hurt to share the idea!
>
>
> I have one that I'd absolutely *love* to see but not gotten around
> implementing myself yet :)
>
>
> Summary:
>
> Implement -M nitro-enclave in QEMU
>
> Nitro Enclaves are the first widely adopted implementation of hypervisor
> assisted compute isolation. Similar to technologies like SGX, it allows
> to spawn a separate context that is inaccessible by the parent Operating
> System. This is implemented by "giving up" resources of the parent VM
> (CPU cores, memory) to the hypervisor which then spawns a second vmm to
> execute a completely separate virtual machine. That new VM only has a
> vsock communication channel to the parent and has a built-in lightweight
> TPM.
>
> One big challenge with Nitro Enclaves is that due to its roots in
> security, there are very few debugging / introspection capabilities.
> That makes OS bringup, debugging and bootstrapping very difficult.
> Having a local dev&test environment that looks like an Enclave, but is
> 100% controlled by the developer and introspectable would make life a
> lot easier for everyone working on them. It also may pave the way to see
> Nitro Enclaves adopted in VM environments outside of EC2.
>
> This project will consist of adding a new machine model to QEMU that
> mimics a Nitro Enclave environment, including the lightweight TPM, the
> vsock communication channel and building firmware which loads the
> special "EIF" file format which contains kernel, initramfs and metadata
> from a -kernel image.
>
> Links:
>
> https://aws.amazon.com/ec2/nitro/nitro-enclaves/
> https://lore.kernel.org/lkml/20200921121732.44291-10-andraprs@amazon.com/T/
>
> Details:
>
> Skill level: intermediate - advanced (some understanding of QEMU machine
> modeling would be good)
> Language: C
> Mentor: Maybe me (Alexander Graf), depends on timelines and holiday
> season. Let's find an intern first - I promise to find a mentor then :)
> Suggested by: Alexander Graf
>
>
> Note: I don't know enough about rust-vmm's debugging capabilities. If it
> has gdbstub and a local UART that's easily usable, the project might be
> perfectly viable under its umbrella as well - written in Rust then of
> course.

It would be great to have an open source Enclave environment for
development and testing in QEMU.

Could you add a little more detail about the tasks involved. Something
along the lines of:
- Implement a device model for the TPM device (link to spec or driver
code below)
- Implement vsock device (or is this virtio-mmio vsock?)
- Add a test for the TPM device
- Add an acceptance test that boots a minimal EIF payload

This will give candidates more keywords and links to research this project.

Thanks,
Stefan

