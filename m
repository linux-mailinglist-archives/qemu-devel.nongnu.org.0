Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2C0660558
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 18:10:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDqD1-0000s4-7q; Fri, 06 Jan 2023 12:08:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pDqCy-0000qx-OJ
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 12:08:44 -0500
Received: from mailout12.t-online.de ([194.25.134.22])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pDqCw-0006jl-IS
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 12:08:44 -0500
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
 by mailout12.t-online.de (Postfix) with SMTP id 21B736654;
 Fri,  6 Jan 2023 18:08:38 +0100 (CET)
Received: from [192.168.211.200] ([93.236.159.46]) by fwd75.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pDqCr-4Iggnh0; Fri, 6 Jan 2023 18:08:37 +0100
Message-ID: <81541fc4-6ca7-8949-893a-c765a648b562@t-online.de>
Date: Fri, 6 Jan 2023 18:08:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH] .gitlab-ci.d/windows: Work-around timeout and OpenGL
 problems of the MSYS2 jobs
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
References: <20230104123559.277586-1-thuth@redhat.com>
Content-Language: en-US
In-Reply-To: <20230104123559.277586-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1673024917-2FFFE535-A0DC2CA1/0/0 CLEAN NORMAL
X-TOI-MSGID: 014f0a01-4d42-4fc7-8278-c1265a30413d
Received-SPF: none client-ip=194.25.134.22; envelope-from=vr_qemu@t-online.de;
 helo=mailout12.t-online.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-2.939, RCVD_IN_BL_SPAMCOP_NET=1.347, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 04.01.23 um 13:35 schrieb Thomas Huth:
> The windows jobs (especially the 32-bit job) recently started to
> hit the timeout limit. Bump it a little bit to ease the situation
> (80 minutes is quite long already - OTOH, these jobs do not have to
> wait for a job from the container stage to finish, so this should
> still be OK).
>
> Additionally, some update on the container side recently enabled
> OpenGL in these jobs - but the corresponding code fails to compile.
> Thus disable OpenGL here for the time being until someone figured
> out the proper fix in the shader code for this.

This is strange. On my Windows msys2 system, I didn't even notice the 
OpenGL code was silently enabled. The code compiles without issues. 
Today I enabled the GtkGLArea code initialization in ui/gtk.c to test 
OpenGL acceleration on Windows.

 >--- a/ui/gtk.c
 >+++ b/ui/gtk.c
 >@@ -2435,6 +2435,12 @@ static void 
early_gtk_display_init(DisplayOptions *opts)
 >             gtk_use_gl_area = true;
 >             gtk_gl_area_init();
 >         } else
 >+#endif
 >+#if defined(GDK_WINDOWING_WIN32)
 >+        if (GDK_IS_WIN32_DISPLAY(gdk_display_get_default())) {
 >+            gtk_use_gl_area = true;
 >+            gtk_gl_area_init();
 >+        } else
 > #endif
 >         {
 > #ifdef CONFIG_X11

Well, it's a start. On a Linux guest system the WebGL Aquarium frame 
rate increased from 6fps to 14fps while the host processor load went 
down from 100% to 65%.

QEMU was started with:
./qemu-system-x86_64.exe -accel whpx \
-machine pc,usb=off,vmport=off,kernel-irqchip=off \
-cpu Skylake-Client-v4,tsc-deadline=off,x2apic=off \
-smp 4,sockets=1,cores=4,threads=1 \
-device virtio-vga-gl,xres=1280,yres=768,bus=pci.0 \
-display gtk,zoom-to-fit=off,gl=on \
-trace "gd_gl_area_*_context" \
...

This is the start of the QEMU log file:
Windows Hypervisor Platform accelerator is operational
qemu: GtkGLArea console lacks DMABUF support.
Realize gdk gl context failed: Unable to create a GL context
Realize gdk gl context failed: Unable to create a GL context
gd_gl_area_create_context ctx=000002934703bc10, major=4, minor=4
gl_version 44 - core profile enabled
gd_gl_area_destroy_context ctx=000002934703bc10, 
current_ctx=000002934703bc10
gd_gl_area_create_context ctx=000002934703bc10, major=4, minor=4
gd_gl_area_create_context ctx=000002934703bba0, major=4, minor=4
gd_gl_area_create_context ctx=000002934703bb30, major=4, minor=4
GLSL feature level 440
gd_gl_area_create_context ctx=000002934703b890, major=4, minor=4
gd_gl_area_create_context ctx=000002934703bc80, major=4, minor=4
gd_gl_area_create_context ctx=000002934703bcf0, major=4, minor=4
gd_gl_area_destroy_context ctx=000002934703bcf0, 
current_ctx=000002934703bcf0
...

With best regards,
Volker

> Signed-off-by: Thomas Huth<thuth@redhat.com>
> ---

