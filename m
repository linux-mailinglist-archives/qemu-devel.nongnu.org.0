Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DB46EABF9
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 15:45:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppr3p-0005ww-32; Fri, 21 Apr 2023 09:44:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raghuhack78@gmail.com>)
 id 1ppr3l-0005wP-42
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:44:21 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <raghuhack78@gmail.com>)
 id 1ppr3j-0007ZS-Jp
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:44:20 -0400
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-b8f5121503eso2203328276.1
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 06:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682084657; x=1684676657;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cD0ppuWO1vVkl2wDiz+1twkxf8WSGwNpe1UcLT6v2J4=;
 b=avNYiqKQEjMO/OpIEdQhh/5FGQlxYFC/FWT9NDZB/j2XOQP9df9GDvpDBc0IzA0fxH
 A+JVTrw14ctthkC3PlxTOSDivW1wX0SXQbgQOX10RFnyJ4mrz8Xz28cPhgMKsfLIgx1l
 qL9hHmHjUR9q7vtfmaj584ruyf1gZSSVRTvn2y/5Uk6ZUjxMviBjltyMVcrgqDMcrbEh
 YGJxQorSehcJchb5bo8OT+mI/HD3VwQZ2F0x8MHLshYgfmYPiH87GPhZHeawU1Xv74ww
 XwIxklmkaDA8OmqzcVvTb3hX7s4Ol5L7COHfLExsAoC0Bq3D+hjwHxEG33HIoC2UInNy
 bJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682084657; x=1684676657;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cD0ppuWO1vVkl2wDiz+1twkxf8WSGwNpe1UcLT6v2J4=;
 b=AQakkhXFeARX3e6YeAFqc2VqlOQNjnzZL48HrFjiFbrl//L/aFC5+H2rNBv1CUX9tf
 o+vfBUGCRmXvkR2eLswNyks3/i0EmXBD1BvdtnzYen3sWvuaOrO8A6doBpa6ueViE+XY
 y3/V+yppYDgNPdz4UR7b5DSuVQcZ3tQg4aw/PxbfB38W3RCvmLP4cRXeoc9OM3sYqgCV
 RbX8CpNejVeN0Q6ADjQmdDtkl1J+/smsVsIbzrSa3bRpwdcr4Kl6Ytn59jKkUvH70JGV
 vXR5q9hPHNJOV82OskYKhGEgHdY1MvveZAgClwpMTvZ18MziXpTYz7QSjWvvHHjZstxG
 dCAg==
X-Gm-Message-State: AAQBX9eBBu7HuKJnaAZ9QPMtdsyiummii6i6Qd0ka3XPdxXlYuxwVtNh
 rKLyFi1owj4jYF1Bp51zONdfNXNb0qm/aBR+nt4=
X-Google-Smtp-Source: AKy350Zwc89pVVPwJsjPPszjz+ILZaVU+I4b3psgwDuiAF5F7RgERzhD9e/zOwZmfWBHj5AvRw6o+dTkFGvSAQkvNDM=
X-Received: by 2002:a25:694b:0:b0:b63:1309:2630 with SMTP id
 e72-20020a25694b000000b00b6313092630mr2072515ybc.35.1682084656862; Fri, 21
 Apr 2023 06:44:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAGWUp4oHxtj69B=gCtUAS_Fp0p6=wBjK_gViYKRqwkVBteCdeQ@mail.gmail.com>
 <20230421133546.000073e3@Huawei.com>
In-Reply-To: <20230421133546.000073e3@Huawei.com>
From: RAGHU H <raghuhack78@gmail.com>
Date: Fri, 21 Apr 2023 19:14:05 +0530
Message-ID: <CAGWUp4qOD=K31_OgrvzkjU+g7PA_Z1erN+yne==uynZ64mrm5w@mail.gmail.com>
Subject: Re: Error : "cxl_pci 0000:0d:00.0: Failed to get interrupt for event
 Info log"
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=raghuhack78@gmail.com; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Jonathan,

The log is from the upstream version.
I have your repo, I can work on it if you provide some basic details
like the commit ID.

Regards
Raghu

On Fri, Apr 21, 2023 at 6:05=E2=80=AFPM Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> On Thu, 20 Apr 2023 18:07:40 +0530
> RAGHU H <raghuhack78@gmail.com> wrote:
>
> > Hello,
> >
> > I am using qemu config listed in CXL documentation to emulate CXL devic=
e
> >
> >
> > -object memory-backend-file,id=3Dcxl-mem1,share=3Don,mem-path=3D/tmp/cx=
ltest.raw,size=3D256M
> > \
> > -object memory-backend-file,id=3Dcxl-mem2,share=3Don,mem-path=3D/tmp/cx=
ltest2.raw,size=3D256M
> > \
> > -object memory-backend-file,id=3Dcxl-mem3,share=3Don,mem-path=3D/tmp/cx=
ltest3.raw,size=3D256M
> > \
> > -object memory-backend-file,id=3Dcxl-mem4,share=3Don,mem-path=3D/tmp/cx=
ltest4.raw,size=3D256M
> > \
> > -object memory-backend-file,id=3Dcxl-lsa1,share=3Don,mem-path=3D/tmp/ls=
a.raw,size=3D256M
> > \
> > -object memory-backend-file,id=3Dcxl-lsa2,share=3Don,mem-path=3D/tmp/ls=
a2.raw,size=3D256M
> > \
> > -object memory-backend-file,id=3Dcxl-lsa3,share=3Don,mem-path=3D/tmp/ls=
a3.raw,size=3D256M
> > \
> > -object memory-backend-file,id=3Dcxl-lsa4,share=3Don,mem-path=3D/tmp/ls=
a4.raw,size=3D256M
> > \
> > -device pxb-cxl,bus_nr=3D12,bus=3Dpcie.0,id=3Dcxl.1 \
> > -device pxb-cxl,bus_nr=3D222,bus=3Dpcie.0,id=3Dcxl.2 \
> > -device cxl-rp,port=3D0,bus=3Dcxl.1,id=3Droot_port13,chassis=3D0,slot=
=3D2 \
> > -device cxl-type3,bus=3Droot_port13,memdev=3Dcxl-mem1,lsa=3Dcxl-lsa1,id=
=3Dcxl-pmem0 \
> > -device cxl-rp,port=3D1,bus=3Dcxl.1,id=3Droot_port14,chassis=3D0,slot=
=3D3 \
> > -device cxl-type3,bus=3Droot_port14,memdev=3Dcxl-mem2,lsa=3Dcxl-lsa2,id=
=3Dcxl-pmem1 \
> > -device cxl-rp,port=3D0,bus=3Dcxl.2,id=3Droot_port15,chassis=3D0,slot=
=3D5 \
> > -device cxl-type3,bus=3Droot_port15,memdev=3Dcxl-mem3,lsa=3Dcxl-lsa3,id=
=3Dcxl-pmem2 \
> > -device cxl-rp,port=3D1,bus=3Dcxl.2,id=3Droot_port16,chassis=3D0,slot=
=3D6 \
> > -device cxl-type3,bus=3Droot_port16,memdev=3Dcxl-mem4,lsa=3Dcxl-lsa4,id=
=3Dcxl-pmem3 \
> > -M cxl-fmw.0.targets.0=3Dcxl.1,cxl-fmw.0.targets.1=3Dcxl.2,cxl-fmw.0.si=
ze=3D4G,cxl-fmw.0.interleave-granularity=3D8k
> >
> > Kernel logs show cxl_pci module error while setting up irq
> > (cxl_event_irqsetup in drivers/cxl/pci.c)
> >
> > cxl_pci 0000:0d:00.0: Failed to get interrupt for event Info log
> > [    3.984800] cxl_pci 0000:e0:00.0: Failed to get interrupt for event =
Info log
> > [    3.984841] cxl_pci 0000:df:00.0: Failed to get interrupt for event =
Info log
> >
> >
> > Is this expected in an emulated environment?
>
> Upstream QEMU? Or a version of my staging tree?
>
> Upstream doesn't support events logs yet, so this may the outcome of that=
.
> It missed the 8.0 cycle due to some problems with other series that I'd
> based it on top of.  Hopefully will start to get those resolved shortly
> and get as far as events support this cycle.
>
> Thanks,
>
> Jonathan
>
> >
> > Regards
> > Raghu
>

