Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C176B798C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 14:55:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbicJ-0000mT-Ry; Mon, 13 Mar 2023 09:53:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pbicI-0000mL-JI
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 09:53:34 -0400
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pbicG-00030L-PZ
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 09:53:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=ZLKsDDoYKsRsd5lhq7DIm3pbarGDeByQy/kyGjrqANg=; b=og46EmsJ1QxrLMthnEIv5nodrm
 UCEJN7IbHddflFvm+NZ9dculYNfc+DhkFpGYVUnj0bHkcJwapXUByRMgJf78ToxpUwTB1GlYTl0e/
 kuDPXnSe0F7ogxgv12hvEiBV3MJRN5W5ePFkoCbBgvi3rueNkml3hjSo7dXmA/K1wFffhdtVVDXzB
 h4mY7MiFi+LnRaxFsVmXpMRkqffKC0/eCY5RZ/CdNA/WsCD7GBW00X0F6tqPvS6poTW4nNBtu2Fan
 uvxcp2gJDUYjLRh+A90RXXavVAi78iA8SrAU2w5qogu0Ze1CTWQEWw70MIH5eq5oCGZaWmObmlj0W
 TUlIUqvVk6NDbly3h/Fbb56fCTn78Ku1XkjMg5ZkFYAo0T8W6oc6qxxDqQN73KvtBAPQu0fjUnzMr
 YGKYDnYYjO1OyJKnw6gpNBJRqA/mZoXls9yZKjiarg2kz8/26oJbBtt4RQj2dIcTBrjILXfnr6HW9
 0B6Q9RJ4aBP4zV5FYwmsaRNxKtYVrMHKV218UXiVSA2bWFPiOfbqV1dXScD3k7YBNChaO2PvahsPL
 fZv51CQKNzDCYzPr541R9CduJY6VPJhNijlz77ljpxh5l1PiUMBgXJDm1D+skCF+Zj7XDVbuK3vwv
 SIbue+rRgWTbVYLPP00FMqrSF7QQiQLwwxA+KFFWo=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH] ui/cocoa: user friendly characters for release mouse
Date: Mon, 13 Mar 2023 14:53:29 +0100
Message-ID: <1983408.hr7SJzzTYm@silver>
In-Reply-To: <a04086d1-474c-8fcb-025d-27bc8b847fa8@eik.bme.hu>
References: <E1pAClj-0003Jo-OB@lizzy.crudebyte.com> <4105880.gIe6kQ2GIU@silver>
 <a04086d1-474c-8fcb-025d-27bc8b847fa8@eik.bme.hu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Monday, March 13, 2023 2:42:36 PM CET BALATON Zoltan wrote:
> On Mon, 13 Mar 2023, Christian Schoenebeck wrote:
> > On Monday, February 27, 2023 12:28:02 PM CET Christian Schoenebeck wrote:
> >> On Tuesday, December 27, 2022 5:15:31 PM CET Christian Schoenebeck wrote:
> >>> While mouse is grabbed, window title contains a hint for the user what
> >>> keyboard keys to press to release the mouse. Make that hint text a bit
> >>> more user friendly for a Mac user:
> >>>
> >>>  - Replace "Ctrl" and "Alt" by appropriate symbols for those keyboard
> >>>    keys typically displayed for them on a Mac (encode those symbols by
> >>>    using UTF-8 characters).
> >>>
> >>>  - Drop " + " in between the keys, as that's not common on macOS for
> >>>    documenting keyboard shortcuts.
> >>>
> >>>  - Convert lower case "g" to upper case "G", as that's common on macOS.
> >>>
> >>>  - Add one additional space at start and end of key stroke set, to
> >>>    visually separate the key strokes from the rest of the text.
> >>>
> >>> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> >>> ---
> >>
> >> Ping
> >
> > Gerd,
> >
> > given that I got a RB and TB from Philippe, would you queue this minor macOS
> > patch please?
> 
> Isn't this already merged as 23bdd0de97a18 ?

Ah yes, thanks! Sorry for the noise!

Best regards,
Christian Schoenebeck



