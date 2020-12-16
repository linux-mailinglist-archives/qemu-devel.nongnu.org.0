Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF73F2DC3EC
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:20:35 +0100 (CET)
Received: from localhost ([::1]:40050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpZXW-0001eA-79
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:20:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpZTs-0006fX-RQ
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:16:49 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:51365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpZTq-0005wd-Nh
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:16:48 -0500
Received: by mail-wm1-x334.google.com with SMTP id v14so2904920wml.1
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=BlRVFzYg0YATRJwvOhY2MUKzZxUYJDYw1JyM/TsC86k=;
 b=sNu+U7hmwzN2hb/0hmIvPHHSvZ85vNOj+GLVnxOHE2TxK5Xf5ie+rghcubUEMnLDav
 HqyZ+zvKPo4nImO81MBMqxoV7CjPXlCviHooKCZeobJ+iJzVVhZ/ZDeejpFiZRUO31QL
 uS2JJahAsrvRlowLpagaGkSSd1lw2kZ4tM9tBDWk7t9iKKzEXc7L/bDRHAmnvP/NBGv0
 EBdg8k+4WnVUC0RpkiFoLUOUrEZvoO1286AgQrizZ9zDr5kgbBRSj7ygb6mpv15Zk09o
 5ru6AT923A/oKXVSHKEW3oXGxfu1/SIuG3xv2jEBezkn733CZSLXUs8KM2kUiKJSNE1X
 admA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=BlRVFzYg0YATRJwvOhY2MUKzZxUYJDYw1JyM/TsC86k=;
 b=tolTfBvz+ID3rjqqQT24lBtOHXRr8fCXi+tzUbC6nPba77Ox52Jvbsw5QgqIDa70T8
 KLnUVUKhsXhUR8R1AWfCQGCuhexCq62M8+JBC14rfIL6OsntQXul1ivnJPKXh38Gjayh
 FowSEigafvTfonm8GT50hYwL55huC8QQO2XOyNbsWFvDDMLBHqvPjyhdRs0OV+9x+glB
 lvN7W9OjxfvtRzDCGlxpHSlvVKsgnRY3eL/yYVGCmYBzx49zDFwQhio5Z0ZNu2QTF/AJ
 qiHsY2cMR3FMMVCG5Zqx/jfCVkaIBNgPA46TXKZhhlhVE1Zf/52Ys3LdKwiLmHDwLeEb
 pgGw==
X-Gm-Message-State: AOAM530kr5Ud1a2MEv4mpw1U9EtJ4I26t7bTAfaDAWQzCrxWnCf+lCVr
 HofNB/0uiti+amBjQOF4sFwWPw==
X-Google-Smtp-Source: ABdhPJyfPprBuFPfhiyjxLxivMiUY6LCOOykw8LD6vQ5/1a9ovE5ZfrGMEKzm/4iuoMKf6FFpAYnEQ==
X-Received: by 2002:a1c:a185:: with SMTP id k127mr4316311wme.23.1608135403724; 
 Wed, 16 Dec 2020 08:16:43 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x17sm3850245wro.40.2020.12.16.08.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 08:16:42 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6F3271FF7E;
 Wed, 16 Dec 2020 16:16:41 +0000 (GMT)
References: <20201215224133.3545901-1-ehabkost@redhat.com>
 <20201215224133.3545901-3-ehabkost@redhat.com>
 <CAMxuvax3MkDLRGAQh5NDs3rwv3qV7dCw=ne-8PYrovboq-ZNCw@mail.gmail.com>
 <62956652-6b89-1bc0-d816-e88f6282b9ee@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 2/2] qom: Assert that objects being destroyed have no
 parent
Date: Wed, 16 Dec 2020 16:15:57 +0000
In-reply-to: <62956652-6b89-1bc0-d816-e88f6282b9ee@redhat.com>
Message-ID: <87tuslsp3q.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> On 16/12/20 08:53, Marc-Andr=C3=A9 Lureau wrote:
>>=20
>> On the principle, I fully agree. But the risk is high to introduce=20
>> regression if objects are manipulated in strange ways.
>>=20
>> I remember I wanted object_unref() to automatically remove itself from=20
>> the parent when the last ref is dropped. I think there were similar=20
>> concerns.
>
> unref and unparent are two very different operations; the former means=20
> *I* am done with this object, the latter means *QEMU* is done with this=20
> object (even though there may be a few reference held, e.g. on the call=20
> stack or by RCU).  Since object_unparent operates on global state, you=20
> can even call object_unparent if you don't own yourself a reference to=20
> the object and just got the pointer from the caller.
>
> While unref is a "mechanical" operation of dropping a reference and=20
> possibly freeing the object, unparent is an active operation that=20
> includes for example dropping reference cycles or in general detaching=20
> from other places that are known to hold references to this object.

This all sounds like good material for a QOM object lifetime section of
docs/devel/qom.rst

>
> This is not a concept that is specific to QEMU, I think I read somewhere=
=20
> that LibreOffice's UI library does something similar, calling it "dispose=
".
>
> Paolo


--=20
Alex Benn=C3=A9e

