Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9424BA5B9
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 17:29:46 +0100 (CET)
Received: from localhost ([::1]:52166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKjf6-0002hL-6l
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 11:29:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nKjcN-0001u0-Al
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 11:26:55 -0500
Received: from [2607:f8b0:4864:20::432] (port=45847
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nKjcK-0002xZ-Qn
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 11:26:55 -0500
Received: by mail-pf1-x432.google.com with SMTP id u16so90620pfg.12
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 08:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lWyN4iF200uGQEh1jVp3II5oN6ZPLGJyhcB1z6wgp6Y=;
 b=F30nE9kCMcaxxegESCi4Nt90sw16wrFCXYNkXSA60blvuhETYeYWv3RqQZgp3jYZw2
 rMWuhP/Xui5FqlJVc2gix49xrBaDWlj+Zsb8U9jIO+Xk3pS7k+zJfsNYFUGoxpivb8sD
 EF2FuL0zIWNFLBJL6njtRNB3U6IdQLeo6/YVoFtBluYlkHAi8FcyZ7xyf/RpESwZv/Zx
 ttc43hTe1sI1YQXtAQM+dmkpLKLBqdUdTDE+rQH9yIRWju0MuuXiEPt+uPZTqfwUs6DR
 FLswwz2waz1sDRda1Wc3IWzLRKYfgQ3WLN52pX0pVgoGCC4rbx2WdZn+AMvB76sOownm
 EIIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lWyN4iF200uGQEh1jVp3II5oN6ZPLGJyhcB1z6wgp6Y=;
 b=MMZoT2xvJsWVuaQRZSPBH2Ncwudg3Ydt/shqZF29WwouUI53IMpJmGhfnosVhupTrF
 m8uS0LWw7NrRXogBx/Ks3Voei1RVdQPPJzBmaZ+KuiykU8Oy75hs/SUwtluaAAX/QiyI
 tk4IOZGkpC3PqXQlQMC/uhVIs/SfVRRos4GWKOT7jVPkyWN+EVQsTiNGRY6qjsEqmx+L
 ah1R+zSM/Kmi8GGkpcnbK0unCPbXpORxViSWgdMlWeU3gIWMOSOJHmsBKj1Dujgo8/sf
 EnMGmHfHYrnGKoOHO4RsFZ3g8p45rvE/nqqXKntyKT1KVEeTiiZpxFKUPgMUzs9LWpop
 butg==
X-Gm-Message-State: AOAM531PeCs+tA+uMklq3+jdYkiJulC14SLK4wul2ORqKmfpbUDEJd7P
 9BSW9vtgU/hi6+9PZhIWxSAgxzI6xKUUgEoszuU=
X-Google-Smtp-Source: ABdhPJzLCINJi1zhAl9JT+saqWcYE97hQnPGMpev1RVPeLi8bUbs6ddZH84a7kH1gqs+ebAxkKVMCp0IFMqt3ftoe6w=
X-Received: by 2002:a63:6cc9:0:b0:372:e69d:60f7 with SMTP id
 h192-20020a636cc9000000b00372e69d60f7mr2991233pgc.608.1645115211442; Thu, 17
 Feb 2022 08:26:51 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QX7O_auRgTKFjHkBbkBK=B3Z-59S6ZZi10tzFTv1_1hkQ@mail.gmail.com>
 <CABBoX7PcqRFHDm0LCwWOwmYmOwH2x70pM-3OyxfDXD1sE_fHrw@mail.gmail.com>
In-Reply-To: <CABBoX7PcqRFHDm0LCwWOwmYmOwH2x70pM-3OyxfDXD1sE_fHrw@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 17 Feb 2022 16:26:40 +0000
Message-ID: <CAJSP0QUqqiHQi2VWdDTvurK8oJL7s7Ae5G3=iPzUhcOtM0q_TA@mail.gmail.com>
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2022
To: Alice Frosi <afrosi@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=stefanha@gmail.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
 Sergio Lopez Pascual <slp@redhat.com>, kvm <kvm@vger.kernel.org>,
 Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, John Snow <jsnow@redhat.com>,
 Alex Agache <aagch@amazon.com>, qemu-devel <qemu-devel@nongnu.org>, "Florescu,
 Andreea" <fandree@amazon.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Rust-VMM Mailing List <rust-vmm@lists.opendev.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Feb 2022 at 07:08, Alice Frosi <afrosi@redhat.com> wrote:
>
> On Fri, Jan 28, 2022 at 6:04 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:
> >
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
> >
>
> I'd like to propose this idea:
>
> Title: Create encrypted storage using VM-based container runtimes
>
> Cryptsetup requires root privileges in order to be able to encrypt
> storage with luks. However, privileged containers are generally
> discouraged for security reasons. A possible solution to avoid extra
> privileges is using VM-based container runtimes (e.g crun with libkrun
> or kata-containers) and running inside the Virtual Machine the tools
> for the storage encryption.
>
> This internship focus on a PoC for integrating and extending crun with
> libkrun in order to be able to create encrypted storage. The initial
> step will focus on creating encrypted images to demonstrate the
> feasibility and the necessary changes in the stack. If the timeframe
> allows it, an interesting follow-up of the first step is the
> encryption of persistent storage using block-based PVCs.
>
> Language: C, rust, golang
> Skills: containers and virtualization would be a big plus
> I won't put a level but the intern needs to be willing to dig into
> different source codes like crun (written in C), libkrun (written in
> Rust) and possibly podman or other kubernetes/containers projects
> (written in go)
> Mentor: Alice Frosi, Co-mentor: Sergio Lopez Pascual
>
> Let me know if the idea sounds feasible to you!
Thanks, I have added the idea:
https://wiki.qemu.org/Google_Summer_of_Code_2022#Create_encrypted_storage_using_VM-based_container_runtimes

Stefan

