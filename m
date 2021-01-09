Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C17B12EFF5D
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 13:28:08 +0100 (CET)
Received: from localhost ([::1]:47534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyDLj-0008NR-80
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 07:28:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kyDKM-0007d4-4W
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 07:26:42 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:33793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kyDKK-0005sz-1l
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 07:26:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=KHT3A1JH6Z52t8AeJ6ObdM6qIrreWfqxJGRdpplb92c=; b=Yb2dGay/WkYnH2bLHbJdXGNcn9
 uPhPyCqZjrwmTEjBqVe1cKIlu60Hcx6vVmgc1UJT6Wg0Sim4yKBXh//0ZDpuwKRIg0JtyT0Nyg0zM
 6COTJZbd/UN5em/8MviQSMlLFW1pe94PF+jQptoDxntHX3mA907eSIR427PXMwNRftRZJ7kzHLGlw
 ucEq9Io9P4n57O3IfNwFImnJCXdk1RIqv8H4fUr7wuETsSIGq3HJQ4UPZnR/+8XTCFqMDk7CpXEhX
 XMqZzzpFz6EfDRPWeeJJybpqkFRFMtSlcvXP0jhnEYDVf1KmNv5NkcmvIZxBa1lijPIO7NquJcfWy
 /BsZiQEOmbux6xZXXBxd8LhHaGeqvFaCC6kkaaDgexLM531SiZGyDU84iaYWSeHFzoQQ+RYirlrYu
 4I6fcLxJpOtwSYU5k4rtyUUV2xr6pPA3eXojLlj3T7Ezzrzc1C+jN+XMMb7IrmlThB52muiBRWNF5
 cDPyEcZ6f5Q7dXawpfDVPUWMFvxX9Xlfko+j7NF508k5H6TusLMFxYFRLTFSXm/Mmv5Y+jG27LZLg
 n2BnUOxXYpBynAgNL3inWI+SeJ61/XyG/D0Iv40bmkTvnrCaEZ3ILu4pRuYkeKpjEwX+VqE+gMJA4
 LwZMO5y+2ypfOhO9ufoo6DN27yCn4g4GB6MvIVlg0=;
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v2] ui/cocoa: Fix openFile: deprecation on Big Sur
Date: Sat, 09 Jan 2021 13:25:44 +0100
Message-ID: <1716563.tmi89dmfaR@silver>
In-Reply-To: <e585d6ab-2dc8-4d1d-fbf7-96ecfdaa79@eik.bme.hu>
References: <20210102150718.47618-1-r.bolshakov@yadro.com>
 <X/jJ7dTlBW8Pg65q@SPB-NB-133.local>
 <e585d6ab-2dc8-4d1d-fbf7-96ecfdaa79@eik.bme.hu>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Christian Schoenebeck <qemu_oss@crudebyte.com>
From: Christian Schoenebeck via <qemu-devel@nongnu.org>

On Samstag, 9. Januar 2021 00:13:36 CET BALATON Zoltan wrote:
> On Sat, 9 Jan 2021, Roman Bolshakov wrote:
> > On Fri, Jan 08, 2021 at 03:00:07PM +0000, Peter Maydell wrote:
> >> On Fri, 8 Jan 2021 at 13:50, Peter Maydell <peter.maydell@linaro.org> 
wrote:
> >>> On Sat, 2 Jan 2021 at 15:14, Roman Bolshakov <r.bolshakov@yadro.com> 
wrote:
> >>>> ui/cocoa.m:1188:44: warning: 'openFile:' is deprecated: first
> >>>> deprecated in macOS 11.0 - Use -[NSWorkspace openURL:] instead.>>>> 
> >>>>       [-Wdeprecated-declarations]
> >>>>       
> >>>>         if ([[NSWorkspace sharedWorkspace] openFile: full_file_path] ==
> >>>>         YES) {
> >>>>         
> >>>>                                            ^
> >>>> 
> >>>> /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/
Frameworks/AppKit.framework/Headers/NSWorkspace.h:350:1: note:
> >>>>       'openFile:' has been explicitly marked deprecated here
> >>>> 
> >>>> - (BOOL)openFile:(NSString *)fullPath API_DEPRECATED("Use -[NSWorkspace
> >>>> openURL:] instead.", macos(10.0, 11.0)); ^
> >>>> 
> >>>> Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
> >>>> ---
> >>> 
> >>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> >> 
> >> So I was just trying to test this patch, and I found that at least
> >> for me the osx menu bar has stopped working in QEMU -- keyboard
> >> shortcuts to it still work but none of the menu buttons respond
> >> to the mouse. Does that happen for anybody else?
> > 
> > There's an old bug when QEMU menu bar is not responsive because it's not
> > properly activated. If you click off qemu and click on the qemu dock
> > icon then it "gets fixed" (cmd-tab works too). Do you hit the issue as
> > described in the article [1]? The code in the article does exactly the
> > same what I'm doing manually. I wanted to fix it but somehow it got
> > postponed for like a whole year :) I might try to make a fix this but
> > note, the issue is not related to the patch.
> 
> This does not sound like the best solution to the problem. There's some
> info on this here (and blog post linked from it):
> 
> https://stackoverflow.com/questions/7460092/nswindow-makekeyandorderfront-ma
> kes-window-appear-but-not-key-or-front
> 
> Maybe we call makeKeyAndOrderFront: too early before the app is active and
> that's causing the problem? Would it work better if that's moved after
> [NSApp run]? (Maybe we also need canBecomeKey: somewhere but I don't see
> why would that be needed for normal windows.)
> 
> Regards,
> BALATON Zoltan

JFYI: I'm not sure whether that's related to this, but there was a general 
event handling issue with Gtk3 on macOS which caused mouse events being 
dropped:

https://gitlab.gnome.org/GNOME/gtk/-/issues/986

According to the response, they seem to have fixed it meanwhile with a 
different patch than suggested by me, but I haven't tested theirs.

Best regards,
Christian Schoenebeck



