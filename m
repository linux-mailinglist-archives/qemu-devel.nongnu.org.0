Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 335AA1D7363
	for <lists+qemu-devel@lfdr.de>; Mon, 18 May 2020 11:00:06 +0200 (CEST)
Received: from localhost ([::1]:33574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jabcy-0001q3-TW
	for lists+qemu-devel@lfdr.de; Mon, 18 May 2020 05:00:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1jabbp-0000cV-ET
 for qemu-devel@nongnu.org; Mon, 18 May 2020 04:58:53 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1jabbn-0004Po-Pu
 for qemu-devel@nongnu.org; Mon, 18 May 2020 04:58:53 -0400
Received: by mail-wr1-x435.google.com with SMTP id y3so10881096wrt.1
 for <qemu-devel@nongnu.org>; Mon, 18 May 2020 01:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hHp6HQqP8CxYG/4Rd01ue5s3D4VjSDHLB0wx8aioeFk=;
 b=LSQBTXQ1Zy8Z28//rvFP052d6aA5Td4Rc+TKghjrjfM3dVNzWbhdQ8+r5WMuBhjkpW
 JGC5bROimXIfKBfp5gRyI1NhaAgumPTGYLtlyFMgEQnAfXicA4X2P/bFvSmZ2E8LAzzK
 33ha+0tgJz6L99xGB9jeCA2+MUfrcsP6ZHQNhp45fm3cp1XpMFp8Rq7LxudgAsc/mqk+
 s3gxFP/BM62l5EP46k8Gww6n5LF1KIM0UTJZ5CAYcoiVi5Ega0kRmrjLl3wVK2/ZaBWo
 S7YFVqZn0nJFyCclgh5eJ16o1rkTJPb6UeLP3UTaQegjWItZShIfGEhK/scY671IV1ik
 BMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hHp6HQqP8CxYG/4Rd01ue5s3D4VjSDHLB0wx8aioeFk=;
 b=QwdvvH0yOdl1IS7M4/PXR+Nw15LkCRz7IWz9LEX30v2MpQrsqoqTaePcdo3uGSZL91
 Ddti2n6xK8tDtN8PQTCA71lgmBUP2DSjiuFl3Qz6tDIpU4r87s/5KCXM1xxqdNgwQyUB
 nS1OvSdcyrPcqPbfFgelvodPPdjXQ3JmEdHjKFZIwsOy1+52srR3qLyhfQ00fFvToG5i
 5ioETOfuB/FI2c8dZwcGz6Rr4enWpDMKZDezdkit3TwHRwCnn+uGLOxrWKeOB1juIkAQ
 j6+yRl+wLrsxgxuxHHL66qAjEAW9pw82Lx3Ud5nTyixvyRqWFk3FEBNXNUftEllZdTOj
 fwCQ==
X-Gm-Message-State: AOAM532oDLagWvbS3CIM7jTNUDEmyXUBiR1fMNHpAzLw/SvH7mr3xJRT
 msUusmaVdvrMdUAFu0blc6K0YVIjlFVTw2SUwdU=
X-Google-Smtp-Source: ABdhPJwn18YcG8gStxrwmYw1FwIgrd6RcEyQc5QP5yZLCn9sxb786EyOwYI5v6FbS+iHo6wQZjTJnQ68NsgLuUU4mHg=
X-Received: by 2002:adf:ec45:: with SMTP id w5mr18907449wrn.96.1589792329967; 
 Mon, 18 May 2020 01:58:49 -0700 (PDT)
MIME-Version: 1.0
References: <1588417318-5055-1-git-send-email-raphael.norwitz@nutanix.com>
In-Reply-To: <1588417318-5055-1-git-send-email-raphael.norwitz@nutanix.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 18 May 2020 10:58:37 +0200
Message-ID: <CAJ+F1CKgxZPjm0C9mV8Y7S6vLY+m+6oTJpgJj3ieUuerGcDESQ@mail.gmail.com>
Subject: Re: checkpatch error checking target arch in libvhost-user
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Content-Type: multipart/alternative; boundary="000000000000182b9605a5e85fbf"
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x435.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_EXCESS_BASE64=0.979, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000182b9605a5e85fbf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, May 18, 2020 at 3:37 AM Raphael Norwitz <raphael.norwitz@nutanix.co=
m>
wrote:

> Hey Marc-Andre,
>
> I'm working on a patchset with changes to libvhost-user. I'm hitting the
> following checkpatch error:
>
> Checking 0011-Lift-max-ram-slots-limit-in-libvhost-user.patch...
> WARNING: architecture specific defines should be avoided
> #117: FILE: contrib/libvhost-user/libvhost-user.h:38:
> +#if defined(__i386__) || defined(__x86_64__) || \
>
> total: 0 errors, 1 warnings, 120 lines checked
>
> 0011-Lift-max-ram-slots-limit-in-libvhost-user.patch has style problems,
> please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
>
> I'm trying to set the maximum number of ram slots to the max supported by
> the
> target architecture, and I don't know how to check that other than using
> these
> macros. I see other architecture specific macro checks in libvhost-user.h=
,
> such as here:
>
> https://u16159052.ct.sendgrid.net/ls/click?upn=3DnHC8zHLUbSCl8801JuFxA5Id=
cFluFbhkOaN0W6nB6sLdfiznj-2FjAzM5FRqjRFWnMRnCWGbBIBOa9D0WJ4d1Dc3pvHvScsomf7=
72bjiFIvKp8WAltnuQtFL02yD-2FAsRP4Fatn_7ODZ15WWDMQmNnbs2AZi2sHUtcz4sYAIHQnA7=
58zSS8fPkeEx38eNnYKLOhQbGVVNhLgwecQ3iL3NTSbIliEXa-2FC6-2BtOz3p1GMC53C8NXjpT=
FaVfbIGOVMdJbGDgx1DQ1-2B8cWcp7Sf4KOdvdFRXGrnJ4qfS1C1gFLZkiXO2G16QOgNEZ8d4mS=
R4ELrAtWFNDmtrSLlPlf0u-2F8M2VUHg3zfUhnJ7KytK3PLS1pechDxa-2BYD2SmQyIm-2FHDMY=
2BGca2
>
> Should I ignore this warning? If not, do you have any other suggestions?
>

If we need to build libvhost-user per-target, we probably have to change
the build-sys - similar to how we build the various qemu targets. This
might be tricky, for host & target compatbility.

Can we make it a run-time value instead?

(I am on PTO, I might be a bit slow to reply ;)

--=20
Marc-Andr=C3=A9 Lureau

--000000000000182b9605a5e85fbf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 18, 2020 at 3:37 AM Rap=
hael Norwitz &lt;<a href=3D"mailto:raphael.norwitz@nutanix.com">raphael.nor=
witz@nutanix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Hey Marc-Andre,<br>
<br>
I&#39;m working on a patchset with changes to libvhost-user. I&#39;m hittin=
g the<br>
following checkpatch error:<br>
<br>
Checking 0011-Lift-max-ram-slots-limit-in-libvhost-user.patch...<br>
WARNING: architecture specific defines should be avoided<br>
#117: FILE: contrib/libvhost-user/libvhost-user.h:38:<br>
+#if defined(__i386__) || defined(__x86_64__) || \<br>
<br>
total: 0 errors, 1 warnings, 120 lines checked<br>
<br>
0011-Lift-max-ram-slots-limit-in-libvhost-user.patch has style problems, pl=
ease review.=C2=A0 If any of these errors<br>
are false positives report them to the maintainer, see<br>
CHECKPATCH in MAINTAINERS.<br>
<br>
I&#39;m trying to set the maximum number of ram slots to the max supported =
by the<br>
target architecture, and I don&#39;t know how to check that other than usin=
g these<br>
macros. I see other architecture specific macro checks in libvhost-user.h,<=
br>
such as here:<br>
<a href=3D"https://u16159052.ct.sendgrid.net/ls/click?upn=3DnHC8zHLUbSCl880=
1JuFxA5IdcFluFbhkOaN0W6nB6sLdfiznj-2FjAzM5FRqjRFWnMRnCWGbBIBOa9D0WJ4d1Dc3pv=
HvScsomf772bjiFIvKp8WAltnuQtFL02yD-2FAsRP4Fatn_7ODZ15WWDMQmNnbs2AZi2sHUtcz4=
sYAIHQnA758zSS8fPkeEx38eNnYKLOhQbGVVNhLgwecQ3iL3NTSbIliEXa-2FC6-2BtOz3p1GMC=
53C8NXjpTFaVfbIGOVMdJbGDgx1DQ1-2B8cWcp7Sf4KOdvdFRXGrnJ4qfS1C1gFLZkiXO2G16QO=
gNEZ8d4mSR4ELrAtWFNDmtrSLlPlf0u-2F8M2VUHg3zfUhnJ7KytK3PLS1pechDxa-2BYD2SmQy=
Im-2FHDMY2BGca2" rel=3D"noreferrer" target=3D"_blank">https://u16159052.ct.=
sendgrid.net/ls/click?upn=3DnHC8zHLUbSCl8801JuFxA5IdcFluFbhkOaN0W6nB6sLdfiz=
nj-2FjAzM5FRqjRFWnMRnCWGbBIBOa9D0WJ4d1Dc3pvHvScsomf772bjiFIvKp8WAltnuQtFL02=
yD-2FAsRP4Fatn_7ODZ15WWDMQmNnbs2AZi2sHUtcz4sYAIHQnA758zSS8fPkeEx38eNnYKLOhQ=
bGVVNhLgwecQ3iL3NTSbIliEXa-2FC6-2BtOz3p1GMC53C8NXjpTFaVfbIGOVMdJbGDgx1DQ1-2=
B8cWcp7Sf4KOdvdFRXGrnJ4qfS1C1gFLZkiXO2G16QOgNEZ8d4mSR4ELrAtWFNDmtrSLlPlf0u-=
2F8M2VUHg3zfUhnJ7KytK3PLS1pechDxa-2BYD2SmQyIm-2FHDMY2BGca2</a><br>
<br>
Should I ignore this warning? If not, do you have any other suggestions?<br=
></blockquote><div><br></div><div>If we need to build libvhost-user per-tar=
get, we probably have to change the build-sys - similar to how we build the=
 various qemu targets. This might be tricky, for host &amp; target compatbi=
lity.<br></div></div><div class=3D"gmail_quote"><br></div><div class=3D"gma=
il_quote">Can we make it a run-time value instead?</div><div class=3D"gmail=
_quote"><br></div><div class=3D"gmail_quote">(I am on PTO, I might be a bit=
 slow to reply ;)<br clear=3D"all"></div><br>-- <br><div dir=3D"ltr" class=
=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000182b9605a5e85fbf--

