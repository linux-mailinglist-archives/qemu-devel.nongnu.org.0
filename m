Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7CA4B64D6
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 08:55:52 +0100 (CET)
Received: from localhost ([::1]:44926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJsgg-0004Pn-5S
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 02:55:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nJsb0-0000dc-W1
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 02:50:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nJsax-00009L-AT
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 02:49:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644911394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=skGSLOtnoQCHfjZETdhbalWZTJmtFEGpyP+K1bHAZS8=;
 b=HKIvBE4OzPRJ5oPGwlyd1uZBwpjBqN+jqdWWW6uQOn7nUBtXqOBHaGPwhKORl95Fc7zFoP
 cBOKzID1lMQGmf9eYNz0uZV8FvjLgh2+UPvejJ7+a0Df1w5PkP7liK9tsyfa2kuUliJEgD
 Tqt/hnH4mQA/tbCO280RhMTca5d+OO8=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-235-9bCEW8gHN4mlk-pr6PrzEw-1; Tue, 15 Feb 2022 02:49:52 -0500
X-MC-Unique: 9bCEW8gHN4mlk-pr6PrzEw-1
Received: by mail-lj1-f197.google.com with SMTP id
 y19-20020a2e9793000000b0023f158d6cc0so6858216lji.10
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 23:49:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=skGSLOtnoQCHfjZETdhbalWZTJmtFEGpyP+K1bHAZS8=;
 b=nq8kQBFzFjPGPYWRGOpZH0kgRfn85PZ3bombseo25KvqUp9Ec4xecIIICQXGjHQ9gQ
 B4v9A5ZHAeqV5mruOiZhFqOgIY7sFH0r1Sug+hjCFqSLsyhM90xfMk8ScTnf+9uexjP4
 o8j9PNU9J1+vLrywVNGVT+GCLd8NRnJhxPu/fHvRHW86uxoN21Rx0FlAfQg66xdVkYuN
 wp5EXfO+zCtXChzFXz3TstT5OIHnXDTuKuAyMuhmF/bfFBEwqTFwtW4Jngm7DDHyPT0w
 aloN2l910fey3aKMcxsE98UH51iGcmiGTNiTx46UOUZKzESUdqYQn2iUsPywNGD61m/e
 ftJQ==
X-Gm-Message-State: AOAM531nflNzxHffyO7iHnfVdz/GB+p5snb9TKOfV9JY1X3c147NNXxV
 giHa7MpcvEaijpOikt+D6jpjZ6VFKmdn0kfuMP5h0to2QQN/q/KJ4EqDhZxIDR/A1DrM420B6O4
 V8PkVCRvLyYuGlm2xjgE2IsMx0cSP/no=
X-Received: by 2002:a05:6512:314d:: with SMTP id
 s13mr2280830lfi.84.1644911391192; 
 Mon, 14 Feb 2022 23:49:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw7jdBCFRGtOx3ChomoUjTqjBAlmnC0RLhXqNRSdsZZrU1QoF+2qS6ZJyNW8cOqfDRUBFdq9mmUwa0oMmRJaPM=
X-Received: by 2002:a05:6512:314d:: with SMTP id
 s13mr2280802lfi.84.1644911390882; 
 Mon, 14 Feb 2022 23:49:50 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QX7O_auRgTKFjHkBbkBK=B3Z-59S6ZZi10tzFTv1_1hkQ@mail.gmail.com>
 <CACGkMEvtENvpubmZY3UKptD-T=c9+JJV1kRm-ZPhP08xOJv2fQ@mail.gmail.com>
 <CAJSP0QX6JgCG7UdqaY=G8rc64ZqE912UzM7pQkSMBfzGywHaHg@mail.gmail.com>
In-Reply-To: <CAJSP0QX6JgCG7UdqaY=G8rc64ZqE912UzM7pQkSMBfzGywHaHg@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 15 Feb 2022 15:49:39 +0800
Message-ID: <CACGkMEvt66SwZxWhZ72Bv_CL_tykwpL7njZwoddTdVQF7yDfqQ@mail.gmail.com>
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2022
To: Stefan Hajnoczi <stefanha@gmail.com>
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
 Sergio Lopez <slp@redhat.com>, kvm <kvm@vger.kernel.org>, mst <mst@redhat.com>,
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

On Mon, Feb 14, 2022 at 10:02 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> On Mon, 14 Feb 2022 at 07:11, Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Fri, Jan 28, 2022 at 11:47 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:
> > >
> > > Dear QEMU, KVM, and rust-vmm communities,
> > > QEMU will apply for Google Summer of Code 2022
> > > (https://summerofcode.withgoogle.com/) and has been accepted into
> > > Outreachy May-August 2022 (https://www.outreachy.org/). You can now
> > > submit internship project ideas for QEMU, KVM, and rust-vmm!
> > >
> > > If you have experience contributing to QEMU, KVM, or rust-vmm you can
> > > be a mentor. It's a great way to give back and you get to work with
> > > people who are just starting out in open source.
> > >
> > > Please reply to this email by February 21st with your project ideas.
> > >
> > > Good project ideas are suitable for remote work by a competent
> > > programmer who is not yet familiar with the codebase. In
> > > addition, they are:
> > > - Well-defined - the scope is clear
> > > - Self-contained - there are few dependencies
> > > - Uncontroversial - they are acceptable to the community
> > > - Incremental - they produce deliverables along the way
> > >
> > > Feel free to post ideas even if you are unable to mentor the project.
> > > It doesn't hurt to share the idea!
> >
> > Implementing the VIRTIO_F_IN_ORDER feature for both Qemu and kernel
> > (vhost/virtio drivers) would be an interesting idea.
> >
> > It satisfies all the points above since it's supported by virtio spec.
> >
> > (Unfortunately, I won't have time in the mentoring)
>
> Thanks for this idea. As a stretch goal we could add implementing the
> packed virtqueue layout in Linux vhost, QEMU's libvhost-user, and/or
> QEMU's virtio qtest code.

Yes, for vhost, last time I remember Michael may want to do that.

Adding Michael for more comments.

Thanks

>
> Stefano: Thank you for volunteering to mentor the project. Please
> write a project description (see template below) and I will add this
> idea:
>
> === TITLE ===
>
>  '''Summary:''' Short description of the project
>
>  Detailed description of the project.
>
>  '''Links:'''
>  * Wiki links to relevant material
>  * External links to mailing lists or web sites
>
>  '''Details:'''
>  * Skill level: beginner or intermediate or advanced
>  * Language: C
>  * Mentor: Email address and IRC nick
>  * Suggested by: Person who suggested the idea
>
> Stefan
>


