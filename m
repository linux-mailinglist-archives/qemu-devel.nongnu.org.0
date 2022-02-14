Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC804B429A
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 08:14:47 +0100 (CET)
Received: from localhost ([::1]:36796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJVZO-0003iR-7v
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 02:14:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nJVWR-0002f2-CX
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 02:11:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nJVWO-0002fp-4f
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 02:11:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644822698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5//e4K4mgU3g8+NZl+6kzGrvE+Xni9sFEdvh5YsZSgI=;
 b=X33J3ktzVsrEqVOv8eDqgo8N0+LkGHQMj6z117leaRHRbhoYyPGQOBjGXUq3e9CrW8x2Iq
 jzM+HBjaeeJjBhg6aEklgFk78b4DdV9tUcdAZ7WKawOGbq1VX3s4fnHsRop3DmJKe1s4Bn
 BTFAPnVUx96D1n/GDkfbnm7LUawlGdw=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-396-2W3Yu_3ePWOyrsq_4QKsRg-1; Mon, 14 Feb 2022 02:11:34 -0500
X-MC-Unique: 2W3Yu_3ePWOyrsq_4QKsRg-1
Received: by mail-lj1-f197.google.com with SMTP id
 y19-20020a2e9793000000b0023f158d6cc0so5375416lji.10
 for <qemu-devel@nongnu.org>; Sun, 13 Feb 2022 23:11:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5//e4K4mgU3g8+NZl+6kzGrvE+Xni9sFEdvh5YsZSgI=;
 b=4wTemX2TeWJwV5+a4O5ysUVfcS/2NVdWHriikYNgcZHZpOvwTi5VmOmYfK2rYkCjIU
 zYiYBuFBJhsErbBDwj+t657CZdsIJ/nxBzVCE62yujYx0/dtwqLQ4lFbMhlYSFcneYwh
 L+X2WK/iYeCJrODeUfy8EAKxbtJ5aLl2lIGaEQQZSyAkD9JQzcjmjRFDGEmwclbI0kB0
 aTGsN3aNiwvUbS0dFjon1JU7e80PLC60331Suh0v6VIJ/bNz3JAmp7o+c8lT2BY0sh5v
 eM4M57xChdUeTd50oBncsqmaxVqEb+F7OtM1q9Nak5/CSgxANe1FmdhLCw287LkH94Hx
 p3Mw==
X-Gm-Message-State: AOAM532+2AD1CO23OPFKEGXkFmDQGU9KN1MpXNxZeRzXIX+z4iTHyqpk
 OYe/AoyFRascWTl++2Ia0XZVFQEEdd9cntGQ/5BAoryDP75ZqWTl+7PdidXbt085UXYai6xLNSp
 UXxIxYGvInHXFMKsP8sZLFZjg7R2MXD4=
X-Received: by 2002:a05:6512:2342:: with SMTP id
 p2mr6130997lfu.348.1644822692936; 
 Sun, 13 Feb 2022 23:11:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwyYX4EV0IPlJLhqf1/sIinuK+GaIKxwcNo+DeQDQqzCQken0irQ++50m+rtF4hqOLZJVZB/oBw6230zP+VdFY=
X-Received: by 2002:a05:6512:2342:: with SMTP id
 p2mr6130966lfu.348.1644822692666; 
 Sun, 13 Feb 2022 23:11:32 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QX7O_auRgTKFjHkBbkBK=B3Z-59S6ZZi10tzFTv1_1hkQ@mail.gmail.com>
In-Reply-To: <CAJSP0QX7O_auRgTKFjHkBbkBK=B3Z-59S6ZZi10tzFTv1_1hkQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 14 Feb 2022 15:11:20 +0800
Message-ID: <CACGkMEvtENvpubmZY3UKptD-T=c9+JJV1kRm-ZPhP08xOJv2fQ@mail.gmail.com>
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2022
To: Stefan Hajnoczi <stefanha@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Fri, Jan 28, 2022 at 11:47 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
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

Implementing the VIRTIO_F_IN_ORDER feature for both Qemu and kernel
(vhost/virtio drivers) would be an interesting idea.

It satisfies all the points above since it's supported by virtio spec.

(Unfortunately, I won't have time in the mentoring)

Thanks

>
> I will review project ideas and keep you up-to-date on QEMU's
> acceptance into GSoC.
>
> Internship program details:
> - Paid, remote work open source internships
> - GSoC projects are 175 or 350 hours, Outreachy projects are 30
> hrs/week for 12 weeks
> - Mentored by volunteers from QEMU, KVM, and rust-vmm
> - Mentors typically spend at least 5 hours per week during the coding period
>
> Changes since last year: GSoC now has 175 or 350 hour project sizes
> instead of 12 week full-time projects. GSoC will accept applicants who
> are not students, before it was limited to students.
>
> For more background on QEMU internships, check out this video:
> https://www.youtube.com/watch?v=xNVCX7YMUL8
>
> Please let me know if you have any questions!
>
> Stefan
>


