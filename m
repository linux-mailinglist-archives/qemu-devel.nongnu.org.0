Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A16307913
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 16:07:46 +0100 (CET)
Received: from localhost ([::1]:47874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l58td-0001kG-Jo
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 10:07:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l58re-0000lr-S5
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 10:05:42 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:35883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l58rY-0007fs-Im
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 10:05:42 -0500
Received: by mail-ed1-x52f.google.com with SMTP id d2so6997435edz.3
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 07:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4dGf+48Td5kcc0tr8sfwraddd2YV57X8Cb15MNQ46kU=;
 b=AB9goDML6WfawhsGG/4t5HWBA3+RA1WwjijsabfzyegrVMc1ZIZ3dS9Xasp7KGIFjW
 jXkmqn+Suf3YqmIpcQdnXNWN9TfvevD6rzxUQHZ/xFzIilcSwaJ6IAbHByKckxOeVbsn
 nYY1Mjvz/Vjd/v8LzzlCNRFK2TmLrHOZqJKoAUzuV4iFs6nd5AYtrS3SpSnKSIpvKl22
 1mvHveUwZoUNxTNBCtbtECR1rg1S0ykbgCnmDUEnWW9vlnaxvpY9F/tWbSensS2edRsY
 G5Fo1oehf9Grgf09S0fa64arVF3DatHeJIx8yfCAgJ8E8L+/gWE/iRAQ+NfOyxtIvDov
 2Rxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4dGf+48Td5kcc0tr8sfwraddd2YV57X8Cb15MNQ46kU=;
 b=ZF1LElvSLHSM91wDMVpBf8EbttmSRr+jGxZJYHnzAt/4v9MJvUPbapCBaKcq7NWFnL
 MOk1vAp5c2Q+eG9ptmnhXIl7Oa4nTnujiVp989iE+36l/3K/PMENpLxa6sWd36l5h5oR
 r80wmm5e2ssOi5p12NhDJm8Pbsd3Oom50x47AFvS9j9fhks0DIZiO37XzzQzAI5L9nR1
 cxxOE1pR0nbXsra2w1l80lbvcHVMVzbeSY9iHAe6die69dnHUc7zDA8Pb7pbqjSa3AXZ
 9AD2PzoYclBY6nXuII0bc0VPXg2UX1NhExuAOz0ZFKPAMl0NTJlU06pBDZ+K2dbvXH+b
 Sgpg==
X-Gm-Message-State: AOAM532kWgyS5PGEdWgR0SS+NIh385r33Smgmmj9af3wgSuieaX/y8jD
 J54Cs9eTKkix6XsQZL/akk4j+/46Hn4+1yKynFI=
X-Google-Smtp-Source: ABdhPJz3DmZPMZr4Mo84G3Q9hyb2UzdCuWbz/qIzUxuljKL2qJfE7PABWtpnfRLaVeBuH5Bc/uhO/K85P8vu+NQtnl0=
X-Received: by 2002:a05:6402:18f:: with SMTP id
 r15mr15045985edv.53.1611846334121; 
 Thu, 28 Jan 2021 07:05:34 -0800 (PST)
MIME-Version: 1.0
References: <20210128111319.329755-1-marcandre.lureau@redhat.com>
 <20210128114352.tvwnx435qbqcv4a4@sirius.home.kraxel.org>
 <CAMxuvazAToFV_uD3Q7whGymoY07eiq-hErToDPB41F2T9ZY7hg@mail.gmail.com>
 <CAMxuvazChfKDHyjP2o1ipfgquawMab9zc4p8J5wnNnmVMmJ1yw@mail.gmail.com>
 <20210128142625.vzdrehzw6mufja3s@sirius.home.kraxel.org>
 <CAJ+F1CJ0Z378KCLGDzLYOfBor7HkHM2YemRj5F-3kTSnVK7ADg@mail.gmail.com>
 <20210128144202.2pqjjn3epspfvlgk@sirius.home.kraxel.org>
In-Reply-To: <20210128144202.2pqjjn3epspfvlgk@sirius.home.kraxel.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 28 Jan 2021 19:05:22 +0400
Message-ID: <CAJ+F1C+1LdY2gJp0trTx_pR7iLeJG9j7O+FjqF6pgnDZGUa=YA@mail.gmail.com>
Subject: Re: [PATCH] spice: delay starting until display are initialized
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: "Bonzini, Paolo" <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Thu, Jan 28, 2021 at 6:42 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> > > I still think that moving these three lines to the correct place is
> > > enough.  Maybe even just qemu_spice_display_start() as it keeps track
> > > of the state and you can safely call this twice.
> >
> > It's not enough, since the first time qemu_spice_display_start() is
> > called (on vm_start) the display interfaces aren't yet registered. And
> > spice server doesn't automatically start the newly added interfaces.
>
> So move the vmstate handler registration call too?
> I'd prefer to not add more state variables if we can avoid it ...
>

Does that seem right to you?

diff --git a/ui/spice-core.c b/ui/spice-core.c
index b621dd86b6..f592331ce4 100644
--- a/ui/spice-core.c
+++ b/ui/spice-core.c
@@ -46,7 +46,6 @@ static const char *auth =3D "spice";
 static char *auth_passwd;
 static time_t auth_expires =3D TIME_MAX;
 static int spice_migration_completed;
-static int spice_display_init_done;
 static int spice_display_is_running;
 static int spice_have_target_host;

@@ -626,7 +625,7 @@ static int add_channel(void *opaque, const char
*name, const char *value,
 static void vm_change_state_handler(void *opaque, int running,
                                     RunState state)
 {
-    if (running && spice_display_init_done) {
+    if (running) {
         qemu_spice_display_start();
     } else if (state !=3D RUN_STATE_PAUSED) {
         qemu_spice_display_stop();
@@ -635,7 +634,7 @@ static void vm_change_state_handler(void *opaque,
int running,

 void qemu_spice_display_init_done(void)
 {
-    spice_display_init_done =3D true;
+    qemu_add_vm_change_state_handler(vm_change_state_handler, NULL);
     vm_change_state_handler(NULL, runstate_is_running(), runstate_get());
 }

@@ -810,7 +809,6 @@ static void qemu_spice_init(void)

     qemu_spice_input_init();

-    qemu_add_vm_change_state_handler(vm_change_state_handler, NULL);
     qemu_spice_display_stop();

     g_free(x509_key_file);


--=20
Marc-Andr=C3=A9 Lureau

