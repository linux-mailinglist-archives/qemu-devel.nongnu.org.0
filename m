Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4632EFAAD
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 22:48:35 +0100 (CET)
Received: from localhost ([::1]:37178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxzcX-00085H-Kf
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 16:48:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kxzbn-0007ge-5k
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 16:47:47 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:39146 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kxzbl-0004D9-9g
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 16:47:46 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 4B226412E5;
 Fri,  8 Jan 2021 21:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1610142462;
 x=1611956863; bh=GggeRE787m9Ngio22dHMo3GRSS60llunFvchgFW1zOY=; b=
 oofQuXPEbb707KlBdY4GA9Ei5X8rwkV9UHgfsgBNuQPV6+ZCP2+3KaJ7raR/6hUC
 DckTpguEWJ7j0gblGy1Tq7hJxpqz6XEJzra46k0qQgAY7ADFo8hTVYW+nK0CgehP
 xzosOCOU8plJLDardoTKfiy7rLEkikxzGImr/N87npM=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bCn5kDvpMyrI; Sat,  9 Jan 2021 00:47:42 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 35363412C6;
 Sat,  9 Jan 2021 00:47:39 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Sat, 9 Jan
 2021 00:47:39 +0300
Date: Sat, 9 Jan 2021 00:48:00 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2] ui/cocoa: Fix openFile: deprecation on Big Sur
Message-ID: <X/jTED/ktnoFxm6e@SPB-NB-133.local>
References: <20210102150718.47618-1-r.bolshakov@yadro.com>
 <CAFEAcA8GMYcTrfKJ-6E3rKyytDHSL4UeWPVuFVLtzWjDtCxMVw@mail.gmail.com>
 <CAFEAcA97hh-bC7yjpHLGyvOiBGMxRtOQaf0O-y5WG0xYYA8N7A@mail.gmail.com>
 <CAFEAcA_DONsg-c_-sEA_T_P+5jYSAXtTDfcvy7_h7oGWOqJ+nA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAFEAcA_DONsg-c_-sEA_T_P+5jYSAXtTDfcvy7_h7oGWOqJ+nA@mail.gmail.com>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 08, 2021 at 03:05:55PM +0000, Peter Maydell wrote:
> On Fri, 8 Jan 2021 at 15:00, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Fri, 8 Jan 2021 at 13:50, Peter Maydell <peter.maydell@linaro.org> wrote:
> > >
> > > On Sat, 2 Jan 2021 at 15:14, Roman Bolshakov <r.bolshakov@yadro.com> wrote:
> > > >
> > > > ui/cocoa.m:1188:44: warning: 'openFile:' is deprecated: first deprecated in macOS 11.0 - Use -[NSWorkspace openURL:] instead.
> > > >       [-Wdeprecated-declarations]
> > > >         if ([[NSWorkspace sharedWorkspace] openFile: full_file_path] == YES) {
> > > >                                            ^
> > > > /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/AppKit.framework/Headers/NSWorkspace.h:350:1: note:
> > > >       'openFile:' has been explicitly marked deprecated here
> > > > - (BOOL)openFile:(NSString *)fullPath API_DEPRECATED("Use -[NSWorkspace openURL:] instead.", macos(10.0, 11.0));
> > > > ^
> > > >
> > > > Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
> > > > ---
> > >
> > > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> >
> >
> > So I was just trying to test this patch, and I found that at least
> > for me the osx menu bar has stopped working in QEMU -- keyboard
> > shortcuts to it still work but none of the menu buttons respond
> > to the mouse. Does that happen for anybody else?
> 
> This menu bar breakage appears to be caused by this patch. I have
> no idea why, because the patch looks pretty harmless. Nonetheless,
> I'm going to have to drop it from my queue.
> 

I think the patch is valid per-se and doubt the patch would cause menu
bar breakage. I had unresponsive menu bar on Catalina even without the
patch.

And I've checked the pre-exesting menu bar issue is resolved in Big Sur
(I assume it was a bug in macOS). As a workaround you might use cmd-tab
or switch focus to another window using mouse and then return it back.

Thanks,
Roman

