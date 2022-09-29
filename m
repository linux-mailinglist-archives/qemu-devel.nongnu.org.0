Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9103E5EF897
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 17:23:15 +0200 (CEST)
Received: from localhost ([::1]:41452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odvNa-0006Z8-Bp
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 11:23:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walters@verbum.org>)
 id 1oduAB-0004SX-67
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 10:05:22 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:45231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walters@verbum.org>)
 id 1oduA6-0001H5-2A
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 10:05:18 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id D408E5C0181;
 Thu, 29 Sep 2022 10:04:57 -0400 (EDT)
Received: from imap46 ([10.202.2.96])
 by compute5.internal (MEProxy); Thu, 29 Sep 2022 10:04:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verbum.org; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1664460297; x=1664546697; bh=6c9uJDWIOl
 89ZxQkBbMaSnvr+ug9AMGnNuidFr3LmtY=; b=GttC4fgWqCh+1eK3V3dq4sQo7M
 FTiTMtTCuLZG5QAAPljvMpgpfX4qapankAOcQjNxCdJ+YtoUwIYVPZGjmOgMTUl5
 P2zTbtYoJisgmRhvIdnDrCuxWXveS818H7DiDnpegvPi2s73h4YurO3zfzJThIA1
 Mypy0nPtSfviJ02OWhOJa+GxyaY00xtHGLEvP7L2d3FI6akKL9wbKJUyKPvGsrSp
 MVBSYtFDnuoMdniYFGl82tgRJ5GFoWhz3mi5LCdqeU+2QJWIZgZFvk8FtvFrAnxG
 AsUQhQ7HiytyZqNTJYxepWfUPRtV1Ep3U2HG1pLUrG0J4rCDnJe0k/M14L/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1664460297; x=1664546697; bh=6c9uJDWIOl89ZxQkBbMaSnvr+ug9
 AMGnNuidFr3LmtY=; b=tKHVDLaurdyRCkP/OVcyokAfjIRvsaiLsRon2pnKqW3T
 7MVI6uowETV9dusJ95VsIx3h2T6ZjhS/jX3OGTeYknOYN/S+F01d9mkiDHbW5pE6
 DTzwU/3zb2TNFhCGaLY1xFBK+mIA4vwK2GlIVNsruWpQvEz22MlIYyBvbZt1afAg
 v0IJeCfUYvi/CMcICUyYRRMCodmOsJY8CLkNHsewa/Ect7HKQZzPNWS54BKGLsD+
 X+I9LHkWKn41wG7NKBVXTVEX9r1SLSJ4uP3Ujz2e8vmfT2PdmuSQLkpz7MRJQjnF
 9kQ1GFdSUg5LJcujRcdX3MAoCKz8iYSj4KYtMElsHQ==
X-ME-Sender: <xms:CaY1Y4Q9hBxIhuKZpwuKrRsbLzYxWFH7oCNrb0k5nO0FuuDvS7Jo6Q>
 <xme:CaY1Y1zlOGkxmNAz73jy7LEuJd5IDYqJKHVBnDyfYjk9kSNsNke6VqxEz9Z-GZ7--
 pbkUq7kRxac9W5L>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehtddgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedfveho
 lhhinhcuhggrlhhtvghrshdfuceofigrlhhtvghrshesvhgvrhgsuhhmrdhorhhgqeenuc
 ggtffrrghtthgvrhhnpefhjedutdehtdfgueeuledtkeefkedvgfevieefudetkeehffej
 gfeiheehkeegteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpeifrghlthgvrhhssehvvghrsghumhdrohhrgh
X-ME-Proxy: <xmx:CaY1Y12oehs5y5YHwAdlOKEejFE1SxQHsb0LpuIINjHmDz5ybPHK-A>
 <xmx:CaY1Y8CpHAedSnnQsyG7O1d8fVqYljQi5L5kcWRClYP5Hac_BBybSA>
 <xmx:CaY1YxiL-gANIhgDHcgxriPnoiTa19N26uvQb_tdYhANidb5vpcF2Q>
 <xmx:CaY1Y0vj8nuN67F3Ge0eC9-aSjDkWh9UVTJkRIJR8UTs4L3GnedUbg>
Feedback-ID: ibe7c40e9:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 328982A20079; Thu, 29 Sep 2022 10:04:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-968-g04df58079d-fm-20220921.001-g04df5807
Mime-Version: 1.0
Message-Id: <b963f623-aa85-4285-9bfa-5fcb4744c354@app.fastmail.com>
In-Reply-To: <YzSgeDdpHOw1hTM0@redhat.com>
References: <4362261a-c762-4666-84e2-03c9daa6c4d9@www.fastmail.com>
 <YzMmu3xfOtQwuFUx@redhat.com> <YzMrYAJQeSP2hDSs@redhat.com>
 <CAJh=p+5rQDBJJC8VNGL10KYgDeq-Hg5WK7avONCti03eJGH+ow@mail.gmail.com>
 <798fe353-9537-44fe-a76a-819e8c93abb5@www.fastmail.com>
 <YzNZnPiUqySu6sGh@fedora> <20220928083340.eyizwu6mm3cc3bxu@mhamilton>
 <YzSgeDdpHOw1hTM0@redhat.com>
Date: Thu, 29 Sep 2022 10:04:36 -0400
From: "Colin Walters" <walters@verbum.org>
To: "Vivek Goyal" <vgoyal@redhat.com>, "Sergio Lopez" <slp@redhat.com>
Cc: "Stefan Hajnoczi" <stefanha@redhat.com>,
 virtio-fs-list <virtio-fs@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [Virtio-fs] virtiofsd: Any reason why there's not an "openat2"
 sandbox mode?
Content-Type: text/plain
Received-SPF: pass client-ip=66.111.4.27; envelope-from=walters@verbum.org;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 28, 2022, at 3:28 PM, Vivek Goyal wrote:

> Sounds reasonable. In fact, we could probably do someting similar
> for "landlock" as well. 

Thanks for the discussion all!  Can someone (vaguely) commit to look into this in say the next few months?  It's not *urgent*, we can live with the 9p flakes and problems short term, just trying to figure out if this needs to be on our medium-term radar or not.  Thanks!

