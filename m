Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C404B522F
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 14:53:53 +0100 (CET)
Received: from localhost ([::1]:47802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJbnb-0005Cl-Qh
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 08:53:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1nJb3L-0002jd-WA
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 08:06:04 -0500
Received: from [2a00:1450:4864:20::62f] (port=39651
 helo=mail-ej1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1nJb3J-0000X1-Qw
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 08:06:03 -0500
Received: by mail-ej1-x62f.google.com with SMTP id p9so14407951ejd.6
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 05:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=o4hVz3dcLyC96gjgfHQZeoJRWLW98BValZllJnQjFtA=;
 b=r8vZguJnrIxwvHBmb0DRTjIRDqbwUxt58nH6ooY6iQL834c/qaVEq6FYho5RuEFNb4
 mIOXj3InceFwgHZ+doCbjCE/cFcAW6yzdsMeS0QbVUno5D05ni1blsOpYRd29eG2aJl4
 BoXhKt1a3GJz2A1Av7QJTQ8RuefhXN5eV5CcgelBg7zqSwV9wqPaBdpaTFtrDEpN1SrB
 d1j4Md6mkN8mpEiAoCn0QnCbA3N3TgDIQ+uZLgXo/MQscbAt1sJaNN9Gaa2geUM3x5sS
 qC0tsxVRTIi9zOMtRTnEFIHMLZLljrXvzBy01mNIjg8KSZxj/Wl0Jh0rCqbA44sXPdwS
 qCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=o4hVz3dcLyC96gjgfHQZeoJRWLW98BValZllJnQjFtA=;
 b=iRopi9QdqTH31ccAoAqk2I0sOktYq9oNHj7WVKWbxDMY+NBh3ydkE7l/3tnkircCIi
 C3724GDAstNTmZ0V0+Efs+pug5RIqFimoKSW9OXgAghwAyXtozUMiS/Fvawga+M7K8ey
 fzqAlpCyGdjJ/R7dCqJM4sDV6girXc9d6moxJttp/cBfZlYVr65XPcvURilolvpn2ude
 MI3XL3RYvQRvTl5ac7QJSvHSN3ZOWxmK2adKUox3jvhuaNNjOBMS5ETYChNjYrRPx4Sg
 cyVMhwfbQ8+BdNOi9ippc3gQx90rHkpEgSUM70pqJGuNqqhjrTd7vk1AGptM41qlZ8zK
 9pVw==
X-Gm-Message-State: AOAM533AgSuE5+IguoD2wg6gHqskLgXk+t3QKZCY9LF97TGS4RGSum6Z
 sT/2MXxl4tkdPTz0c+Bb7f/Kug==
X-Google-Smtp-Source: ABdhPJzQmTXIoDHPvEpzgf8k92ipW1iQmP71B9/WAPjEciZpqGA9Rf8/ANAy0fKfAlF352Oy9NUn/A==
X-Received: by 2002:a17:907:1b09:: with SMTP id
 mp9mr11219778ejc.587.1644843960328; 
 Mon, 14 Feb 2022 05:06:00 -0800 (PST)
Received: from smtpclient.apple ([188.25.251.197])
 by smtp.gmail.com with ESMTPSA id dy15sm14751717edb.3.2022.02.14.05.05.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 14 Feb 2022 05:05:59 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: [PATCH] Add --with-branding-prefix and QEMU_BRANDING_PREFIX
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <YgpLAAztd6qNTwmm@redhat.com>
Date: Mon, 14 Feb 2022 15:05:58 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <B37774A8-1751-4449-B84E-86FF31504B8C@livius.net>
References: <20220120113545.55820-1-ilg@livius.net>
 <8A1E1B8F-ADA0-4966-A4E9-C0A08EB0A327@livius.net>
 <D6833D18-344A-473E-AC4D-89A64F8AA0EC@livius.net>
 <CAFEAcA91q2t9sVvaW6h3BwFMExgyCdVsb3TozH52EM70aPJt4w@mail.gmail.com>
 <46F93823-E819-4B8B-ACD3-D8A80245BC9E@livius.net>
 <CAFEAcA9YxQFug5vuHwi5koHUDZiBfMVHUr8yfby9r5D0b6hM=Q@mail.gmail.com>
 <08631A61-4E68-4A3A-99DC-56C3FDD5A780@livius.net>
 <YgpLAAztd6qNTwmm@redhat.com>
To: =?utf-8?B?IkRhbmllbCBQLiBCZXJyYW5nw6ki?= <berrange@redhat.com>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62f
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::62f;
 envelope-from=ilg@livius.net; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On 14 Feb 2022, at 14:28, Daniel P. Berrang=C3=A9 =
<berrange@redhat.com> wrote:
>=20
> In a .git checkout, pkgversion defaults to "git describe --match 'v*' =
--dirty"
> See scripts/qemu-version.sh

I see. I would say that this is a different use case.

Thank you,

Liviu


