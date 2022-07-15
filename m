Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A88DF57629C
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 15:12:58 +0200 (CEST)
Received: from localhost ([::1]:37868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCL7p-00059y-Ak
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 09:12:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oCL69-0003Wq-3D
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 09:11:14 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:35427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oCL65-0000SE-TR
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 09:11:12 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id e69so8381801ybh.2
 for <qemu-devel@nongnu.org>; Fri, 15 Jul 2022 06:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/0l2vfsppxHeE5phI4KUG02NY9Kg2kcm6M5MKnn0m3g=;
 b=jKCcfyUZuPRNsMNScVyF0ftoZs4pZhiJvyy651Bo2gDC1+/WVYZ9U/XsqRHgSpu7ib
 V6PV3fXrswA00WaKO2Nz8cezgUnwHEShGgX4z5FlOjJ6d0BDDt05T9kiY3bD6+mNhu6A
 m8GSWw6vm8l5XIwQllTK4j7wcrqik80MuQPTJwtF471ib5hMKHdL4ZUa2sxZj735nAIV
 uHQTZm+2Hzko8fpfwQfFrVPNzmYJmMbZgszGRj3LgVZbnaQMEARW99jawYD8PtShwh2V
 4V3DW4Tl2suiNO44qYDuBq5n6LZOZpxSO5HTV2u6FRXiS58pnwJd1/ftoPVqRFtFNq4Y
 uItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/0l2vfsppxHeE5phI4KUG02NY9Kg2kcm6M5MKnn0m3g=;
 b=5hI7xGj/uP8Hb2vrzqIkQHy2kp8Gk3x5Xn5pg5dYI7hFxO52g/yAIg4O2xDmEHB2v4
 00o8pirwVytb7iz0mW67ClvOeAr4pPG+1BvFhnLOWWmOGabbir0o2PUBboQgtnOfcVYD
 YhJLUJZ5dKpnGjBy/XzRDY/Q9lyV6Yvi4L8dcoljLqztzkZVsBVdO0JX36A2yDw9R6Wl
 FjWpkV0IrUFFuvXPYHKJSTa3NlJrPAOKLP26Ce2AeB1RLfhMP4WVW0CaPqCI2MZKmiaz
 M1aSr92IwUqg+Lgmv5ZPk6n3ZNoWbiAWVfZ/cN3h+GwGOuhxMTZWPcRxvnM9RrYoy8qu
 kVcg==
X-Gm-Message-State: AJIora/cJeW3YNqZoSOZswBteN2GQTV2GLCcfVD6lpxC4+Wt9z1204/X
 iofG2SQB8f+jyakrWcCY767Yg1IjzoRDXlQK5hMVkA==
X-Google-Smtp-Source: AGRyM1vliDwrt9ZoA7L24eT0pFIUPrgqHt+BswqhmtPSclouQP560577hQNY4AdjiMhEl9DI9cnT4GlYi0x5VxKcnqA=
X-Received: by 2002:a25:d381:0:b0:66e:2943:1c9d with SMTP id
 e123-20020a25d381000000b0066e29431c9dmr13558844ybf.67.1657890668028; Fri, 15
 Jul 2022 06:11:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220715114039.59790-1-akihiko.odaki@gmail.com>
 <20220715114039.59790-2-akihiko.odaki@gmail.com>
In-Reply-To: <20220715114039.59790-2-akihiko.odaki@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jul 2022 14:10:29 +0100
Message-ID: <CAFEAcA96_AX=UDrY=69kaSLvh+8DsEjzpkt=maL5r-O4e1wH5g@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] ui/cocoa: Run qemu_init in the main thread
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
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

On Fri, 15 Jul 2022 at 12:40, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>
> This work is based on:
> https://patchew.org/QEMU/20220317125534.38706-1-philippe.mathieu.daude@gmail.com/
>
> Simplify the initialization dance by running qemu_init() in the main
> thread before the Cocoa event loop starts. The secondary thread only
> runs only qemu_main_loop() and qemu_cleanup().
>
> This fixes a case where addRemovableDevicesMenuItems() calls
> qmp_query_block() while expecting the main thread to still hold
> the BQL.
>
> Overriding the code after calling qemu_init() is done by dynamically
> replacing a function pointer variable, qemu_main when initializing
> ui/cocoa, which unifies the static implementation of main() for
> builds with ui/cocoa and ones without ui/cocoa.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>

> @@ -585,7 +583,7 @@ - (void) updateUIInfo
>          /*
>           * Don't try to tell QEMU about UI information in the application
>           * startup phase -- we haven't yet registered dcl with the QEMU UI
> -         * layer, and also trying to take the iothread lock would deadlock.
> +         * layer.
>           * When cocoa_display_init() does register the dcl, the UI layer
>           * will call cocoa_switch(), which will call updateUIInfo, so
>           * we don't lose any information here.

This comment says that we can't use the dcl while allow_events is false...

> @@ -778,16 +776,6 @@ - (void) handleMonitorInput:(NSEvent *)event
>
>  - (bool) handleEvent:(NSEvent *)event
>  {
> -    if(!allow_events) {
> -        /*
> -         * Just let OSX have all events that arrive before
> -         * applicationDidFinishLaunching.
> -         * This avoids a deadlock on the iothread lock, which cocoa_display_init()
> -         * will not drop until after the app_started_sem is posted. (In theory
> -         * there should not be any such events, but OSX Catalina now emits some.)
> -         */
> -        return false;
> -    }

...so don't we want to also retain this check of allow_events ?
Much of the code in handleEventLocked assumes the dcl has been registered.

>      return bool_with_iothread_lock(^{
>          return [self handleEventLocked:event];
>      });

> @@ -1915,92 +1898,35 @@ static void cocoa_clipboard_request(QemuClipboardInfo *info,
>  /*
>   * The startup process for the OSX/Cocoa UI is complicated, because
>   * OSX insists that the UI runs on the initial main thread, and so we
> - * need to start a second thread which runs the vl.c qemu_main():
> - *
> - * Initial thread:                    2nd thread:
> - * in main():
> - *  create qemu-main thread
> - *  wait on display_init semaphore
> - *                                    call qemu_main()
> - *                                    ...
> - *                                    in cocoa_display_init():
> - *                                     post the display_init semaphore
> - *                                     wait on app_started semaphore
> - *  create application, menus, etc
> - *  enter OSX run loop
> - * in applicationDidFinishLaunching:
> - *  post app_started semaphore
> - *                                     tell main thread to fullscreen if needed
> - *                                    [...]
> - *                                    run qemu main-loop
> - *
> - * We do this in two stages so that we don't do the creation of the
> - * GUI application menus and so on for command line options like --help
> - * where we want to just print text to stdout and exit immediately.

Could we have an updated version of this diagram that explains the
new startup process, please ?

> + * need to start a second thread which runs the qemu_default_main().
>   */

Otherwise this looks good, and it's nice to get rid of that redefine-main
hack.

thanks
-- PMM

