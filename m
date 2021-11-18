Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C327455CA0
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 14:23:33 +0100 (CET)
Received: from localhost ([::1]:42880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnhNz-0007is-OG
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 08:23:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mnhLc-0006fT-HC
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 08:21:04 -0500
Received: from [2a00:1450:4864:20::335] (port=38829
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mnhLa-0008J4-4l
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 08:21:04 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso7605360wms.3
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 05:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kzC0a8fIDZ4pD+13iNKPIa4WIUziOqiHEAEMYbuThSk=;
 b=xtjV1xB4FdbZBggcS7Vob6jhPFXJ0y8DlWgdPe3s18PnSjX9lPEkmqeg9M2upNJWTZ
 y0Ue8KpSKEmlVvczVPvB5r0f65AK484lCKL/OKM+Cet3vph1E3sqADsdP+h4z6yOuJNp
 Wv5fKNaWTpyqDKeG5aqlOLXa9prDB86xTSB26oN/QnhSe+L7FlHU13ySw1kVpd8AMQVV
 I8qqWZgT+1yodd6NUnGjEzTvyzwUJcaT0zwRKXXdewAy+jsNQkn1Cc651C/FRLT7WmiA
 +JYE2+2H+K9KefS45oXAq+4FTY7EyLz9Ko0Y+9miwawvrbd7QtPMEGEVcjbDVpYLFwQC
 +r/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kzC0a8fIDZ4pD+13iNKPIa4WIUziOqiHEAEMYbuThSk=;
 b=7IsD/C/csPjpEee3JpdwtuufHP3DHlxCCKUcpr4+6YrtLFEiWlEAz/xz1Hnbu0ngD6
 MfYk0O6arpUDjeKVJrJ6jxOFVNcpV03OfJobLrKRSaEhy316zXvbPxFuu4hvSARRH9C8
 TnI6VszmfrqSrJXY1zh/VzN1T/8Se7pPS+5gyslNLz9c3Xw3/coja07DutknO3r73IVS
 oTf7l1Pg+KpyqmE0Gh/GBQ70mUAhmWVcpI9OCOVPA/6PImlWpVNPKSNtBj55cA14nfRV
 cLrKo07YzD+Jn5RA+y6kIkWZE4Ep/rmcRKXpAJt7zgt54hnFsobp07sxwMIdeRLwsVkt
 I+GQ==
X-Gm-Message-State: AOAM5329MBNJVhhhJT6cIO3GaIerA0jb7HMiyU8aOV6bf7f0wSIy2pn2
 Kf3z3vsFU5SqvmJFq11H/JOtzbNrOkxg1ftb4AX4jA==
X-Google-Smtp-Source: ABdhPJxFDV/C3ymt2/plvH7QyGPYABQu/nfNWtWL+BaYVr22+Fr3v2pxIhxde0j4HFVMTpXK5WeQ5mBELqHpoEjbi2w=
X-Received: by 2002:a05:600c:1993:: with SMTP id
 t19mr10087448wmq.21.1637241660587; 
 Thu, 18 Nov 2021 05:21:00 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA9zmPds0+jHm8VY465XEhK6bbVPd+nDob1ruRPaHOua_Q@mail.gmail.com>
 <87r1bxzl5c.fsf@dusky.pond.sub.org>
 <e7ec3afc-6db9-822e-5a5e-dee7c4db8f34@redhat.com>
 <87pmr5cxbt.fsf@dusky.pond.sub.org>
 <CAFEAcA8sNjLsknea5Nt-tANEniFF2FYmjiV0xz=pr+vFwkX-gw@mail.gmail.com>
 <875ysunfwz.fsf@dusky.pond.sub.org>
 <CAKmqyKN9FWkNd2WpBsW8sdDdiQsmw-AVvG-kowiBigj5kRyZFQ@mail.gmail.com>
 <a1d797e7-a05f-cd39-80cf-3125e7522503@redhat.com>
 <CAKmqyKPn3OWjN+ytU19KD8_83QB+PL0ggwbY=AyZCFzqk3ttTA@mail.gmail.com>
In-Reply-To: <CAKmqyKPn3OWjN+ytU19KD8_83QB+PL0ggwbY=AyZCFzqk3ttTA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Nov 2021 13:20:49 +0000
Message-ID: <CAFEAcA_xWWC1ptxKUT7DOQECdJpdF+E7gSu4EM2BRcbxXbLgFg@mail.gmail.com>
Subject: Re: does drive_get_next(IF_NONE) make sense?
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, Markus Armbruster <armbru@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Nov 2021 at 13:04, Alistair Francis <alistair23@gmail.com> wrote:
>
> On Tue, Nov 16, 2021 at 2:10 AM Thomas Huth <thuth@redhat.com> wrote:
> > What kind of device is that OTP exactly? If it is some kind of non-serial
> > flash device, maybe you could simply use IF_PFLASH instead?
>
> It just says "one time programmable memory". I'm guessing it's
> sometype of eFuse.

We used IF_PFLASH for the Xilinx efuse devices we recently added.
So we should probably use that for consistency, unless we want
to instead say that efuses should be something other than IF_PFLASH.

Either way it's a compatibility break for command lines, so we
should probably try to have only one rather than two :-)

-- PMM

