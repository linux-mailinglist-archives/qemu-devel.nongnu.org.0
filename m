Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5754B5047FA
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 16:09:45 +0200 (CEST)
Received: from localhost ([::1]:43440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng5ax-0008KI-Uv
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 10:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1ng5ZO-0006w4-0O
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 10:08:06 -0400
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c]:35639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1ng5ZL-0005m3-Px
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 10:08:05 -0400
Received: by mail-vs1-xe2c.google.com with SMTP id j16so10712400vsv.2
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 07:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k6J1+z+Y9ZBegRWHsq0pkC45xmhCRx3jWG3U2LqIWZQ=;
 b=mnKnXIjLFiERao1rCOTJHfeoT3dyWTr7T2C1cBMglwLu7VyZoiHkIrmUTBxKEKGcMa
 SAnoLsPVH9dJNqICUEL/09NwEQnlc+rQS06WjjRdGivZZPT4uZYqMbAZzlb83hnJKRId
 D4vUrZUqCX7zqwoK80q18kr8dgLJK9NTpoexir7n4J6qWCG89GA31vLFKWqF0b4D67cs
 Q9p4A6z20RkY2+hDSQuhAg4E+ZmujLth25ODw6cwfYPtj/D8DX2RVsyyOCuAfIulF688
 FZLyJEMVbefk1TLbF252kjq63IFOnWQ1xK4myS1yJf0hN7/bkfMSWkLmX1Jlco53UlT6
 KnvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k6J1+z+Y9ZBegRWHsq0pkC45xmhCRx3jWG3U2LqIWZQ=;
 b=AGPa3KiS9tnxq1XPg7OST0nYkFLg42sSUjwX4xNDxzp28SN95mqlw69rf/G1HY+TYb
 8IhFIICpwxhJwlMt/mAuAAQ8dfqB01YfHQgZHPx4y5obZEa0yVrGq1GyIMhcNDLy85Qs
 78GVnQ7uMayAvNr7N/CF2FatJK8oJ5NTc4anOkmUojqdKRcLX9StVDUg0zDX2hOyCvQO
 G8AgavgMK/fgf0zpcU7rtKoMj29MxEs9LxJ8RQzNJmA85bepw5Q6I9ODbb+qUK/DHcE9
 sJigeQ82Cy+U0Qbh2E0YFbv50v6hG9Ms47Vpu2oy0RjbJ+vEFqrza2Fj4s5GOGv9br3f
 COrg==
X-Gm-Message-State: AOAM533lxhV6JeQ5zGF1/l6pPyCtVokOFqX1YUdPgSdKHYDLNSSVkK+8
 cNNGv8q/HL85iZGLMBQKiKV1emJMeWzWLtMCBnE5oBR1cKRolbK/Y0k=
X-Google-Smtp-Source: ABdhPJxCw9XYKKhIpimtr/CW1VerZa7MQXj78QZ+0BunF8JHzbZVdo4UHM1yWyIWbo95VvaT6JnxsWdZ/Pi+dY7zV/A=
X-Received: by 2002:a05:6a00:1788:b0:508:70fe:4e62 with SMTP id
 s8-20020a056a00178800b0050870fe4e62mr7600386pfg.70.1650203005776; Sun, 17 Apr
 2022 06:43:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220405004621.94982-1-t0rr3sp3dr0@gmail.com>
 <20220417013608.22086-1-yaroshchuk2000@gmail.com>
In-Reply-To: <20220417013608.22086-1-yaroshchuk2000@gmail.com>
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Date: Sun, 17 Apr 2022 16:43:14 +0300
Message-ID: <CADO9X9SdWwKS49NAJDWULg_GxRSoNEhABWhWCBOkD_FwZGgkXw@mail.gmail.com>
Subject: Re: [PATCH v3] hw/misc: applesmc: use host osk as default on macs
To: qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000f7766905dcd9d3df"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2c;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-vs1-xe2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 =?UTF-8?Q?Pedro_To=CC=82rres?= <t0rr3sp3dr0@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Jan Kiszka <jan.kiszka@siemens.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, agraf@suse.de,
 "Gabriel L. Somlo" <gsomlo@gmail.com>, marcandre.lureau@redhat.com,
 rene@exactcode.de, Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.a@redhat.com>,
 Alistair Francis <alistair.francis@xilinx.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 suse@csgraf.de, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Chetan Pant <chetan4windows@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 afaerber@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f7766905dcd9d3df
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I've CCed all the people from previous threads.


> [...]
> +static bool applesmc_read_osk(uint8_t *osk)
> +{
> +#if defined(__APPLE__) && defined(__MACH__)
> +    struct AppleSMCParams {
> +        uint32_t key;
> +        uint8_t __pad0[16];
> +        uint8_t result;
> +        uint8_t __pad1[7];
> +        uint32_t size;
> +        uint8_t __pad2[10];
> +        uint8_t data8;
> +        uint8_t __pad3[5];
> +        uint8_t output[32];
> +    };
> +
> +    io_service_t svc;
> +    io_connect_t conn;
> +    kern_return_t ret;
> +    size_t size =3D sizeof(struct AppleSMCParams);
> +    struct AppleSMCParams params_in =3D { .size =3D 32, .data8 =3D 5 };

Maybe it's better to name this magic number '5'

> +    struct AppleSMCParams params_out =3D {};
> +

params_in and params_out can be the same variable, see
https://patchew.org/QEMU/20211022161448.81579-1-yaroshchuk2000@gmail.com/

> +    svc =3D IOServiceGetMatchingService(0, IOServiceMatching("AppleSMC")=
);
> +    if (svc =3D=3D 0) {
> +        return false;
> +    }
> +
> +    ret =3D IOServiceOpen(svc, mach_task_self(), 0, &conn);
> +    if (ret !=3D 0) {
> +        return false;
> +    }
> +
> +    for (params_in.key =3D 'OSK0'; params_in.key <=3D 'OSK1';
++params_in.key) {
> +        ret =3D IOConnectCallStructMethod(conn, 2, &params_in, size,
&params_out, &size);

Same about this magic number '2'.

> +        if (ret !=3D 0) {
> +            return false;
> +        }
> +
> +        if (params_out.result !=3D 0) {
> +            return false;
> +        }
> +        memcpy(osk, params_out.output, params_in.size);
> +
> +        osk +=3D params_in.size;
> +     }
> +

Cleanup IOServiceClose and IOObjectReturn are not called at the
end of the procedure.

This is also mentioned in Phil Dennis-Jordan's instruction you noted (stage
5):
https://lists.nongnu.org/archive/html/qemu-devel/2021-10/msg02843.html

> +    return true;
> +#else
> +    return false;
> +#endif
> +}
> +
> [...]
>
> static void applesmc_isa_realize(DeviceState *dev, Error **errp)
>  {
>      AppleSMCState *s =3D APPLE_SMC(dev);
> +    bool valid_osk =3D false;
>
>      memory_region_init_io(&s->io_data, OBJECT(s), &applesmc_data_io_ops,
s,
>                            "applesmc-data", 1);
> @@ -331,8 +393,17 @@ static void applesmc_isa_realize(DeviceState *dev,
Error **errp)
>      isa_register_ioport(&s->parent_obj, &s->io_err,
>                          s->iobase + APPLESMC_ERR_PORT);
>
> -    if (!s->osk || (strlen(s->osk) !=3D 64)) {
> -        warn_report("Using AppleSMC with invalid key");
> +    if (s->osk) {
> +        valid_osk =3D strlen(s->osk) =3D=3D 64;
> +    } else {
> +        valid_osk =3D applesmc_read_osk((uint8_t *) default_osk);
> +        if (valid_osk) {
> +            warn_report("Using AppleSMC with host OSK");
> +            s->osk =3D default_osk;
> +        }
> +    }
> +    if (!valid_osk) {
> +        warn_report("Using AppleSMC with invalid OSK");
>          s->osk =3D default_osk;
>      }
> [...]

After the previous discussion we've decided (if i don't confuse anything)
to have a way to enable/disable host OSK reading with new property:
1. properties osk=3D$key and hostosk=3Don cannot be used together (fail har=
d)
2. for QEMU machine > 7.0 - hostosk=3Don by default.
    If unable to read - fail hard with error_setg.
3. for QEMU machine <=3D 7.0 - hostosk=3Doff by default,
   the dummy OSK is used (as previously).

BTW since my patches lost 7.0, I planned to wait until compat machines
for 7.1 are added (after 7.0 release) and then rebase the patches,
adding required changes into `hw/core/machine.c`

Now we have two versions of host OSK forwarding implementations,
Pedro's (this one) and mine (
https://patchew.org/QEMU/20220113152836.60398-1-yaroshchuk2000@gmail.com/#)

Do we still want to add this feature? If yes - whose version is preferred?
(I'm still ready to work on this)

Regards,
Vlad

=D0=B2=D1=81, 17 =D0=B0=D0=BF=D1=80. 2022 =D0=B3. =D0=B2 04:36, Vladislav Y=
aroshchuk <yaroshchuk2000@gmail.com
>:

> Hi Pedro Torres,
>
> Please note this threads
> https://patchew.org/QEMU/20211022161448.81579-1-yaroshchuk2000@gmail.com/
> https://patchew.org/QEMU/20220113152836.60398-1-yaroshchuk2000@gmail.com/
>
> There was a discussion about how to preserve
> backward compatibility of emulated AppleSMC
> behaviour. The discussion has stopped, but
> if you're intended to see this feature working
> within QEMU - it'd be good to cc all the
> participans of previous threads :)
>
>
> Thanks,
>
> Vladislav Yaroshchuk
>
>

--000000000000f7766905dcd9d3df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve CCed=C2=A0all the people from previous=C2=A0threa=
ds.=C2=A0<br><br><br>&gt; [...]<br>&gt;=C2=A0+static bool applesmc_read_osk=
(uint8_t *osk)<br>&gt;=C2=A0+{<br>&gt;=C2=A0+#if defined(__APPLE__) &amp;&a=
mp; defined(__MACH__)<br>&gt;=C2=A0+ =C2=A0 =C2=A0struct AppleSMCParams {<b=
r>&gt;=C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t key;<br>&gt;=C2=A0+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0uint8_t __pad0[16];<br>&gt;=C2=A0+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0uint8_t result;<br>&gt;=C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0uint=
8_t __pad1[7];<br>&gt;=C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t size;<br>=
&gt;=C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t __pad2[10];<br>&gt;=C2=A0+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t data8;<br>&gt;=C2=A0+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0uint8_t __pad3[5];<br>&gt;=C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0uint=
8_t output[32];<br>&gt;=C2=A0+ =C2=A0 =C2=A0};<br>&gt;=C2=A0+<br>&gt;=C2=A0=
+ =C2=A0 =C2=A0io_service_t svc;<br>&gt;=C2=A0+ =C2=A0 =C2=A0io_connect_t c=
onn;<br>&gt;=C2=A0+ =C2=A0 =C2=A0kern_return_t ret;<br>&gt;=C2=A0+ =C2=A0 =
=C2=A0size_t size =3D sizeof(struct AppleSMCParams);<br>&gt;=C2=A0+ =C2=A0 =
=C2=A0struct AppleSMCParams params_in =3D { .size =3D 32, .data8 =3D 5 };<b=
r><br>Maybe it&#39;s better to name this magic number &#39;5&#39;=C2=A0<br>=
<br>&gt;=C2=A0+ =C2=A0 =C2=A0struct AppleSMCParams params_out =3D {};<br>&g=
t;=C2=A0+<br><br>params_in=C2=A0and params_out=C2=A0can be the same variabl=
e, see<br><a href=3D"https://patchew.org/QEMU/20211022161448.81579-1-yarosh=
chuk2000@gmail.com/">https://patchew.org/QEMU/20211022161448.81579-1-yarosh=
chuk2000@gmail.com/</a><br><br>&gt;=C2=A0+ =C2=A0 =C2=A0svc =3D IOServiceGe=
tMatchingService(0, IOServiceMatching(&quot;AppleSMC&quot;));<br>&gt;=C2=A0=
+ =C2=A0 =C2=A0if (svc =3D=3D 0) {<br>&gt;=C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0return false;<br>&gt;=C2=A0+ =C2=A0 =C2=A0}<br>&gt;=C2=A0+<br>&gt;=C2=A0=
+ =C2=A0 =C2=A0ret =3D IOServiceOpen(svc, mach_task_self(), 0, &amp;conn);<=
br>&gt;=C2=A0+ =C2=A0 =C2=A0if (ret !=3D 0) {<br>&gt;=C2=A0+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return false;<br>&gt;=C2=A0+ =C2=A0 =C2=A0}<br>&gt;=C2=A0+<br>=
&gt;=C2=A0+ =C2=A0 =C2=A0for (params_in.key =3D &#39;OSK0&#39;; params_in.k=
ey &lt;=3D &#39;OSK1&#39;; ++params_in.key) {<br>&gt;=C2=A0+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0ret =3D IOConnectCallStructMethod(conn, 2, &amp;params_in, siz=
e, &amp;params_out, &amp;size);<br><br>Same about this magic number &#39;2&=
#39;.<br><br>&gt;=C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret !=3D 0) {<br>&g=
t;=C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>&gt;=C2=
=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>&gt;=C2=A0+<br>&gt;=C2=A0+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if (params_out.result !=3D 0) {<br>&gt;=C2=A0+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>&gt;=C2=A0+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0}<br>&gt;=C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(osk, params=
_out.output, params_in.size);<br>&gt;=C2=A0+<br>&gt;=C2=A0+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0osk +=3D params_in.size;<br>&gt;=C2=A0+=C2=A0=C2=A0=C2=A0 =C2=
=A0}<br>&gt;=C2=A0+<br><br>Cleanup IOServiceClose and IOObjectReturn are no=
t called at the<br>end of the procedure.<br><br>This is also mentioned in P=
hil Dennis-Jordan&#39;s instruction you noted (stage 5):<br><a href=3D"http=
s://lists.nongnu.org/archive/html/qemu-devel/2021-10/msg02843.html">https:/=
/lists.nongnu.org/archive/html/qemu-devel/2021-10/msg02843.html</a><br><br>=
&gt;=C2=A0+ =C2=A0 =C2=A0return true;<br>&gt;=C2=A0+#else<br>&gt;=C2=A0+ =
=C2=A0 =C2=A0return false;<br>&gt;=C2=A0+#endif<br>&gt;=C2=A0+}<br>&gt; +<b=
r>&gt; [...]<br>&gt;<br>&gt;=C2=A0static void applesmc_isa_realize(DeviceSt=
ate *dev, Error **errp)<br>&gt;=C2=A0 {<br>&gt;=C2=A0=C2=A0=C2=A0=C2=A0 =C2=
=A0AppleSMCState *s =3D APPLE_SMC(dev);<br>&gt;=C2=A0+ =C2=A0 =C2=A0bool va=
lid_osk =3D false;<br>&gt;=C2=A0=C2=A0<br>&gt;=C2=A0=C2=A0 =C2=A0 =C2=A0mem=
ory_region_init_io(&amp;s-&gt;io_data, OBJECT(s), &amp;applesmc_data_io_ops=
, s,<br>&gt;=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;applesmc-data&quot;, 1);<br>=
&gt;=C2=A0@@ -331,8 +393,17 @@ static void applesmc_isa_realize(DeviceState=
 *dev, Error **errp)<br>&gt;=C2=A0=C2=A0 =C2=A0 =C2=A0isa_register_ioport(&=
amp;s-&gt;parent_obj, &amp;s-&gt;io_err,<br>&gt;=C2=A0=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;=
iobase + APPLESMC_ERR_PORT);<br>&gt;=C2=A0=C2=A0<br>&gt;=C2=A0- =C2=A0 =C2=
=A0if (!s-&gt;osk || (strlen(s-&gt;osk) !=3D 64)) {<br>&gt;=C2=A0- =C2=A0 =
=C2=A0 =C2=A0 =C2=A0warn_report(&quot;Using AppleSMC with invalid key&quot;=
);<br>&gt;=C2=A0+ =C2=A0 =C2=A0if (s-&gt;osk) {<br>&gt;=C2=A0+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0valid_osk =3D strlen(s-&gt;osk) =3D=3D 64;<br>&gt;=C2=A0+ =
=C2=A0 =C2=A0} else {<br>&gt;=C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0valid_osk =
=3D applesmc_read_osk((uint8_t *) default_osk);<br>&gt;=C2=A0+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if (valid_osk) {<br>&gt;=C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0warn_report(&quot;Using AppleSMC with host OSK&quot;);<br>=
&gt;=C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;osk =3D default_=
osk;<br>&gt;=C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>&gt;=C2=A0+ =C2=A0 =C2=
=A0}<br>&gt;=C2=A0+ =C2=A0 =C2=A0if (!valid_osk) {<br>&gt;=C2=A0+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0warn_report(&quot;Using AppleSMC with invalid OSK&quot;=
);<br>&gt;=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;osk =3D default_osk=
;<br>&gt;=C2=A0=C2=A0 =C2=A0 =C2=A0}<br>&gt; [...]<br><br>After the previou=
s discussion we&#39;ve decided (if i don&#39;t confuse anything)<br>to have=
 a way to enable/disable host OSK reading with new property:<br>1. properti=
es osk=3D$key and hostosk=3Don cannot be used together (fail hard)<br>2. fo=
r QEMU machine &gt; 7.0 - hostosk=3Don=C2=A0by default.<br>=C2=A0 =C2=A0 If=
 unable to read - fail hard with=C2=A0error_setg.<br>3. for QEMU machine &l=
t;=3D 7.0 - hostosk=3Doff by default, <br>=C2=A0 =C2=A0the dummy OSK is use=
d (as previously).<br><br>BTW since my patches lost 7.0, I planned to wait =
until=C2=A0compat machines<br>for 7.1 are added (after 7.0 release) and the=
n rebase the patches,<br>adding required changes into `hw/core/machine.c`<b=
r><br>Now we have two versions of host OSK forwarding implementations, <br>=
Pedro&#39;s (this one) and mine (<a href=3D"https://patchew.org/QEMU/202201=
13152836.60398-1-yaroshchuk2000@gmail.com/#">https://patchew.org/QEMU/20220=
113152836.60398-1-yaroshchuk2000@gmail.com/#</a>)<br><br>Do we still want t=
o add this feature? If yes - whose version is preferred?<br>(I&#39;m still =
ready to work on this)<br><br>Regards,<br>Vlad</div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">=D0=B2=D1=81, 17 =D0=B0=D0=BF=
=D1=80. 2022 =D0=B3. =D0=B2 04:36, Vladislav Yaroshchuk &lt;<a href=3D"mail=
to:yaroshchuk2000@gmail.com">yaroshchuk2000@gmail.com</a>&gt;:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">Hi Pedro Torres,<br>
<br>
Please note this threads<br>
<a href=3D"https://patchew.org/QEMU/20211022161448.81579-1-yaroshchuk2000@g=
mail.com/" rel=3D"noreferrer" target=3D"_blank">https://patchew.org/QEMU/20=
211022161448.81579-1-yaroshchuk2000@gmail.com/</a><br>
<a href=3D"https://patchew.org/QEMU/20220113152836.60398-1-yaroshchuk2000@g=
mail.com/" rel=3D"noreferrer" target=3D"_blank">https://patchew.org/QEMU/20=
220113152836.60398-1-yaroshchuk2000@gmail.com/</a><br>
<br>
There was a discussion about how to preserve<br>
backward compatibility of emulated AppleSMC<br>
behaviour. The discussion has stopped, but<br>
if you&#39;re intended to see this feature working<br>
within QEMU - it&#39;d be good to cc all the<br>
participans of previous threads :)<br>
<br>
<br>
Thanks,<br>
<br>
Vladislav Yaroshchuk <br>
<br>
</blockquote></div>

--000000000000f7766905dcd9d3df--

