Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C20F4484237
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 14:19:48 +0100 (CET)
Received: from localhost ([::1]:55782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4jj9-0008Om-JM
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 08:19:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1n4jh3-00069I-6M; Tue, 04 Jan 2022 08:17:37 -0500
Received: from [2a00:1450:4864:20::430] (port=46073
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1n4jh1-0001Rv-LP; Tue, 04 Jan 2022 08:17:36 -0500
Received: by mail-wr1-x430.google.com with SMTP id v7so76032324wrv.12;
 Tue, 04 Jan 2022 05:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=+fc5pRio4+WMiKWqnBvSS9a0SN3ZgBjI/DGotEeBVys=;
 b=eAdC/MezHyAOJPbKp8BZqu1rOC4JBS4/yPDUXXT9lWBJZRUMAI4OOoVH+AZ9noWDOS
 OcVKK9bfy5vaPd3CDjSS8e0Hga2BakpMaMBq2GKsw+183FomJZbXYDIGpqIy1dBhffdo
 bUEnhGeVh5EaZzVrqPRsj0ZQY7wQ90//4PNfl5JLR0C+ay9cxPzcUWoXc2PM0phtvWwT
 SzMaCQX6bPPM3MD6lCDnRqkEYpi2DMipZlRWO9ZZ6k6wwLVvlC4MK7SHJhvpUjakr1d9
 WHTDvBDo4Gh/qsm+l7DrzGVubb9MXWSjyOFKOkNnGWUPr5wQyluVsHLWIZ3kwOV7z+F1
 Dh+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=+fc5pRio4+WMiKWqnBvSS9a0SN3ZgBjI/DGotEeBVys=;
 b=E6plBlxxdo18+uB4WQZ4M8SU8AXRgc/njuiqWYqR9Ss/+3thNCamzmIz90yf8sm6NS
 6K0EGmDmY5JxP00C0WZwCsNXg8jTYkolrztgHjc5Jrc6mgZquYrU2heKFzisKzdmV+VG
 3pdYiNQz81vFoSeua8mzK51ENsBMmJE7osFtzSo8MLdqZAELUlf1CDfEPuh25NAKWbzr
 rPg175q6Kfs3fwUY6jY4SoObameNZEa9ec/IIVAWQZJE9n6DeQVDO9789Cc5IgJRlOtT
 6XyUKSDqG1LTeQ8aH3gMXb6NeOcMulykPIiPLMybPHXv/2PTVDXkIAxK44wY5uzASAYW
 FGbg==
X-Gm-Message-State: AOAM530fJd1ExfTKqfOyw6dzFosMNz5Y4YuZ9x/7qpCqemuXPE1YRvmK
 1UsiXvaHqTFFTugHShEHzIg=
X-Google-Smtp-Source: ABdhPJz8odjqj7XorCjyeTGUVEO+heI1TldQt2qFmmH0DjG1BD9577JtG7x1Jc0ixj6fOjdNkrqsCw==
X-Received: by 2002:adf:fa87:: with SMTP id h7mr41218003wrr.561.1641302252884; 
 Tue, 04 Jan 2022 05:17:32 -0800 (PST)
Received: from smtpclient.apple (201.11.75.194.dyn.plus.net. [194.75.11.201])
 by smtp.gmail.com with ESMTPSA id
 l2sm39461627wrs.43.2022.01.04.05.17.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Jan 2022 05:17:32 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: [PATCH 2/2] hw/display/vmware_vga: do not discard screen updates
From: Carwyn Ellis <carwynellis@gmail.com>
In-Reply-To: <20220104122350.ktsnpqfmtrmwcxrk@sirius.home.kraxel.org>
Date: Tue, 4 Jan 2022 13:17:31 +0000
Content-Transfer-Encoding: quoted-printable
Message-Id: <A9FA2066-AC8D-490F-B60B-6675EFF4A8F5@gmail.com>
References: <20220104091135.61226-1-carwynellis@gmail.com>
 <20220104091135.61226-3-carwynellis@gmail.com>
 <20220104122350.ktsnpqfmtrmwcxrk@sirius.home.kraxel.org>
To: Gerd Hoffmann <kraxel@redhat.com>
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
Cc: qemu-trivial@nongnu.org, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On 4 Jan 2022, at 12:23, Gerd Hoffmann <kraxel@redhat.com> wrote:
>=20
>  Hi,
>=20
>> This change firstly increases the screen update FIFO size to ensure =
it's
>> large enough to accomodate all updates deferred in a given screen
>> refresh cycle.
>=20
> How do you know it's large enough?
>=20
>> @@ -385,7 +385,14 @@ static inline void =
vmsvga_update_rect_delayed(struct vmsvga_state_s *s,
>> {
>>     struct vmsvga_rect_s *rect =3D =
&s->redraw_fifo[s->redraw_fifo_last++];
>>=20
>> -    s->redraw_fifo_last &=3D REDRAW_FIFO_LEN - 1;
>> +    if (s->redraw_fifo_last >=3D REDRAW_FIFO_LEN) {
>> +        VMWARE_VGA_DEBUG("%s: Discarding updates - FIFO length %d =
exceeded\n",
>> +            "vmsvga_update_rect_delayed",
>> +            REDRAW_FIFO_LEN
>=20
> Hmm, apparently you don't know ;)
>=20
> How about just calling vmsvga_update_rect_flush()
> when the fifo is (almost) full?

Yeah will give that a shot. Wasn=E2=80=99t sure how it=E2=80=99d play so =
did the simplest thing possible.

>=20
> Which guest do you use btw?  I'm kind-of surprised this is still being
> used even though it hasn't seen any development (beside fixing a bug =
now
> and then) for a decade or so and the feature gap to recent vmware is
> huge ...
>=20

This is an old vmware vm that rarely gets used. Figured I=E2=80=99d see =
if I could get it working over the holidays after making the move off an =
intel mac to m1, and noticed the issue with the output. In this case =
using the already configured vmware drivers was the least worst option.

> take care,
>  Gerd
>=20

Cheers
Carwyn=

