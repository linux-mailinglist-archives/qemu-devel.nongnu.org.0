Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2066B693703
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 12:33:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRAZu-0002ak-BR; Sun, 12 Feb 2023 06:31:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hc981@poolhem.se>) id 1pRAZr-0002aL-Pl
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 06:31:27 -0500
Received: from mailout12.inleed.net ([2a0b:dc80:cafe:112::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hc981@poolhem.se>) id 1pRAZo-0003p0-VB
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 06:31:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=poolhem.se; 
 s=x;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
 In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xkCFxC6JU02zMDn5EHGLV+ztJVNOCZS/pi0OC+pqrsw=; b=SFVhCNJ68/vgEpr4wn1dg2tEUJ
 DzEm5ecSuo7+EHUDIpaFug0phSfk+uA785tMUi2Hvkijua6CS1jsHztaxsEPvf/+1i+vEvMvYku4p
 l1fTguV5C/6Q3vgwKEiSx42skH9fNjBWtPQSsZdFHWd7KToxcBzYl6e0oJZ2JerV6Y38h8Z22FfFP
 UVfxXiUePa8oAOl0psOmBX2ljojDknjJx288zdnJRTrXWFqHosKYxykqceR3toqPDr3z/9oj9S6nl
 5yxjM5GlJjjVvwrbmzrH/PxQBUBpZreTm3LC2L5T3iZLTA0pDvt+jFUC/+U97Rva9dMA1gmM2yGX5
 iLidJKqw==;
Received: from [213.115.245.47] (helo=balrog.lkp.se)
 by ns12.inleed.net with esmtpa (Exim 4.96)
 (envelope-from <hc981@poolhem.se>) id 1pRAZn-0044il-2S;
 Sun, 12 Feb 2023 12:31:23 +0100
Date: Sun, 12 Feb 2023 12:31:09 +0100
From: Henrik Carlqvist <hc981@poolhem.se>
To: Henrik Carlqvist <hc981@poolhem.se>
Cc: mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org,
 pbonzini@redhat.com, atar4qemu@gmail.com, marcandre.lureau@redhat.com
Subject: Ping [PATCH v5] Emulate dip switch language layout settings on SUN
 keyboard
Message-Id: <20230212123109.5c869840.hc981@poolhem.se>
In-Reply-To: <20230114153853.76b68899.hc94@poolhem.se>
References: <20230114125029.7395a547.hc981@poolhem.se>
 <20230114153853.76b68899.hc94@poolhem.se>
X-Mailer: Sylpheed version 0.9.7 (GTK+ 1.2.10; i686-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authenticated-Id: henrik@poolhem.se
Received-SPF: none client-ip=2a0b:dc80:cafe:112::1;
 envelope-from=hc981@poolhem.se; helo=mailout12.inleed.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Would you please consider this patch or let me know if you want me to somehow
update it before it can be accepted?

Best regards Henrik

On Sat, 14 Jan 2023 15:38:53 +0100
Henrik Carlqvist <hc94@poolhem.se> wrote:

> https://patchew.org/QEMU/20230114125029.7395a547.hc981@poolhem.se/ 
> complains that "patch is empty", so here is my fifth attempt...
> 
> regards Henrik
> 
> SUN Type 4, 5 and 5c keyboards have dip switches to choose the language
> layout of the keyboard. Solaris makes an ioctl to query the value of the
> dipswitches and uses that value to select keyboard layout. Also the SUN
> bios like the one in the file ss5.bin uses this value to support at least
> some keyboard layouts. However, the OpenBIOS provided with qemu is
> hardcoded to always use an US keyboard layout.
> 
> Before this patch, qemu allways gave dip switch value 0x21 (US keyboard),
> this patch uses the command line switch "-k" (keyboard layout) to select
> dip switch value. A table is used to lookup values from arguments like:
> 
> -k fr
> -k es
> 
> But the patch also accepts numeric dip switch values directly to the -k
> switch:
> 
> -k 0x2b
> -k 43
> 
> Both values above are the same and select swedish keyboard as explained in
> table 3-15 at
> https://docs.oracle.com/cd/E19683-01/806-6642/new-43/index.html
> 
> Unless you want to do a full Solaris installation but happen to have
> access to a bios file, the easiest way to test that the patch works is to:
> 
> qemu-system-sparc -k sv -bios /path/to/ss5.bin
> 
> If you already happen to have a Solaris installation in a qemu disk image
> file you can easily try different keyboard layouts after this patch is
> applied.
> 
> Signed-off-by: Henrik Carlqvist <hc1245@poolhem.se>
> ---
>  hw/char/escc.c | 74 +++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 73 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/char/escc.c b/hw/char/escc.c
> index 17a908c59b..53022ccf39 100644
> --- a/hw/char/escc.c
> +++ b/hw/char/escc.c
> @@ -31,6 +31,8 @@
>  #include "qemu/module.h"
>  #include "hw/char/escc.h"
>  #include "ui/console.h"
> +#include "sysemu/sysemu.h"
> +#include "qemu/cutils.h"
>  #include "trace.h"
>  
>  /*
> @@ -190,6 +192,7 @@
>  #define R_MISC1I 14
>  #define R_EXTINT 15
>  
> +static unsigned char sun_keyboard_layout_dip_switch(void);
>  static void handle_kbd_command(ESCCChannelState *s, int val);
>  static int serial_can_receive(void *opaque);
>  static void serial_receive_byte(ESCCChannelState *s, int ch);
> @@ -846,6 +849,75 @@ static QemuInputHandler sunkbd_handler = {
>      .event = sunkbd_handle_event,
>  };
>  
> +static unsigned char sun_keyboard_layout_dip_switch(void)
> +{
> +    /* Return the value of the dip-switches in a SUN Type 5 keyboard */
> +    static unsigned char ret = 0xff;
> +
> +    if ((ret == 0xff) && keyboard_layout) {
> +        int i;
> +        struct layout_values {
> +            const char *lang;
> +            unsigned char dip;
> +        } languages[] =
> +    /* Dip values from table 3-16 Layouts for Type 4, 5, and 5c Keyboards
> */+            {
> +                {"en-us", 0x21}, /* U.S.A. (US5.kt) */
> +                                 /* 0x22 is some other US (US_UNIX5.kt)*/
> +                {"fr",    0x23}, /* France (France5.kt) */
> +                {"da",    0x24}, /* Denmark (Denmark5.kt) */
> +                {"de",    0x25}, /* Germany (Germany5.kt) */
> +                {"it",    0x26}, /* Italy (Italy5.kt) */
> +                {"nl",    0x27}, /* The Netherlands (Netherland5.kt) */
> +                {"no",    0x28}, /* Norway (Norway.kt) */
> +                {"pt",    0x29}, /* Portugal (Portugal5.kt) */
> +                {"es",    0x2a}, /* Spain (Spain5.kt) */
> +                {"sv",    0x2b}, /* Sweden (Sweden5.kt) */
> +                {"fr-ch", 0x2c}, /* Switzerland/French (Switzer_Fr5.kt) */
> +                {"de-ch", 0x2d}, /* Switzerland/German (Switzer_Ge5.kt) */
> +                {"en-gb", 0x2e}, /* Great Britain (UK5.kt) */
> +                {"ko",    0x2f}, /* Korea (Korea5.kt) */
> +                {"tw",    0x30}, /* Taiwan (Taiwan5.kt) */
> +                {"ja",    0x31}, /* Japan (Japan5.kt) */
> +                {"fr-ca", 0x32}, /* Canada/French (Canada_Fr5.kt) */
> +                {"hu",    0x33}, /* Hungary (Hungary5.kt) */
> +                {"pl",    0x34}, /* Poland (Poland5.kt) */
> +                {"cz",    0x35}, /* Czech (Czech5.kt) */
> +                {"ru",    0x36}, /* Russia (Russia5.kt) */
> +                {"lv",    0x37}, /* Latvia (Latvia5.kt) */
> +                {"tr",    0x38}, /* Turkey-Q5 (TurkeyQ5.kt) */
> +                {"gr",    0x39}, /* Greece (Greece5.kt) */
> +                {"ar",    0x3a}, /* Arabic (Arabic5.kt) */
> +                {"lt",    0x3b}, /* Lithuania (Lithuania5.kt) */
> +                {"nl-be", 0x3c}, /* Belgium (Belgian5.kt) */
> +                {"be",    0x3c}, /* Belgium (Belgian5.kt) */
> +            };
> +
> +        for (i = 0;
> +             i < sizeof(languages) / sizeof(struct layout_values);
> +             i++) {
> +            if (!strcmp(keyboard_layout, languages[i].lang)) {
> +                ret = languages[i].dip;
> +                return ret;
> +            }
> +        }
> +        /* Found no known language code */
> +
> +        if ((keyboard_layout[0] >= '0') && (keyboard_layout[0] <= '9')) {
> +            unsigned int tmp;
> +            /* As a fallback we also accept numeric dip switch value */
> +            if (!qemu_strtoui(keyboard_layout, NULL, 0, &tmp)) {
> +                ret = (unsigned char)tmp;
> +            }
> +        }
> +    }
> +    if (ret == 0xff) {
> +        /* Final fallback if keyboard_layout was not set or recognized */
> +        ret = 0x21; /* en-us layout */
> +    }
> +    return ret;
> +}
> +
>  static void handle_kbd_command(ESCCChannelState *s, int val)
>  {
>      trace_escc_kbd_command(val);
> @@ -867,7 +939,7 @@ static void handle_kbd_command(ESCCChannelState *s, int
> val)
>      case 0xf:
>          clear_queue(s);
>          put_queue(s, 0xfe);
> -        put_queue(s, 0x21); /*  en-us layout */
> +        put_queue(s, sun_keyboard_layout_dip_switch());
>          break;
>      default:
>          break;
> -- 
> 2.35.1
> 

