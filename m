Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E06A303163
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 02:42:24 +0100 (CET)
Received: from localhost ([::1]:39886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4DN8-0001wo-Ns
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 20:42:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bertofurth@sent.com>)
 id 1l4BLj-0000r3-6r; Mon, 25 Jan 2021 18:32:47 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:59895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bertofurth@sent.com>)
 id 1l4BLh-0001D3-A3; Mon, 25 Jan 2021 18:32:46 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 5D886ED4;
 Mon, 25 Jan 2021 18:32:43 -0500 (EST)
Received: from imap1 ([10.202.2.51])
 by compute6.internal (MEProxy); Mon, 25 Jan 2021 18:32:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sent.com; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=i/5X3yl8sRh8vdJUUOTx55n0DGyXxxd
 JPLa1+JpDVtE=; b=cfvvas5+pN39jVAvLkndTLLQTvbLO/84H5LuTpoax7/U/mU
 7clXzyJ+Ff/NZ2uKBo4gBkzuZ/2VxRze964BA6mUPxgYcA23cY8VJWDZFfdXRAhq
 b7/DUTl33awixo8ZtoZyitK8KMVdrHeNBAVrNLRd6+92PFkCHGX6nZKYPVY1gd1T
 6akgEV1VzocNXJVNSLpAC/cnD7s7CL6t1b6C4Xjc8/aCeEFSIBZK0Um0U8tHMSU/
 VvIy31HTe4CRWUNqci+XvUMhiFD1ph/mDXnp6ejL8UZAXopwAF0tgl+fkyQAbuq5
 wKqieAPq3a/nEs3VcSLXsiNxO954gfFiTOWe6fw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=i/5X3y
 l8sRh8vdJUUOTx55n0DGyXxxdJPLa1+JpDVtE=; b=XC+/L6NGgVwDbHt/j8IfQp
 mw2dvoHKQ0R1bNTxb1uveH5PAnQQIWkvlZBRfNvb0lpGdnzvIzXRRZw8MKPnjejT
 89yx4DnD30wfHJ1fxZj/rGuKplwBg/QBoUk+MiVf4h4tchAmhZtB7GhH5hiLux4h
 nuAwQsdvea1WYTtnyDlsFPS12GO4L/F70RFsVUIdSF9KmVinTQfmCdFSvEM8S5di
 b5Ef8geUvI6+Ps9maYUesWnwnrBduuYIhMAH8xdjldt1Vez9Bd3cojoRhWdKlRe3
 DxVIKcj2hx31xnLo3Jpv/BEpLOfdA5iQPvwtDbLYRChpoE2ACPSjRKj9mhJv7nKg
 ==
X-ME-Sender: <xms:GlUPYMaVpQv7K1Z9_uQ8TCewkTFTlanaLBatNNTGW7XsD_RWjv-bZg>
 <xme:GlUPYHbFjsj7iTzlEIhVR3J-3ZGfZuNHHqUNdj2WtaRbUhTr3NsSX_1lCUxIxupF1
 pJ3ze68DLETBLCyL9s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeggddtlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedfuegvrhht
 ohcuhfhurhhthhdfuceosggvrhhtohhfuhhrthhhsehsvghnthdrtghomheqnecuggftrf
 grthhtvghrnhepkedvffekhedugffhieeffeeujeeuueeifeevtdehfffhvdfhueejleeh
 tdfhfedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epsggvrhhtohhfuhhrthhhsehsvghnthdrtghomh
X-ME-Proxy: <xmx:GlUPYG9vWv7IWA2fcPPH1WnF20uxD0tdskuPmAVGWAlCwr2YLdTgRg>
 <xmx:GlUPYGqY1s3QaLg2L5u7HI3alerFSDI8wHtuO8DcOM0FKfpMwimwWw>
 <xmx:GlUPYHrlSRsR9Dw0XF_lyQkBAlQ4V4rQ5xFpulZ-JdsQL3zIXpI7Pg>
 <xmx:GlUPYGRrNilaOspb0c3I4uG81QmNubBuMoHwn_hQsH_xy-Be5AgUcg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 73C75130005D; Mon, 25 Jan 2021 18:32:42 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-78-g36b56e88ef-fm-20210120.001-g36b56e88
Mime-Version: 1.0
Message-Id: <083767b3-3621-4735-9f05-77153f6894a1@www.fastmail.com>
In-Reply-To: <CAFEAcA-pm+k4ukfVQ_zg-Bi5SAj4e2P9LEVHpbCkSK6wR=T-Mw@mail.gmail.com>
References: <994f40e1-2a5b-4b7a-a4aa-23f824881d8a@www.fastmail.com>
 <CAFEAcA-pm+k4ukfVQ_zg-Bi5SAj4e2P9LEVHpbCkSK6wR=T-Mw@mail.gmail.com>
Date: Tue, 26 Jan 2021 10:32:21 +1100
From: "Berto Furth" <bertofurth@sent.com>
To: "Peter Maydell" <peter.maydell@linaro.org>
Subject: Re: KVM guests reading/writing guest memory directly and accurately
Content-Type: text/plain
Received-SPF: pass client-ip=64.147.123.25; envelope-from=bertofurth@sent.com;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 25 Jan 2021 20:40:56 -0500
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks so much for your help and encouragement Peter. I really appreciate it.

All the best!

On Mon, 25 Jan 2021, at 03:07, Peter Maydell wrote:
> On Sun, 24 Jan 2021 at 07:22, Berto Furth <bertofurth@sent.com> wrote:
> > Can anyone give me some advice on how a machine or device can read and write kvm guest ram memory and get a guaranteed up to date result? Can someone point me at an example in the latest QEMU source code? I'm working with an ARM-32 guest (-cpu host,aarch64=off) running on an ARM-64 host (Cortex A72 - Raspberry Pi4b).
> >
> > I have a problem where if I write directly to my guest RAM, (such as a DMA transfer) then the guest can't see the change straight away. Similarly when the host writes memory, the guest doesn't see the change until much later.
> >
> > If during a KVM_EXIT_MMIO the qemu host changes some values in guest ram memory (via address_space_write() or cpu_physical_memory_rw() etc...) , is there a way to make the guest be able to accurately read that memory as soon as the exit is complete. Additionally if a guest changes a value in ram just before a KVM_EXIT_MMIO, is there a way to ensure that the QEMU host can then read the up to date newly set values?
> 
> With KVM I think this is just normal "multiple threads/CPUs both
> accessing one in-memory data structure" effects, so you need a
> memory barrier to ensure that what one thread has written is
> visible to the other. I think that the idea is that
> the functions in include/sysemu/dma.h provide a dma_barrier() (which is
> just a CPU memory barrier) and some wrapper functions which put in the
> barrier on the right side of a read or write operation. On the guest
> side it should already be using the right barrier insns in order
> to ensure that real hardware DMA sees the right view of RAM...
> 
> We're very inconsistent about using these -- I've never liked the way
> we have separate 'dma' operations here rather than having the normal
> functions Just Work. But I haven't ever looked very deeply into what
> the requirements in this area are.
> 
> > I understand that the proper thing to do is to set up the memory region in question as MMIO so that when the guest accesses this memory a KVM_EXIT_MMIO will occur but the memory region in question has to be executable and MMIO memory areas are not executable in QEMU. In addition it's not easily possible to predict before hand exactly what memory addresses are going to be involved in DMA, so I'd prefer to avoid having to dynamically construct little MMIO memory islands inside the main guest ram space as the guest runs.
> 
> You only want to mark regions as MMIO if they need to actually come
> out to QEMU for the guest memory access to be handled -- typically
> this is device MMIO-mapped register banks. Normal RAM isn't mapped
> as MMIO.
> 
> > I'm assuming that the guest could be modified to disable d-caching (modify the ARM register SCTLR / p15 ?) and that may help but I'm desperately trying to avoid that if possible because I'm working with a proprietary "blob" on the guest that I don't have all the source code for.
> 
> With Arm KVM doing this wouldn't help; in fact it would make things
> worse, because then the view of guest RAM that the guest sees has
> the non-cacheable attribute, but the view of guest RAM that QEMU
> has mapped is still cacheable, so the two get hopelessly mismatched
> ideas of what the RAM contents are.
> 
> (Side note: if the guest wants to map RAM as non-cacheable, this
> won't work with Arm KVM (unless the host CPU supports FEAT_S2FWB,
> which is an Armv8.4 feature), for the same "QEMU and guest view
> of the same block of RAM disagree about whether it's cached" reason.
> The most commonly encountered case of this is that you can't use a
> normal VGA PCI graphics device model with KVM, because the guest maps
> the graphics RAM on the device non-cacheable.)
> 
> > I know it's not very professional of me to make an emotional plea, but I've been working on this for weeks and I am desperately hoping someone can point to a solution for me. I am not a KVM expert and so I'm hoping I'm just missing something simple and obvious that one of you can quickly point out for me.
> 
> Nah, this isn't obvious stuff -- a lot of QEMU's internals aren't
> very well documented and often are inconsistent about whether they
> do things correctly or not...
> 
> thanks
> -- PMM
>

