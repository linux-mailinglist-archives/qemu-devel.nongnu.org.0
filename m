Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B622F0495
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 01:32:40 +0100 (CET)
Received: from localhost ([::1]:48222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyOet-0006jI-59
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 19:32:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kyOdO-0006HA-JY
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 19:31:06 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:59706 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kyOdI-0006Gh-Js
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 19:31:06 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 2DC93412ED;
 Sun, 10 Jan 2021 00:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1610238656;
 x=1612053057; bh=hcLhiB6ZXNdpL4eoUb9QB0daB6UhmnAreqYbPAL5q9A=; b=
 k8eZQtCrYJPJbzuuuHLyXKH3StUJgoOaOHABoYp5tOcFQHnfhdKFHeS9Iz0qoaRB
 VJjSwFqEehTbX80irrf8TBeIqOjBWbmYhtIZ6djrgmbL93lTb5ltarMABOScbERa
 a8ED9Mo5mHU8AO209owS5KjPpryLAhROLm9mkheK01g=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kof2kyjX4gPL; Sun, 10 Jan 2021 03:30:56 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 12DB741209;
 Sun, 10 Jan 2021 03:30:56 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Sun, 10
 Jan 2021 03:30:55 +0300
Date: Sun, 10 Jan 2021 03:31:18 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2] ui/cocoa: Fix openFile: deprecation on Big Sur
Message-ID: <X/pK1lsz4MZKqSgg@SPB-NB-133.local>
References: <20210102150718.47618-1-r.bolshakov@yadro.com>
 <X/jJ7dTlBW8Pg65q@SPB-NB-133.local>
 <e585d6ab-2dc8-4d1d-fbf7-96ecfdaa79@eik.bme.hu>
 <1716563.tmi89dmfaR@silver>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1716563.tmi89dmfaR@silver>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jan 09, 2021 at 01:25:44PM +0100, Christian Schoenebeck via wrote:
> On Samstag, 9. Januar 2021 00:13:36 CET BALATON Zoltan wrote:
> > On Sat, 9 Jan 2021, Roman Bolshakov wrote:
> > > On Fri, Jan 08, 2021 at 03:00:07PM +0000, Peter Maydell wrote:
> > >> On Fri, 8 Jan 2021 at 13:50, Peter Maydell <peter.maydell@linaro.org> 
> wrote:
> > >>> On Sat, 2 Jan 2021 at 15:14, Roman Bolshakov <r.bolshakov@yadro.com> 
> wrote:
> > >>>> ui/cocoa.m:1188:44: warning: 'openFile:' is deprecated: first
> > >>>> deprecated in macOS 11.0 - Use -[NSWorkspace openURL:] instead.>>>> 
> > >>>>       [-Wdeprecated-declarations]
> > >>>>       
> > >>>>         if ([[NSWorkspace sharedWorkspace] openFile: full_file_path] ==
> > >>>>         YES) {
> > >>>>         
> > >>>>                                            ^
> > >>>> 
> > >>>> /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/
> Frameworks/AppKit.framework/Headers/NSWorkspace.h:350:1: note:
> > >>>>       'openFile:' has been explicitly marked deprecated here
> > >>>> 
> > >>>> - (BOOL)openFile:(NSString *)fullPath API_DEPRECATED("Use -[NSWorkspace
> > >>>> openURL:] instead.", macos(10.0, 11.0)); ^
> > >>>> 
> > >>>> Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
> > >>>> ---
> > >>> 
> > >>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> > >> 
> > >> So I was just trying to test this patch, and I found that at least
> > >> for me the osx menu bar has stopped working in QEMU -- keyboard
> > >> shortcuts to it still work but none of the menu buttons respond
> > >> to the mouse. Does that happen for anybody else?
> > > 
> > > There's an old bug when QEMU menu bar is not responsive because it's not
> > > properly activated. If you click off qemu and click on the qemu dock
> > > icon then it "gets fixed" (cmd-tab works too). Do you hit the issue as
> > > described in the article [1]? The code in the article does exactly the
> > > same what I'm doing manually. I wanted to fix it but somehow it got
> > > postponed for like a whole year :) I might try to make a fix this but
> > > note, the issue is not related to the patch.
> > 
> > This does not sound like the best solution to the problem. There's some
> > info on this here (and blog post linked from it):
> > 
> > https://stackoverflow.com/questions/7460092/nswindow-makekeyandorderfront-ma
> > kes-window-appear-but-not-key-or-front
> > 
> > Maybe we call makeKeyAndOrderFront: too early before the app is active and
> > that's causing the problem? Would it work better if that's moved after
> > [NSApp run]? (Maybe we also need canBecomeKey: somewhere but I don't see
> > why would that be needed for normal windows.)
> > 
> > Regards,
> > BALATON Zoltan
> 
> JFYI: I'm not sure whether that's related to this, but there was a general 
> event handling issue with Gtk3 on macOS which caused mouse events being 
> dropped:
> 
> https://gitlab.gnome.org/GNOME/gtk/-/issues/986

Hi Christian,

Thanks for the reference. I've looked at the patch and I'm not sure if
the Cocoa issues are related to GTK. It's likely something different.

After skimming over QT bug tracker I found a mathcing ticket that
confirms findings of earlier email:

  https://bugreports.qt.io/browse/QTBUG-89436

  Workaround is to build app as app bundle. Or manually deactivate and
  re-activate the app, like the JavaFX workaround does.

Regards,
Roman

> 
> According to the response, they seem to have fixed it meanwhile with a 
> different patch than suggested by me, but I haven't tested theirs.
> 
> Best regards,
> Christian Schoenebeck
> 
> 
> 

