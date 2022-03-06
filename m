Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 638704CEA92
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 11:51:57 +0100 (CET)
Received: from localhost ([::1]:49316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQoUV-0005ie-T5
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 05:51:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nQoSf-0004IS-SF
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 05:50:01 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:57115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nQoSd-00048T-Vm
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 05:50:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=Wn6PfVE6UmvZzAnmagWcd20dLTFk2gwaFmSP+4KRAGo=; b=U/G9qk9e6K2lNNLYVu9hCBaRSP
 znziHYHdzeD4dbnvdedU6QiNcuNHKX4+7EnraDlL78uAPGX6DIB0p5y8X1yAgDSrfXC292GmXKh0D
 SO8HDKo90h8qj47fEDtfkAtfcGc3rX81a0Mnj1Mzcr6zDUlwFOId+xL8jSFYlEORK9njt6TNNCBPT
 vSAuLhNlJJF/JvbpQnV0b050+f5HRsQnEmUz0LgwPbcYQTaiuIO8t/LGMLnEEyWg9m1xI/wYEd0o6
 vE5FyTZhpssSw/qglH7ktS/97H75sql8yNzhyAvGDya0ASryOpmWMyJTm/vj5r+O9Nf2B5kV3fvXD
 I3SPX516NDZ7zhLdzSJa4Ge3kyE12Z6mD9PBSjkPEEPqboxazpPKI2JMdBrJlSvFrjK4sgc0Mitk5
 J1aRG5Vfuyl2Nojm4Cl2cSWarMCw0P1M/B4RZUKKxcM8IFn1Kzmdl97WLQLGeN5l0gPU6xhqIQw64
 q7wyM/JgeJOMCer/2vVsJhW7k+OQjsgniucjWnhFI0TVIRWajRPGYwqMp2heFRvkSCkqJZp0DntHi
 R9UZZemiMNb/BTW6yIkzJER+6lQnNtaLdxN+NSxirJrfJ0O9Pt3QCw/T+o1E0aX8EJpUNj4qHu1XL
 WTEQqHAEYAB5lBEQzwWCTkOfjWDkwd7L36M+lAkac=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] coreaudio: Always return 0 in handle_voice_change
Date: Sun, 06 Mar 2022 11:49:55 +0100
Message-ID: <1771824.72ebOKuLVD@silver>
In-Reply-To: <20220306063949.28138-1-akihiko.odaki@gmail.com>
References: <20220306063949.28138-1-akihiko.odaki@gmail.com>
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

On Sonntag, 6. M=E4rz 2022 07:39:49 CET Akihiko Odaki wrote:
> MacOSX.sdk/System/Library/Frameworks/CoreAudio.framework/Headers/AudioHar=
dwa
> re.h
> says:
> > The return value is currently unused and should always be 0.

Where does it say that, about which macOS functions? There are quite a bunc=
h=20
of macOS functions involved in init_out_device(), and they all have error=20
pathes in init_out_device(), and they still will have them after this patch.

And again, I'm missing: this as an improvement because? Is this a user=20
invisible improvement (e.g. removing redundant branches), or is this a user=
=20
visible improvement, i.e. does it fix a misbehaviour? In case of the latter=
,=20
which misbehaviour did you encounter?

Best regards,
Christian Schoenebeck

>=20
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>  audio/coreaudio.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/audio/coreaudio.c b/audio/coreaudio.c
> index 0f19d0ce01c..91445096358 100644
> --- a/audio/coreaudio.c
> +++ b/audio/coreaudio.c
> @@ -540,7 +540,6 @@ static OSStatus handle_voice_change(
>      const AudioObjectPropertyAddress *in_addresses,
>      void *in_client_data)
>  {
> -    OSStatus status;
>      coreaudioVoiceOut *core =3D in_client_data;
>=20
>      qemu_mutex_lock_iothread();
> @@ -549,13 +548,12 @@ static OSStatus handle_voice_change(
>          fini_out_device(core);
>      }
>=20
> -    status =3D init_out_device(core);
> -    if (!status) {
> +    if (!init_out_device(core)) {
>          update_device_playback_state(core);
>      }
>=20
>      qemu_mutex_unlock_iothread();
> -    return status;
> +    return 0;
>  }
>=20
>  static int coreaudio_init_out(HWVoiceOut *hw, struct audsettings *as,



