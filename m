Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA146E2252
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 13:36:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnHhL-00076p-Kx; Fri, 14 Apr 2023 07:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raghuhack78@gmail.com>)
 id 1pnHhH-00075Y-Ny
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:34:32 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <raghuhack78@gmail.com>)
 id 1pnHh5-00009L-5q
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:34:31 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-54bfa5e698eso492390677b3.13
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 04:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681472055; x=1684064055;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kyXVpuTojFq3QtTzxoJjcoCcBTZFztvz7v9HOFhVUXU=;
 b=Ajbyvw2ehiKimuGFONyEQ/rqlJ3rQcXO47blM6SrHEmTHe4DfVeljLLl6BIec+R2ai
 wY3g3aSZISHyYJrsc25R96hC1LIdMELMcfp0zPNWn+pyqEck4k3hZXC5omiJRN1FAijz
 9q+09eHjytX5AOLs5Oq8e8sDU/hTBJYNJ2W5Y67jC4gzKOwkCGUYjNuzvSiG3FeMM5AD
 sM21D8XjwmPicpYQDbB0d8KdCYc6SHUiqN519109yblc6zoyQBhNVGHdzQwP8/x5VG7g
 rA0nU/AcKJ1LHQDuznZS3dsGh3P0V9kEb+4DfJpYKsjgN+4e4gtN2bCF650zb0gcKxqf
 BAoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681472055; x=1684064055;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kyXVpuTojFq3QtTzxoJjcoCcBTZFztvz7v9HOFhVUXU=;
 b=ZF3l8ubH2Tp0Sj6ADunmDd7lhbrBRanScuifGMq5KaKP3SzFlyQzYCEo+RfTB+kcwC
 brzkZM+oghU7TP4Sq4Mn/DiRfekoJQZl40xAG2ZkJqHJF6T1Y9SxOQ5ULb/8bGb9vke+
 2rNrSlIaJTqbYQHD3yeNcqlMOejvlvpxQuSZyO9oyjVz4jAsjGDHPAS9T5JqRsP497BK
 vDWqwVipcFG5bNH0V7x8+mOp8t/PubynirEyZVtkNtHA55FmBnrXejZv7s6Axu4xjCMq
 mHL2F4aZ1qCtVfuL4ABcL9d8+x0YVCn12J6BpSxwB2b+BpH0+7EzprHe3TNm9EJbyRkX
 3P5w==
X-Gm-Message-State: AAQBX9deewojF3ckzGkxKNOTiD6fyiW/m/n9BC2WEzuuL0dNcnXID5kO
 uN4ZruEURUtaoUD7l26kQuWtxNuInUlOHB3tmls=
X-Google-Smtp-Source: AKy350YT7OP7GM4jE/B2F0w20WlShAQZO0IJ8oYHev39OogQCK7g8JYtm9XtRdB9FvWGooIZr1GRLdnn+P+srwrV9ks=
X-Received: by 2002:a81:e443:0:b0:54c:fd7:476e with SMTP id
 t3-20020a81e443000000b0054c0fd7476emr3549054ywl.3.1681472054615; Fri, 14 Apr
 2023 04:34:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230406113640.0000277c@Huawei.com>
 <20230406132839.3357195-1-raghuhack78@gmail.com>
 <20230413102804.00006cae@Huawei.com>
In-Reply-To: <20230413102804.00006cae@Huawei.com>
From: RAGHU H <raghuhack78@gmail.com>
Date: Fri, 14 Apr 2023 17:04:03 +0530
Message-ID: <CAGWUp4r9J9RfvvsWsbKw60W3qhdzH8aQWYaFxTxTnOceL3kULQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] Update CXL documentation
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: maverickk1778@gmail.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=raghuhack78@gmail.com; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Thanks Jonathan! I assume it will be merged sometime later with your
other patches in the 8.x version!

On Thu, Apr 13, 2023 at 2:58=E2=80=AFPM Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> On Thu,  6 Apr 2023 18:58:37 +0530
> Raghu H <raghuhack78@gmail.com> wrote:
>
> > Thanks Jonathan for quick review/comments on earlier patch, as suggeste=
d
> > splitting into two separate patches
> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg952999.html
> >
> > Removed the unsupported size option for cxl-type3 device, Qemu reads
> > the device size directly from the backend memory device config.
> >
> > Currently the Qemu CXL emulation for AARCH64 is not available and its
> > only supported on x86_64 platform emulations. Removing the incorrect
> > information and populating with supported x86_64 sample command to
> > emulate cxl devices.
> >
> > The document will be updated when the AARCH64 support is mainlined.
>
> Both look good to me.  No need to rush these in.
>
> I'll queue these up in my local tree (and update gitlab/jic23/qemu
> sometime later this week) but if anyone wants to pick
> them directly that's fine too.
>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>
> >
> >
> > Raghu H (2):
> >   docs/cxl: Remove incorrect CXL type 3 size parameter
> >   docs/cxl: Replace unsupported AARCH64 with x86_64
> >
> >  docs/system/devices/cxl.rst | 17 ++++++++++-------
> >  1 file changed, 10 insertions(+), 7 deletions(-)
> >
> >
> > base-commit: 7d0334e49111787ae19fbc8d29ff6e7347f0605e
>

