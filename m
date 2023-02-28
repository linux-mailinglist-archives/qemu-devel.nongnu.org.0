Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CC66A5087
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 02:12:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWoWE-0001vY-Rl; Mon, 27 Feb 2023 20:11:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pWoWC-0001vK-Gw
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 20:11:00 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pWoWA-0007k8-MU
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 20:11:00 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id C893F5C0114;
 Mon, 27 Feb 2023 20:01:09 -0500 (EST)
Received: from imap42 ([10.202.2.92])
 by compute1.internal (MEProxy); Mon, 27 Feb 2023 20:01:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1677546069; x=
 1677632469; bh=Q85rDOzuoKnF9N3D41k1Gny4/h11sbFreEZfAsvwsSw=; b=L
 +BhQwGdrfTgc6+hOX3D4MmQoPIiXGh1wzcKZ/NuvWm1ylhVJknQ8Es8IPwZVX4xM
 zzqIgo5/hy23lZAU8EBwLcGFxlwx4kRngDbQdaFsoMsfJO/mB9cGi17bauDoEHZt
 wOI7H1YNGdFp+52CbrooEbXvMiJt1uzmNu13yY6/JIZJp8dtHmcaQiPTvtiCDzok
 B60sSEglMkHXxOEA6BfZDSF8HGDvVik5aMCylj9E6Mq/QdLvL49Jn1RaU7CXhTNY
 pcwFIkfRrtMT7VvrRRYf5WpEuMZH0fyhUQ5Bsko6UfiYZ0zoicxjX+Nqn8PvUu29
 5d3PygnD+DTWyl1xAXZXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677546069; x=
 1677632469; bh=Q85rDOzuoKnF9N3D41k1Gny4/h11sbFreEZfAsvwsSw=; b=m
 TNQShSjfbIBlTH1KYsuULDJEQkMCY71cAYFK5a8MbZ/HkZ3iTQxvy1lcPBOUM3sX
 rlVajJ49yyRwCINhkiH9kPg/WZW2j5Ad9rrxSbO/IZcEPqLci0JIO2dfe7p3Aa6C
 fGIaeRPHri5XGeH42BQN8vstFL7IRFIzwZbWl9gajJyPF42MviFoE9EQ0HAGKVrt
 0pBoAgtXrLd/M3HS/8vg1g+Ok33X3cHguEyriPTFR+shGqNAT0gCHinDAsJ/wq+G
 Pwp8/yoGVSbFVbJTBLeCD3wWd+0SPToCtDpM93zBxm/c6iDlxDS6kJuGcqgYgf+U
 6ngpa/jZ10hh7rd9CVrnw==
X-ME-Sender: <xms:VVL9Yw7y8hLMre5LWfHyvnEYptu2C8rhWXlj1VBLCtNSA6mZoS-Pmw>
 <xme:VVL9Yx7Ax-c_JbMNdKt4KKoBfpoRU35vv-nYyMRtlunp7bgFgXoosAQDxvaG9imOb
 b8ziJ4Dzkt0SM76qQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeluddgvdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqher
 tderreejnecuhfhrohhmpedfffgrnhhivghlucgiuhdfuceougiguhesugiguhhuuhdrgi
 ihiieqnecuggftrfgrthhtvghrnhepveehudetfedvtdfhvdfgheejjedthfeiiefggffg
 uddvffdtveeljeelleefieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomhepugiguhesugiguhhuuhdrgiihii
X-ME-Proxy: <xmx:VVL9Y_cYsD200t0no8dMwowgKFCl2u6YlisQVhKOs1MvF5jpObkAZg>
 <xmx:VVL9Y1L3__RPwJt7OlpUcDiLU1WECKB10PnLg47OR5nL6SsCZHrp2w>
 <xmx:VVL9Y0K-C6Gw2clHZr_B9juHQP0rBqNNMkYuQukUVOTCtp80aQDkmg>
 <xmx:VVL9Y-y9NIBnaABsbpUWcE8tjXFABYdnRIR-ksqydMwfmdohvuVWXg>
Feedback-ID: i6a694271:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 99648BC007C; Mon, 27 Feb 2023 20:01:09 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-183-gbf7d00f500-fm-20230220.001-gbf7d00f5
Mime-Version: 1.0
Message-Id: <25abc65e-a0fd-480a-bdf4-e03d03ac56c3@app.fastmail.com>
In-Reply-To: <CAJ+F1CLY=8fnvqkn9OBwqvDw=-mgjsDeMr1pa-p2xBw3Oc4Nxg@mail.gmail.com>
References: <cover.1677197937.git.dxu@dxuuu.xyz>
 <d4b8f60e02ae9f6fd12f2d05feae3c903cfe9e82.1677197937.git.dxu@dxuuu.xyz>
 <CAJ+F1CLY=8fnvqkn9OBwqvDw=-mgjsDeMr1pa-p2xBw3Oc4Nxg@mail.gmail.com>
Date: Mon, 27 Feb 2023 18:00:49 -0700
From: "Daniel Xu" <dxu@dxuuu.xyz>
To: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@gmail.com>
Cc: "Michael Roth" <michael.roth@amd.com>,
 "Konstantin Kostiuk" <kkostiuk@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 1/3] qga: test: Use absolute path to test data
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=66.111.4.27; envelope-from=dxu@dxuuu.xyz;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_NXDOMAIN=0.9,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, NO_DNS_FOR_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Marc-Andr=C3=A9,

Thanks for reviewing the series.

On Mon, Feb 27, 2023, at 1:16 AM, Marc-Andr=C3=A9 Lureau wrote:
> Hi
>
> On Fri, Feb 24, 2023 at 8:31 AM Daniel Xu <dxu@dxuuu.xyz> wrote:
>>
>> It looks like qga's working directory is in a tempdir. So the relative
>> path that the test case gives qga through the QGA_OS_RELEASE=3D
>> env variable does not resolve correctly.
>>
>> Fix by doing a poor man's path canonicalization of the test data file.
>>
>> Note we cannot use g_canonicalize_filename() b/c that helper was only
>> introduced in glib 2.58 and the current GLIB_VERSION_MAX_ALLOWED is
>> pinned to 2.56.
>>
>> Signed-off-by: Daniel Xu <dxu@dxuuu.xyz>
>
> This breaks "meson test test-qga" for me. How do you run the tests?

Ah, thanks for the hint. I was running the qga tests in build/ with:

        $ ./tests/unit/test-qga

Using meson to drive the tests fixed it for me. I will drop this patch.

[...]

Thanks,
Daniel

