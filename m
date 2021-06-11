Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 847803A3E9A
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 11:07:00 +0200 (CEST)
Received: from localhost ([::1]:53246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrd7z-0003yS-4i
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 05:06:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nirsof@gmail.com>)
 id 1lrd6Y-0002YE-SD; Fri, 11 Jun 2021 05:05:31 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:46008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nirsof@gmail.com>)
 id 1lrd6V-000649-H3; Fri, 11 Jun 2021 05:05:30 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 v206-20020a1cded70000b02901a586d3fa23so8033334wmg.4; 
 Fri, 11 Jun 2021 02:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=I+k7JTHnOxfyYhmPdgo4wnF/IlfdOPoPDBQlcb25bUk=;
 b=lmH+wJsZHVbPGucvqizclehzAW0P9g7SQGhhdgFKzPMNkj8MZGLDUqVrGVL70/8GIc
 BLO6oKNVO6sx2RZ7hf5Ui1TRiZCAxObJBJ2Ju2HCHeVVCRMRFz0ZSWp5hoLMH8oF0vsX
 2iBxBnvfOAuEDY7F7YJtA83bxca20Aw94maH9UUrx32LbJjZjInvziuqDyhdteszHqm2
 9nYQvhptsRBUfnpIcxV5U6DUn9SBUR0tNYPmRx/nXDuJ6eomcwuftvks5Epe2+vhySRj
 /dUO/796abQygvDYHPlDkmjUUPqkVPMaQg4iAZORAzdFbf6PiA9+kfRvhBJLHan9FINZ
 eXPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=I+k7JTHnOxfyYhmPdgo4wnF/IlfdOPoPDBQlcb25bUk=;
 b=LgDA7ExxbtJfPpNrRDp8QkG/+w23eN2EiIYGWFFnLIfD3M48ByJr67Mxyv0KuTDH84
 14mIGQ0KrGVMKe8RD36PMwaZPeW1SG+7u9llWM8ATlq2pkA1gGr3ZtSgpj0ShZWpkSmg
 8C+mwehmh7yWdDCPIkg/bUKYDhQOV2m1j8AVFGnEUbE+2nq2quRIFMHuI0+VZ3xuEHih
 fU6Y4yyDCR7Yvo7o6mB0g0603FQ32dbEw6WNs8rx9vT0XaRgipEs6mV8/oiiR+aWukS3
 5tccFnh0o+T9DLk0YMngX45/NkNOH+DSnW2G1jyn9SmIAcEHcOsY4PvQt+bhxBCEZKY2
 hCFw==
X-Gm-Message-State: AOAM533SqZ4M7O2AIvNRIAq4rqJEExuRzGPFFBraDMtBp8y1i4IOxE/o
 GEPMVV4yMAZNgAbtyffFeSg=
X-Google-Smtp-Source: ABdhPJz8pl1ei24A4k1ngJFzj2h945aHAcYED3NRVfgtNPngKdXqK7C5bvqjZIi0dJ0Uzq4ih+Mc6A==
X-Received: by 2002:a1c:a785:: with SMTP id q127mr2902569wme.152.1623402321518; 
 Fri, 11 Jun 2021 02:05:21 -0700 (PDT)
Received: from smtpclient.apple (89-138-223-238.bb.netvision.net.il.
 [89.138.223.238])
 by smtp.gmail.com with ESMTPSA id p5sm6582061wrd.25.2021.06.11.02.05.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 02:05:20 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary=Apple-Mail-1E37F757-26E9-43F9-9073-1DED126039A6
Content-Transfer-Encoding: 7bit
From: Nir Soffer <nirsof@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] qemu-{img,nbd}: Don't report zeroed cluster as a hole
Date: Fri, 11 Jun 2021 12:05:19 +0300
Message-Id: <DC0BA400-DC91-4450-9408-915B2152EFD5@gmail.com>
References: <49ed9c03-eb24-4e8a-1b5f-8a291466a7b9@virtuozzo.com>
In-Reply-To: <49ed9c03-eb24-4e8a-1b5f-8a291466a7b9@virtuozzo.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
X-Mailer: iPhone Mail (18F72)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=nirsof@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, MIME_QP_LONG_LINE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Nir Soffer <nsoffer@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Apple-Mail-1E37F757-26E9-43F9-9073-1DED126039A6
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable



> =E2=80=AB=D7=91-11 =D7=91=D7=99=D7=95=D7=A0=D7=99 2021, =D7=91=D7=A9=D7=A2=
=D7=94 11:14, =E2=80=8F=E2=80=8FVladimir Sementsov-Ogievskiy =E2=80=8F<vseme=
ntsov@virtuozzo.com> =D7=9B=D7=AA=D7=91/=D7=94:=E2=80=AC
>=20
> =EF=BB=BF11.06.2021 11:09, Kevin Wolf wrote:
>> Am 10.06.2021 um 22:46 hat Eric Blake geschrieben:
>>>> On Thu, Jun 10, 2021 at 11:09:05PM +0300, Nir Soffer wrote:
>>>>>> But:
>>>>>>=20
>>>>>> $ qemu-img map --output=3Djson -f qcow2 json:'{"driver":"qcow2","back=
ing":null, \
>>>>>>   "file":{"driver":"file","filename":"top.qcow2"}}'
>>>>>> [{ "start": 0, "length": 65536, "depth": 0, "zero": true, "data": fal=
se},
>>>>>> { "start": 65536, "length": 65536, "depth": 0, "zero": false, "data":=
 true, "offset": 327680},
>>>>>> { "start": 131072, "length": 131072, "depth": 0, "zero": true, "data"=
: false}]
>>>>>>=20
>>>>>> also reports the entire file at "depth":0, which is misleading, since=

>>>>>> we have just been arguing from the qemu:allocation-depth perspective
>>>>>> (and also from bdrv_block_status) that the qcow2 image is NOT 100%
>>>>>> allocated (in the sense where allocation =3D=3D data comes locally).
>>>>>> Perhaps it might be better if we tweaked the above qemu-img map to
>>>>>> produce:
>>>>>>=20
>>>>>> [{ "start": 0, "length": 65536, "depth": -1, "zero": true, "data": fa=
lse},
>>>>>> { "start": 65536, "length": 65536, "depth": 0, "zero": false, "data":=
 true, "offset": 327680},
>>>>>> { "start": 131072, "length": 65536, "depth": 0, "zero": true, "data":=
 false},
>>>>>> { "start": 196608, "length": 65536, "depth": -1, "zero": true, "data"=
: false}]
>>>>>=20
>>>>> It will be more consistent with "offset" to drop "depth" from output
>>>>> if we don't have it:
>>>>>=20
>>>>>     [{ "start": 0, "length": 65536, "zero": true, "data": false},
>>>>>      { "start": 65536, "length": 65536, "depth": 0, "zero": false,
>>>>> "data": true, "offset": 327680},
>>>>>      { "start": 131072, "length": 65536, "depth": 0, "zero": true,
>>>>> "data": false},
>>>>>      { "start": 196608, "length": 65536, "zero": true, "data": false}]=

>>>=20
>>> Yes, that might work as well.  But we didn't previously document
>>> depth to be optional.  Removing something from output risks breaking
>>> more downstream tools that expect it to be non-optional, compared to
>>> providing a new value.
>> A negative value isn't any less unexpected than a missing key. I don't
>> think any existing tool would be able to handle it. Encoding different
>> meanings in a single value isn't very QAPI-like either. Usually strings
>> that are parsed are the problem, but negative integers really isn't that
>> much different. I don't really like this solution.
>> Leaving out the depth feels like a better suggestion to me.
>> But anyway, this seems to only happen at the end of the backing chain.
>> So if the backing chain consistents of n images, why not report 'depth':
>> n + 1? So, in the above example, you would get 1. I think this has the
>> best chances of tools actually working correctly with the new output,
>> even though it's still not unlikely to break something.
>=20
> Did you consider just add a new field?
>=20
> So, "depth" keeps its meaning "which level provides data".
>=20
> And we add additional optional field like
>=20
> absolutely-completely-absent: bool

hole: bool?

>=20
> Which is true if data is nowhere in the backing chain.
>=20
>=20
> --=20
> Best regards,
> Vladimir

--Apple-Mail-1E37F757-26E9-43F9-9073-1DED126039A6
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div style=3D"direction: rtl;"><br></div><d=
iv dir=3D"rtl"><br><blockquote type=3D"cite">=E2=80=AB=D7=91-11 =D7=91=D7=99=
=D7=95=D7=A0=D7=99 2021, =D7=91=D7=A9=D7=A2=D7=94 11:14, =E2=80=8F=E2=80=8FV=
ladimir Sementsov-Ogievskiy =E2=80=8F&lt;vsementsov@virtuozzo.com&gt; =D7=9B=
=D7=AA=D7=91/=D7=94:=E2=80=AC<br><br></blockquote></div><blockquote type=3D"=
cite"><div dir=3D"ltr">=EF=BB=BF<span>11.06.2021 11:09, Kevin Wolf wrote:</s=
pan><br><blockquote type=3D"cite"><span>Am 10.06.2021 um 22:46 hat Eric Blak=
e geschrieben:</span><br></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span>On Thu, Jun 10, 2021 at 11:09:05PM +0300, Nir Soffer wrot=
e:</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>But=
:</span><br></blockquote></blockquote></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><span></span><br></blockquote></blockquote></blockquote></blo=
ckquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=
=3D"cite"><blockquote type=3D"cite"><span>$ qemu-img map --output=3Djson -f q=
cow2 json:'{"driver":"qcow2","backing":null, \</span><br></blockquote></bloc=
kquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span> &nbsp;&nbs=
p;"file":{"driver":"file","filename":"top.qcow2"}}'</span><br></blockquote><=
/blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>[{ "s=
tart": 0, "length": 65536, "depth": 0, "zero": true, "data": false},</span><=
br></blockquote></blockquote></blockquote></blockquote><blockquote type=3D"c=
ite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>{ "start": 65536, "length": 65536, "depth": 0, "zero": false, "=
data": true, "offset": 327680},</span><br></blockquote></blockquote></blockq=
uote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><block=
quote type=3D"cite"><blockquote type=3D"cite"><span>{ "start": 131072, "leng=
th": 131072, "depth": 0, "zero": true, "data": false}]</span><br></blockquot=
e></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span><=
/span><br></blockquote></blockquote></blockquote></blockquote><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span>also reports the entire file at "depth":0, which is misle=
ading, since</span><br></blockquote></blockquote></blockquote></blockquote><=
blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"=
><blockquote type=3D"cite"><span>we have just been arguing from the qemu:all=
ocation-depth perspective</span><br></blockquote></blockquote></blockquote><=
/blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span>(and also from bdrv_block_statu=
s) that the qcow2 image is NOT 100%</span><br></blockquote></blockquote></bl=
ockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><span>allocated (in the se=
nse where allocation =3D=3D data comes locally).</span><br></blockquote></bl=
ockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote typ=
e=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>Perhaps=
 it might be better if we tweaked the above qemu-img map to</span><br></bloc=
kquote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blo=
ckquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><s=
pan>produce:</span><br></blockquote></blockquote></blockquote></blockquote><=
blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"=
><blockquote type=3D"cite"><span></span><br></blockquote></blockquote></bloc=
kquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blo=
ckquote type=3D"cite"><blockquote type=3D"cite"><span>[{ "start": 0, "length=
": 65536, "depth": -1, "zero": true, "data": false},</span><br></blockquote>=
</blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>{ "=
start": 65536, "length": 65536, "depth": 0, "zero": false, "data": true, "of=
fset": 327680},</span><br></blockquote></blockquote></blockquote></blockquot=
e><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"ci=
te"><blockquote type=3D"cite"><span>{ "start": 131072, "length": 65536, "dep=
th": 0, "zero": true, "data": false},</span><br></blockquote></blockquote></=
blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite">=
<blockquote type=3D"cite"><blockquote type=3D"cite"><span>{ "start": 196608,=
 "length": 65536, "depth": -1, "zero": true, "data": false}]</span><br></blo=
ckquote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquo=
te></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"c=
ite"><blockquote type=3D"cite"><span>It will be more consistent with "offset=
" to drop "depth" from output</span><br></blockquote></blockquote></blockquo=
te><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"c=
ite"><span>if we don't have it:</span><br></blockquote></blockquote></blockq=
uote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span></span><br></blockquote></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span> &nbs=
p;&nbsp;&nbsp;&nbsp;[{ "start": 0, "length": 65536, "zero": true, "data": fa=
lse},</span><br></blockquote></blockquote></blockquote><blockquote type=3D"c=
ite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span> &nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;{ "start": 65536, "length": 65536, "depth": 0, "zero": fal=
se,</span><br></blockquote></blockquote></blockquote><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>"data": true, "=
offset": 327680},</span><br></blockquote></blockquote></blockquote><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span> &=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{ "start": 131072, "length": 65536, "depth": 0,=
 "zero": true,</span><br></blockquote></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>"data=
": false},</span><br></blockquote></blockquote></blockquote><blockquote type=
=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span> &nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;{ "start": 196608, "length": 65536, "zero": true, "da=
ta": false}]</span><br></blockquote></blockquote></blockquote><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote></blockq=
uote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>Yes, that mig=
ht work as well. &nbsp;But we didn't previously document</span><br></blockqu=
ote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>d=
epth to be optional. &nbsp;Removing something from output risks breaking</sp=
an><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>more downstream tools that expect it to be non-optional, compar=
ed to</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockqu=
ote type=3D"cite"><span>providing a new value.</span><br></blockquote></bloc=
kquote><blockquote type=3D"cite"><span>A negative value isn't any less unexp=
ected than a missing key. I don't</span><br></blockquote><blockquote type=3D=
"cite"><span>think any existing tool would be able to handle it. Encoding di=
fferent</span><br></blockquote><blockquote type=3D"cite"><span>meanings in a=
 single value isn't very QAPI-like either. Usually strings</span><br></block=
quote><blockquote type=3D"cite"><span>that are parsed are the problem, but n=
egative integers really isn't that</span><br></blockquote><blockquote type=3D=
"cite"><span>much different. I don't really like this solution.</span><br></=
blockquote><blockquote type=3D"cite"><span>Leaving out the depth feels like a=
 better suggestion to me.</span><br></blockquote><blockquote type=3D"cite"><=
span>But anyway, this seems to only happen at the end of the backing chain.<=
/span><br></blockquote><blockquote type=3D"cite"><span>So if the backing cha=
in consistents of n images, why not report 'depth':</span><br></blockquote><=
blockquote type=3D"cite"><span>n + 1? So, in the above example, you would ge=
t 1. I think this has the</span><br></blockquote><blockquote type=3D"cite"><=
span>best chances of tools actually working correctly with the new output,</=
span><br></blockquote><blockquote type=3D"cite"><span>even though it's still=
 not unlikely to break something.</span><br></blockquote><span></span><br><s=
pan>Did you consider just add a new field?</span><br><span></span><br><span>=
So, "depth" keeps its meaning "which level provides data".</span><br><span><=
/span><br><span>And we add additional optional field like</span><br><span></=
span><br><span>absolutely-completely-absent: bool</span><br></div></blockquo=
te><div><br></div><div style=3D"direction: ltr;">hole: bool?</div><div style=
=3D"direction: rtl;"><br></div><blockquote type=3D"cite"><div dir=3D"ltr"><s=
pan></span><br><span>Which is true if data is nowhere in the backing chain.<=
/span><br><span></span><br><span></span><br><span>-- </span><br><span>Best r=
egards,</span><br><span>Vladimir</span><br></div></blockquote></body></html>=

--Apple-Mail-1E37F757-26E9-43F9-9073-1DED126039A6--

