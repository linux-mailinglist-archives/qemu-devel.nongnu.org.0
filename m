Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 046F44B354B
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 14:30:46 +0100 (CET)
Received: from localhost ([::1]:37844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIsU7-0007m7-UJ
	for lists+qemu-devel@lfdr.de; Sat, 12 Feb 2022 08:30:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nIsPN-0005gQ-ET
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 08:25:49 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:45989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nIsPK-0005V1-6O
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 08:25:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=xIUJsxt6A5xUvdNCjyAXUlWX/tBmCHhV5QbL1jVgVtU=; b=D7hs3mK2NipVQ1ruKG0TUGVNse
 5uyGWQasyNtvHkDBDXnf/hMkf0idl9caZT/L39tTYUIvQyyGCPiBWrAINJQRcFapfkZpwVX64cox6
 7sBjDsCCRxvYXcazIv0WsNjnG71DbyOSFtopaTjztrSpVVAuJ6UlP8mpQL98ezIUjXkazWBqvTT0l
 8i6EAwu6E2HVgO+Fm4GWzghhueqpKa69f51XVf12847bE4qiZ6Qs2W0XWTnw+U9ZGw4h4XjK7zVkz
 6DgGnqI7vMHWyOU9P5ddwkPmdaBF08D1Lhxokx2ISh22hGk+Wfz7WCe21f/grSPWhYVNfk8Ej7wOs
 jLa8UuNRoYwYymJExWwUCtV2X6QfaiY7UmaUoQrUNiSzN9jmrkCBdLUVwkLJZueTTrlhz6GhvPWM5
 FBhB9JiUKUxX8x/Ih9tgsKXLl4tJrBj76aQutX6htUaZSYC30ceAG5RV31+snEf8KpGBdon3CtBnC
 AvpthwoY9UHouOFuNKpSd7hHCAKorhwW/7peJrN/xqaSf+rpE9AlTThWsXvxyWYLWtHu3EVFU9JOa
 NaRExeFJgpSp3tG/n6AuZhdbUCpXuP5Wbu+WkiBB9+HjLlYsyIhB6kHw9RUoxe+oqk4D0xD4sEPbN
 cA/UsPjC/mHjFYscaohltCbeoTTRwKoJtXIMYVskA=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>
Cc: Cameron Esfahani <dirty@apple.com>,
 Peter Maydell <peter.maydell@linaro.org>, Will Cohen <wwcohen@gmail.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Li Zhang <lizhang@suse.de>
Subject: Re: [PATCH v4 12/13] ui/cocoa: Remove allowedFileTypes restriction in
 SavePanel
Date: Sat, 12 Feb 2022 14:25:42 +0100
Message-ID: <5538947.yAnU0GCVav@silver>
In-Reply-To: <20220211163434.58423-13-f4bug@amsat.org>
References: <20220211163434.58423-1-f4bug@amsat.org>
 <20220211163434.58423-13-f4bug@amsat.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, TVD_SUBJ_WIPE_DEBT=1.004,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Freitag, 11. Februar 2022 17:34:33 CET Philippe Mathieu-Daud=E9 via wrot=
e:
> setAllowedFileTypes is deprecated in macOS 12.
>=20
> Per Akihiko Odaki [*]:
>=20
>   An image file, which is being chosen by the panel, can be a
>   raw file and have a variety of file extensions and many are not
>   covered by the provided list (e.g. "udf"). Other platforms like
>   GTK can provide an option to open a file with an extension not
>   listed, but Cocoa can't. It forces the user to rename the file
>   to give an extension in the list. Moreover, Cocoa does not tell
>   which extensions are in the list so the user needs to read the
>   source code, which is pretty bad.
>=20
> Since this code is harming the usability rather than improving it,
> simply remove the [NSSavePanel allowedFileTypes:] call, fixing:
>=20
>   [2789/6622] Compiling Objective-C object libcommon.fa.p/ui_cocoa.m.o
>   ui/cocoa.m:1411:16: error: 'setAllowedFileTypes:' is deprecated: first
> deprecated in macOS 12.0 - Use -allowedContentTypes instead
> [-Werror,-Wdeprecated-declarations] [openPanel setAllowedFileTypes:
> supportedImageFileTypes];
>                  ^
> =20
> /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Framew=
or
> ks/AppKit.framework/Headers/NSSavePanel.h:215:49: note: property
> 'allowedFileTypes' is declared deprecated here @property (nullable, copy)
> NSArray<NSString *> *allowedFileTypes API_DEPRECATED("Use
> -allowedContentTypes instead", macos(10.3,12.0)); ^
> =20
> /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Framew=
or
> ks/AppKit.framework/Headers/NSSavePanel.h:215:49: note:
> 'setAllowedFileTypes:' has been explicitly marked deprecated here FAILED:
> libcommon.fa.p/ui_cocoa.m.o
>=20
> [*]
> https://lore.kernel.org/qemu-devel/4dde2e66-63cb-4390-9538-c032310db3e3@g=
ma
> il.com/
>=20
> Suggested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
> Tested-by: Roman Bolshakov <r.bolshakov@yadro.com>
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

>  ui/cocoa.m | 6 ------
>  1 file changed, 6 deletions(-)
>=20
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index ac18e14ce0..7a1ddd4075 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -100,7 +100,6 @@ static int gArgc;
>  static char **gArgv;
>  static bool stretch_video;
>  static NSTextField *pauseLabel;
> -static NSArray * supportedImageFileTypes;
>=20
>  static QemuSemaphore display_init_sem;
>  static QemuSemaphore app_started_sem;
> @@ -1168,10 +1167,6 @@ QemuCocoaView *cocoaView;
>          [pauseLabel setTextColor: [NSColor blackColor]];
>          [pauseLabel sizeToFit];
>=20
> -        // set the supported image file types that can be opened
> -        supportedImageFileTypes =3D [NSArray arrayWithObjects: @"img",
> @"iso", @"dmg", -                                 @"qcow", @"qcow2",
> @"cloop", @"vmdk", @"cdr", -                                  @"toast",
> nil];
>          [self make_about_window];
>      }
>      return self;
> @@ -1414,7 +1409,6 @@ QemuCocoaView *cocoaView;
>      openPanel =3D [NSOpenPanel openPanel];
>      [openPanel setCanChooseFiles: YES];
>      [openPanel setAllowsMultipleSelection: NO];
> -    [openPanel setAllowedFileTypes: supportedImageFileTypes];
>      if([openPanel runModal] =3D=3D NSModalResponseOK) {
>          NSString * file =3D [[[openPanel URLs] objectAtIndex: 0] path];
>          if(file =3D=3D nil) {



