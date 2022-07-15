Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F615762CD
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 15:29:47 +0200 (CEST)
Received: from localhost ([::1]:49170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCLO6-0005XE-Ma
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 09:29:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oCLM3-0003lh-GC
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 09:27:41 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:42777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oCLLy-00035T-D4
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 09:27:36 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2ef5380669cso46672787b3.9
 for <qemu-devel@nongnu.org>; Fri, 15 Jul 2022 06:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CI5UFv/JONNJcJ5+eMk3JbgdHEfCIFIKDxiDwGVweRE=;
 b=O6+us56d0VCaDxRd50DaU0qKQxZdhM5y4h2r9D3gZ/4nwbm85xeVyFOrjpxw8GC5GS
 3bXevl8NIpD8aIASF435KDBd3hjq0FVbBGOtcr7SrOdzldGjMdUIuXhpRyfGlg6iHHvB
 Byq1vx+0Ydyy9d6yn/312A+nu0Km28ZmFsQFRRK5RJbfGNHj1dSIjl5VnS86NLjlFcex
 zD/cYb5E/j/VfaJ2wCpb3208XQCzUiT7iLdGNUrm7ZnEo9ipa+sCgPttear6ZOMZw07p
 X12lcZjPjDeCOFV+wr+N/o3r5oz8ai1N4Vc7K/aqV3y8KWhyxdMVg0p24tfGstFKQ3LS
 kcxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CI5UFv/JONNJcJ5+eMk3JbgdHEfCIFIKDxiDwGVweRE=;
 b=q557uKOIQSGn+PzhqM9quMLXv7j51xL8OkVUezwcd9oIWsxTNkUFwW97P8q7FxgqqC
 FmnDCI2EjBVY4ug6JUZ3fqiRMMLjIbm0pKPGP6WW+1ZhPdHgVqmhhNLJG0pBwvl26SUg
 JB8ohBN1tDQ1EIm5O4AaG8eJZEl5Ebkd7A3rCMa6jmU7xLvDbP7QViUoFQI3xlaE4a+B
 0l3mtL2ijuydAnYnjhDAgxtkNy/xP6y4czhn26SaZWUB0Cad2Ym9SqOnzXyYBaXIlSYM
 KhUSY8KCV7M3AHrN9c1J6oll9GHArCDmfSsN89CRYHmK8BJTUwITy9i6Gc2hxfyfUfCR
 8N8g==
X-Gm-Message-State: AJIora/WejKGMJsNbmubYaLR/Pp1YbNHANlLRGq6iRRvhh0tpGO1jF9W
 MEidpFv/sVDt2jRA9cAO8eJhjfj3YMIdQuOm3eaddA==
X-Google-Smtp-Source: AGRyM1sAyp/kJAo/pC0/PTAf3udiL2JxYWctAbid3SZE2/MnztVizB1O9NAr/5yKuQ9Nkxe6G1cvdzOu/6xOPojixSo=
X-Received: by 2002:a81:a247:0:b0:31d:72da:e931 with SMTP id
 z7-20020a81a247000000b0031d72dae931mr15900518ywg.469.1657891653095; Fri, 15
 Jul 2022 06:27:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220715114039.59790-1-akihiko.odaki@gmail.com>
 <20220715114039.59790-2-akihiko.odaki@gmail.com>
 <CAFEAcA96_AX=UDrY=69kaSLvh+8DsEjzpkt=maL5r-O4e1wH5g@mail.gmail.com>
 <d6f14a76-d0c6-f5b9-93bd-2235b3a5383c@gmail.com>
In-Reply-To: <d6f14a76-d0c6-f5b9-93bd-2235b3a5383c@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jul 2022 14:26:54 +0100
Message-ID: <CAFEAcA9xpo7i-Wb-kNJp_GqJ3UWRb3DKXjPfrDLKW-680swQdA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] ui/cocoa: Run qemu_init in the main thread
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Fri, 15 Jul 2022 at 14:19, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>
> On 2022/07/15 22:10, Peter Maydell wrote:
> > On Fri, 15 Jul 2022 at 12:40, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
> >>
> >> This work is based on:
> >> https://patchew.org/QEMU/20220317125534.38706-1-philippe.mathieu.daude@gmail.com/
> >>
> >> Simplify the initialization dance by running qemu_init() in the main
> >> thread before the Cocoa event loop starts. The secondary thread only
> >> runs only qemu_main_loop() and qemu_cleanup().
> >>
> >> This fixes a case where addRemovableDevicesMenuItems() calls
> >> qmp_query_block() while expecting the main thread to still hold
> >> the BQL.
> >>
> >> Overriding the code after calling qemu_init() is done by dynamically
> >> replacing a function pointer variable, qemu_main when initializing
> >> ui/cocoa, which unifies the static implementation of main() for
> >> builds with ui/cocoa and ones without ui/cocoa.
> >>
> >> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> >
> >> @@ -585,7 +583,7 @@ - (void) updateUIInfo
> >>           /*
> >>            * Don't try to tell QEMU about UI information in the application
> >>            * startup phase -- we haven't yet registered dcl with the QEMU UI
> >> -         * layer, and also trying to take the iothread lock would deadlock.
> >> +         * layer.
> >>            * When cocoa_display_init() does register the dcl, the UI layer
> >>            * will call cocoa_switch(), which will call updateUIInfo, so
> >>            * we don't lose any information here.
> >
> > This comment says that we can't use the dcl while allow_events is false...
> >
> >> @@ -778,16 +776,6 @@ - (void) handleMonitorInput:(NSEvent *)event
> >>
> >>   - (bool) handleEvent:(NSEvent *)event
> >>   {
> >> -    if(!allow_events) {
> >> -        /*
> >> -         * Just let OSX have all events that arrive before
> >> -         * applicationDidFinishLaunching.
> >> -         * This avoids a deadlock on the iothread lock, which cocoa_display_init()
> >> -         * will not drop until after the app_started_sem is posted. (In theory
> >> -         * there should not be any such events, but OSX Catalina now emits some.)
> >> -         */
> >> -        return false;
> >> -    }
> >
> > ...so don't we want to also retain this check of allow_events ?
> > Much of the code in handleEventLocked assumes the dcl has been registered.
> >
> >>       return bool_with_iothread_lock(^{
> >>           return [self handleEventLocked:event];
> >>       });
> >
> >> @@ -1915,92 +1898,35 @@ static void cocoa_clipboard_request(QemuClipboardInfo *info,
> >>   /*
> >>    * The startup process for the OSX/Cocoa UI is complicated, because
> >>    * OSX insists that the UI runs on the initial main thread, and so we
> >> - * need to start a second thread which runs the vl.c qemu_main():
> >> - *
> >> - * Initial thread:                    2nd thread:
> >> - * in main():
> >> - *  create qemu-main thread
> >> - *  wait on display_init semaphore
> >> - *                                    call qemu_main()
> >> - *                                    ...
> >> - *                                    in cocoa_display_init():
> >> - *                                     post the display_init semaphore
> >> - *                                     wait on app_started semaphore
> >> - *  create application, menus, etc
> >> - *  enter OSX run loop
> >> - * in applicationDidFinishLaunching:
> >> - *  post app_started semaphore
> >> - *                                     tell main thread to fullscreen if needed
> >> - *                                    [...]
> >> - *                                    run qemu main-loop
> >> - *
> >> - * We do this in two stages so that we don't do the creation of the
> >> - * GUI application menus and so on for command line options like --help
> >> - * where we want to just print text to stdout and exit immediately.
> >
> > Could we have an updated version of this diagram that explains the
> > new startup process, please ?
>
> I don't think the diagram is appropriate anymore. It was necessary to
> describe the synchronization between the initial thread and the second
> thread, but they do no longer synchronize at all.

But there are still two threads, and the sequence of events is
not exactly obvious given that things happen in several different
functions. A summary of the expected sequence of events during
startup is still useful to have, I think.

thanks
-- PMM

