Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9526D5EF98E
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 17:54:20 +0200 (CEST)
Received: from localhost ([::1]:42702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odvrf-0003c8-87
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 11:54:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walters@verbum.org>)
 id 1odvlU-0006Sf-8T
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 11:47:56 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:58427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walters@verbum.org>)
 id 1odvlS-0002yA-6K
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 11:47:55 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id F21A95C0197;
 Thu, 29 Sep 2022 11:47:52 -0400 (EDT)
Received: from imap46 ([10.202.2.96])
 by compute5.internal (MEProxy); Thu, 29 Sep 2022 11:47:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verbum.org; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1664466472; x=1664552872; bh=U7nwSGKpL7
 kzmsrtzXcN1vDbSjhTDOzHr0ve0+b3wqo=; b=Rt9jihANFNVqeqXl/6jZcgFkJl
 TXrXf2rlWCYldEjenoea9M+iXsbN10HbGJOD2uRLGO5ubzm9r/ruBgAN5Rwvhx5R
 xAndsuJqD8FnnCiy0iApbcpNtOsh4DALZyex2yPXCFfKt1F6s9F04u1Nfy6aA9CG
 mAwxNMtxc6xlPFahH06C9V2NbIfwwYm2CHgHJEdIm9038qSK0deZBfVv1nFCs2CG
 kYwB0nH0wTQp+z2PNYSYfxVq4hXJzrCYC4navPXLfRg9rdfgnVN/S2fbzzPL2Nqy
 64N/Oj53jhMheNe2G/Ch9qQklYTf4NDWok9AdZ42QI1pjTvSL7FCwdy2wK7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1664466472; x=1664552872; bh=U7nwSGKpL7kzmsrtzXcN1vDbSjhT
 DOzHr0ve0+b3wqo=; b=dxLV/mjI73QJL5fs9aBRIly7heSoPQcURioDSbQerzdB
 vkHuwS11dqb3HU4YRRo+oQ63PCiG0EXY4m3wUz1iRUaezHBwXShVEDEb2az6xKSk
 UL6b25iEcC1yxaHm8Q5zqGBuMusXYruD7R08PXU38ZDldGnxl8rLezNzGmPRuZcJ
 rsyQrOpg7md4NiC+NQ6Qm5dAvjM4KnCl5MF9JUPGX5FOhtd1xUovT9h6RuZLxMsv
 90kJj+busn+8OpK2clmhkgey/Kp4nejqnGpQcsANfoK312mq0TF4xwIrzU2bbOLa
 ejD4quKhFwZaEeVk2tSM7uvc2UyglOkgjC2Nte5ALA==
X-ME-Sender: <xms:KL41Y1ih0i58MVjmr2Xadm3Sm8d-koZTJRgN-MDFEnBrVLFndAn0Cg>
 <xme:KL41Y6DeuYFKTzIT5nFJbU0j_5R0zdNM_CczoGPDs4mEKycU6KleXmA2pS9WeS9ZB
 iAj2pUo49tlqbti>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehtddgleegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedfveho
 lhhinhcuhggrlhhtvghrshdfuceofigrlhhtvghrshesvhgvrhgsuhhmrdhorhhgqeenuc
 ggtffrrghtthgvrhhnpefhjedutdehtdfgueeuledtkeefkedvgfevieefudetkeehffej
 gfeiheehkeegteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpeifrghlthgvrhhssehvvghrsghumhdrohhrgh
X-ME-Proxy: <xmx:KL41Y1HiBy1E_kWIFFwjtB92dDd4Iw_ASUnK_VpFXfR5VaLtsS-jwQ>
 <xmx:KL41Y6SOP2fQxjChZKN5-Uxg1tU_X9Eg4YeYVXUDHjZY7UidtZx3AA>
 <xmx:KL41YyzYqgMAsPmiRSR9garkQRfwnBNyHs3G_8Yb8aTf75trF6lESg>
 <xmx:KL41Y98-cORPsfZK1qNoW2Np28mGa5GjNVIM_2m1PyR-z6bQ8wd4Rg>
Feedback-ID: ibe7c40e9:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id BD4F22A20079; Thu, 29 Sep 2022 11:47:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-968-g04df58079d-fm-20220921.001-g04df5807
Mime-Version: 1.0
Message-Id: <b1cf0d02-cc45-4f5c-bfef-fda3e750bef3@app.fastmail.com>
In-Reply-To: <YzWnPZ5Y6ivS8e1v@redhat.com>
References: <4362261a-c762-4666-84e2-03c9daa6c4d9@www.fastmail.com>
 <YzMmu3xfOtQwuFUx@redhat.com> <YzMrYAJQeSP2hDSs@redhat.com>
 <CAJh=p+5rQDBJJC8VNGL10KYgDeq-Hg5WK7avONCti03eJGH+ow@mail.gmail.com>
 <798fe353-9537-44fe-a76a-819e8c93abb5@www.fastmail.com>
 <YzNZnPiUqySu6sGh@fedora> <20220928083340.eyizwu6mm3cc3bxu@mhamilton>
 <YzSgeDdpHOw1hTM0@redhat.com>
 <b963f623-aa85-4285-9bfa-5fcb4744c354@app.fastmail.com>
 <YzWnPZ5Y6ivS8e1v@redhat.com>
Date: Thu, 29 Sep 2022 11:47:32 -0400
From: "Colin Walters" <walters@verbum.org>
To: "Vivek Goyal" <vgoyal@redhat.com>
Cc: "Sergio Lopez" <slp@redhat.com>, "Stefan Hajnoczi" <stefanha@redhat.com>, 
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



On Thu, Sep 29, 2022, at 10:10 AM, Vivek Goyal wrote:

> What's your use case. How do you plan to use virtiofs.

At the current time, the Kubernetes that we run does not support user namespaces.  We want to do the production builds of our operating system (Fedora CoreOS and RHEL CoreOS) today inside an *unprivileged* Kubernetes pod (actually in OpenShift using anyuid, i.e. random unprivileged uid too), just with /dev/kvm exposed from the host (which is safe).  Operating system builds *and* tests in qemu are just another workload that can be shared with other tenants.

qemu works fine in this model, as does 9p.  It's just the virtiofs isolation requires privileges to be used today.



