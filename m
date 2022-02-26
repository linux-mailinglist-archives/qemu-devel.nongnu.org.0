Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F674C55AC
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 12:34:40 +0100 (CET)
Received: from localhost ([::1]:59888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNvLS-0003hV-R2
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 06:34:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nNvHo-0002rg-Ul
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 06:30:52 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:59723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nNvHX-0000uw-D2
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 06:30:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=L6o44UKQ0fKNTIbyze3qdtxBq1hPXYZneCEJqrgUg78=; b=IW1eLvH1lQy6wgAj9z18DJt5fr
 dbZiN9EZO3Ec19/jdDU2QQy6dJnh8h1B0PDJnIdQc6wDjXlUnCs9b+ePUus1k63UYchaJ5CaW1yUO
 JzaVn8vIHJYZWdW8Hlu3QgrTFkFAA+palwHrjQ38B0x6fpmYktQxa1RechYyNtVSlwp+FMAPfjV44
 qUAsiWdl5REVw1Goz1yZFMp+aqCGnkNFqDPIv+5qz5mNGo+Nb+yn7ZRQ8D9ZneMV83HHXLX4wuFU4
 2Z/Ny1T8+k+sTkBPDfR+rzUmOEwI8+JREP609gP4G45mvg8QDB5p0psXZiCc+Qi3Vuxa0oLKF4uuE
 dD/8/6LWKHwZxhfGjR4b70k7qlfCnmgedNg+eiL3CCca1PC9ihQDK/7RbeSEHVe11p9OO2w0tT+Eu
 f48SCUvv4Uykewm+PkFxxItuJqQHXLxWj3l1IobsLBC+gtgsmo2ZmBe8w/tCRyKK4MbAT9Leksz1G
 iaFcT+nqViNxbPrqS3dGgHhGPpU1qUe8mDDeQmj9Umg0zfQrnoXOCBs3HURTXRZdBXkvLX4SqwuOT
 TQx18RBQeoNeUq3sjS+puUAC68g3/2Kt3mCb4eESqM2asoM0vRjYUKtsut4tgga4C1dBEdti+xjGY
 VCgyw7H6rke+hBdwcSx6dV/ZTSRxetiAZBAqWjyxI=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] coreaudio: Notify error in coreaudio_init_out
Date: Sat, 26 Feb 2022 12:30:32 +0100
Message-ID: <18704456.9KXHJpUyHl@silver>
In-Reply-To: <f1198af9-1d43-5155-229d-3663c65aec3d@gmail.com>
References: <20220226100248.26847-1-akihiko.odaki@gmail.com>
 <4536903.fTDxs23YJo@silver> <f1198af9-1d43-5155-229d-3663c65aec3d@gmail.com>
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

On Samstag, 26. Februar 2022 11:18:44 CET Akihiko Odaki wrote:
> On 2022/02/26 19:16, Christian Schoenebeck wrote:
> > On Samstag, 26. Februar 2022 11:02:48 CET Akihiko Odaki wrote:
> >> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> >> ---
> >> 
> >>   audio/coreaudio.c | 2 ++
> >>   1 file changed, 2 insertions(+)
> >> 
> >> diff --git a/audio/coreaudio.c b/audio/coreaudio.c
> >> index d8a21d3e507..d7cfdcc4fc4 100644
> >> --- a/audio/coreaudio.c
> >> +++ b/audio/coreaudio.c
> >> @@ -604,6 +604,8 @@ static int coreaudio_init_out(HWVoiceOut *hw, struct
> >> audsettings *as, coreaudio_playback_logerr(status,
> >> 
> >>                                         "Could not remove voice property
> >> 
> >> change listener\n"); }
> >> +
> >> +        return -1;
> >> 
> >>       }
> >>       
> >>       return 0;
> > 
> > Is this a pure theoretical fix, or does it actually fix an actually
> > encountered misbehaviour? I don't see any explanation in the commit log. I
> > mean the branch here is about removing a listener only.
> > 
> > Best regards,
> > Christian Schoenebeck
> 
> I saw branching to this block results in abort as core->hw.samples is
> not set.

Ok, then please add an appropriate description to the commit log of what your 
observed. Except of that:

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

Best regards,
Christian Schoenebeck



