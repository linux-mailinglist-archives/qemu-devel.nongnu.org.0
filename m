Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F5249BA7C
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 18:37:53 +0100 (CET)
Received: from localhost ([::1]:56170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCPlQ-00066P-CK
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 12:37:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nCPfr-0000rD-GM
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 12:32:08 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:44203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nCPfD-0008Af-Oj
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 12:31:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=qgx/D3b9fIoksonCw+XchQFV8rizuEtE9VlIKaA+VRA=; b=kf1NlWlfvBU5TZg8tLltWHt0Y2
 v78eIzCUVw8vZZ78MhR7WY2yIBDoEn2Py85kfKakJIv4zTFfJ6O2gRYrnmtepx8xEVz7b4EKsoTDK
 BcHNZy7C/jUAq0BiFS/HOIAmh+HrwCd/5LciHWbiVM/wTWOEG/ayxJNrkvnBMbMHI0VHj9h0whaZO
 DCly3V31z6sbh3sATYgRsj6xM7f0KtArEOlwfsRg7vzS7beqvpIhaS7eIxa0MgVio/qKV1TPMhHnB
 2vFYgvLQpUFJe6XIUxbXkdUhHzjcYK/+IbTtUQG2Bm5ugKlhugMdicY6SM4L7LqlWq0WPChYRKTJB
 rmFFntdv292gaTlvj4yU3Q3kRstzoNoGJ7EPTe636hPs8u5JRbI+pYK4fAfVCxaseU5FLvXQfTcvt
 qlyaYTDvR8qn18AkfFxM7T5G+OaokKATdl2WKgeMlx2noN5ZmqwCPg5DsyyjcRl8z8ygr/qRLVdUA
 5v2eMXwUbWMiRvMsJe97In+DERoMXaQ6Y1ngwbZo6nJex9/wYfzil8+kGkMTeinnM4Vl5R4azyWh+
 fYeVO0npSqd2ZCWaWVai2PxnrQtcqUlOkvuP8AFAXiHTeLShOq40ufEvYBTnft/ntq88T84zSLL2e
 YLrMWFz7NKKkBV2TLDfmPsXVcYJy4Iv6AGkbZzDw4=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>,
 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>, phillip.ennen@gmail.com,
 Jason Wang <jasowang@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 Markus Armbruster <armbru@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Howard Spoelstra <hsp.cat7@gmail.com>, Roman Bolshakov <roman@roolebo.dev>,
 Alessio Dionisi <hello@adns.io>,
 Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Eric Blake <eblake@redhat.com>, Phillip Tennen <phillip@axleos.com>
Subject: Re: [PATCH v13 2/7] net/vmnet: add vmnet backends to qapi/net
Date: Tue, 25 Jan 2022 18:30:35 +0100
Message-ID: <11994994.S7o1fDX3Xt@silver>
In-Reply-To: <CAMVc7JVShGiPvwc4fWHfG2JjTX0QGOcs3ua3k58WFdo4fOLS6A@mail.gmail.com>
References: <20220113172219.66372-1-yaroshchuk2000@gmail.com>
 <CAFEAcA_CT6AJx_ns4zjw1_udq-Ab3YdM2mzPcKKZberUPOqhPA@mail.gmail.com>
 <CAMVc7JVShGiPvwc4fWHfG2JjTX0QGOcs3ua3k58WFdo4fOLS6A@mail.gmail.com>
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Dienstag, 25. Januar 2022 12:08:21 CET Akihiko Odaki wrote:
> On Tue, Jan 25, 2022 at 7:32 PM Peter Maydell <peter.maydell@linaro.org> 
wrote:
> > On Tue, 25 Jan 2022 at 04:14, Akihiko Odaki <akihiko.odaki@gmail.com> 
wrote:
> > > I'm neutral about the decision. I think QEMU should avoid using
> > > Objective-C code except for interactions with Apple's APIs, and .c is
> > > superior in terms of that as it would prevent accidental introduction
> > > of Objective-C code. On the other hand, naming them .m will allow the
> > > introduction of Automatic Reference Counting to manage dispatch queue
> > > objects. In fact, I have found a few memory leaks in vmnet in the last
> > > review and ui/cocoa.m has a suspicious construction of the object
> > > management (Particularly it has asynchronous dispatches wrapped with
> > > NSAutoreleasePool, which does not make sense).
> > 
> > I think those are probably my fault -- in commit 6e657e64cd (in 2013)
> > we added NSAutoReleasePools to fix leaks that happened because
> > we were calling into Cocoa APIs from threads other than the UI
> > thread that didn't have their own automatically created autorelease
> > pool. Much later in commit 5588840ff778 (in 2019) we put in the
> > dispatch_async stuff because newer macOS was stricter about
> > requiring Cocoa API calls to be only on the UI thread. So
> > I think that means the requirement for the autorelease pools
> > has now gone away in those functions and we could simply delete
> > them -- does that sound right? (I freely admit that I'm not a macOS
> > expert -- I just look stuff up in the documentation; historically
> > we haven't really had many expert macOS people around to work on
> > cocoa.m...)
> 
> Removing them would be an improvement. 

Yes, AFAICS those NSAutoReleasePools in ui/cocoa.m can safely be removed, as 
they were apparently just fighting the symptoms of having called cocoa APIs 
from non-main thread(s) in the past, which is not allowed.

There is actually a "main thread checker" for that. In Xcode it's just a 
checkbox away, but I don't see a corresponding clang parameter. Maybe it's in 
a separate toolchain by Apple.

However I don't think the NSAutoReleasePools were the cause of the memory leak 
you saw.

> Enabling ARC is a long-term
> solution and would allow clang to analyze object management code and
> answer such a question semi-automatically.

Yeah, that's not trivial and would be a long way. Personally I would say, for 
new targets, sure use ARC. But for already existing, large projects like QEMU, 
I would not switch to ARC. Because it is not just refactoring, you have to 
understand each component and make proper decisions for references (weak, 
strong, copy, bridge transfers, adjust blocks, ... ) and avoid cyclic 
references, otherwise you just replace existing issues with new ones, 
including new leaks.

> Regards,
> Akihiko Odaki
> 
> > On the subject of cocoa.m, while we have various macOS-interested
> > people in this thread, can I ask if anybody would like to
> > review a couple of patches that came in at the beginning of the
> > year?
> > 
> > https://patchew.org/QEMU/20220102174153.70043-1-carwynellis@gmail.com/
> > ("ui/cocoa: Add option to disable left command and hide cursor on click")
> > and
> > https://patchew.org/QEMU/20220103114515.24020-1-carwynellis@gmail.com/
> > ("Show/hide the menu bar in fullscreen on mouse")

I didn't spot anything negative, but I can't test those patches ATM.

> > either from the point of view of "is this a sensible change to
> > the macOS UI experience" or for the actual code changes, or both.
> > 
> > We've been very short on upstream macOS code reviewers so if people
> > interested in that host platform are able to chip in by
> > reviewing each others' code that helps a lot.

Which reminds me of the automated Xcode project discussion for QEMU. I still 
think if there was a simple way to work on QEMU with Xcode there were plenty 
of macOS reviewers and contributors, and I think it can be done with Meson.

Best regards,
Christian Schoenebeck



