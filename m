Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FDA4B538F
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 15:43:04 +0100 (CET)
Received: from localhost ([::1]:49660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJcZE-0005GY-0w
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 09:43:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nJbvy-0008U3-TQ
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 09:02:33 -0500
Received: from [2607:f8b0:4864:20::430] (port=45732
 helo=mail-pf1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nJbvp-0002dR-3Z
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 09:02:22 -0500
Received: by mail-pf1-x430.google.com with SMTP id p10so8726455pfo.12
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 06:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2xzHEJ4t1jVAMUwW/BHxKnQJ/o9l34zpVpVLqeAfwL4=;
 b=X9mazUBFcIGPS9C2DXn76IpKO4Q7VChw/khLO4V0bpooV1NTqqdD/8yxMjnWaJbA55
 DDhgriINmV/GnIegmbQK4+IHhU0BSkSNewCiI+EqHRlG4C5aY3wFcwXkvL4qZJwKTpmI
 AZ9ZdJU94k/qg/lGrTh8OD4Td78t0R7ysEQafMrKGvyeAMOJxcZKTaZrii7rzOwPkfY8
 f8ER9+WhczYIJzIkLDpHl84PRoVLc/JXeMbuIpIpBG3Gytlc5AdlxU8quPyKG24y+3g+
 tpWzsdNkv3O2E45KfjtfSRBnvrmx981PQXzz5KRegWaWTuKEbwl0oBaicQtoWLLz+LA0
 dMRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2xzHEJ4t1jVAMUwW/BHxKnQJ/o9l34zpVpVLqeAfwL4=;
 b=6k4c48i6sDgXIUvT5N76wzNF8kf6Vdj2IDzW5XWf1cJrHgcIUay/zpNnppBLVnoRJo
 8MQzAvcwPD+1T+0h0VXZHRlympsYt8q9WKpS9Ah54bHkqXsvK68ENmglrIpCChLRWZ1k
 rf++NHFb3KhZ/blqGRvp4vArs2flJ05z5R8hNySYUj82dWrmblNyGwsTLIttVOv38K5I
 xsEjsNgP7mpjEvWWtTZ457lQRwLosHv2nEtad6MEVkc7MjwC2f8al9rMxxwAKECvgtvV
 ozvpIwzAryMtyVyUeoqfUtCKfCzWmtqQ6ACkDCyIcEkzx463yaTbZXDZYOVA3TH57RQb
 prMA==
X-Gm-Message-State: AOAM531lFVhpKjHRggvC+h+6/E6TxJ3/sobjJBZXTYvRG+/BSUDy/Jt6
 kiIc4tpM0F49vAwkNDeW1LAGzTEXKzpQjIQc1HU=
X-Google-Smtp-Source: ABdhPJw9F+NSOYskhPxSW7TGCcK6ZoAr0uHG5Irjp6NTYDuNbJYgzsRxlDVVmJkEFtX5K3JMKVSiFl142ftptwNb04E=
X-Received: by 2002:a05:6a00:16d3:: with SMTP id
 l19mr14341573pfc.7.1644847324177; 
 Mon, 14 Feb 2022 06:02:04 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QX7O_auRgTKFjHkBbkBK=B3Z-59S6ZZi10tzFTv1_1hkQ@mail.gmail.com>
 <CACGkMEvtENvpubmZY3UKptD-T=c9+JJV1kRm-ZPhP08xOJv2fQ@mail.gmail.com>
In-Reply-To: <CACGkMEvtENvpubmZY3UKptD-T=c9+JJV1kRm-ZPhP08xOJv2fQ@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 14 Feb 2022 14:01:52 +0000
Message-ID: <CAJSP0QX6JgCG7UdqaY=G8rc64ZqE912UzM7pQkSMBfzGywHaHg@mail.gmail.com>
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2022
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::430
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=stefanha@gmail.com; helo=mail-pf1-x430.google.com
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sergio Lopez <slp@redhat.com>, kvm <kvm@vger.kernel.org>,
 Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, John Snow <jsnow@redhat.com>,
 Hannes Reinecke <hare@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, "Florescu,
 Andreea" <fandree@amazon.com>, qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Alex Agache <aagch@amazon.com>,
 Rust-VMM Mailing List <rust-vmm@lists.opendev.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Feb 2022 at 07:11, Jason Wang <jasowang@redhat.com> wrote:
>
> On Fri, Jan 28, 2022 at 11:47 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:
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
>
> Implementing the VIRTIO_F_IN_ORDER feature for both Qemu and kernel
> (vhost/virtio drivers) would be an interesting idea.
>
> It satisfies all the points above since it's supported by virtio spec.
>
> (Unfortunately, I won't have time in the mentoring)

Thanks for this idea. As a stretch goal we could add implementing the
packed virtqueue layout in Linux vhost, QEMU's libvhost-user, and/or
QEMU's virtio qtest code.

Stefano: Thank you for volunteering to mentor the project. Please
write a project description (see template below) and I will add this
idea:

=== TITLE ===

 '''Summary:''' Short description of the project

 Detailed description of the project.

 '''Links:'''
 * Wiki links to relevant material
 * External links to mailing lists or web sites

 '''Details:'''
 * Skill level: beginner or intermediate or advanced
 * Language: C
 * Mentor: Email address and IRC nick
 * Suggested by: Person who suggested the idea

Stefan

