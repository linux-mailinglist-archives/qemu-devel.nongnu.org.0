Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6870483F2A
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 10:29:47 +0100 (CET)
Received: from localhost ([::1]:32786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4g8Y-0004C3-UY
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 04:29:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1n4g6w-0002sN-6A; Tue, 04 Jan 2022 04:28:06 -0500
Received: from [2a00:1450:4864:20::430] (port=35500
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1n4g6u-0000pL-OA; Tue, 04 Jan 2022 04:28:05 -0500
Received: by mail-wr1-x430.google.com with SMTP id j18so74853466wrd.2;
 Tue, 04 Jan 2022 01:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=QSI8aq+71VtTWoNtv700OTDliqIA8xFp89n1EUTk44I=;
 b=jtsoKv3liD2Syt2THIySzIroFx/K9xrTCd7oNCDrXGDz+d6g/wib3RDS+BWpuS925s
 LbMj60BaP6RkgmqhPwrnwZitnOLAkVie0tYBTt6Ql/VnF7fWpkblBycvtRiqcW70bZ3V
 lqhaUSVsiRWnGJg9vdmXzHXI0GAMbvyKMktshkFEZgwKOOGkIUsE5yA4hR2y9QW1vaZt
 DIZeElazA64MUFlDZo8t5AmSNaPN9qw7/kKqT82dV5hZOrkLrBv5ZIRPHDtVujpMjoGr
 hgeHig4C299Hx7xuQG7vtW82Svid26MKKaQOMHAhcduZFNGkpGXQxvd7nczzdvffj2RK
 eY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=QSI8aq+71VtTWoNtv700OTDliqIA8xFp89n1EUTk44I=;
 b=3Y4nu8PwUebhWG+AHpLeT5Lk2koUNO2u7ess9qofKLPv5KczkgkG/Yi6U3Qjiljvet
 hW2xSKvE0STzg2KM5OuBuLWXlUC3xsg98vXW0VlIqIJFfc3NhwiHAl6pkRVzVExRM9Nc
 3WarmbAnxzU5s4ypfTdCr/rWuoQBGy4tOw9v+O4d0p3/5nRAuv6PNzPOit58H0fV1kwy
 ewfHKZklhPuCRgmzGffi9QbRa0WLFihCJSDNNiZm2js1V+BepBHeXHPBTUGZmY65w3sw
 7R7KSxKHtPu7x+TEbUQbTa5R63LQzMgtJ7SaUnh+LWLj06rkFl6w6xq57sh+YgMEi5pL
 v47Q==
X-Gm-Message-State: AOAM533H82I83UawAgiBV81PnUQrE4fwCLQVKuksyXwdAhyKq3WeryZj
 SnTSIzi5K3FCASK/kxBOeEw=
X-Google-Smtp-Source: ABdhPJzAXNm49Zl0UYJfISCMnxyFW1vwyb6ik9AXMkBcP/s6DTgQkBXLku1irL7LPMVgba7TjO7vyA==
X-Received: by 2002:a05:6000:1449:: with SMTP id
 v9mr41846621wrx.49.1641288482786; 
 Tue, 04 Jan 2022 01:28:02 -0800 (PST)
Received: from smtpclient.apple (201.11.75.194.dyn.plus.net. [194.75.11.201])
 by smtp.gmail.com with ESMTPSA id
 b2sm41128920wrd.35.2022.01.04.01.28.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Jan 2022 01:28:02 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: [PATCH 1/2] hw/display/vmware_vga: only show debug output if
 DEBUG enabled
From: Carwyn Ellis <carwynellis@gmail.com>
In-Reply-To: <d46faaf5-17c9-20e9-83e8-fb6bcd87ee67@vivier.eu>
Date: Tue, 4 Jan 2022 09:28:02 +0000
Content-Transfer-Encoding: quoted-printable
Message-Id: <EF15CBA5-3A25-4963-931B-6736D779303A@gmail.com>
References: <20220104091135.61226-1-carwynellis@gmail.com>
 <20220104091135.61226-2-carwynellis@gmail.com>
 <5be97a9e-8df4-621a-8875-56979448a777@vivier.eu>
 <5DC1E921-4166-45E4-8EBE-BA07A2708956@gmail.com>
 <d46faaf5-17c9-20e9-83e8-fb6bcd87ee67@vivier.eu>
To: Laurent Vivier <laurent@vivier.eu>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=carwynellis@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ok cool.

Thanks for the info!

> On 4 Jan 2022, at 09:27, Laurent Vivier <laurent@vivier.eu> wrote:
>=20
> Le 04/01/2022 =C3=A0 10:20, Carwyn Ellis a =C3=A9crit :
>> Hey,
>> Thanks for getting back to me.
>> Yeah will take a look and update when I have a mo.
>=20
> It's really easy to do, see below for an example:
>=20
> ...
>>>>  @@ -297,45 +303,45 @@ static inline bool =
vmsvga_verify_rect(DisplaySurface *surface,
>>>>                                        int x, int y, int w, int h)
>>>>  {
>>>>      if (x < 0) {
>>>> -        fprintf(stderr, "%s: x was < 0 (%d)\n", name, x);
>>>> +        VMWARE_VGA_DEBUG("%s: x was < 0 (%d)\n", name, x);
>=20
> replace it by:
>=20
>    trace_vmsvga_verify_rect_check_neg(name, x);
>=20
> and in hw/display/trace-events you add:
>=20
>    vmsvga_verify_rect_check_neg(const char *name, int x) "%s: x was < =
0 (%d)"
>=20
> Thanks,
> Laurent


