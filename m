Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FAF4CEB81
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 13:18:58 +0100 (CET)
Received: from localhost ([::1]:49080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQpqk-0006F3-01
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 07:18:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nQpop-0005Sx-R2
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 07:16:59 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:42863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nQpom-00041p-BU
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 07:16:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=fY/AD6j90GTxRMp4c0LPh5xCTISBJBqv8KHcnP7VT6M=; b=AuYr6jRSFur1RTC/dwXVGcy+Gy
 R5jMPswCzNpqM1HJ0cRfy5gg0QKJ/4GynEM/R1Ob143oQCJcQXWrl4rdkzy7Hta7kvMsFgTBtUpJM
 P1K0xTQRlGm95HK2/smx7JxV0BdtGpLq2ao58k9pT9Cul0Uo3ICFiD8K4Z6RMez5/RgPc4sTe/nU8
 /VlXdb8/C7lqkPAPRPUvEQM1oP2nMWO7JDeKlbWQnoyJR5oqL1eIUu7yNzr/xqF5WhccJ+ixUNwio
 /UbH7uHYyIAUGlK9aXRFt7EZ+MevqBWuy068Eafx5tYjmT1ebOWIG2jO2+zhnqcOqpUc/9YO4dp/S
 F3ejpLK3NIoZ49U7I7nAPy/uXHFMgSMdoFXFASMTeZd+exmOBdyi3HQKHkrPP4LV3yNIGDWHwrGMq
 rA1HI4qCLct3rnGZUHf1yJCmpQoX9YQqXKzPdG4eLW54DV2LZai2xLoCrcgYhskdU/zjW+mUZ3ezt
 nxtg5+3JW1Ttv7QN0E/8mOHfh+rZMEx/Jvf8jfIJAoYsWUD8zglmVg08R5h2snc1nJQENkhBIISiK
 sJBnZvHxV2q+8vlzPy9WcLBnGiRVN6m8dcgfNCPdS870hXzW6OS70TGOq/vWVvm9mIAezEyU0h6V5
 IHSN/nK6xNsn493RkvKPGPBfC0JyDe3emhFeJOwOY=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] coreaudio: Always return 0 in handle_voice_change
Date: Sun, 06 Mar 2022 13:16:52 +0100
Message-ID: <1758606.r3f8h81gpy@silver>
In-Reply-To: <0fc7e092-49dd-4fb3-a365-f5399a4cb8b2@gmail.com>
References: <20220306063949.28138-1-akihiko.odaki@gmail.com>
 <1771824.72ebOKuLVD@silver> <0fc7e092-49dd-4fb3-a365-f5399a4cb8b2@gmail.com>
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Sonntag, 6. M=E4rz 2022 11:54:00 CET Akihiko Odaki wrote:
> On 2022/03/06 19:49, Christian Schoenebeck wrote:
> > On Sonntag, 6. M=E4rz 2022 07:39:49 CET Akihiko Odaki wrote:
> >> MacOSX.sdk/System/Library/Frameworks/CoreAudio.framework/Headers/Audio=
Har
> >> dwa re.h
> >>=20
> >> says:
> >>> The return value is currently unused and should always be 0.
> >=20
> > Where does it say that, about which macOS functions? There are quite a
> > bunch of macOS functions involved in init_out_device(), and they all ha=
ve
> > error pathes in init_out_device(), and they still will have them after
> > this patch.
> >=20
> > And again, I'm missing: this as an improvement because? Is this a user
> > invisible improvement (e.g. removing redundant branches), or is this a
> > user
> > visible improvement, i.e. does it fix a misbehaviour? In case of the
> > latter, which misbehaviour did you encounter?
>=20
> handle_voice_change itself is a callback.
> It is invisible for a user since "the return value is currently unused".

Then the commit log should be more specific and say something like:

"
handle_voice_change() is a CoreAudio callback function as of CoreAudio type=
=20
'AudioObjectPropertyListenerProc', and for the latter MacOSX.sdk/System/
Library/Frameworks/CoreAudio.framework/Headers/AudioHardware.h
says 'The return value is currently unused and should always be 0.'.
"

Nevertheless, personally I would not change that, but I won't object either.

I read it like "The CoreAudio subsystem of macOS currently ignores the resu=
lt=20
of your callback, and for that reason simply return 0 for now.". It does no=
t=20
say "you must not return anything else than 0". ATM it simply does not matt=
er=20
what you return here.

Best regards,
Christian Schoenebeck



