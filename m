Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1654B64C6
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 08:51:24 +0100 (CET)
Received: from localhost ([::1]:40154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJscM-0000zy-4f
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 02:51:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nJsa2-0008Is-L7
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 02:48:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nJsZy-00005Z-L4
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 02:48:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644911331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qf0f3GqY7XJOGRvGn1MQtRPKB9lVAUr7eFd/kUGMfaw=;
 b=Cm2yY4XwnwiRSUgH7CX+IdEYIVqoJntACjgUGoEAiK+nDO9Sa8g2dJoN+0NFexWa4XNyLQ
 OdkiPra7bybIbTikHqEqq8TuyG1Rfi+3J4DzISd0AnPEkNpK1AL9XabASuZZLBj7rZVdEd
 Qzx4ln2p8cqeNVFqCoahK6AczkDvjIg=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-173-8pDhRo7rOgysbJYkJJWZjQ-1; Tue, 15 Feb 2022 02:48:47 -0500
X-MC-Unique: 8pDhRo7rOgysbJYkJJWZjQ-1
Received: by mail-lj1-f197.google.com with SMTP id
 bx17-20020a05651c199100b00244b2f9b56cso2899679ljb.22
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 23:48:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qf0f3GqY7XJOGRvGn1MQtRPKB9lVAUr7eFd/kUGMfaw=;
 b=i4sfGliP3ZJ1vQRUjqPtoi0sCe7j91sFkNOjFSl6m19IcEGjq/JpPlg1isPFGu+2Ws
 i3nty/COoUm04ALpuG3sJ5leoI6zCb9Y+tc5KfIJtXMqXlPwz2FnxyrLmBUGYpKMdj4y
 qw5Dhm2/094nTOU71LCXbVC9hCZa2/n/LzGLxMbwMbTPNCrUtA+htp7KLna00DZmL/e4
 P/D8Yh6QzpLEizhGmvzKN2LNDXvBHWzNRRvUypOzBrSXMqzEIzP0TY98Z2+HIno4V/k6
 TPWFMO3S5oWHzLpXflCF/u1CNDZ+o40885Jpfvp/5T1aYartSDQUq2JUCutuZtyZRozV
 uW5Q==
X-Gm-Message-State: AOAM531nWVipIgQrsZZbYm3bQgpSrmPQNcnKJa9CjFpRWxeOY/Tyf9jh
 D62wuhXglElkFib+fwoKa65n13tB5VGLfLBTD8pqKok8RxkPgyeKGyejGx4GqGHr5s4JVI+Y5Pa
 JP8bmXe5hdNqFIgSD+UGBewHXAj149IQ=
X-Received: by 2002:a2e:914c:: with SMTP id q12mr1701375ljg.420.1644911326104; 
 Mon, 14 Feb 2022 23:48:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJypmK6UTHFl1ejOt9kDQsNxXoTtuMZRRFPEr4rUWc75hnD/F/KZVQzSNtRIDOFvz8w/q/0Eg42UbQsbRzx2v/8=
X-Received: by 2002:a2e:914c:: with SMTP id q12mr1701351ljg.420.1644911325842; 
 Mon, 14 Feb 2022 23:48:45 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QX7O_auRgTKFjHkBbkBK=B3Z-59S6ZZi10tzFTv1_1hkQ@mail.gmail.com>
 <CACGkMEvtENvpubmZY3UKptD-T=c9+JJV1kRm-ZPhP08xOJv2fQ@mail.gmail.com>
 <20220214114825.pi44m7mqyqvvtt52@step1g3>
In-Reply-To: <20220214114825.pi44m7mqyqvvtt52@step1g3>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 15 Feb 2022 15:48:34 +0800
Message-ID: <CACGkMEsqTRP18Sp5zAy9tUOcsMNx+MwrkeqnMXg=2sS58MrsUQ@mail.gmail.com>
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2022
To: Stefano Garzarella <sgarzare@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
 Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel <qemu-devel@nongnu.org>,
 "Florescu, Andreea" <fandree@amazon.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Alex Agache <aagch@amazon.com>,
 Rust-VMM Mailing List <rust-vmm@lists.opendev.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 14, 2022 at 7:48 PM Stefano Garzarella <sgarzare@redhat.com> wrote:
>
> On Mon, Feb 14, 2022 at 03:11:20PM +0800, Jason Wang wrote:
> >On Fri, Jan 28, 2022 at 11:47 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:
> >>
> >> Dear QEMU, KVM, and rust-vmm communities,
> >> QEMU will apply for Google Summer of Code 2022
> >> (https://summerofcode.withgoogle.com/) and has been accepted into
> >> Outreachy May-August 2022 (https://www.outreachy.org/). You can now
> >> submit internship project ideas for QEMU, KVM, and rust-vmm!
> >>
> >> If you have experience contributing to QEMU, KVM, or rust-vmm you can
> >> be a mentor. It's a great way to give back and you get to work with
> >> people who are just starting out in open source.
> >>
> >> Please reply to this email by February 21st with your project ideas.
> >>
> >> Good project ideas are suitable for remote work by a competent
> >> programmer who is not yet familiar with the codebase. In
> >> addition, they are:
> >> - Well-defined - the scope is clear
> >> - Self-contained - there are few dependencies
> >> - Uncontroversial - they are acceptable to the community
> >> - Incremental - they produce deliverables along the way
> >>
> >> Feel free to post ideas even if you are unable to mentor the project.
> >> It doesn't hurt to share the idea!
> >
> >Implementing the VIRTIO_F_IN_ORDER feature for both Qemu and kernel
> >(vhost/virtio drivers) would be an interesting idea.
> >
> >It satisfies all the points above since it's supported by virtio spec.
>
> Yep, I agree!
>
> >
> >(Unfortunately, I won't have time in the mentoring)
>
> I can offer my time to mentor this idea.

Great, thanks a lot.

>
> Thanks,
> Stefano
>


