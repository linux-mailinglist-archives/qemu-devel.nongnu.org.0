Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 754144B404A
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 04:28:18 +0100 (CET)
Received: from localhost ([::1]:50162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJS2D-00085N-KF
	for lists+qemu-devel@lfdr.de; Sun, 13 Feb 2022 22:28:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dirty@apple.com>) id 1nJS1F-0007PD-K1
 for qemu-devel@nongnu.org; Sun, 13 Feb 2022 22:27:17 -0500
Received: from rn-mailsvcp-ppex-lapp45.rno.apple.com ([17.179.253.49]:48666
 helo=rn-mailsvcp-ppex-lapp45.apple.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dirty@apple.com>) id 1nJS1D-0002qI-1n
 for qemu-devel@nongnu.org; Sun, 13 Feb 2022 22:27:17 -0500
Received: from pps.filterd (rn-mailsvcp-ppex-lapp45.rno.apple.com [127.0.0.1])
 by rn-mailsvcp-ppex-lapp45.rno.apple.com (8.16.1.2/8.16.1.2) with
 SMTP id 21E3EJSi022395; Sun, 13 Feb 2022 19:26:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apple.com;
 h=from : message-id :
 content-type : mime-version : subject : date : in-reply-to : cc : to :
 references; s=20180706; bh=+MSZYrHizvWoLusuqP3kf8gbty1CDf4OIQfEG2s3saA=;
 b=klJA/8+5BjsPStGivQME2/5W/dXVSg4bVSk6phI4yqvjCSPe2Glx2L0In5/A5dmRbMqR
 yvZ1suDoLcavmCmdDmQgzi136O5KNubobKYxx6qV1pu6M6Rmh/uUTulOlkytpzQ/US3u
 Gl+O213GlD+X8dcmwREfL43XSxm1FQlHkvgYjBesh1vXr8A+OKh1oaJNoC+6Kt8Qk64y
 w9rzILwNjD0lMUQ863uXZUuUQMPhu7dojOq41Mse/LuZ6qDhHI/bA5s4uoZz1B4clPAs
 G/Tq3bxHMqQtTM4SLDQHDo+DEo6vU22P7hc+CN4pqPQFggYIM6waOwx/e+iTnevqbrRY 5g== 
Received: from rn-mailsvcp-mta-lapp04.rno.apple.com
 (rn-mailsvcp-mta-lapp04.rno.apple.com [10.225.203.152])
 by rn-mailsvcp-ppex-lapp45.rno.apple.com with ESMTP id 3e7a45b94g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Sun, 13 Feb 2022 19:26:55 -0800
Received: from rn-mailsvcp-mmp-lapp02.rno.apple.com
 (rn-mailsvcp-mmp-lapp02.rno.apple.com [17.179.253.15])
 by rn-mailsvcp-mta-lapp04.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.12.20210903 64bit (built Sep 3
 2021)) with ESMTPS id <0R7900IU4YWVMS90@rn-mailsvcp-mta-lapp04.rno.apple.com>; 
 Sun, 13 Feb 2022 19:26:55 -0800 (PST)
Received: from process_milters-daemon.rn-mailsvcp-mmp-lapp02.rno.apple.com by
 rn-mailsvcp-mmp-lapp02.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.12.20210903 64bit (built Sep 3
 2021)) id <0R7900R00Y814500@rn-mailsvcp-mmp-lapp02.rno.apple.com>; Sun,
 13 Feb 2022 19:26:55 -0800 (PST)
X-Va-A: 
X-Va-T-CD: a4993044822e62ac2b1465e3850df6e0
X-Va-E-CD: 2c84840946803e7ee428a0142ee6c73a
X-Va-R-CD: 3ec591cc733108bf52666b75c4b215ff
X-Va-CD: 0
X-Va-ID: 6afa16d7-5abf-434b-bd2e-eab0e03a81d2
X-V-A: 
X-V-T-CD: a4993044822e62ac2b1465e3850df6e0
X-V-E-CD: 2c84840946803e7ee428a0142ee6c73a
X-V-R-CD: 3ec591cc733108bf52666b75c4b215ff
X-V-CD: 0
X-V-ID: fe72a5da-21a9-47ee-a12d-200cbc9bad65
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.816
 definitions=2022-02-14_01:2022-02-11,
 2022-02-14 signatures=0
Received: from smtpclient.apple ([17.234.2.16])
 by rn-mailsvcp-mmp-lapp02.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.12.20210903 64bit (built Sep 3
 2021))
 with ESMTPSA id <0R79008JHYWU7H20@rn-mailsvcp-mmp-lapp02.rno.apple.com>; Sun,
 13 Feb 2022 19:26:55 -0800 (PST)
From: Cameron Esfahani <dirty@apple.com>
Message-id: <10BA3470-B308-4C1C-AFDE-FB9B0F0ADD5F@apple.com>
Content-type: multipart/alternative;
 boundary="Apple-Mail=_F9C89C63-F3D3-4FE8-B325-7416C46B6884"
MIME-version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: [PATCH v4 12/13] ui/cocoa: Remove allowedFileTypes restriction in
 SavePanel
Date: Sun, 13 Feb 2022 19:26:53 -0800
In-reply-to: <20220211163434.58423-13-f4bug@amsat.org>
Cc: Cameron Esfahani via <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Will Cohen <wwcohen@gmail.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Li Zhang <lizhang@suse.de>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
References: <20220211163434.58423-1-f4bug@amsat.org>
 <20220211163434.58423-13-f4bug@amsat.org>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.816
 definitions=2022-02-14_01:2022-02-11,
 2022-02-14 signatures=0
Received-SPF: pass client-ip=17.179.253.49; envelope-from=dirty@apple.com;
 helo=rn-mailsvcp-ppex-lapp45.apple.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, TVD_SUBJ_WIPE_DEBT=1.004,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--Apple-Mail=_F9C89C63-F3D3-4FE8-B325-7416C46B6884
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Reviewed-by: Cameron Esfahani <dirty@apple.com <mailto:dirty@apple.com>>


> On Feb 11, 2022, at 8:34 AM, Philippe Mathieu-Daud=C3=A9 via =
<qemu-devel@nongnu.org> wrote:
>=20
> setAllowedFileTypes is deprecated in macOS 12.
>=20
> Per Akihiko Odaki [*]:
>=20
>  An image file, which is being chosen by the panel, can be a
>  raw file and have a variety of file extensions and many are not
>  covered by the provided list (e.g. "udf"). Other platforms like
>  GTK can provide an option to open a file with an extension not
>  listed, but Cocoa can't. It forces the user to rename the file
>  to give an extension in the list. Moreover, Cocoa does not tell
>  which extensions are in the list so the user needs to read the
>  source code, which is pretty bad.
>=20
> Since this code is harming the usability rather than improving it,
> simply remove the [NSSavePanel allowedFileTypes:] call, fixing:
>=20
>  [2789/6622] Compiling Objective-C object libcommon.fa.p/ui_cocoa.m.o
>  ui/cocoa.m:1411:16: error: 'setAllowedFileTypes:' is deprecated: =
first deprecated in macOS 12.0 - Use -allowedContentTypes instead =
[-Werror,-Wdeprecated-declarations]
>      [openPanel setAllowedFileTypes: supportedImageFileTypes];
>                 ^
>  =
/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Framewo=
rks/AppKit.framework/Headers/NSSavePanel.h:215:49: note: property =
'allowedFileTypes' is declared deprecated here
>  @property (nullable, copy) NSArray<NSString *> *allowedFileTypes =
API_DEPRECATED("Use -allowedContentTypes instead", macos(10.3,12.0));
>                                                  ^
>  =
/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Framewo=
rks/AppKit.framework/Headers/NSSavePanel.h:215:49: note: =
'setAllowedFileTypes:' has been explicitly marked deprecated here
>  FAILED: libcommon.fa.p/ui_cocoa.m.o
>=20
> [*] =
https://lore.kernel.org/qemu-devel/4dde2e66-63cb-4390-9538-c032310db3e3@gm=
ail.com/
>=20
> Suggested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
> Tested-by: Roman Bolshakov <r.bolshakov@yadro.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> ui/cocoa.m | 6 ------
> 1 file changed, 6 deletions(-)
>=20
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index ac18e14ce0..7a1ddd4075 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -100,7 +100,6 @@ static int gArgc;
> static char **gArgv;
> static bool stretch_video;
> static NSTextField *pauseLabel;
> -static NSArray * supportedImageFileTypes;
>=20
> static QemuSemaphore display_init_sem;
> static QemuSemaphore app_started_sem;
> @@ -1168,10 +1167,6 @@ QemuCocoaView *cocoaView;
>         [pauseLabel setTextColor: [NSColor blackColor]];
>         [pauseLabel sizeToFit];
>=20
> -        // set the supported image file types that can be opened
> -        supportedImageFileTypes =3D [NSArray arrayWithObjects: =
@"img", @"iso", @"dmg",
> -                                 @"qcow", @"qcow2", @"cloop", =
@"vmdk", @"cdr",
> -                                  @"toast", nil];
>         [self make_about_window];
>     }
>     return self;
> @@ -1414,7 +1409,6 @@ QemuCocoaView *cocoaView;
>     openPanel =3D [NSOpenPanel openPanel];
>     [openPanel setCanChooseFiles: YES];
>     [openPanel setAllowsMultipleSelection: NO];
> -    [openPanel setAllowedFileTypes: supportedImageFileTypes];
>     if([openPanel runModal] =3D=3D NSModalResponseOK) {
>         NSString * file =3D [[[openPanel URLs] objectAtIndex: 0] =
path];
>         if(file =3D=3D nil) {
> --=20
> 2.34.1
>=20
>=20


--Apple-Mail=_F9C89C63-F3D3-4FE8-B325-7416C46B6884
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D"">Reviewed-by: Cameron Esfahani &lt;<a =
href=3D"mailto:dirty@apple.com" class=3D"">dirty@apple.com</a>&gt;<div =
class=3D""><br class=3D""><div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D"">On Feb 11, 2022, at 8:34 AM, Philippe =
Mathieu-Daud=C3=A9 via &lt;<a href=3D"mailto:qemu-devel@nongnu.org" =
class=3D"">qemu-devel@nongnu.org</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div =
class=3D"">setAllowedFileTypes is deprecated in macOS 12.<br =
class=3D""><br class=3D"">Per Akihiko Odaki [*]:<br class=3D""><br =
class=3D""> &nbsp;An image file, which is being chosen by the panel, can =
be a<br class=3D""> &nbsp;raw file and have a variety of file extensions =
and many are not<br class=3D""> &nbsp;covered by the provided list (e.g. =
"udf"). Other platforms like<br class=3D""> &nbsp;GTK can provide an =
option to open a file with an extension not<br class=3D""> &nbsp;listed, =
but Cocoa can't. It forces the user to rename the file<br class=3D""> =
&nbsp;to give an extension in the list. Moreover, Cocoa does not tell<br =
class=3D""> &nbsp;which extensions are in the list so the user needs to =
read the<br class=3D""> &nbsp;source code, which is pretty bad.<br =
class=3D""><br class=3D"">Since this code is harming the usability =
rather than improving it,<br class=3D"">simply remove the [NSSavePanel =
allowedFileTypes:] call, fixing:<br class=3D""><br class=3D""> =
&nbsp;[2789/6622] Compiling Objective-C object =
libcommon.fa.p/ui_cocoa.m.o<br class=3D""> &nbsp;ui/cocoa.m:1411:16: =
error: 'setAllowedFileTypes:' is deprecated: first deprecated in macOS =
12.0 - Use -allowedContentTypes instead =
[-Werror,-Wdeprecated-declarations]<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[openPanel setAllowedFileTypes: =
supportedImageFileTypes];<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;^<br class=3D""> =
&nbsp;/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/F=
rameworks/AppKit.framework/Headers/NSSavePanel.h:215:49: note: property =
'allowedFileTypes' is declared deprecated here<br class=3D""> =
&nbsp;@property (nullable, copy) NSArray&lt;NSString *&gt; =
*allowedFileTypes API_DEPRECATED("Use -allowedContentTypes instead", =
macos(10.3,12.0));<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;^<=
br class=3D""> =
&nbsp;/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/F=
rameworks/AppKit.framework/Headers/NSSavePanel.h:215:49: note: =
'setAllowedFileTypes:' has been explicitly marked deprecated here<br =
class=3D""> &nbsp;FAILED: libcommon.fa.p/ui_cocoa.m.o<br class=3D""><br =
class=3D"">[*] <a =
href=3D"https://lore.kernel.org/qemu-devel/4dde2e66-63cb-4390-9538-c032310=
db3e3@gmail.com/" =
class=3D"">https://lore.kernel.org/qemu-devel/4dde2e66-63cb-4390-9538-c032=
310db3e3@gmail.com/</a><br class=3D""><br class=3D"">Suggested-by: =
Akihiko Odaki &lt;<a href=3D"mailto:akihiko.odaki@gmail.com" =
class=3D"">akihiko.odaki@gmail.com</a>&gt;<br class=3D"">Reviewed-by: =
Roman Bolshakov &lt;<a href=3D"mailto:r.bolshakov@yadro.com" =
class=3D"">r.bolshakov@yadro.com</a>&gt;<br class=3D"">Tested-by: Roman =
Bolshakov &lt;<a href=3D"mailto:r.bolshakov@yadro.com" =
class=3D"">r.bolshakov@yadro.com</a>&gt;<br class=3D"">Signed-off-by: =
Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org" =
class=3D"">f4bug@amsat.org</a>&gt;<br class=3D"">---<br class=3D""> =
ui/cocoa.m | 6 ------<br class=3D""> 1 file changed, 6 deletions(-)<br =
class=3D""><br class=3D"">diff --git a/ui/cocoa.m b/ui/cocoa.m<br =
class=3D"">index ac18e14ce0..7a1ddd4075 100644<br class=3D"">--- =
a/ui/cocoa.m<br class=3D"">+++ b/ui/cocoa.m<br class=3D"">@@ -100,7 =
+100,6 @@ static int gArgc;<br class=3D""> static char **gArgv;<br =
class=3D""> static bool stretch_video;<br class=3D""> static NSTextField =
*pauseLabel;<br class=3D"">-static NSArray * supportedImageFileTypes;<br =
class=3D""><br class=3D""> static QemuSemaphore display_init_sem;<br =
class=3D""> static QemuSemaphore app_started_sem;<br class=3D"">@@ =
-1168,10 +1167,6 @@ QemuCocoaView *cocoaView;<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[pauseLabel =
setTextColor: [NSColor blackColor]];<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[pauseLabel =
sizeToFit];<br class=3D""><br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;// set the supported image =
file types that can be opened<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;supportedImageFileTypes =3D =
[NSArray arrayWithObjects: @"img", @"iso", @"dmg",<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@"qcow", @"qcow2", @"cloop", =
@"vmdk", @"cdr",<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@"toast", nil];<br =
class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[self =
make_about_window];<br class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;}<br =
class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;return self;<br class=3D"">@@ =
-1414,7 +1409,6 @@ QemuCocoaView *cocoaView;<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;openPanel =3D [NSOpenPanel openPanel];<br =
class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;[openPanel setCanChooseFiles: =
YES];<br class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;[openPanel =
setAllowsMultipleSelection: NO];<br class=3D"">- =
&nbsp;&nbsp;&nbsp;[openPanel setAllowedFileTypes: =
supportedImageFileTypes];<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;if([openPanel runModal] =3D=3D =
NSModalResponseOK) {<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NSString * file =3D =
[[[openPanel URLs] objectAtIndex: 0] path];<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if(file =3D=3D nil) {<br =
class=3D"">-- <br class=3D"">2.34.1<br class=3D""><br class=3D""><br =
class=3D""></div></div></blockquote></div><br =
class=3D""></div></body></html>=

--Apple-Mail=_F9C89C63-F3D3-4FE8-B325-7416C46B6884--

