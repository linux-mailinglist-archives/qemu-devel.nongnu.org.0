Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 064FF483F07
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 10:19:37 +0100 (CET)
Received: from localhost ([::1]:48476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4fyi-0003lw-4c
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 04:19:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1n4fxa-0002uO-8Y; Tue, 04 Jan 2022 04:18:26 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:43395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1n4fxY-0007ln-GV; Tue, 04 Jan 2022 04:18:25 -0500
Received: from [192.168.100.1] ([82.142.30.62]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M7sQ8-1n0oL12f6A-0050c5; Tue, 04 Jan 2022 10:18:21 +0100
Message-ID: <5be97a9e-8df4-621a-8875-56979448a777@vivier.eu>
Date: Tue, 4 Jan 2022 10:18:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/2] hw/display/vmware_vga: only show debug output if
 DEBUG enabled
Content-Language: fr
To: Carwyn Ellis <carwynellis@gmail.com>, qemu-devel@nongnu.org
References: <20220104091135.61226-1-carwynellis@gmail.com>
 <20220104091135.61226-2-carwynellis@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220104091135.61226-2-carwynellis@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:PMm0EfZLp/+QGDse6+hLAiGZgrLkUXKLytnYDVui8VnDz+/v7re
 amRrwc9TPaZKBYqjS+PwjgNW4wC9Mpvl9CkLk0+9SyTN6581Hh+VBzM788BSx9uevt5qlmO
 RJyOM1RVr6nL2EZ1N70Nf0uwJDDsUXJLYFM8vpS4g1PehgdZ0OyXQ/QfgnNNgosCJvgMiL2
 O6ki2GYjWVIzQWNZsDLIA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BxT/9a5mnVE=:PL6m4t9rfrwN9ij7mLXRXc
 7mzbrLwiXKiGIX6c+J92tKwhSBkyPhEjLUxnwojn80WZ3lXVvjqc7nYkha6ic6qGWJRmTEIAZ
 jx2wfj2Be6jbBpSemoYvIUfzivp+i5caI7qVJaFPg1/29/kros3J/41hymbpmAo8fk06vK81x
 Xnt3h1rxE051KbrKyz0PfcPNiF9op6NnMBcV4Et7UIkmQoXtfVoqt2L/duDcMlQtcsbjyP+r1
 V14TTbbLAXVfHBOnEY0hnjHt2YJnWgQwZE/tBmIfTPaE6TzuH2yIzP/3ju7WgSp8pF/aelTJi
 oHagLRjyzfIBcwHPlku4D7MpIatPkZpUCdVcqSNOohXiMgBkHvq0T0+o4DZZ7M7uZE0Xr9t2E
 rRRmwGZoIBkP/mr1cao/SpK2psrmApguhLVcK6wx2a9xM6ZVDjnnGaC9p9wzX05lWYIZYX73F
 4N1/mwxgnHCmD6Ckif43G5JsGu/OT7pxF6YEOTxljoSqNSFrds4OqHdS5o/CnPhvideMWTjU8
 U3ujq7Lxi3jlhIWxKbcDGYGnRTw7Q2vGBX26pnkaJWFbhJR1zP/JTETlXiq3p5Y7zpjVhBWZ7
 Dw4i5+ycuLrzkNkhxSYe0TFqAu8IZGu2n1mXIt/t/27zhYpASNlBgr26dJqsZtIuSocXUMN/1
 UJ4d3MujfzJ8DqcT7Z3pQsj5rflgxFleyVJ9F5ZrYwlN6TGnfBDIbxs9qEqK9HFD08Tc=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 04/01/2022 à 10:11, Carwyn Ellis a écrit :
> Debug output was always being sent to STDERR. This has been replaced by
> a define that will only show this output when DEBUG is set to true.
> 
> Signed-off-by: Carwyn Ellis <carwynellis@gmail.com>
> ---
>   hw/display/vmware_vga.c | 26 ++++++++++++++++----------
>   1 file changed, 16 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
> index e2969a6c81..8080e085d1 100644
> --- a/hw/display/vmware_vga.c
> +++ b/hw/display/vmware_vga.c
> @@ -43,6 +43,12 @@
>   
>   /* See http://vmware-svga.sf.net/ for some documentation on VMWare SVGA */
>   
> +#ifdef DEBUG
> +#define VMWARE_VGA_DEBUG(...) { (void) fprintf(stdout, __VA_ARGS__); }
> +#else
> +#define VMWARE_VGA_DEBUG(...) ((void) 0)
> +#endif
> +

Could you replace this macro by adding some trace-events instead.

See https://qemu-project.gitlab.io/qemu/devel/tracing.html#using-trace-events

Thanks,
Laurent

>   struct vmsvga_state_s {
>       VGACommonState vga;
>   
> @@ -297,45 +303,45 @@ static inline bool vmsvga_verify_rect(DisplaySurface *surface,
>                                         int x, int y, int w, int h)
>   {
>       if (x < 0) {
> -        fprintf(stderr, "%s: x was < 0 (%d)\n", name, x);
> +        VMWARE_VGA_DEBUG("%s: x was < 0 (%d)\n", name, x);
>           return false;
>       }
>       if (x > SVGA_MAX_WIDTH) {
> -        fprintf(stderr, "%s: x was > %d (%d)\n", name, SVGA_MAX_WIDTH, x);
> +        VMWARE_VGA_DEBUG("%s: x was > %d (%d)\n", name, SVGA_MAX_WIDTH, x);
>           return false;
>       }
>       if (w < 0) {
> -        fprintf(stderr, "%s: w was < 0 (%d)\n", name, w);
> +        VMWARE_VGA_DEBUG("%s: w was < 0 (%d)\n", name, w);
>           return false;
>       }
>       if (w > SVGA_MAX_WIDTH) {
> -        fprintf(stderr, "%s: w was > %d (%d)\n", name, SVGA_MAX_WIDTH, w);
> +        VMWARE_VGA_DEBUG("%s: w was > %d (%d)\n", name, SVGA_MAX_WIDTH, w);
>           return false;
>       }
>       if (x + w > surface_width(surface)) {
> -        fprintf(stderr, "%s: width was > %d (x: %d, w: %d)\n",
> +        VMWARE_VGA_DEBUG("%s: width was > %d (x: %d, w: %d)\n",
>                   name, surface_width(surface), x, w);
>           return false;
>       }
>   
>       if (y < 0) {
> -        fprintf(stderr, "%s: y was < 0 (%d)\n", name, y);
> +        VMWARE_VGA_DEBUG("%s: y was < 0 (%d)\n", name, y);
>           return false;
>       }
>       if (y > SVGA_MAX_HEIGHT) {
> -        fprintf(stderr, "%s: y was > %d (%d)\n", name, SVGA_MAX_HEIGHT, y);
> +        VMWARE_VGA_DEBUG("%s: y was > %d (%d)\n", name, SVGA_MAX_HEIGHT, y);
>           return false;
>       }
>       if (h < 0) {
> -        fprintf(stderr, "%s: h was < 0 (%d)\n", name, h);
> +        VMWARE_VGA_DEBUG("%s: h was < 0 (%d)\n", name, h);
>           return false;
>       }
>       if (h > SVGA_MAX_HEIGHT) {
> -        fprintf(stderr, "%s: h was > %d (%d)\n", name, SVGA_MAX_HEIGHT, h);
> +        VMWARE_VGA_DEBUG("%s: h was > %d (%d)\n", name, SVGA_MAX_HEIGHT, h);
>           return false;
>       }
>       if (y + h > surface_height(surface)) {
> -        fprintf(stderr, "%s: update height > %d (y: %d, h: %d)\n",
> +        VMWARE_VGA_DEBUG("%s: update height > %d (y: %d, h: %d)\n",
>                   name, surface_height(surface), y, h);
>           return false;
>       }


