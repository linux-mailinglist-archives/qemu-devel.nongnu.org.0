Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 826CB6A50C3
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 02:38:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWovM-0004Xt-AM; Mon, 27 Feb 2023 20:37:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pWovK-0004SA-GP
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 20:36:58 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pWovH-0003Qh-OV
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 20:36:58 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id D1DCB5C01A4;
 Mon, 27 Feb 2023 20:36:52 -0500 (EST)
Received: from imap42 ([10.202.2.92])
 by compute1.internal (MEProxy); Mon, 27 Feb 2023 20:36:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1677548212; x=
 1677634612; bh=ry/862Ry+6YM40SLbf2K4NnpT3bHMSLo6u9quS8L4E4=; b=a
 JMlExoIUaMYz9aoFbAd+cHo6wMK4P53WxGSsJYxO0RKzKdGEfUFJBBlFAU2nWd0N
 wccg0kor3CVfXeJuDAOy7002g8tznAr+m2WJypcYIbPSRLAoMdQl+El4ciQ9WtiC
 aDFLnw4nSaT00pOYe2fjBumY239Qtf/9UX8Tm8zRCIscSldoH1fFyVcwGjO42TOc
 8B9wVqq43Vaq4pK1KErxQ307ARq4Jdw0IoeaJe3zSUutsi7gYxREEVwCncGQ8U7A
 yRLwqbPRpxBH2hU5bym8ZDFO5Z9mffkFeO0cd7hJxMqWJ+oiJGYiIBctTv8sbZa7
 KWLQ4/MJoyjOiz34mNKnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677548212; x=
 1677634612; bh=ry/862Ry+6YM40SLbf2K4NnpT3bHMSLo6u9quS8L4E4=; b=l
 xdpLY4zA2qcE6xcz0cQGDjedPpsvU+GBpWuuWCc0yEBVfrQdIc3VMSxLQzaEIXOc
 6SXVf5gOlUGW7/KKHU1rkWiv79wok42HvrvBM3FAEBzSqglUOcMUq0F7hIF25KjD
 a8L2tZWwym1KdlqLQaojCLjOjxknZENj1DW9edLPjG5474eWL8KwXu3Ev0E9+zRF
 IfkeYKIXZW2J9PiCLFpGkwaoJ3AqKnh0d36tPn5z9zEzAE/vZiuxgRy2pQzBsyL4
 LhTcW+QngthfABBBlzD9kTQH2TTT0BUy06WyrO72tXkAnUTRke6diF7jZbbV36/n
 X3R/UtWq9i/upMS+fLmQg==
X-ME-Sender: <xms:tFr9YwKlALGEleJB4vpDff4slTndnyfBaN4FscO1GHYyZwrMF3mKVA>
 <xme:tFr9YwIqVBOEkSEaomW9rgDc-GLTBw7Nwc1m_UXpwap5zSld9qCmOlZRrXUibEgBg
 HDIGx8nJKd5APZT4A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeluddgfeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqher
 tderreejnecuhfhrohhmpedfffgrnhhivghlucgiuhdfuceougiguhesugiguhhuuhdrgi
 ihiieqnecuggftrfgrthhtvghrnhepveehudetfedvtdfhvdfgheejjedthfeiiefggffg
 uddvffdtveeljeelleefieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomhepugiguhesugiguhhuuhdrgiihii
X-ME-Proxy: <xmx:tFr9YwsHzEWsvkW8TJBxiGkOUAISZu_vhw-R6PH9ipqR3wNqCKuO_w>
 <xmx:tFr9Y9ZNOlOAKBQ7WpnMlIHZvWA5Go_4e3G28uOr54iRBuD8bYQWIw>
 <xmx:tFr9Y3YsTWO6AyRlxm_kD86q3d7bgwm3BQk19mIN7NAnS8r0mKB1Bg>
 <xmx:tFr9Y4DakLnAhjBY-SeTsofij5_BsGfcHiu_CjSSywhEYv9NJMGVVg>
Feedback-ID: i6a694271:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id A8197BC0078; Mon, 27 Feb 2023 20:36:52 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-183-gbf7d00f500-fm-20230220.001-gbf7d00f5
Mime-Version: 1.0
Message-Id: <f5749d78-bce4-4f4e-90d8-3f7d48503015@app.fastmail.com>
In-Reply-To: <CAJ+F1CK2fHPSq=m=CX-2QVbg10TquLRWGtRRY1ip+ORozr+avw@mail.gmail.com>
References: <cover.1677197937.git.dxu@dxuuu.xyz>
 <2d68032724822784750df4edc4df0c578c878871.1677197937.git.dxu@dxuuu.xyz>
 <CAJ+F1CK2fHPSq=m=CX-2QVbg10TquLRWGtRRY1ip+ORozr+avw@mail.gmail.com>
Date: Mon, 27 Feb 2023 18:36:31 -0700
From: "Daniel Xu" <dxu@dxuuu.xyz>
To: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@gmail.com>
Cc: "Michael Roth" <michael.roth@amd.com>,
 "Konstantin Kostiuk" <kkostiuk@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 3/3] qga: test: Add tests for `merge-output` flag
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

Hi,

On Mon, Feb 27, 2023, at 1:40 AM, Marc-Andr=C3=A9 Lureau wrote:
> Hi
>
> On Fri, Feb 24, 2023 at 8:31 AM Daniel Xu <dxu@dxuuu.xyz> wrote:
>>
>> This commit adds a test to ensure `merge-output` functions as expecte=
d.
>> We also add a negative test to ensure we haven't regressed previous
>> functionality.
>>
>> Signed-off-by: Daniel Xu <dxu@dxuuu.xyz>
>
> Please check your patch with ASAN, you have use after-free introduced
> by this change:
> =3D=3D664972=3D=3DERROR: AddressSanitizer: heap-use-after-free on addr=
ess
> 0x621000135028 at pc 0x55e617a38b39 bp 0x7fff7fe85390 sp
> 0x7fff7fe85388
> READ of size 8 at 0x621000135028 thread T0
>     #0 0x55e617a38b38 in qdict_find ../qobject/qdict.c:96
>     #1 0x55e617a39bea in qdict_get ../qobject/qdict.c:164
>     #2 0x55e617a39bea in qdict_get_int ../qobject/qdict.c:209
>     #3 0x55e6179e2519 in test_qga_guest_exec ../tests/unit/test-qga.c:=
807
>     #4 0x7fbaa499dc7d in g_test_run_suite_internal
> (/lib64/libglib-2.0.so.0+0x84c7d)
>     #5 0x7fbaa499d9e4 in g_test_run_suite_internal
> (/lib64/libglib-2.0.so.0+0x849e4)
>     #6 0x7fbaa499e181 in g_test_run_suite (/lib64/libglib-2.0.so.0+0x8=
5181)
>     #7 0x7fbaa49966ec in g_test_run (/lib64/libglib-2.0.so.0+0x7d6ec)
>     #8 0x55e6179da0ac in main ../tests/unit/test-qga.c:1083
>     #9 0x7fbaa384a50f in __libc_start_call_main (/lib64/libc.so.6+0x27=
50f)
>     #10 0x7fbaa384a5c8 in __libc_start_main@GLIBC_2.2.5
> (/lib64/libc.so.6+0x275c8)
>     #11 0x55e6179daf44 in _start
> (/home/elmarco/src/qemu/build/tests/unit/test-qga+0x1bbf44)

Ack. Will fix.

[...]

Thanks,
Daniel

