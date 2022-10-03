Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0384B5F3961
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 00:54:20 +0200 (CEST)
Received: from localhost ([::1]:36356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofUKI-0006tD-Jw
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 18:54:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walters@verbum.org>)
 id 1ofUIB-0005IY-K3
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 18:52:07 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:52615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walters@verbum.org>)
 id 1ofUI9-0006Yj-NV
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 18:52:07 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id A5D815C00EE;
 Mon,  3 Oct 2022 18:52:02 -0400 (EDT)
Received: from imap46 ([10.202.2.96])
 by compute5.internal (MEProxy); Mon, 03 Oct 2022 18:52:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verbum.org; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1664837522; x=1664923922; bh=jd0wJkpOXv
 i8AWOfiC0AbkK+OJ5peRzxA9rPR6meT4E=; b=h7M4/eQ6OCKWA6StWWUy9sgyr3
 xMdnP6PGzI73MFY0GQLI382h2L1YpKTwZyjqqtV0ltRSafqg6pOVOo3w0L/Rpmjx
 XX74YzcapQO8XH6wem+Gu4XhV/7w/HUqsN8AHmrmTNyXgaFC5XPayfUFWlwOWI30
 cJy4YkwPWOti/mWxyUP1YPV9OyAxb1Xqxj7SHPN6b7ezGusanndknETZy8Am4/Sm
 hL0X4BljaXxjJlSS4bx8V1Uz0gc9GQ9EdUYe5RfY3BR/FmC1uph95brq25WUipfB
 M2pqlqlyBNJJL9kltNqya4sWJIoxw3XTWBAYX1rAAKoC7b7+p4JY1gmlg+Iw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1664837522; x=1664923922; bh=jd0wJkpOXvi8AWOfiC0AbkK+OJ5p
 eRzxA9rPR6meT4E=; b=eyu3gmcyOmUDAFz1lRYj0KRODLE2mthriWxGyo9VLEgx
 RnqgnFMsFFFpA6VVsMt0jJjUXS80sUZnZjtjgiBaVml5eS59KweIO0dPhrNqeYPT
 i4/B7aMYT8YFRii7Vv7OCGCSMvrfEWKgD7lScnANPoapPkEbtlmJh7R3zVHg+6QF
 dcgskY9VoB/9mZR1cJ9gLyD7uHlC+4B7ylZNyE/+8tLRB1e90suRATGDIU8YVTnQ
 fY0RdcgRAjKX9pgAC1wV0yfAliLUK8CNKMBlBcNJAS6lyTXe1Mxmp+HyAYejE0ya
 ZKMKF5kTexLGbqnD4f4swHIDqmgaRsGVDccJIigibA==
X-ME-Sender: <xms:kmc7Y8_YdtdQoFeSts6PsHE5qXbcb8wXJ3AyaRaxMq1zhoYY7Tp--g>
 <xme:kmc7Y0tmLi0sLv8GERzeyGGbD5nGIRQ36fyM5rpG2qRRaFOgo5-kX8v9tb2LeH1wF
 hq4v7UKn95-LEjs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeitddgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedfveho
 lhhinhcuhggrlhhtvghrshdfuceofigrlhhtvghrshesvhgvrhgsuhhmrdhorhhgqeenuc
 ggtffrrghtthgvrhhnpedtkeekveffueeihfegieeukeejveelledvlefffedvgeduffdt
 heetieefuefhvdenucffohhmrghinhepohhpvghnshhhihhfthdrtghomhenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeifrghlthgvrhhssehv
 vghrsghumhdrohhrgh
X-ME-Proxy: <xmx:kmc7YyBILTukHa1H3B1PEIWTPN7zgPZ26pmvr56aEaiu-sj95wkoVQ>
 <xmx:kmc7Y8fhd2O1jhPWo06nmdMKuR3nqHgwXoqanZ2oV3ttg1zzrAnjlQ>
 <xmx:kmc7YxOwmwD2-ipusBr6pmCpINIdsZKxX8qlI73jdArj3SvXkhV13g>
 <xmx:kmc7YyoQyxcFrLsAVjNWfzyzs-Bu5JfHwnmVlN5xATWWdf4u0l5RtA>
Feedback-ID: ibe7c40e9:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 6828A2A20079; Mon,  3 Oct 2022 18:52:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1015-gaf7d526680-fm-20220929.001-gaf7d5266
Mime-Version: 1.0
Message-Id: <aa26d28d-d352-467c-910c-ab5973a6d759@app.fastmail.com>
In-Reply-To: <YzXP8XhCG5ta2Dvv@redhat.com>
References: <YzMmu3xfOtQwuFUx@redhat.com> <YzMrYAJQeSP2hDSs@redhat.com>
 <CAJh=p+5rQDBJJC8VNGL10KYgDeq-Hg5WK7avONCti03eJGH+ow@mail.gmail.com>
 <798fe353-9537-44fe-a76a-819e8c93abb5@www.fastmail.com>
 <YzNZnPiUqySu6sGh@fedora> <20220928083340.eyizwu6mm3cc3bxu@mhamilton>
 <YzSgeDdpHOw1hTM0@redhat.com>
 <b963f623-aa85-4285-9bfa-5fcb4744c354@app.fastmail.com>
 <YzWnPZ5Y6ivS8e1v@redhat.com>
 <b1cf0d02-cc45-4f5c-bfef-fda3e750bef3@app.fastmail.com>
 <YzXP8XhCG5ta2Dvv@redhat.com>
Date: Mon, 03 Oct 2022 18:51:42 -0400
From: "Colin Walters" <walters@verbum.org>
To: "Vivek Goyal" <vgoyal@redhat.com>
Cc: "Sergio Lopez" <slp@redhat.com>, "Stefan Hajnoczi" <stefanha@redhat.com>, 
 virtio-fs-list <virtio-fs@redhat.com>, qemu-devel@nongnu.org,
 "German Maglione" <gmaglione@redhat.com>
Subject: Re: [Virtio-fs] virtiofsd: Any reason why there's not an "openat2"
 sandbox mode?
Content-Type: text/plain
Received-SPF: pass client-ip=66.111.4.28; envelope-from=walters@verbum.org;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On Thu, Sep 29, 2022, at 1:03 PM, Vivek Goyal wrote:
> 
> So rust version of virtiofsd, already supports running unprivileged
> (inside a user namespace).

I know, but as I already said, the use case here is running inside an OpenShift unprivileged pod where *we are already in a container*.

> host$ podman unshare -- virtiofsd --socket-path=/tmp/vfsd.sock 
> --shared-dir /mnt \
>         --announce-submounts --sandbox chroot &

Yes, but in current OCP 4.11 our seccomp policy denies CLONE_NEWUSER:

```
$ unshare -m
unshare: unshare failed: Function not implemented
```

https://docs.openshift.com/container-platform/4.11/security/seccomp-profiles.html

> I think only privileged operation it needs is assigning a range of
> subuid/subgid to the uid you are using on host.

We also turn on NO_NEW_PRIVILEGES by default in OCP pods.  

Now, I *could* in general get elevated permissions where I need to today.  But it's also really important to me to have a long term goal of having operating system builds and tests work well as "just another workload" in our production container platform (now, one *does* want to bind in /dev/kvm, but that's generally safe, and even that strictly speaking is optional if one can stomach the ~10x perf hit).

> Can you give rust virtiofsd (unprivileged) a try.

I admit to not actually trying it in a pod, but I think we all agree it can't work, and the only thing that can today is openat2.

