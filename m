Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6C62E879C
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 15:21:37 +0100 (CET)
Received: from localhost ([::1]:39200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvhmi-00085B-QR
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 09:21:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kvhlV-0007Xw-5y
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 09:20:23 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:41512 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kvhlQ-00050Q-Sk
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 09:20:20 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 6BC7E41303;
 Sat,  2 Jan 2021 14:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1609597213;
 x=1611411614; bh=bRVteqOT1oXU1hA5Vd/hCDPiIYncmNzmOdWCTZ2dAko=; b=
 jPP2sip3SzdiFEujOpi9M0HzpkNkVOozxLnK2PE+Nl1G2cZ+m3keEWmhczuM93EE
 HHZqsQ2zBWOzlqKObS8BXve17wOF3a97GhNPWiKOCdNQlDMMAQYsZmJe1EzjAbMy
 KVkmrkTAPlJB1rutX4bkhjYJHRPMU+3rYJ/JtdSpCIg=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3H3y7y5FA_Yf; Sat,  2 Jan 2021 17:20:13 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id B44C8412FD;
 Sat,  2 Jan 2021 17:20:13 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Sat, 2 Jan
 2021 17:20:13 +0300
Date: Sat, 2 Jan 2021 17:20:18 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] ui/cocoa: Fix openFile: deprecation on Big Sur
Message-ID: <X/CBIiYASlyIrdha@SPB-NB-133.local>
References: <20210102125154.41182-1-r.bolshakov@yadro.com>
 <CAFEAcA_jTfLjgwPFXQ9TYv1hNK-G1HsXYq7m_eJodDtTPhuH2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAFEAcA_jTfLjgwPFXQ9TYv1hNK-G1HsXYq7m_eJodDtTPhuH2A@mail.gmail.com>
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

On Sat, Jan 02, 2021 at 01:16:48PM +0000, Peter Maydell wrote:
> On Sat, 2 Jan 2021 at 12:52, Roman Bolshakov <r.bolshakov@yadro.com> wrote:
> >
> > ui/cocoa.m:1188:44: warning: 'openFile:' is deprecated: first deprecated in macOS 11.0 - Use -[NSWorkspace openURL:] instead.
> >       [-Wdeprecated-declarations]
> >         if ([[NSWorkspace sharedWorkspace] openFile: full_file_path] == YES) {
> >                                            ^
> > /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/AppKit.framework/Headers/NSWorkspace.h:350:1: note:
> >       'openFile:' has been explicitly marked deprecated here
> > - (BOOL)openFile:(NSString *)fullPath API_DEPRECATED("Use -[NSWorkspace openURL:] instead.", macos(10.0, 11.0));
> > ^
> >
> > Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
> > ---
> >  ui/cocoa.m | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/ui/cocoa.m b/ui/cocoa.m
> > index f32adc3074..5909758a09 100644
> > --- a/ui/cocoa.m
> > +++ b/ui/cocoa.m
> > @@ -1178,6 +1178,7 @@ QemuCocoaView *cocoaView;
> >      /* Where to look for local files */
> >      NSString *path_array[] = {@"../share/doc/qemu/", @"../doc/qemu/", @"../docs/"};
> >      NSString *full_file_path;
> > +    NSURL *full_file_url;
> >
> >      /* iterate thru the possible paths until the file is found */
> >      int index;
> > @@ -1186,7 +1187,8 @@ QemuCocoaView *cocoaView;
> >          full_file_path = [full_file_path stringByDeletingLastPathComponent];
> >          full_file_path = [NSString stringWithFormat: @"%@/%@%@", full_file_path,
> >                            path_array[index], filename];
> > -        if ([[NSWorkspace sharedWorkspace] openFile: full_file_path] == YES) {
> > +        full_file_url = [NSURL URLWithString: full_file_path];
> > +        if ([[NSWorkspace sharedWorkspace] openURL: full_file_url] == YES) {
> >              return;
> >          }
> 
> The NSURL URLWithString method documentation:
> https://developer.apple.com/documentation/foundation/nsurl/1572047-urlwithstring
> says:
> # Important
> # To create NSURL objects for file system paths, use
> fileURLWithPath:isDirectory:
> # instead.
> 
> Should we be doing that instead ?
> 

Sure, Peter. I'll update it.

Thanks,
Roman

> thanks
> -- PMM

