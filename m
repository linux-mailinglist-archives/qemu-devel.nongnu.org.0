Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4272A48999F
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 14:13:25 +0100 (CET)
Received: from localhost ([::1]:57862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6uUG-0000MQ-Ba
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 08:13:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1n6uOc-0006Ee-BI; Mon, 10 Jan 2022 08:07:34 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:48801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1n6uOY-0007pR-Vu; Mon, 10 Jan 2022 08:07:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=W2FFhitDEVn/Rg/ISb5kacaGcHR6O+t1LwSjjHXH5qI=; b=cLvmY2evJ5WCtGoAS7bUoiB3HS
 1ZPJUWqeEZ0a9Qzc+dBJgEH3+Sa8HrA5GiMk9Be6aeSDswyqY5Q0WoronEIEAQJO8M4LVtm4nOqXw
 3pFeoWwyk4VowNoCPCbFgmRDXbSUoGz+fhLVOvAHy54E+BS+EoXRMP7Q9iimMtmx/9vhNxHzOp6hl
 0MU5lSHA5PGXG9CWjmDFQA/eS6pMuJ0ORcXJpwIM6YgN0IdcZBgb6gF27MMhjHCQsCwG1n0UXw7nd
 GPgeCDIfWUqI/9zjEjARZ0otTgZu1k6idz9e1vVPHgDJyd1RUvsbL7lSVGTRrIxR9TqziGOJ8aqzk
 8DW99wDkgWOfB2nZi6CCsuMICihN8PQuT42XeGaiabjS+BiqWoWc2+Fw0Sir5gO8oJI8uqrVLd4hC
 AGm/ZdOfckqNMIVADJ5In2nR0PvjBUOWrIG8VAtnzqYjvmB46iY7XA4AOq5ziDCZ6zbbfxA36xzJR
 7Msce93JbWrXwFRUZ743s0R+Wn8FsxJe/mHkbucASFlGVSPeWy6VFt4ZANuFVhb5ZOtw6df9ap69J
 T+asA7Dx2Dqg21SW4Q9m1qrKxu/dxNkTPI7UE3MJHfHJWFzo6+/9pkmhscrNcMCXI2TpFyC6JZ3m6
 WUDhE0WogOoSOoG8OgoCfA/l7LU87QFsX9+I+cjvk=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-block@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [RFC PATCH v2 2/6] audio/coreaudio: Remove a deprecation warning
 on macOS 12
Date: Mon, 10 Jan 2022 14:07:24 +0100
Message-ID: <2147921.xlN1UyrzLN@silver>
In-Reply-To: <4993ab11-570b-2bd7-a9b9-c6ddc9af5802@amsat.org>
References: <20220109170612.574104-1-f4bug@amsat.org>
 <742a1bca-1150-c277-c498-3815ef956f58@amsat.org>
 <4993ab11-570b-2bd7-a9b9-c6ddc9af5802@amsat.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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

On Montag, 10. Januar 2022 13:24:06 CET Philippe Mathieu-Daud=E9 wrote:
> On 1/10/22 09:44, Philippe Mathieu-Daud=E9 wrote:
> > On 1/10/22 09:17, Akihiko Odaki wrote:
> >> On 2022/01/10 2:06, Philippe Mathieu-Daud=E9 wrote:
> >>> When building on macOS 12 we get:
> >>>=20
> >>>    audio/coreaudio.c:50:5: error: 'kAudioObjectPropertyElementMaster'
> >>> is deprecated: first deprecated in macOS 12.0
> >>> [-Werror,-Wdeprecated-declarations]
> >>>        kAudioObjectPropertyElementMaster
> >>>        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >>>        kAudioObjectPropertyElementMain
> >>>  =20
> >>> /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Fr=
ame
> >>> works/CoreAudio.framework/Headers/AudioHardwareBase.h:208:5: note:
> >>> 'kAudioObjectPropertyElementMaster' has been explicitly marked
> >>> deprecated here
> >>>        kAudioObjectPropertyElementMaster
> >>> API_DEPRECATED_WITH_REPLACEMENT("kAudioObjectPropertyElementMain",
> >>> macos(10.0, 12.0), ios(2.0, 15.0), watchos(1.0, 8.0), tvos(9.0, 15.0))
> >>> =3D kAudioObjectPropertyElementMain
> >>>        ^
> >>>=20
> >>> Use kAudioObjectPropertyElementMain (define it to
> >>> kAudioObjectPropertyElementMaster on macOS < 12).
> >>>=20
> >>> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> >>> ---
> >>>   audio/coreaudio.c | 16 ++++++++++------
> >>>   1 file changed, 10 insertions(+), 6 deletions(-)
> >>>=20
> >>> diff --git a/audio/coreaudio.c b/audio/coreaudio.c
> >>> index d8a21d3e507..c836bc9dd37 100644
> >>> --- a/audio/coreaudio.c
> >>> +++ b/audio/coreaudio.c
> >>> @@ -44,10 +44,14 @@ typedef struct coreaudioVoiceOut {
> >>>       bool enabled;
> >>>   } coreaudioVoiceOut;
> >>>   +#if !defined(MAC_OS_VERSION_12_0)
> >>> +#define kAudioObjectPropertyElementMain
> >>> kAudioObjectPropertyElementMaster
> >>> +#endif
> >>> +
> >>=20
> >> Semantically MAC_OS_VERSION_12_0 defines the numeric value of version
> >> 12.0 and its existence does not mean that
> >> kAudioObjectPropertyElementMain is defined. I suggest the following:
> >> #if !__is_identifier(kAudioObjectPropertyElementMain)
> >> #define kAudioObjectPropertyElementMain kAudioObjectPropertyElementMas=
ter
> >> #endif
>=20
> Apparently __is_identifier() is Clang specific. It might be acceptable
> since this file is restricted to macOS. Similarly for the other
> block/file-posix.c patch, the section is conditional to  __APPLE__
> being defined.

Correct, __is_identifier() is a clang extension and does not work with GCC
(tested). I would not use it. People on Mac usually use clang, but there are
also cross compilers for macOS binaries.

I'd suggest to use:

#if !defined(MAC_OS_VERSION_12_0) ||
    (MAC_OS_X_VERSION_MAX_ALLOWED < MAC_OS_VERSION_12_0)
#define kAudioObjectPropertyElementMain kAudioObjectPropertyElementMaster
#endif

Best regards,
Christian Schoenebeck



