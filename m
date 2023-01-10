Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C38E663D56
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 10:54:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFA7I-0000KX-JR; Tue, 10 Jan 2023 03:36:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>) id 1pFA7C-0000Iv-Lr
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:36:17 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>) id 1pFA76-0000Fj-PH
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:36:12 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 1DB0C320094C;
 Tue, 10 Jan 2023 03:36:04 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 10 Jan 2023 03:36:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1673339763; x=
 1673426163; bh=IovgYnh0+BPr5+/hNcKBd58r3qA6HCWFlpfZNefkvhQ=; b=0
 xW6VtFNzFXZUtQnTGRpmaFz0TTslhX/pyNQvpdEbhI8zZSlqVLevcGfHmnubW0iC
 v262A5cp73NSZLoFRsHm5L+t9epmJhzkRNEMK7CBUSk7/oVu/kPut6/BM8tfBlxt
 T+lgJr401swxsXWE7O/j0aVltZPBLdy2w+21g3Gt/TTMAC7jkLs1dLcNL+hjgK61
 G4jpwJaEwvyES4mEzOyS5+TW8zpvyTiKJYFnJBcnjSnnTMJFYkpjTGh3213/r6U6
 mJfEhhe22NH2uWNHU08cGeaYmt8xFXZslnjISEp33z2RQkdLm5qcNsTmtadVrADj
 wMsQIngXcpnx56JDO9Jtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1673339763; x=
 1673426163; bh=IovgYnh0+BPr5+/hNcKBd58r3qA6HCWFlpfZNefkvhQ=; b=J
 5m4ovdDavWZKYx0Xf+qJ2yuYR1I+u7vN2WrviUkci/MZ9KbLyH0SGEPwNZ4mlOVA
 603XLoE0STP2vJtCibFthUU/WHA0z4TG23L1xmzRL05k9Yx/eNSC8fnuAXvc+2Ga
 jmG2g3WGIrzXWq3m+Nv9GsWy7Yll/Z6t9vQ9g418utd/t1woKUTsNCEkd9zCRHg7
 kV7ad59vMLxRLVFOFqmyKurIbSvqqgDGZl5gKSc0BUf6uVdO1i5W9OC+DPYpYJQS
 bg/c/18qq02QysJv7v70XJeX7U93PqDtVbyArWpnoP+gAu67SCCT+VxGCNA0g6FO
 DCgJiXqInbrzbG+Kp8mpA==
X-ME-Sender: <xms:cyO9Y-O12EVADTEJDEL6VILFS2O0yPm0CCVLHIUHu2yBJWoIg2hyEg>
 <xme:cyO9Y89_6T-5V_YwALmbj3uh8I1zkRqJwBuQ9f-UqX48eCFkhHRFNolz0s32j09Ug
 AxQT8pDOE3SkJ8py3s>
X-ME-Received: <xmr:cyO9Y1S9c0uuzYXzk-67ghlEcTyeFjY6z7Zd4DoCzREw3yQ1bC7Fdo3qVnLxse_1d59qLd8R-a_algp9OYybJyOPu1pcg8B4vDUvSwxb6hC53LotnFuj4Rsm5oU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrkeejgdduvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefrvght
 vghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrg
 htthgvrhhnpedtieekkeekgffhteefteeuvddugffggfejheelteduuddtgfetleeufffh
 iefhgeenucffohhmrghinhepshhtrggtkhgvgigthhgrnhhgvgdrtghomhdpkhgvrhhnvg
 hlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
 mhepphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:cyO9Y-uAtMLY8Ajk3jkCZA5XkriiI2nvWuxziZrOzQ4Up_xH-F70bA>
 <xmx:cyO9Y2fKlfGL2cpQfLUK9VbvbZrzdifba4XDNV0DBeUAyhrfFf_-lQ>
 <xmx:cyO9Yy1UetpvjRkjk4BE-GAldNbu_X98BqdjdBqvMrFZT8eexUI2RQ>
 <xmx:cyO9YzEOS4Lp9VgqMXiu06Dlp2LkVshVDhnUg8Ghov4JpvmSyrqf7Q>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Jan 2023 03:36:02 -0500 (EST)
Date: Tue, 10 Jan 2023 00:35:59 -0800
From: Peter Delevoryas <peter@pjd.dev>
To: John Snow <jsnow@redhat.com>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 crosa@redhat.com, bleal@redhat.com, f4bug@amsat.org,
 wainersm@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 1/1] python/machine: Fix AF_UNIX path too long on macOS
Message-ID: <Y70jb7hzhR0sf98k@pdel-mbp.dhcp.thefacebook.com>
References: <20220722182508.89761-1-peter@pjd.dev>
 <20220722182508.89761-2-peter@pjd.dev>
 <Yt5dHNDMMrzp/Vah@redhat.com>
 <CAFn=p-by++_fpn8cxAE27UvAz0fNmsH=67MR6LTYXf1j_W4Msw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFn=p-by++_fpn8cxAE27UvAz0fNmsH=67MR6LTYXf1j_W4Msw@mail.gmail.com>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=peter@pjd.dev;
 helo=wout5-smtp.messagingengine.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Jan 09, 2023 at 04:09:32PM -0500, John Snow wrote:
> On Mon, Jul 25, 2022 at 5:06 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Fri, Jul 22, 2022 at 11:25:08AM -0700, Peter Delevoryas wrote:
> > > On macOS, private $TMPDIR's are the default. These $TMPDIR's are
> > > generated from a user's unix UID and UUID [1], which can create a
> > > relatively long path:
> > >
> > >     /var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T/
> > >
> > > QEMU's avocado tests create a temporary directory prefixed by
> > > "avo_qemu_sock_", and create QMP sockets within _that_ as well.
> > > The QMP socket is unnecessarily long, because a temporary directory
> > > is created for every QEMUMachine object.
> > >
> > >     /avo_qemu_sock_uh3w_dgc/qemu-37331-10bacf110-monitor.sock
> > >
> > > The path limit for unix sockets on macOS is 104: [2]
> > >
> > >     /*
> > >      * [XSI] Definitions for UNIX IPC domain.
> > >      */
> > >     struct  sockaddr_un {
> > >         unsigned char   sun_len;        /* sockaddr len including null */
> > >         sa_family_t     sun_family;     /* [XSI] AF_UNIX */
> > >         char            sun_path[104];  /* [XSI] path name (gag) */
> > >     };
> > >
> > > This results in avocado tests failing on macOS because the QMP unix
> > > socket can't be created, because the path is too long:
> > >
> > >     ERROR| Failed to establish connection: OSError: AF_UNIX path too long
> > >
> > > This change resolves by reducing the size of the socket directory prefix
> > > and the suffix on the QMP and console socket names.
> > >
> > > The result is paths like this:
> > >
> > >     pdel@pdel-mbp:/var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T
> > >     $ tree qemu*
> > >     qemu_df4evjeq
> > >     qemu_jbxel3gy
> > >     qemu_ml9s_gg7
> > >     qemu_oc7h7f3u
> > >     qemu_oqb1yf97
> > >     ├── 10a004050.con
> > >     └── 10a004050.qmp
> > >
> > > [1] https://apple.stackexchange.com/questions/353832/why-is-mac-osx-temp-directory-in-weird-path
> > > [2] /Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/un.h
> > >
> > > Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> > > ---
> > >  python/qemu/machine/machine.py         | 6 +++---
> > >  tests/avocado/avocado_qemu/__init__.py | 2 +-
> > >  2 files changed, 4 insertions(+), 4 deletions(-)
> >
> > Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> 
> My apologies, I missed this update because it appeared in a thread
> underneath the old version.

Oh, that's ok, nice catch digging this up! I completely forgot about it, and
haven't been developing QEMU stuff on macOS in a little while

> 
> Peter, may I please ask for you to kindly re-submit this patch with an
> incremented version number?

Sure! I've resubmitted it as v4 and v5, v4 might not have been sent correctly
(I have so many problems with sending emails lol)

v4: https://lore.kernel.org/qemu-devel/20230110080756.38271-1-peter@pjd.dev/T/#t
v5: < will probably show up on the mailing list soon >


- Peter

> 
> --js
> 

