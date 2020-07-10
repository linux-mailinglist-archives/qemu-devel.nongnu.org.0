Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D5021B130
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jul 2020 10:26:46 +0200 (CEST)
Received: from localhost ([::1]:39604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtoMo-0002rU-2l
	for lists+qemu-devel@lfdr.de; Fri, 10 Jul 2020 04:26:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1jtoLr-0002QE-GE
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 04:25:47 -0400
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:33955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1jtoLp-0004qG-MI
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 04:25:47 -0400
Received: by mail-ej1-x643.google.com with SMTP id y10so5159112eje.1
 for <qemu-devel@nongnu.org>; Fri, 10 Jul 2020 01:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=XdUKOLa5uVHX6YVetnsT+rST50JE8eRVilHlNqXilxk=;
 b=RcZT5Z0GI2hjNdsP92G0M4oUapLJEKPFqHVrYSt392ZvMWp/QOw9UtveoO0K4VycOj
 zk+GxLdwLgj10mqSyqP+MeD0QpExdvoz8cV8NcjmObPaQUsknJCR8OesY8OFD9noLaAd
 1d569tBNv5XmSx0dKqsf0negRf70Wk9vNCRdct7ioWeD6zGYUVfcvnlC8NOLnwGvzqMY
 9Ov7qUJoszt+tFnyrssP/9AtzF7KbBbs5ptPBHh3Ozt1R+RYBIml3W4cuAcy3OBHYT/L
 UYl7xajYvnbYQlBNjx1plfqBbZ/CXTUkzM0jmc1RH3uNow1pttTHzDqK/+2gzDvL02ax
 KtGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=XdUKOLa5uVHX6YVetnsT+rST50JE8eRVilHlNqXilxk=;
 b=bI1OxPDrJxCMs2qX9WGtu1fr9+xvM0IeAQQ3Xwr+EKo711EYijUr6rgmnDc12/ZrtI
 784I1KZRJaGJM72PK8K9uKS3IZC5WOebB6CqUFINT0gRBJgftEcwPY75OK8S8HhezGSG
 X8EdOM2seQ4CZWFM3of1v/YOBI00cOyaieTDb9nODSNZtOBFGsQtOK3pVzcUuJQWi115
 UyGCjNweLRISVC/Czgp1QrWQeGJKgMg9CVj7xCl/B/OqlEMl5Vc2mjtMgtVJ+JAOReQ/
 dwomQoGngDMbNDSfPIjAcm2yXxRSep55hCnhjGFYChZ67DeX7uCqGImnxXB/bo4C1XNx
 uadQ==
X-Gm-Message-State: AOAM5324YVx3KRJFno8g4BcZhucchpO1syNOWWS+A/Y9bMCYqxArWkTX
 8ITsq8ZT72kJNi0eUjPeWos4qQ==
X-Google-Smtp-Source: ABdhPJyxN5NdpkxwVtlm7jrkoXgjD6fE4eXJcaAVB65FPbMjiXIEpaSeVBzkwO5wxZt7zcSXkSQupw==
X-Received: by 2002:a17:906:c10f:: with SMTP id
 do15mr62895801ejc.249.1594369543913; 
 Fri, 10 Jul 2020 01:25:43 -0700 (PDT)
Received: from wks.local ([86.121.22.151])
 by smtp.gmail.com with ESMTPSA id lj18sm3212184ejb.43.2020.07.10.01.25.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 Jul 2020 01:25:43 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: Separate notifications from list messages?
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <CAFEAcA-Y_e9V2UTEZoVbxOWQcs_eP96cMQ1J2BtC6Y0AAUTgSA@mail.gmail.com>
Date: Fri, 10 Jul 2020 11:25:42 +0300
Content-Transfer-Encoding: quoted-printable
Message-Id: <FF6A540C-7C16-4FFC-9A6D-FAB9EFE56B7F@livius.net>
References: <E646BE29-B46F-4B56-ADF5-B0DC6CCEF422@livius.net>
 <0a3689e1-001a-76ec-894d-0bb63115ecdd@redhat.com>
 <CAFEAcA-Y_e9V2UTEZoVbxOWQcs_eP96cMQ1J2BtC6Y0AAUTgSA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Received-SPF: none client-ip=2a00:1450:4864:20::643;
 envelope-from=ilg@livius.net; helo=mail-ej1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Qemu Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On 10 Jul 2020, at 11:09, Peter Maydell <peter.maydell@linaro.org> =
wrote:
>=20
> What sort of notifications are we talking about here ?

For example:

...
Received: from mg.gitlab.com (74.90.74.34.bc.googleusercontent.com
 [34.74.90.74]) by smtp-out-n18.prod.us-west-2.postgun.com with SMTP id
 5f074fb9a33b1a3dd4571072 (version=3DTLS1.3, =
cipher=3DTLS_AES_128_GCM_SHA256);
 Thu, 09 Jul 2020 17:11:21 GMT
Date: Thu, 09 Jul 2020 17:11:20 +0000
Message-ID: =
<5f074fb827f26_7cd93fa34d371dbc1570d@sidekiq-catchall-02-sv-gprd.mail>
Subject: QEMU | Pipeline #164899134 has failed for master | 3d7cad3c
Reply-to: GitLab <noreply@gitlab.com>, GitLab <gitlab@mg.gitlab.com>
From: GitLab via <qemu-devel@nongnu.org>
...

Regards,

Liviu


