Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 135274B536D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 15:36:17 +0100 (CET)
Received: from localhost ([::1]:36542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJcSd-0004vJ-MT
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 09:36:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nJbci-0001Tb-SF
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 08:42:41 -0500
Received: from [2a00:1450:4864:20::42e] (port=43538
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nJbcc-0006na-7n
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 08:42:36 -0500
Received: by mail-wr1-x42e.google.com with SMTP id i14so26871167wrc.10
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 05:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=pnQHgkexYs4YcfYqLfNWqtHK/S9Aw9KOlNDzfmwnM7o=;
 b=ztfWeddK85MC+RcmRlDHTVeozBymz58K/e9i7O6tsPCZjGBdoPMMjwzfpVXT3XWDB8
 V5D3kNFfr2J/cGW+TFdNj5h5JDaZkMzOxTbAur+wCIWlwePrT3/64C5/fP/XqN+n8y+w
 OmyAX9pLsHNo13ffPFJ2hSvpiunVbfm3/7mdv8V3LX0iVbqugdvFubaDX2hBvBN2ekRs
 0MAoi1BKh73Y5mFchhbDxpaLV0sHEn5htV7w380DmCozI5poIdtiuTegNQUunqkn5TKq
 1B+k/vruTy7lTjqU3MgKsNRGRloxjWsKLNEUKrroDpp0G3kMETMvIBUcPRHTl3E8UMsT
 vdwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=pnQHgkexYs4YcfYqLfNWqtHK/S9Aw9KOlNDzfmwnM7o=;
 b=rCOqFu6g/MYDT0yBpi0jsmyEW/oZtbN6ycQzkIispAWy47zS18BH22mIrBpbLRk1IU
 4Pp74AlymWbZYXVOmp5NMPOf1kXWp4caikBgPWaftLIXuV8OlUUJYOgx9PQcW9HHaPvn
 6mZe4+q62pdiv+M7YDI5A9nhQGcWwWb9tS0y407lOvmCQ2W1iv4hfu5dIME1Wfs4YRP2
 8cSVDHPb6RmEiIFQzvkcEzGP1zB3iv7IdWvRbC744rCQEypetn4c2ye203MDDjrBJg6T
 6fpMHwe3Guw8r2rG37y5RqZmMq9/oCku3dWjVyMbk+MSOhQUxLBSSDXCxyc91fVuYuVj
 n6+Q==
X-Gm-Message-State: AOAM533rf9MDKtNgkR0EnB/VWzBV8hUTiFVresaI9dwXb/6BPrYJe/Ph
 eK11iaDlS0M2aWLVSAwfBsOFag==
X-Google-Smtp-Source: ABdhPJwUK+KknkkGx/YCKtD3Oo46jjY1c/E1ME6NWB+I1c8iEAayzVzlePJarG8lE9RSSL4GcBfuPQ==
X-Received: by 2002:adf:ce87:: with SMTP id r7mr10964358wrn.397.1644846146257; 
 Mon, 14 Feb 2022 05:42:26 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b2sm4376184wri.35.2022.02.14.05.42.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 05:42:25 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5882620329;
 Mon, 14 Feb 2022 13:42:24 +0000 (GMT)
References: <CAJSP0QX7O_auRgTKFjHkBbkBK=B3Z-59S6ZZi10tzFTv1_1hkQ@mail.gmail.com>
User-agent: mu4e 1.7.7; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2022
Date: Mon, 14 Feb 2022 13:16:36 +0000
In-reply-to: <CAJSP0QX7O_auRgTKFjHkBbkBK=B3Z-59S6ZZi10tzFTv1_1hkQ@mail.gmail.com>
Message-ID: <87zgmtd0ov.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sergio Lopez <slp@redhat.com>, kvm <kvm@vger.kernel.org>,
 Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, Hannes Reinecke <hare@suse.de>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, "Florescu,
 Andreea" <fandree@amazon.com>, qemu-devel <qemu-devel@nongnu.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 hreitz@redhat.com, Alex Agache <aagch@amazon.com>,
 Rust-VMM Mailing List <rust-vmm@lists.opendev.org>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Stefan Hajnoczi <stefanha@gmail.com> writes:

> Dear QEMU, KVM, and rust-vmm communities,
> QEMU will apply for Google Summer of Code 2022
> (https://summerofcode.withgoogle.com/) and has been accepted into
> Outreachy May-August 2022 (https://www.outreachy.org/). You can now
> submit internship project ideas for QEMU, KVM, and rust-vmm!
>
> If you have experience contributing to QEMU, KVM, or rust-vmm you can
> be a mentor. It's a great way to give back and you get to work with
> people who are just starting out in open source.
>
> Please reply to this email by February 21st with your project ideas.
>
> Good project ideas are suitable for remote work by a competent
> programmer who is not yet familiar with the codebase. In
> addition, they are:
> - Well-defined - the scope is clear
> - Self-contained - there are few dependencies
> - Uncontroversial - they are acceptable to the community
> - Incremental - they produce deliverables along the way
>
> Feel free to post ideas even if you are unable to mentor the project.
> It doesn't hurt to share the idea!
>
> I will review project ideas and keep you up-to-date on QEMU's
> acceptance into GSoC.
>
> Internship program details:
> - Paid, remote work open source internships
> - GSoC projects are 175 or 350 hours, Outreachy projects are 30
> hrs/week for 12 weeks
> - Mentored by volunteers from QEMU, KVM, and rust-vmm
> - Mentors typically spend at least 5 hours per week during the coding per=
iod
>
> Changes since last year: GSoC now has 175 or 350 hour project sizes
> instead of 12 week full-time projects. GSoC will accept applicants who
> are not students, before it was limited to students.

I'm certainly up for mentoring new devices for vhost-device (rust-vmm
vhost-user backends). Since we've become a code owner we're trying to
clear the backlog (virto-vsock and virtio-block) but there are plenty of
others that could be done. Of particular interest to me are:

  - virtio-rpmb (we have a working C implementation I wrote)
  - virtio-snd (in flight virtio spec)
  - virtio-video (again we have a working C version against v3)
=20=20
With my other hat on there are numerous TCG plugin projects that could
be done. Adding basic plugins is fairly straight forward but it would be
interesting to look at what is required to do a more involved plugin
like panda-re's taint analysis (following ptrs as they move through the
system). This will likely need some additional features exposed from the
plugin interface to achieve.

With that in mind there is also the idea of a central registry for
register values which is a prerequisite for expanding access to TCG
plugins but could also bring various quality of life improvements to
other areas. I've written that up on a page:

  https://wiki.qemu.org/Internships/ProjectIdeas/CentralRegisterRegistry

--=20
Alex Benn=C3=A9e

