Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF1648A064
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 20:45:59 +0100 (CET)
Received: from localhost ([::1]:51568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n70cA-0005rQ-Ud
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 14:45:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1n70ZY-0003Ed-5K
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 14:43:16 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:36716 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1n70ZW-0000jP-4m
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 14:43:15 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 1255E468A0;
 Mon, 10 Jan 2022 19:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-transfer-encoding:content-disposition
 :content-type:content-type:mime-version:references:message-id
 :subject:subject:from:from:date:date:received:received:received;
 s=mta-01; t=1641843790; x=1643658191; bh=ugzMl99Sz2CdiHw3tgyfI3
 2zO0OVgEN8lWVfCe85L+M=; b=uZ6vMsAfJxk3IcBSeBT8VB2UIOmZ/n3Sg4fK4V
 DIQOB0n0e8kpKENsmG3RI5ySYgQQNoB/b5mYz17/Xuh5CvmmC7DCs/rlFnN5oJ/M
 U4rcbtr56DKymnoEQ7s8fIjUB7X32hZsMOTpjLmQi39HNapitL0ONJCxnSJpN/nQ
 lQMsw=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BY9C8RsM00Bf; Mon, 10 Jan 2022 22:43:10 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id C065F47536;
 Mon, 10 Jan 2022 22:43:09 +0300 (MSK)
Received: from localhost (172.22.0.12) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 10
 Jan 2022 22:43:09 +0300
Date: Mon, 10 Jan 2022 22:43:08 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH v3 2/7] ui/cocoa: Remove allowedFileTypes restriction
 in SavePanel
Message-ID: <YdyMTNvphFc0KpC1@SPB-NB-133.local>
References: <20220110131001.614319-1-f4bug@amsat.org>
 <20220110131001.614319-3-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220110131001.614319-3-f4bug@amsat.org>
X-Originating-IP: [172.22.0.12]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-04.corp.yadro.com (172.17.100.104)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, TVD_SUBJ_WIPE_DEBT=1.004 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Alexander Graf <agraf@csgraf.de>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 10, 2022 at 02:09:56PM +0100, Philippe Mathieu-Daud� wrote:
> setAllowedFileTypes is deprecated in macOS 12.
> 
> Per Akihiko Odaki [*]:
> 
>   An image file, which is being chosen by the panel, can be a
>   raw file and have a variety of file extensions and many are not
>   covered by the provided list (e.g. "udf"). Other platforms like
>   GTK can provide an option to open a file with an extension not
>   listed, but Cocoa can't.
>
> It forces the user to rename the file
>   to give an extension in the list. Moreover, Cocoa does not tell
>   which extensions are in the list so the user needs to read the
>   source code, which is pretty bad.
> 
> Since this code is harming the usability rather than improving it,
> simply remove the [NSSavePanel allowedFileTypes:] call, fixing:
> 

Yes, it is an issue for raw images with extensions outside of the
specified list or for images without any extension.

Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
Tested-by: Roman Bolshakov <r.bolshakov@yadro.com>

Regards,
-Roman

>   [2789/6622] Compiling Objective-C object libcommon.fa.p/ui_cocoa.m.o
>   ui/cocoa.m:1411:16: error: 'setAllowedFileTypes:' is deprecated: first deprecated in macOS 12.0 - Use -allowedContentTypes instead [-Werror,-Wdeprecated-declarations]
>       [openPanel setAllowedFileTypes: supportedImageFileTypes];
>                  ^
>   /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/AppKit.framework/Headers/NSSavePanel.h:215:49: note: property 'allowedFileTypes' is declared deprecated here
>   @property (nullable, copy) NSArray<NSString *> *allowedFileTypes API_DEPRECATED("Use -allowedContentTypes instead", macos(10.3,12.0));
>                                                   ^
>   /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/AppKit.framework/Headers/NSSavePanel.h:215:49: note: 'setAllowedFileTypes:' has been explicitly marked deprecated here
>   FAILED: libcommon.fa.p/ui_cocoa.m.o
> 
> [*] https://lore.kernel.org/qemu-devel/4dde2e66-63cb-4390-9538-c032310db3e3@gmail.com/
> 
> Suggested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> Signed-off-by: Philippe Mathieu-Daud� <f4bug@amsat.org>
> ---
>  ui/cocoa.m | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index 69745c483b4..dec22968815 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -100,7 +100,6 @@ static void cocoa_switch(DisplayChangeListener *dcl,
>  static char **gArgv;
>  static bool stretch_video;
>  static NSTextField *pauseLabel;
> -static NSArray * supportedImageFileTypes;
>  
>  static QemuSemaphore display_init_sem;
>  static QemuSemaphore app_started_sem;
> @@ -1162,10 +1161,6 @@ - (id) init
>          [pauseLabel setTextColor: [NSColor blackColor]];
>          [pauseLabel sizeToFit];
>  
> -        // set the supported image file types that can be opened
> -        supportedImageFileTypes = [NSArray arrayWithObjects: @"img", @"iso", @"dmg",
> -                                 @"qcow", @"qcow2", @"cloop", @"vmdk", @"cdr",
> -                                  @"toast", nil];
>          [self make_about_window];
>      }
>      return self;
> @@ -1408,7 +1403,6 @@ - (void)changeDeviceMedia:(id)sender
>      openPanel = [NSOpenPanel openPanel];
>      [openPanel setCanChooseFiles: YES];
>      [openPanel setAllowsMultipleSelection: NO];
> -    [openPanel setAllowedFileTypes: supportedImageFileTypes];
>      if([openPanel runModal] == NSModalResponseOK) {
>          NSString * file = [[[openPanel URLs] objectAtIndex: 0] path];
>          if(file == nil) {
> -- 
> 2.33.1
> 

