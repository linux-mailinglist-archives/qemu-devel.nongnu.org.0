Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A54650A9D9
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 22:18:49 +0200 (CEST)
Received: from localhost ([::1]:60528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhdGK-0003ts-0d
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 16:18:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1nhdAz-0007y4-2b
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 16:13:17 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:44736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1nhdAw-00039P-K5
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 16:13:16 -0400
Received: by mail-pg1-x52f.google.com with SMTP id i63so5529371pge.11
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 13:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S/CuN0iQlmNJoIVZ5xpp0cbEFm+9YpPU8zLYYDVfKnU=;
 b=cQWHA7gnWxq5hc62f7kv8P7pnzctOf0f2pkq42OEZ7kcgaribdGDhKlG3pTxgEzFRp
 d8CyIr2FIRVdXGKVB9t7Ro72QgY9Z+5BpPcZ04Gi9gDPAI7FYROEpjoyclu5tL3SpjZQ
 HHOAW9YbzJ1OR4wfvL2GkPZobE9BBud6mlvYaVGF2ePUELmf1ntoZFuQcw/zjswxVYx7
 0JpysAsnWzi4rvbTGPxKDzAuTDZEfsuebZhFX1ue6k7Bhg6vgutzCy+vtJPw00rQKK+p
 CiTeNo/mTS6dAfUKECevHx6xkhMXx5Trbk1KyWMowdKCkk98+oTe3KPJzmuCRcloSc5o
 q9cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S/CuN0iQlmNJoIVZ5xpp0cbEFm+9YpPU8zLYYDVfKnU=;
 b=5MhABots/XMA8xCDfrGFfmzKSi8OU33nPLT1m+n86MfJqp2S2HLKNBj1zNpGSpW6pM
 E/R2mMWfu81VQAvYxoeM8939aiBlsfuEnSftT0KvdIyqyAyWTFvdm5z3DKIzLsEb9c1o
 KS9Bd41ykTzZSQwMMMJ56BNq6ek1v6LM+VFFq2OU/EGrOKr8ldNdT3TmITtKXHZAkcVc
 XIAWN1/FOFetfMHD6ii7sJPuG8n5vm8qUUtOxMhB6htbGVUn3BxD9FjDnlN6FHJEK/8w
 QSoYnB8Hck3gLcsCZzd0OjT915S8r6fmcAjgKz4Edxf4uOesbBmcOwXnuQyC7talPL6o
 ORxw==
X-Gm-Message-State: AOAM531buSU5b+0XzlqJpyuwNwjcUVpPEx1vaFxYF9n1hxEHfblIZ66H
 QtV5+vgIrM1wOBFG7SxGUgph2U0aiRSV2tCjCiM=
X-Google-Smtp-Source: ABdhPJyFdQvft205N2h37awJNkBNL4Vw4h9sksKEedkuZxYPlG8OTNzLN9yD7y9qslBLkxaPP7VJ1VuKz6hwpIMaVkE=
X-Received: by 2002:a05:6a00:1818:b0:50a:dfc5:9ed4 with SMTP id
 y24-20020a056a00181800b0050adfc59ed4mr1399292pfa.70.1650571992402; Thu, 21
 Apr 2022 13:13:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220405004621.94982-1-t0rr3sp3dr0@gmail.com>
 <20220417013608.22086-1-yaroshchuk2000@gmail.com>
 <CADO9X9SdWwKS49NAJDWULg_GxRSoNEhABWhWCBOkD_FwZGgkXw@mail.gmail.com>
 <Yl7dM/xKG/zASa+D@redhat.com>
In-Reply-To: <Yl7dM/xKG/zASa+D@redhat.com>
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Date: Thu, 21 Apr 2022 23:13:01 +0300
Message-ID: <CADO9X9Rpcm-j2z+3O6-vObKBGFOLVbvdjwwu6QMoaZgZV2A=aw@mail.gmail.com>
Subject: Re: [PATCH v3] hw/misc: applesmc: use host osk as default on macs
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000048901d05dd2fbdf5"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-pg1-x52f.google.com
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
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 agraf@suse.de, "Gabriel L. Somlo" <gsomlo@gmail.com>,
 marcandre.lureau@redhat.com, rene@exactcode.de,
 Eduardo Habkost <ehabkost@redhat.com>, Marcel Apfelbaum <marcel.a@redhat.com>,
 Alistair Francis <alistair.francis@xilinx.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 suse@csgraf.de, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Chetan Pant <chetan4windows@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 afaerber@suse.de, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000048901d05dd2fbdf5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Daniel!

Ok, thank you - then I'll wait until compat machines
for 7.1 are added (after release) and send a new
patch.

Regards,
Vladislav

=D0=B2=D1=82, 19 =D0=B0=D0=BF=D1=80. 2022 =D0=B3. =D0=B2 19:03, Daniel P. B=
errang=C3=A9 <berrange@redhat.com>:

> On Sun, Apr 17, 2022 at 04:43:14PM +0300, Vladislav Yaroshchuk wrote:
> > I've CCed all the people from previous threads.
> >
> >
> > > [...]
> > > +static bool applesmc_read_osk(uint8_t *osk)
> > > +{
> > > +#if defined(__APPLE__) && defined(__MACH__)
> > > +    struct AppleSMCParams {
> > > +        uint32_t key;
> > > +        uint8_t __pad0[16];
> > > +        uint8_t result;
> > > +        uint8_t __pad1[7];
> > > +        uint32_t size;
> > > +        uint8_t __pad2[10];
> > > +        uint8_t data8;
> > > +        uint8_t __pad3[5];
> > > +        uint8_t output[32];
> > > +    };
> > > +
> > > +    io_service_t svc;
> > > +    io_connect_t conn;
> > > +    kern_return_t ret;
> > > +    size_t size =3D sizeof(struct AppleSMCParams);
> > > +    struct AppleSMCParams params_in =3D { .size =3D 32, .data8 =3D 5=
 };
> >
> > Maybe it's better to name this magic number '5'
> >
> > > +    struct AppleSMCParams params_out =3D {};
> > > +
> >
> > params_in and params_out can be the same variable, see
> >
> https://patchew.org/QEMU/20211022161448.81579-1-yaroshchuk2000@gmail.com/
> >
> > > +    svc =3D IOServiceGetMatchingService(0,
> IOServiceMatching("AppleSMC"));
> > > +    if (svc =3D=3D 0) {
> > > +        return false;
> > > +    }
> > > +
> > > +    ret =3D IOServiceOpen(svc, mach_task_self(), 0, &conn);
> > > +    if (ret !=3D 0) {
> > > +        return false;
> > > +    }
> > > +
> > > +    for (params_in.key =3D 'OSK0'; params_in.key <=3D 'OSK1';
> > ++params_in.key) {
> > > +        ret =3D IOConnectCallStructMethod(conn, 2, &params_in, size,
> > &params_out, &size);
> >
> > Same about this magic number '2'.
> >
> > > +        if (ret !=3D 0) {
> > > +            return false;
> > > +        }
> > > +
> > > +        if (params_out.result !=3D 0) {
> > > +            return false;
> > > +        }
> > > +        memcpy(osk, params_out.output, params_in.size);
> > > +
> > > +        osk +=3D params_in.size;
> > > +     }
> > > +
> >
> > Cleanup IOServiceClose and IOObjectReturn are not called at the
> > end of the procedure.
> >
> > This is also mentioned in Phil Dennis-Jordan's instruction you noted
> (stage
> > 5):
> > https://lists.nongnu.org/archive/html/qemu-devel/2021-10/msg02843.html
> >
> > > +    return true;
> > > +#else
> > > +    return false;
> > > +#endif
> > > +}
> > > +
> > > [...]
> > >
> > > static void applesmc_isa_realize(DeviceState *dev, Error **errp)
> > >  {
> > >      AppleSMCState *s =3D APPLE_SMC(dev);
> > > +    bool valid_osk =3D false;
> > >
> > >      memory_region_init_io(&s->io_data, OBJECT(s),
> &applesmc_data_io_ops,
> > s,
> > >                            "applesmc-data", 1);
> > > @@ -331,8 +393,17 @@ static void applesmc_isa_realize(DeviceState *de=
v,
> > Error **errp)
> > >      isa_register_ioport(&s->parent_obj, &s->io_err,
> > >                          s->iobase + APPLESMC_ERR_PORT);
> > >
> > > -    if (!s->osk || (strlen(s->osk) !=3D 64)) {
> > > -        warn_report("Using AppleSMC with invalid key");
> > > +    if (s->osk) {
> > > +        valid_osk =3D strlen(s->osk) =3D=3D 64;
> > > +    } else {
> > > +        valid_osk =3D applesmc_read_osk((uint8_t *) default_osk);
> > > +        if (valid_osk) {
> > > +            warn_report("Using AppleSMC with host OSK");
> > > +            s->osk =3D default_osk;
> > > +        }
> > > +    }
> > > +    if (!valid_osk) {
> > > +        warn_report("Using AppleSMC with invalid OSK");
> > >          s->osk =3D default_osk;
> > >      }
> > > [...]
> >
> > After the previous discussion we've decided (if i don't confuse anythin=
g)
> > to have a way to enable/disable host OSK reading with new property:
> > 1. properties osk=3D$key and hostosk=3Don cannot be used together (fail=
 hard)
> > 2. for QEMU machine > 7.0 - hostosk=3Don by default.
> >     If unable to read - fail hard with error_setg.
> > 3. for QEMU machine <=3D 7.0 - hostosk=3Doff by default,
> >    the dummy OSK is used (as previously).
> >
> > BTW since my patches lost 7.0, I planned to wait until compat machines
> > for 7.1 are added (after 7.0 release) and then rebase the patches,
> > adding required changes into `hw/core/machine.c`
> >
> > Now we have two versions of host OSK forwarding implementations,
> > Pedro's (this one) and mine (
> >
> https://patchew.org/QEMU/20220113152836.60398-1-yaroshchuk2000@gmail.com/=
#
> )
> >
> > Do we still want to add this feature? If yes - whose version is
> preferred?
> > (I'm still ready to work on this)
>
> I prefer yours, since the feature is introspectable by mgmt apps,
> given the existance of the 'hostosk' property
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :|
>
>

--00000000000048901d05dd2fbdf5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,=C2=A0Daniel!<br><br>Ok, thank you - then I&#39;ll wait=
 until=C2=A0compat machines<br>for 7.1 are added (after release) and send a=
 new<br>patch.<br><br><div>Regards,</div><div>Vladislav</div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=D0=B2=D1=82, =
19 =D0=B0=D0=BF=D1=80. 2022 =D0=B3. =D0=B2 19:03, Daniel P. Berrang=C3=A9 &=
lt;<a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt;:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">On Sun, Apr 17, 2022=
 at 04:43:14PM +0300, Vladislav Yaroshchuk wrote:<br>
&gt; I&#39;ve CCed all the people from previous threads.<br>
&gt; <br>
&gt; <br>
&gt; &gt; [...]<br>
&gt; &gt; +static bool applesmc_read_osk(uint8_t *osk)<br>
&gt; &gt; +{<br>
&gt; &gt; +#if defined(__APPLE__) &amp;&amp; defined(__MACH__)<br>
&gt; &gt; +=C2=A0 =C2=A0 struct AppleSMCParams {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t key;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t __pad0[16];<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t result;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t __pad1[7];<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t size;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t __pad2[10];<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t data8;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t __pad3[5];<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t output[32];<br>
&gt; &gt; +=C2=A0 =C2=A0 };<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 io_service_t svc;<br>
&gt; &gt; +=C2=A0 =C2=A0 io_connect_t conn;<br>
&gt; &gt; +=C2=A0 =C2=A0 kern_return_t ret;<br>
&gt; &gt; +=C2=A0 =C2=A0 size_t size =3D sizeof(struct AppleSMCParams);<br>
&gt; &gt; +=C2=A0 =C2=A0 struct AppleSMCParams params_in =3D { .size =3D 32=
, .data8 =3D 5 };<br>
&gt; <br>
&gt; Maybe it&#39;s better to name this magic number &#39;5&#39;<br>
&gt; <br>
&gt; &gt; +=C2=A0 =C2=A0 struct AppleSMCParams params_out =3D {};<br>
&gt; &gt; +<br>
&gt; <br>
&gt; params_in and params_out can be the same variable, see<br>
&gt; <a href=3D"https://patchew.org/QEMU/20211022161448.81579-1-yaroshchuk2=
000@gmail.com/" rel=3D"noreferrer" target=3D"_blank">https://patchew.org/QE=
MU/20211022161448.81579-1-yaroshchuk2000@gmail.com/</a><br>
&gt; <br>
&gt; &gt; +=C2=A0 =C2=A0 svc =3D IOServiceGetMatchingService(0, IOServiceMa=
tching(&quot;AppleSMC&quot;));<br>
&gt; &gt; +=C2=A0 =C2=A0 if (svc =3D=3D 0) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 ret =3D IOServiceOpen(svc, mach_task_self(), 0, &a=
mp;conn);<br>
&gt; &gt; +=C2=A0 =C2=A0 if (ret !=3D 0) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 for (params_in.key =3D &#39;OSK0&#39;; params_in.k=
ey &lt;=3D &#39;OSK1&#39;;<br>
&gt; ++params_in.key) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D IOConnectCallStructMethod(co=
nn, 2, &amp;params_in, size,<br>
&gt; &amp;params_out, &amp;size);<br>
&gt; <br>
&gt; Same about this magic number &#39;2&#39;.<br>
&gt; <br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret !=3D 0) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (params_out.result !=3D 0) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(osk, params_out.output, param=
s_in.size);<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 osk +=3D params_in.size;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; <br>
&gt; Cleanup IOServiceClose and IOObjectReturn are not called at the<br>
&gt; end of the procedure.<br>
&gt; <br>
&gt; This is also mentioned in Phil Dennis-Jordan&#39;s instruction you not=
ed (stage<br>
&gt; 5):<br>
&gt; <a href=3D"https://lists.nongnu.org/archive/html/qemu-devel/2021-10/ms=
g02843.html" rel=3D"noreferrer" target=3D"_blank">https://lists.nongnu.org/=
archive/html/qemu-devel/2021-10/msg02843.html</a><br>
&gt; <br>
&gt; &gt; +=C2=A0 =C2=A0 return true;<br>
&gt; &gt; +#else<br>
&gt; &gt; +=C2=A0 =C2=A0 return false;<br>
&gt; &gt; +#endif<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; [...]<br>
&gt; &gt;<br>
&gt; &gt; static void applesmc_isa_realize(DeviceState *dev, Error **errp)<=
br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 AppleSMCState *s =3D APPLE_SMC(dev);<br>
&gt; &gt; +=C2=A0 =C2=A0 bool valid_osk =3D false;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 memory_region_init_io(&amp;s-&gt;io_data, OBJ=
ECT(s), &amp;applesmc_data_io_ops,<br>
&gt; s,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;applesmc-data&quot;, 1);<br>
&gt; &gt; @@ -331,8 +393,17 @@ static void applesmc_isa_realize(DeviceState=
 *dev,<br>
&gt; Error **errp)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 isa_register_ioport(&amp;s-&gt;parent_obj, &a=
mp;s-&gt;io_err,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;iobase + APPLESMC_ERR_PORT);<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 if (!s-&gt;osk || (strlen(s-&gt;osk) !=3D 64)) {<b=
r>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 warn_report(&quot;Using AppleSMC wit=
h invalid key&quot;);<br>
&gt; &gt; +=C2=A0 =C2=A0 if (s-&gt;osk) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 valid_osk =3D strlen(s-&gt;osk) =3D=
=3D 64;<br>
&gt; &gt; +=C2=A0 =C2=A0 } else {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 valid_osk =3D applesmc_read_osk((uin=
t8_t *) default_osk);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (valid_osk) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 warn_report(&quot;Usin=
g AppleSMC with host OSK&quot;);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;osk =3D default_=
osk;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; +=C2=A0 =C2=A0 if (!valid_osk) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 warn_report(&quot;Using AppleSMC wit=
h invalid OSK&quot;);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;osk =3D default_osk;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; [...]<br>
&gt; <br>
&gt; After the previous discussion we&#39;ve decided (if i don&#39;t confus=
e anything)<br>
&gt; to have a way to enable/disable host OSK reading with new property:<br=
>
&gt; 1. properties osk=3D$key and hostosk=3Don cannot be used together (fai=
l hard)<br>
&gt; 2. for QEMU machine &gt; 7.0 - hostosk=3Don by default.<br>
&gt;=C2=A0 =C2=A0 =C2=A0If unable to read - fail hard with error_setg.<br>
&gt; 3. for QEMU machine &lt;=3D 7.0 - hostosk=3Doff by default,<br>
&gt;=C2=A0 =C2=A0 the dummy OSK is used (as previously).<br>
&gt; <br>
&gt; BTW since my patches lost 7.0, I planned to wait until compat machines=
<br>
&gt; for 7.1 are added (after 7.0 release) and then rebase the patches,<br>
&gt; adding required changes into `hw/core/machine.c`<br>
&gt; <br>
&gt; Now we have two versions of host OSK forwarding implementations,<br>
&gt; Pedro&#39;s (this one) and mine (<br>
&gt; <a href=3D"https://patchew.org/QEMU/20220113152836.60398-1-yaroshchuk2=
000@gmail.com/#" rel=3D"noreferrer" target=3D"_blank">https://patchew.org/Q=
EMU/20220113152836.60398-1-yaroshchuk2000@gmail.com/#</a>)<br>
&gt; <br>
&gt; Do we still want to add this feature? If yes - whose version is prefer=
red?<br>
&gt; (I&#39;m still ready to work on this)<br>
<br>
I prefer yours, since the feature is introspectable by mgmt apps,<br>
given the existance of the &#39;hostosk&#39; property<br>
<br>
With regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer" target=3D"_blank">ht=
tps://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D"http=
s://www.flickr.com/photos/dberrange" rel=3D"noreferrer" target=3D"_blank">h=
ttps://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer" target=3D"_blank">htt=
ps://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com" rel=3D"n=
oreferrer" target=3D"_blank">https://fstop138.berrange.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer" target=3D"_bla=
nk">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D=
"https://www.instagram.com/dberrange" rel=3D"noreferrer" target=3D"_blank">=
https://www.instagram.com/dberrange</a> :|<br>
<br>
</blockquote></div>

--00000000000048901d05dd2fbdf5--

