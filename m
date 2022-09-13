Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2AC5B6AFC
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 11:44:35 +0200 (CEST)
Received: from localhost ([::1]:60150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY2T4-0002N6-7U
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 05:44:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1oY2Nm-00071D-D3
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 05:39:06 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:46810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1oY2Nk-00065u-90
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 05:39:05 -0400
Received: by mail-yb1-xb29.google.com with SMTP id 202so16762950ybe.13
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 02:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adacore.com; s=google;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date;
 bh=Vjg83gPWLDPLUQpoQ3Nsq8tnGY8IGQ6USNYzLVULi5k=;
 b=cjq8VfKkeY94Yq6QoeBu/0k03ufr8EL1ts4fzW5hYjq2mxAmg99lycQxDdQoYSEqHH
 MTeFeEHIIHd3KfIBa8MdmWtuPfhlb3zdm/wAyEdAK0B9l4RT/GGI7ewj+mJdheluYjEg
 xuBKiN21DoCiShDUvKey/L4azqbs2mbg9J3cWU/F36avzXmfalh3lT38XEaTYtMauml9
 eoGd7T/NqZXu7PuPqD0DtriZA/+4BtRok/l7ql0zW5ZBuGAOv5PpMF/7z+Rys0j6/IEZ
 SgHvC7b2s3WvlDKXdpv/IcjL2JOoVDefReGBI5b3oRAZQlqCaMJy1EZyetUTD4wRPgO8
 ueOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Vjg83gPWLDPLUQpoQ3Nsq8tnGY8IGQ6USNYzLVULi5k=;
 b=HicBnztKPnzf7KC7pq18MQDClg7tb95t3ZH466YueEJiZ1YB4SqJAnNdeOO2hfM/T0
 8ApJp/RilyZqmAYAdGFdrpz7JWee9LU2dmvOrZbTeBuixqetb4jTfCTmwIPlE+eszha5
 jGLrLfc+QxIJ3ImNPrnDfpIi+cAbfY8vjttoKtKMz+9rD+9M51N3/u/v9avcjFuILkj5
 R0i4hMh+Ry0xMExrJl29dfiMvGWyQmCsyfVs5cFNAo0H7nnNuI4Kno+KBAQPam8FNDwg
 9vdjXgL16bg5eTYaIwl/5NQXPNrCUkhNRJShpxjbj0RB4qzDicsfoySevDeXyJUfnvXk
 rTJA==
X-Gm-Message-State: ACgBeo2Dm1eeIPOM0pkxkOM530idEX15wQn4KQauQhjQCGQtWdiHBcgG
 YCoUvuAwcrtfxjUoqN/GOth4YmBnMb1VHJCXm87vlX0ZnfhAlg==
X-Google-Smtp-Source: AA6agR4t6uf+gYBVUABjB4ibkwKI2gZ88Ft4/AuRu3ae0jmPV0YDDc+yq3aMUvCeWOnVlMeH9cTbTa9FHdxzDD90P6U=
X-Received: by 2002:a25:d506:0:b0:6ae:cdd4:8149 with SMTP id
 r6-20020a25d506000000b006aecdd48149mr10911233ybe.306.1663061940677; Tue, 13
 Sep 2022 02:39:00 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Date: Tue, 13 Sep 2022 11:38:50 +0200
Message-ID: <CAJ307Ej5stZr6fPsLROFBkmtg=uzkG50yVVY6=Ru6LTLQzae5A@mail.gmail.com>
Subject: Question about loading bare metal firmware
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=chigot@adacore.com; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

I'm wondering if there is an official way to load bare metal software
within qemu emulations.
I've seen a lot of people (including us) using -kernel. However, the
doc seems to imply that the generic loader would be a better approach
(cf [1]). I know that the compatibility with older Qemus is one of the
reasons why -kernel is still highly used. I've also seen that the
reset vector can be initialized automatically by -kernel unlike with
the generic loader (this is the case with RiscV AFAICT).
But is there any kind of official recommendation on that topic ?

I'm asking that because a recent change in RiscV Polarfire Soc is
forcing -dtb to be passed along -kernel. But in case of bare board
software, -dtb isn't needed (at least in our use case).
I've a patch that allows "-dtb" to be missing with "-kernel" only if
"-bios none" is provided. But I'm not sure if this is the right way to
say "it's a bare board software".

@Bin Meng you're the one that added this -kernel support in PolarFire
Soc. Thus, is my approach looking good for you or do you have a better
one in mind ?

[1] https://www.qemu.org/docs/master/system/qemu-manpage.html#hxtool-8

Thanks,
Cl=C3=A9ment

