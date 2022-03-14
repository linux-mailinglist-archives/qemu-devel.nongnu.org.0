Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D330D4D8E96
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 22:14:19 +0100 (CET)
Received: from localhost ([::1]:58402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTs1C-0007hJ-Gr
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 17:14:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nTs0O-0006zw-MP
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 17:13:28 -0400
Received: from [2607:f8b0:4864:20::e36] (port=33421
 helo=mail-vs1-xe36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nTs0M-0007vF-Tz
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 17:13:28 -0400
Received: by mail-vs1-xe36.google.com with SMTP id u82so18687695vsu.0
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 14:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TPGS/CVPTypA1s7HGeI6UZWnewrqcghwfxt3eZ6AV9w=;
 b=c/wPdmrPl4QfgaQWaA4a3cE3YFNT5aZ5u/PrB+w+SpDr9BnFHyt8Te6mwIPk7LL5B5
 Hz+ZNzuNwGfPipBEOev6wgxcZkpQv6QGzDstXW+7me1666ddjMy87kYeX5RIAGKJkAIr
 vShrLyGRqjpBmgguxuVsUfjJ/z/Dh7aIL5QlEz/cDum4HIlRUofiNMQScMmJZ3A0kGgt
 sE2t4J90fGpel8WEy/A2F4/959XNIgsE0kGKeqOO5DfjiS/eDxEJpIXCnncImV/W7ibO
 ByL32mkRY+5gReVQ9AljwCwqtx1JDr6r7rPPUYiZcyVrpfTBR0r2Rw8aShszvsp6ZeXT
 mnWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TPGS/CVPTypA1s7HGeI6UZWnewrqcghwfxt3eZ6AV9w=;
 b=W46nC/t7ztxO6kTQvs10r84Ab5i09Tz9VkrbOX8ma83O+iWaRblb0HAqxk9UYD2u8r
 ktjpKFnJC1zkaerm0xarjHojF06KU2IiRgtMa+6WrbiCQHZ9xeLkseG+XrL8N3UTZ4oR
 Bj6q1vb8lWnBTQR4/e7Xms0X9+F9hVpGOVC4malnXfQ+f5Zdi3Uy4DuEl+qmN/rEUfdj
 koKQ6Z5msyVX1tklYeTFeW+gxJ9KMSbFUUjhtm3sqv23aN5BEGJFM1fA/D8Mxi8BbrVw
 /+nM9fnYWzQsuirPgOjkB2gtQHYzrpecR94ghjRBVG12i0K7p/SAZpfRS+iZsnQSphKl
 746g==
X-Gm-Message-State: AOAM5330LwxHk0GQM9yV0lzfsrtVyDgbhvOwnP4QLJ1RSg/G7JIBulK8
 NPtZm9E8JkNQoqfZtiRv54+xuMPFR/KnwmPvL3kGXw==
X-Google-Smtp-Source: ABdhPJzZ9ePynYIU4LtBBX6J6vhdQpCCI+wwhpzTglBqaI+JJkeVwk3shTw6wWBz4GfB7bCZ/IlpuHvCrAJ7qK56Wm4=
X-Received: by 2002:a67:bb1a:0:b0:322:c24e:d557 with SMTP id
 m26-20020a67bb1a000000b00322c24ed557mr6562255vsn.46.1647292404448; Mon, 14
 Mar 2022 14:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220314211158.4053690-1-venture@google.com>
In-Reply-To: <20220314211158.4053690-1-venture@google.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 14 Mar 2022 14:13:13 -0700
Message-ID: <CAO=notx9xx9suhVMq=c0mu_1McPr5mHK5qr6R4se63T3gyLCGQ@mail.gmail.com>
Subject: Re: [PATCH] hw/nvram: Add at24c-eeprom support for small eeproms
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Corey Minyard <cminyard@mvista.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>
Content-Type: multipart/alternative; boundary="0000000000009c277505da3426c0"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::e36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::e36;
 envelope-from=venture@google.com; helo=mail-vs1-xe36.google.com
X-Spam_score_int: -161
X-Spam_score: -16.2
X-Spam_bar: ----------------
X-Spam_report: (-16.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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

--0000000000009c277505da3426c0
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 14, 2022 at 2:12 PM Patrick Venture <venture@google.com> wrote:

> Tested: Verified at24c02 driver happy and contents matched
> expectations.
>
> Signed-off-by: Patrick Venture <venture@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> ---
>  hw/nvram/eeprom_at24c.c | 52 +++++++++++++++++++++++++++--------------
>  1 file changed, 35 insertions(+), 17 deletions(-)
>
> diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
> index 01a3093600..abf9898f94 100644
> --- a/hw/nvram/eeprom_at24c.c
> +++ b/hw/nvram/eeprom_at24c.c
> @@ -45,6 +45,8 @@ struct EEPROMState {
>      bool changed;
>      /* during WRITE, # of address bytes transfered */
>      uint8_t haveaddr;
> +    /* whether it's 8-bit addressed or 16-bit */
> +    bool eightbit;
>
>      uint8_t *mem;
>
> @@ -85,7 +87,7 @@ uint8_t at24c_eeprom_recv(I2CSlave *s)
>      EEPROMState *ee = AT24C_EE(s);
>      uint8_t ret;
>
> -    if (ee->haveaddr == 1) {
> +    if (ee->haveaddr == 1 && !ee->eightbit) {
>          return 0xff;
>      }
>
> @@ -102,26 +104,35 @@ int at24c_eeprom_send(I2CSlave *s, uint8_t data)
>  {
>      EEPROMState *ee = AT24C_EE(s);
>
> -    if (ee->haveaddr < 2) {
> -        ee->cur <<= 8;
> -        ee->cur |= data;
> +    if (ee->haveaddr < 1) {
> +        ee->cur = data;
>          ee->haveaddr++;
> -        if (ee->haveaddr == 2) {
> -            ee->cur %= ee->rsize;
> +        if (ee->eightbit) {
>              DPRINTK("Set pointer %04x\n", ee->cur);
>          }
> +        return 0;
> +    } else if (ee->haveaddr < 2) {
> +        if (!ee->eightbit) {
> +            ee->cur <<= 8;
> +            ee->cur |= data;
> +            ee->haveaddr++;
> +            if (ee->haveaddr == 2) {
> +                ee->cur %= ee->rsize;
> +                DPRINTK("Set pointer %04x\n", ee->cur);
> +            }
>
> -    } else {
> -        if (ee->writable) {
> -            DPRINTK("Send %02x\n", data);
> -            ee->mem[ee->cur] = data;
> -            ee->changed = true;
> -        } else {
> -            DPRINTK("Send error %02x read-only\n", data);
> +            return 0;
>          }
> -        ee->cur = (ee->cur + 1u) % ee->rsize;
> +    }
>
> +    if (ee->writable) {
> +        DPRINTK("Send %02x\n", data);
> +        ee->mem[ee->cur] = data;
> +        ee->changed = true;
> +    } else {
> +        DPRINTK("Send error %02x read-only\n", data);
>      }
> +    ee->cur = (ee->cur + 1u) % ee->rsize;
>
>      return 0;
>  }
> @@ -131,12 +142,16 @@ static void at24c_eeprom_realize(DeviceState *dev,
> Error **errp)
>      EEPROMState *ee = AT24C_EE(dev);
>
>      if (ee->blk) {
> +        /* blk length is a minimum of 1 sector. */
>          int64_t len = blk_getlength(ee->blk);
>
>          if (len != ee->rsize) {
> -            error_setg(errp, "%s: Backing file size %" PRId64 " != %u",
> -                       TYPE_AT24C_EE, len, ee->rsize);
> -            return;
> +            /* for the at24c01 and at24c02, they are smaller than a
> sector. */
> +            if (ee->rsize >= BDRV_SECTOR_SIZE) {
> +                error_setg(errp, "%s: Backing file size %" PRId64 " !=
> %u",
> +                           TYPE_AT24C_EE, len, ee->rsize);
> +                return;
> +            }
>          }
>
>          if (blk_set_perm(ee->blk, BLK_PERM_CONSISTENT_READ |
> BLK_PERM_WRITE,
> @@ -148,6 +163,9 @@ static void at24c_eeprom_realize(DeviceState *dev,
> Error **errp)
>          }
>      }
>
> +    if (ee->rsize < 512) {
> +        ee->eightbit = true;
> +    }
>

Why 512?  The eeprom sizes for the parts seem to grow exponentially, so c01
is 128, then c02 is 256, then 512.  So I check for the two smaller
effectively.  Might warrant a comment.


>      ee->mem = g_malloc0(ee->rsize);
>  }
>
> --
> 2.35.1.723.g4982287a31-goog
>
>

--0000000000009c277505da3426c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 14, 2022 at 2:12 PM Patri=
ck Venture &lt;<a href=3D"mailto:venture@google.com">venture@google.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Test=
ed: Verified at24c02 driver happy and contents matched<br>
expectations.<br>
<br>
Signed-off-by: Patrick Venture &lt;<a href=3D"mailto:venture@google.com" ta=
rget=3D"_blank">venture@google.com</a>&gt;<br>
Reviewed-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" target=3D"_b=
lank">wuhaotsh@google.com</a>&gt;<br>
---<br>
=C2=A0hw/nvram/eeprom_at24c.c | 52 +++++++++++++++++++++++++++-------------=
-<br>
=C2=A01 file changed, 35 insertions(+), 17 deletions(-)<br>
<br>
diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c<br>
index 01a3093600..abf9898f94 100644<br>
--- a/hw/nvram/eeprom_at24c.c<br>
+++ b/hw/nvram/eeprom_at24c.c<br>
@@ -45,6 +45,8 @@ struct EEPROMState {<br>
=C2=A0 =C2=A0 =C2=A0bool changed;<br>
=C2=A0 =C2=A0 =C2=A0/* during WRITE, # of address bytes transfered */<br>
=C2=A0 =C2=A0 =C2=A0uint8_t haveaddr;<br>
+=C2=A0 =C2=A0 /* whether it&#39;s 8-bit addressed or 16-bit */<br>
+=C2=A0 =C2=A0 bool eightbit;<br>
<br>
=C2=A0 =C2=A0 =C2=A0uint8_t *mem;<br>
<br>
@@ -85,7 +87,7 @@ uint8_t at24c_eeprom_recv(I2CSlave *s)<br>
=C2=A0 =C2=A0 =C2=A0EEPROMState *ee =3D AT24C_EE(s);<br>
=C2=A0 =C2=A0 =C2=A0uint8_t ret;<br>
<br>
-=C2=A0 =C2=A0 if (ee-&gt;haveaddr =3D=3D 1) {<br>
+=C2=A0 =C2=A0 if (ee-&gt;haveaddr =3D=3D 1 &amp;&amp; !ee-&gt;eightbit) {<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0xff;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -102,26 +104,35 @@ int at24c_eeprom_send(I2CSlave *s, uint8_t data)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0EEPROMState *ee =3D AT24C_EE(s);<br>
<br>
-=C2=A0 =C2=A0 if (ee-&gt;haveaddr &lt; 2) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ee-&gt;cur &lt;&lt;=3D 8;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ee-&gt;cur |=3D data;<br>
+=C2=A0 =C2=A0 if (ee-&gt;haveaddr &lt; 1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ee-&gt;cur =3D data;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ee-&gt;haveaddr++;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ee-&gt;haveaddr =3D=3D 2) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ee-&gt;cur %=3D ee-&gt;rsize;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ee-&gt;eightbit) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DPRINTK(&quot;Set pointer %=
04x\n&quot;, ee-&gt;cur);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 } else if (ee-&gt;haveaddr &lt; 2) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!ee-&gt;eightbit) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ee-&gt;cur &lt;&lt;=3D 8;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ee-&gt;cur |=3D data;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ee-&gt;haveaddr++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ee-&gt;haveaddr =3D=3D 2) {<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ee-&gt;cur %=3D ee=
-&gt;rsize;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DPRINTK(&quot;Set =
pointer %04x\n&quot;, ee-&gt;cur);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ee-&gt;writable) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DPRINTK(&quot;Send %02x\n&quot;,=
 data);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ee-&gt;mem[ee-&gt;cur] =3D data;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ee-&gt;changed =3D true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DPRINTK(&quot;Send error %02x re=
ad-only\n&quot;, data);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ee-&gt;cur =3D (ee-&gt;cur + 1u) % ee-&gt;rsiz=
e;<br>
+=C2=A0 =C2=A0 }<br>
<br>
+=C2=A0 =C2=A0 if (ee-&gt;writable) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 DPRINTK(&quot;Send %02x\n&quot;, data);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ee-&gt;mem[ee-&gt;cur] =3D data;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ee-&gt;changed =3D true;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 DPRINTK(&quot;Send error %02x read-only\n&quot=
;, data);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 ee-&gt;cur =3D (ee-&gt;cur + 1u) % ee-&gt;rsize;<br>
<br>
=C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
@@ -131,12 +142,16 @@ static void at24c_eeprom_realize(DeviceState *dev, Er=
ror **errp)<br>
=C2=A0 =C2=A0 =C2=A0EEPROMState *ee =3D AT24C_EE(dev);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (ee-&gt;blk) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* blk length is a minimum of 1 sector. */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int64_t len =3D blk_getlength(ee-&gt;blk)=
;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (len !=3D ee-&gt;rsize) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;%s: Backi=
ng file size %&quot; PRId64 &quot; !=3D %u&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0TYPE_AT24C_EE, len, ee-&gt;rsize);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* for the at24c01 and at24c02, =
they are smaller than a sector. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ee-&gt;rsize &gt;=3D BDRV_SE=
CTOR_SIZE) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &=
quot;%s: Backing file size %&quot; PRId64 &quot; !=3D %u&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0TYPE_AT24C_EE, len, ee-&gt;rsize);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (blk_set_perm(ee-&gt;blk, BLK_PERM_CON=
SISTENT_READ | BLK_PERM_WRITE,<br>
@@ -148,6 +163,9 @@ static void at24c_eeprom_realize(DeviceState *dev, Erro=
r **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 if (ee-&gt;rsize &lt; 512) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ee-&gt;eightbit =3D true;<br>
+=C2=A0 =C2=A0 }<br></blockquote><div><br></div><div>Why 512?=C2=A0 The eep=
rom sizes for the parts seem to grow exponentially, so c01 is 128, then c02=
 is 256, then 512.=C2=A0 So I check for the two smaller effectively.=C2=A0 =
Might warrant a comment.</div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0ee-&gt;mem =3D g_malloc0(ee-&gt;rsize);<br>
=C2=A0}<br>
<br>
-- <br>
2.35.1.723.g4982287a31-goog<br>
<br>
</blockquote></div></div>

--0000000000009c277505da3426c0--

