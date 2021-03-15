Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 032A533C49E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 18:39:32 +0100 (CET)
Received: from localhost ([::1]:33574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLrBg-0002Dn-VE
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 13:39:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lLr7w-0008Hm-0I
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 13:35:36 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:34251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lLr7g-0005Nw-8u
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 13:35:30 -0400
Received: by mail-io1-xd35.google.com with SMTP id o11so34332972iob.1
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 10:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4FTo0J7NRfiaMnJjHelZrG/tsjW/pNVfNNe8ZmZwlqQ=;
 b=mdOHCHtalJwxdG64hNQfeGWPLCVGAbWHfxWXeOjNZ8mCetIxbDl6/rB/g5wa4YgDLi
 EJ9dn7LnB+VJGxkeKxNukRF56GHVGnkFPdKGPyKzo3Rc+2SD/Zc3InwE9iKQ5uEBIXtK
 kmpLhGMkzrwKpNZh+5mxz9fTWET38aRtXvENUJrb7vGb3aSzHSAHCnhmrDnTR7voEweh
 oou75kLR4QAGccO5g2fqGzMhpBVp7LcdZWWTtNJOYwhd4szQgtIzV1N9Qpo0MG4zy8JE
 cBCrkwF4QqYLsdf2qHGjg0PM3p6eBMpdetEN/MPcwASspVxtRMBXwdsYyJAWGt7fXzp3
 qEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4FTo0J7NRfiaMnJjHelZrG/tsjW/pNVfNNe8ZmZwlqQ=;
 b=qyM7ZJZSErY7XRB4nbrI1dMzteRDdPsv3HpkW9GynlN0r7nQJUWIEuIFilThUM8lBA
 sFDcafL4z1nRUgSJcCVHKdmIaOVnRTOUcF4uXdsY9PeC8OayuoZCv7vATYWAe+KBqfFj
 FTa5Gqh58kVapaZm7CDA8fZUMJlebNVrRnuHqYuC7JwomqXmj8xBnw8z8ZurL4NwwuZB
 DY2cD2A28nidkRp2VYqOSQwgugTmrKqx/FldlLOBx5/TDpH7+LBPOPz2jEwLuZCymtbs
 V2uWi8UqSh9UOw+1jcJyJr/YqkkfUCEA+LUnQv8xIIndEsppCzfR8CROWvB5y/pi+odV
 X1KQ==
X-Gm-Message-State: AOAM532FmOedDueZi8+SgOPHVPS3jQzI4tQWbwSZ2G7EY4ndcUMdHRpx
 HYkYwyEmM9i7UMkSW6k3q8oYiAKQsEVTpR1HJKk=
X-Google-Smtp-Source: ABdhPJzO2Cer6+jXeFSDzsX0NwkAUqN0xugSIKMyx1Ekutas6Yr3BnZp+gLXUDgL5EA+t1s3m74PkhA2RT1j6Egmbnc=
X-Received: by 2002:a6b:4f09:: with SMTP id d9mr528079iob.60.1615829718118;
 Mon, 15 Mar 2021 10:35:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210314032324.45142-1-ma.mandourr@gmail.com>
 <20210314032324.45142-4-ma.mandourr@gmail.com>
 <87y2eo8kd5.fsf@linaro.org>
In-Reply-To: <87y2eo8kd5.fsf@linaro.org>
From: Mahmoud Mandour <ma.mandourr@gmail.com>
Date: Mon, 15 Mar 2021 19:35:07 +0200
Message-ID: <CAD-LL6htGxRPPM3VyTvE=OGQPUc+_UobTmSQ=q_wWPHw5f1y0w@mail.gmail.com>
Subject: Re: [PATCH 3/8] hw/audio/fmopl.c: Replaced calls to malloc with
 GLib's variants
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000005db20b05bd96aca0"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=ma.mandourr@gmail.com; helo=mail-io1-xd35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--0000000000005db20b05bd96aca0
Content-Type: text/plain; charset="UTF-8"

Thank you for the valuable feedback. I tried as much as I could to maintain
the semantics as is, only changing the calls to GLib's functions.

To assure myself that I understood the directions of your feedback, the
initialization
of the tables can be done using g_malloc directly and all the null checks
for the tables
to be dropped. And that's because of the cruciality of this initialization
code.

Can you please elaborate more on how I would employ g_autofree in this
code? Are
you talking about the memory allocated for ``ptr`` in OPLCreate here?

Thanks
Mahmoud Mandour

--0000000000005db20b05bd96aca0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you for the valuable=C2=A0feedback. I tried as much=
=C2=A0as I could to maintain<div>the semantics=C2=A0as is, only changing th=
e calls to GLib&#39;s=C2=A0functions.</div><div><br></div><div>To assure my=
self that I understood the directions of your feedback, the initialization<=
/div><div>of the tables can be done using g_malloc directly and all the nul=
l checks for the tables</div><div>to be dropped. And that&#39;s because of =
the cruciality of this initialization code.=C2=A0</div><div><br></div><div>=
Can you please elaborate more on how I would employ g_autofree in this code=
? Are=C2=A0</div><div>you talking about the memory allocated for ``ptr`` in=
 OPLCreate here?</div><div><br></div><div>Thanks</div><div>Mahmoud Mandour<=
/div></div>

--0000000000005db20b05bd96aca0--

