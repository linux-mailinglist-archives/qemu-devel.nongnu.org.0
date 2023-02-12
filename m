Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D22E2693901
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 18:13:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRFsr-0003Zg-9q; Sun, 12 Feb 2023 12:11:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pRFso-0003ZP-QR
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 12:11:22 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pRFsm-0003Sq-6N
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 12:11:22 -0500
Received: by mail-ed1-x529.google.com with SMTP id c1so6276601edt.4
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 09:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XvwOq0Aa97GFJkSqRdWjk3YflAIUKY8LhlIFQpCtNxQ=;
 b=Tjx75a1W9X09TXD6Ip9OdyryUR56z+QGR8GnuDU4YGH5BjwVrlWqLGdZjQS8hm/A3k
 o/FA7macM7FxRET7KtNTmSGIUjb6fhSydETHC4CRmBTCu3uf7iK9F8uKWfGMD/kjDmrQ
 6p7jfIfR8UupTgWnIb0AX9HQAyoruh6frahDB2qNy3YM4A77ZMuxchCyIUe7P14a9w66
 6tSk4FT5tj2MaCsBIiN6SEstY5aKkxIiiLJsbqiGYEXMKhHyg0qdZsWTsB1zSLKnfq99
 UioQXkxYgXBRIVj2U8rOFYftroNXTl3mx7RVLb1J9AanCAi8RMu9ExeDlBzqcUikEBzX
 QyQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XvwOq0Aa97GFJkSqRdWjk3YflAIUKY8LhlIFQpCtNxQ=;
 b=0xNNQnGkweoeF8d0Zvq6SE0+ReTAZGbesXwQg+6X2VBA/xd3KtPszqdIQeoGwxYvW5
 zTk1KI4i8LH+pJX8Ohw6krJyXv7bkiykLCpZhKNkdHb95SRitxqOGFcW3Xb/fwYh6SpV
 eoj0fuZVUngfo2pFltoDOmunbbCRyefUDeYFH4gPnDwDPka6Xaiy2F79ihxnjAmh02nZ
 J7kEwWPg2z0dmMV0ZpTe9KQIi7c7Oe4lsTjmw7b21P28NLk4izfrYj+OsfRE3swmK1dQ
 oM5QqJsWCABN2osREydTK0ZsnVZxafccSg0OM4FT4p2JfTW62heVKm7yyNFkOAKMxatz
 +3+Q==
X-Gm-Message-State: AO0yUKU/JcwOVnh+Ps9yglrcr13KXLkgukO3rwZjRK+qn/nxL0wTD4rE
 xiL3lHnhMrUkzxCu0aBgbAsdeWaZimV4FXDbA/ugmQ==
X-Google-Smtp-Source: AK7set9y4nrnEypnqbmLmAJ8yJ8NAVRH9b3QJ74Un2U0MnnvF15sspHGCC15gfXO0IPR2wXOUa1jXJmcURTZ1Q+KHUs=
X-Received: by 2002:a50:9eee:0:b0:4aa:a4f2:ca1a with SMTP id
 a101-20020a509eee000000b004aaa4f2ca1amr5567628edf.0.1676221878050; Sun, 12
 Feb 2023 09:11:18 -0800 (PST)
MIME-Version: 1.0
References: <20230210231829.39476-1-imp@bsdimp.com>
 <20230210231829.39476-5-imp@bsdimp.com>
 <f7a5c2d4-f8d2-9dc6-d34f-a12154dbc87e@linaro.org>
 <CANCZdfpHM8YKUqhiVx5re1c8GU-hHbiEXREz9HrmWtvOAiUUOA@mail.gmail.com>
 <CANCZdfpbw1fPXEQzXS+epVOY=TetEguC70Y5t8kaPf-G+fC13Q@mail.gmail.com>
In-Reply-To: <CANCZdfpbw1fPXEQzXS+epVOY=TetEguC70Y5t8kaPf-G+fC13Q@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Sun, 12 Feb 2023 10:11:13 -0700
Message-ID: <CANCZdfoACGYcvfYjcaVqpGiij69g_6uJhpSvonEYmviimRDJ-w@mail.gmail.com>
Subject: Re: [PATCH 4/9] bsd-user: Two helper routines oidfmt and sysctl_oldcvt
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Kyle Evans <kevans@freebsd.org>, f4bug@amsat.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Stacey Son <sson@freebsd.org>,
 Sean Bruno <sbruno@freebsd.org>, Juergen Lock <nox@jelal.kn-bremen.de>,
 Raphael Kubo da Costa <rakuco@freebsd.org>
Content-Type: multipart/alternative; boundary="0000000000009b32e605f483d1d2"
Received-SPF: none client-ip=2a00:1450:4864:20::529;
 envelope-from=wlosh@bsdimp.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

--0000000000009b32e605f483d1d2
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 12, 2023 at 10:01 AM Warner Losh <imp@bsdimp.com> wrote:

> Hey Richard
>
> Thanks for the very interesting question... This kept me up...
>
> Kyle,
>
> Please double check what I've written below to make sure I've not missed
> anything.
> This might well be the source of some of the weird errors we're seeing on
> some
> ports, but sysctl is rare enough I'm guessing that any of the overflows
> are in the
> end benign.
>
> On Sat, Feb 11, 2023 at 9:11 PM Warner Losh <imp@bsdimp.com> wrote:
>
>>
>>
>> On Sat, Feb 11, 2023 at 3:17 PM Richard Henderson <
>> richard.henderson@linaro.org> wrote:
>>
>>> On 2/10/23 13:18, Warner Losh wrote:
>>> > +static int sysctl_oldcvt(void *holdp, size_t *holdlen, uint32_t kind)
>>> > +{
>>> > +    switch (kind & CTLTYPE) {
>>> > +    case CTLTYPE_INT:
>>> > +    case CTLTYPE_UINT:
>>> > +        *(uint32_t *)holdp = tswap32(*(uint32_t *)holdp);
>>> > +        break;
>>> > +
>>> > +#ifdef TARGET_ABI32
>>> > +    case CTLTYPE_LONG:
>>> > +    case CTLTYPE_ULONG:
>>> > +        /*
>>> > +         * If the sysctl has a type of long/ulong but seems to be
>>> bigger than
>>> > +         * these data types, its probably an array.  Double check
>>> that its
>>> > +         * evenly divisible by the size of long and convert holdp to
>>> a series of
>>> > +         * 32bit elements instead, adjusting holdlen to the new size.
>>> > +         */
>>> > +        if ((*holdlen > sizeof(abi_ulong)) &&
>>> > +            ((*holdlen % sizeof(abi_ulong)) == 0)) {
>>> > +            int array_size = *holdlen / sizeof(long);
>>> > +            int i;
>>> > +            if (holdp) {
>>> > +                for (i = 0; i < array_size; i++) {
>>> > +                    ((uint32_t *)holdp)[i] = tswap32(((long
>>> *)holdp)[i]);
>>> > +                }
>>> > +                *holdlen = array_size * sizeof(abi_ulong);
>>> > +            } else {
>>> > +                *holdlen = sizeof(abi_ulong);
>>> > +            }
>>> > +        } else {
>>> > +            *(uint32_t *)holdp = tswap32(*(long *)holdp);
>>> > +            *holdlen = sizeof(uint32_t);
>>>
>>> This is totally confusing.  Why would it ever be an array?
>>> Why is this section the only place we ever assign back into holdlen?
>>>
>>> Can you point to anything similar in the freebsd source?  The whole
>>> thing is pretty hard
>>> to track, starting from sys/kern/kern_sysctl.c.
>>>
>>
>> I need to understand this... I've been looking for where we export an
>> array, and we just don't.
>>
>> I've asked the original author who said it had something to do with
>> different size longs. I'll
>> look into that a bit and get back to this.
>>
>> I think we assign back into holdlen in a weird attempt adjust for the
>> difference of LONG between
>> the two. But I'm not sure that that's where we should assign.
>>
>
> OK. I understand what's going on. If you look at kern_sysctl.c
> sysctl_old_ddb or
> sbin/sysctl/sysctl.c show_var, you'll see that these values canbe arrays.
> This code
> only implements the array part for long and ulong, most likely because
> that's
> all that was encountered in the field.
>
>  So the code is right, as far as it goes.... But if the value is bigger
> than a long, it
> will be truncated, which strikes me as a rather weird thing to do since
> most longs
> are for sizes of things, so I'd think it would be better to saturate.
>
> We also adjust the length here because the host's memory requirements
> are larger than tha targets. This also means that we're likely returning an
> error for long/ulong fetches since the target would pass in 4 and the host
> would want 8, and would return ENOMEM. There's no code to cope with
> this at all, but I think there needs to be a temporary host buffer that's
> then copied to the target buffer once it's converted. So I need to write
> that code.
>
> Also, this code doesn't handle the newer types that FreeBSD has grown
> in the last few years: _{S,U}{8,16,32,64}. At least those are fixed between
> the two different ABIs that freebsd supports (ILP32 and LP64).
>
> Also, there's a size issue. *holdlen is a size_t, so we need to do a
> similar
> brokering for ABI32 targets. The interface is such that we need to
> read/write
> this variable because that's what the kernel is doing (reading it to make
> sure
> it's big enough, and then writing it to the actual size).
>

Actually, this issue isn't an issue because, modulo bugs, the callers of
sysctl_freebsd_oid() handle it.


> Also (not relevant to this patch), we must not set sysctls very often. newp
> needs similar treatment tooldp (except the reverse direction), but isn't
> getting any of the tswaptreatment, so it's broken for long/ulong types as
> well
> as on powerpc which we have out-of-tree now and is the only big-endian
> port we have left.
>
> tl;dr: I think I'm going to have to do a bit of a rewrite here...
>
> Warner
>

--0000000000009b32e605f483d1d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Feb 12, 2023 at 10:01 AM Warn=
er Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr=
"><div>Hey Richard</div><div><br></div><div>Thanks for the very interesting=
 question... This kept me up...</div><div><br></div><div>Kyle,</div><div><b=
r></div><div>Please double check what I&#39;ve written below to make sure I=
&#39;ve not missed anything.</div><div>This might well be the source of som=
e of the weird errors we&#39;re seeing on some</div><div>ports, but sysctl =
is rare enough I&#39;m guessing that any of the overflows are in the</div><=
div>end benign.<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Sat, Feb 11, 2023 at 9:11 PM Warner Losh &lt;<a href=
=3D"mailto:imp@bsdimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"=
><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Sat, Feb 11, 2023 at 3:17 PM Richard Henderson &lt=
;<a href=3D"mailto:richard.henderson@linaro.org" target=3D"_blank">richard.=
henderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On 2/10/23 13:18, Warner Losh wrote:<br>
&gt; +static int sysctl_oldcvt(void *holdp, size_t *holdlen, uint32_t kind)=
<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 switch (kind &amp; CTLTYPE) {<br>
&gt; +=C2=A0 =C2=A0 case CTLTYPE_INT:<br>
&gt; +=C2=A0 =C2=A0 case CTLTYPE_UINT:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *(uint32_t *)holdp =3D tswap32(*(uint32_t=
 *)holdp);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +<br>
&gt; +#ifdef TARGET_ABI32<br>
&gt; +=C2=A0 =C2=A0 case CTLTYPE_LONG:<br>
&gt; +=C2=A0 =C2=A0 case CTLTYPE_ULONG:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* If the sysctl has a type of long/=
ulong but seems to be bigger than<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* these data types, its probably an=
 array.=C2=A0 Double check that its<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* evenly divisible by the size of l=
ong and convert holdp to a series of<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* 32bit elements instead, adjusting=
 holdlen to the new size.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((*holdlen &gt; sizeof(abi_ulong)) &am=
p;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((*holdlen % sizeof(abi_ulo=
ng)) =3D=3D 0)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int array_size =3D *holdlen=
 / sizeof(long);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int i;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (holdp) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0;=
 i &lt; array_size; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ((uint32_t *)holdp)[i] =3D tswap32(((long *)holdp)[i]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *holdlen =3D =
array_size * sizeof(abi_ulong);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *holdlen =3D =
sizeof(abi_ulong);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *(uint32_t *)holdp =3D tswa=
p32(*(long *)holdp);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *holdlen =3D sizeof(uint32_=
t);<br>
<br>
This is totally confusing.=C2=A0 Why would it ever be an array?<br>
Why is this section the only place we ever assign back into holdlen?<br>
<br>
Can you point to anything similar in the freebsd source?=C2=A0 The whole th=
ing is pretty hard <br>
to track, starting from sys/kern/kern_sysctl.c.<br></blockquote><div><br></=
div><div>I need to understand this... I&#39;ve been looking for where we ex=
port an array, and we just don&#39;t.</div><div><br></div><div>I&#39;ve ask=
ed the original author who said it had something to do with different size =
longs. I&#39;ll</div><div>look into that a bit and get back to this.</div><=
div><br></div><div>I think we assign back into holdlen=C2=A0in a weird atte=
mpt adjust for the difference of LONG between</div><div>the two. But I&#39;=
m not sure that that&#39;s where we should assign.</div></div></div></block=
quote><div><br></div><div>OK. I understand what&#39;s going on. If you look=
 at kern_sysctl.c sysctl_old_ddb or</div><div>sbin/sysctl/sysctl.c show_var=
, you&#39;ll see that these values canbe arrays. This code</div><div>only i=
mplements the array part for long and ulong, most likely because that&#39;s=
</div><div>all that was encountered in the field.</div><div><br></div><div>=
=C2=A0So the code is right, as far as it goes.... But if the value is bigge=
r than a long, it</div><div>will be truncated, which strikes me as a rather=
 weird thing to do since most longs</div><div>are for sizes of things, so I=
&#39;d think it would be better to saturate.</div><div><br></div><div>We al=
so adjust the length here because the host&#39;s memory requirements</div><=
div>are larger than tha targets. This also means that we&#39;re likely retu=
rning an</div><div>error for long/ulong fetches since the target would pass=
 in 4 and the host</div><div>would want 8, and would return ENOMEM. There&#=
39;s no code to cope with</div><div>this at all, but I think there needs to=
 be a temporary host buffer that&#39;s</div><div>then copied to the target =
buffer once it&#39;s converted. So I need to write</div><div>that code.</di=
v><div><br></div><div>Also, this code doesn&#39;t handle the newer types th=
at FreeBSD has grown</div><div>in the last few years: _{S,U}{8,16,32,64}. A=
t least those are fixed between</div><div>the two different ABIs that freeb=
sd supports (ILP32 and LP64).</div><div><br></div><div>Also, there&#39;s a =
size issue. *holdlen is a size_t, so we need to do a similar</div><div>brok=
ering for ABI32 targets. The interface is such that we need to read/write</=
div><div>this variable because that&#39;s what the kernel is doing (reading=
 it to make sure</div><div>it&#39;s big enough, and then writing it to the =
actual size).</div></div></div></blockquote><div><br></div><div>Actually, t=
his issue isn&#39;t an issue because, modulo bugs, the callers of</div><div=
>sysctl_freebsd_oid() handle it.<br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quot=
e"><div>Also (not relevant to this patch), we must not set sysctls very oft=
en. newp</div><div>needs similar treatment tooldp (except the reverse direc=
tion), but isn&#39;t</div><div>getting any of the tswaptreatment, so it&#39=
;s broken for long/ulong types as well</div><div>as on powerpc which we hav=
e out-of-tree now and is the only big-endian</div><div>port we have left.</=
div><div><br></div><div>tl;dr: I think I&#39;m going to have to do a bit of=
 a rewrite here...</div><div><br></div><div>Warner<br></div></div></div>
</blockquote></div></div>

--0000000000009b32e605f483d1d2--

