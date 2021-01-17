Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E48E22F91BF
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 11:32:10 +0100 (CET)
Received: from localhost ([::1]:54940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l15Lt-0005Km-7j
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 05:32:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1l15Kf-0004p0-RL
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 05:30:53 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:50356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1l15Kd-0006Rj-Ub
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 05:30:53 -0500
Received: by mail-pj1-x1033.google.com with SMTP id md11so7613075pjb.0
 for <qemu-devel@nongnu.org>; Sun, 17 Jan 2021 02:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lrVLKEWpJgbemesZNbvB76US9FYUdk+7ZQKMKtLMIOg=;
 b=eLca56D11X2ScNi5Xziz/jQKHFHLmv00X3SirkxmSbsDJS89Emfopz6ThtiEnd2YHn
 XprOnbVpbsSzOSmBoc43cnU3QQEM9LWE/XIRG5+n+ZWTh7ubi05KiMZ77tdGAowKKk6H
 0Jz/1cqgJEcOR5XRyYZU2zgVMCHULzEhMX4KnRVwLmuGBrKWQ7+1pGtVXArTvvcMCCRj
 ktN8oUjsrWIjl8FcsSkVeiRn9UFni2sDrDkTpIiLwVP9ZI2sA+WRb/+8qNMZR32PPXDz
 9YEJZx39lLvu3X8bDlIgNyMsbztqVPqKo+L3HLsz8TxYek5cylw1Ar01KdPIMSGikblf
 UeVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lrVLKEWpJgbemesZNbvB76US9FYUdk+7ZQKMKtLMIOg=;
 b=kgLVz/oA6zbfyUuaferq4WmRlrl4SUm9rtpSSS6oGQvaffweSPbc24YuzbZHE+a/bR
 yqR+t87RNVKi3sgiyJI/WhxxNPBob4w4xUHxnMX0ykmzIrKe6i4wgttFaGG3tpVdOsST
 fYU/yT+2EQLj2hiGdIzpEk7VlaD7ul4XlSDi1rQaZ445OyQXN02pOaMX6WFNGSlh0F5c
 HV4PjQKyIuhpeLdzMFA4R32PmjQJiAXSgqZiNbt8blgmDPPuEsQA9p+XaxoPRUfmO2gc
 oodLhO+WLowk+hA+xWuYHqtNBgmTQlWKDzegkoOKRBl3/tjFhRdva1QhDLMiHf4lwTO1
 wkJQ==
X-Gm-Message-State: AOAM532IMIWWQEoSFBfBMZFlaSAx+Jbje9oNLmgYwRiRZJwdnvXw/lO3
 HyLWXR3D4/qmoqVX/SXXeD9KvEy/KYIWRkymcDY=
X-Google-Smtp-Source: ABdhPJwVare0G9iotGCJ38uzt+qn5TnV++ScRT+aLoSsuqPO+LwPdazdz7bCetOGL1VqbAoJSBAXevfekFd5DzAP+Fs=
X-Received: by 2002:a17:902:6b01:b029:da:d295:2582 with SMTP id
 o1-20020a1709026b01b02900dad2952582mr21197290plk.14.1610879449722; Sun, 17
 Jan 2021 02:30:49 -0800 (PST)
MIME-Version: 1.0
References: <CAAQ-SiP8G28ade0jHbhTcv0jtGQb4OSgL5p3mAr0MU_FH8vZ3w@mail.gmail.com>
 <87a6tm2sxb.fsf@linaro.org>
 <CAAQ-SiOW8OnWEb0sHUEeS139-Tw0RO2YD1Tx-1s9iuy3ZVQFgw@mail.gmail.com>
 <878s941x85.fsf@linaro.org>
 <20210108083433.pfzhxrd4rezk6yxe@sirius.home.kraxel.org>
 <CAAQ-SiO4VvVTo77J2ga1FmUZ9yrwopeASweO6-AFaakrAUZ80w@mail.gmail.com>
 <CAAQ-SiPiq5NQN=2mvP3isZ9PtYO2Bu64kVEvE6T+3OJd5B-U5A@mail.gmail.com>
 <CAAQ-SiMkJGBnxWSnybJqMD0LSASMtvA_wbrPDQcg-S+Y1ddjJA@mail.gmail.com>
 <878s8zptrf.fsf@linaro.org>
 <CAAQ-SiNKXhJcT1XEodQT6kojqppq37Kg8F8igipQ-HVYOU0=zA@mail.gmail.com>
 <87ft33l8an.fsf@linaro.org>
 <CAAQ-SiMY8W9TS7eXgWuHY0m4yjaRbqqsZ+41Xyhxm+gW0sYakg@mail.gmail.com>
In-Reply-To: <CAAQ-SiMY8W9TS7eXgWuHY0m4yjaRbqqsZ+41Xyhxm+gW0sYakg@mail.gmail.com>
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
Date: Sun, 17 Jan 2021 16:00:38 +0530
Message-ID: <CAAQ-SiM8_XnW1Ar5xocR7pUG_WW4SrQSnaKhqr1rY62ti2pw7Q@mail.gmail.com>
Subject: Re: Fwd: VirtioSound device emulation implementation
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000006073c105b9161956"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006073c105b9161956
Content-Type: text/plain; charset="UTF-8"

>
> If you want to see an example of a branch new vhost-user daemon being
>> built up from scratch see my recent virtio-rpmb series. The first few
>> patches of in-QEMU code will be the same boilerplate either way I think:
>>
>>   https://patchew.org/QEMU/20200925125147.26943-1-alex.bennee@linaro.org/
>
> This really clears everything about vhost-user daemons. Thanks a lot.

I am currently looking at how the sound subsystem is implemented in QEMU.
If I can recreate something similar for the vhost-user daemon,
I'll make it a vhost-user daemon. Else I will implement
it as an in-QEMU device. Either ways, I'll provide an implementation
plan with a loose timeline tomorrow.
I will start writing the code for the device from tomorrow.

--0000000000006073c105b9161956
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
If you want to see an example of a branch new vhost-user daemon being<br>
built up from scratch see my recent virtio-rpmb series. The first few<br>
patches of in-QEMU code will be the same boilerplate either way I think:<br=
>
<br>
=C2=A0 <a href=3D"https://patchew.org/QEMU/20200925125147.26943-1-alex.benn=
ee@linaro.org/" rel=3D"noreferrer" target=3D"_blank">https://patchew.org/QE=
MU/20200925125147.26943-1-alex.bennee@linaro.org/</a></blockquote></div></d=
iv></blockquote><div>This really clears everything about vhost-user daemons=
. Thanks a lot.</div><div><br></div><div> I am currently looking at how the=
 sound subsystem is implemented in QEMU. <br></div><div>If I can recreate s=
omething similar for the vhost-user daemon, <br></div><div>I&#39;ll make it=
 a vhost-user daemon. Else I will implement</div><div>it as an in-QEMU devi=
ce. Either ways, I&#39;ll provide an implementation</div><div>plan with a l=
oose timeline tomorrow.</div><div> I will start writing the code for the de=
vice from tomorrow.<br> </div></div></div>

--0000000000006073c105b9161956--

