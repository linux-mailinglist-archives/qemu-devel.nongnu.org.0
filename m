Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5156129F7
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 11:14:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1op5It-0006AP-0n; Sun, 30 Oct 2022 06:12:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elliot@nunn.io>) id 1op5Iq-00067S-Ub
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 06:12:28 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elliot@nunn.io>) id 1op5Io-0000rl-Pi
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 06:12:28 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id DD7FF32002D8;
 Sun, 30 Oct 2022 06:12:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Sun, 30 Oct 2022 06:12:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nunn.io; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1667124743; x=
 1667211143; bh=uwqsyRd8Xf3x10mZupwMrkYYPEMZYMaGhHlf28FdYoo=; b=r
 lM2ZboPuac+UKHsBcVsQIwcbfi+SijMtvxCke3qwq7/iYtc+BBGgIl9i0+OM/VqX
 d+pDK7fjUGvDn1GuSdPAD9El84vBsAxBgxVR/Kqtf3Z4nNKbcH6rv58/UDTbjIkW
 Ve6ZHkegcvGpk3A1tB2yzTJN5yVedFuL/zt4vwaSWmnCYUJ257Bgsyw2hlOXP2ua
 Go5J5ybbCc1Lzk5ftd0solJnJpgXV7oYw2+KfSmmIDonPYrm/3M7zrz6IcopIrmD
 hV4qKUNGiUMIBW5q9GFoty6hg6IUt+6mlCd+Z3y73TBrhEsDALtfYpyHYpz7EmrM
 41JA+82RAoH+fZvGKpRUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667124743; x=
 1667211143; bh=uwqsyRd8Xf3x10mZupwMrkYYPEMZYMaGhHlf28FdYoo=; b=B
 KM6oVyMLrvk43O8hKV6QFO8BxvgF1JL5YPUt9SuWXyaoBfzXDAX1JfW2JHW/IcWx
 Eg/x1Pc1aAN4tIxE2rkyyIKUbSmSvoFxzzV7RRzqlumrRi5nSlhnk7wLarWNd4cl
 3YuFDuGUpp6QwsEOHdSM9uKIf9J4BcMkUh4lK3446uXxeqYkuvMRefK6ZAZO8Q7F
 2+USjuVlwTsUDvMmSD/DSPF40l2MXDEGFxycWD2kMw+GDKW7hKukJf2LKviA6g80
 RQIVhOp/Zk7kSJjYYg6AUHkP2J4SJnXrgOg+2q+40j2D6AezqW5WkCk0ZA+Kl+ks
 Bz0NlQG9LcV6AeyyqlI/g==
X-ME-Sender: <xms:B05eY_27-dwsC47Tyj0s9lemVYc_u4sLMNGC03V72MDZys7ttjlKzg>
 <xme:B05eY-F0bHA6kJflM8-2pqvIDPJGfvKlkqAu3blVqLAPAgZGnWQS1aNk8_-HPf5Iu
 IcOF5LMJt-RtNsV5Q>
X-ME-Received: <xmr:B05eY_5B_CPLRZAxrKJkocBO7-rSpglH2OMMEOyhUg8tPZgwgNqhxKXsRaJ5renU9T9LBJ1q5Kp99bwFxxvbEUX8sn_sngBt3r7Nlw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedruddtgddufecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpegtggfuhfgjffevgffkfhfvofesthejmhdthhdtvdenucfhrhhomhepgfhllhhi
 ohhtucfpuhhnnhcuoegvlhhlihhothesnhhunhhnrdhioheqnecuggftrfgrthhtvghrnh
 epffevvdfgudeugfdtvdehveekteekudegfeetleettdeikeejfeduhffhtefftdevnecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepvghllhhioh
 htsehnuhhnnhdrihho
X-ME-Proxy: <xmx:B05eY025vVTU9yNyLbl36KTbMo5KAV3yXZoDjjTzN8bby65Ja22mnA>
 <xmx:B05eYyHYgl6V5lE3Sq5WI3pWHNbilWdMLzCnh9STFYaZPy2bn7yLFg>
 <xmx:B05eY19INimjPB2rBAlas-G990Yj_2Ghqvqf7V5EkBi0-buQ2D1EFw>
 <xmx:B05eY3RoquuCBhLvgpsMUXWA6zUBA6G3HBKs2GwldQokG6OMPv06bQ>
Feedback-ID: i6a78429f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 30 Oct 2022 06:12:21 -0400 (EDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: [PATCH] ui/cocoa: Support hardware cursor interface
From: Elliot Nunn <elliot@nunn.io>
In-Reply-To: <a5029b6b-d0a9-a379-09c0-05d6786af0f2@gmail.com>
Date: Sun, 30 Oct 2022 18:12:16 +0800
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 f4bug@amsat.org
Content-Transfer-Encoding: 7bit
Message-Id: <A51A48EC-0616-4325-84F0-BDC8846F46A7@nunn.io>
References: <54930451-d85f-4ce0-9a45-b3478c5a6468@www.fastmail.com>
 <CAFEAcA_bip7nifW-Zq8qrSmZTCUQA1VMpMR8HSHsKVBAeQxy0A@mail.gmail.com>
 <CAMVc7JXPi3kbFyrN9757uKt-cUprKUBLM9nuDMRjawtVePVVAw@mail.gmail.com>
 <5232C333-9F52-455D-A0D5-B1A438800717@nunn.io>
 <a5029b6b-d0a9-a379-09c0-05d6786af0f2@gmail.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
Received-SPF: pass client-ip=64.147.123.24; envelope-from=elliot@nunn.io;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

Akihiko,

Sounds like you've done a lot of work on ui/cocoa, with the goal of
improving the experience with modern Linux guests. My goal is to improve
the experience with antiquated Mac OS 9 guests.

> My patch has been only tested with recent Linux, but it certainly should
> be ensured that it works well for old systems when upstreaming.
> 
> First I'd like to know what display device you use. It looks like
> dpy_mouse_set is used only by ati-vga, vhost-user-gpu, virtio-gpu, and
> vmware.

I was using my own hardware cursor patches to the VGA device, but now I am
using virtio-gpu. My Mac OS 9 driver for virtio-gpu is in progress.

>> 1. In absolute pointing mode, re-enable Cocoa's cursor and let the host
>> OS move it according to user input.
>> 2. Keep the cursor sprite, but move it according to Cocoa's mouse
>> movement events instead of dpy_mouse_set events.
> 
> Also, can you give reasoning while 2 is preferred? 1 would allow to
> exploit the hardware's feature for cursor composition, resulting in
> smoother experience and a bit less power consumption. But there may be
> complications it can cause so I have not decided which one is the better
> yet.

Mainly that it would simplify the code. OTOH, if we expect the guest to
use the hardware cursor facility, then it's only fair that the host does
the same. I'm open to either option. We should probably try both.

>> And I didn't realise that you had added VirGL support to cocoa.m. Well
>> done! Is it on track for release?
>> My patch should be withdrawn from consideration, in favour of a future
>> solution that does not use cursor warping.
> 
> I'm not really pushing my changes hard so it's kind of stale. Perhaps it
> is better to rewrite the cursor composition patch in a way that does not
> depend on the Virgl patch. I'm also aware that the cursor composition
> using Core Graphics is somewhat laggy so it may be better to rewrite it
> using subview, Core Animation, Metal, or something else. But I have not
> done that yet.

Is there some Cocoa-native way of compositing within the window, that
will work with or without a GL surface? Subviews sound appropriate.

Not that I have any influence, but I think your virgl patch is an
excellent contribution and should go upstream.

Thanks again,

Elliot

