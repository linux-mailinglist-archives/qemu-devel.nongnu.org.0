Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A78E86713B7
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 07:16:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI1ik-0004J4-Aw; Wed, 18 Jan 2023 01:14:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <42.hyeyoo@gmail.com>)
 id 1pI1ih-0004Ir-EL
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 01:14:48 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <42.hyeyoo@gmail.com>)
 id 1pI1ie-0004Qg-OJ
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 01:14:46 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 cx21-20020a17090afd9500b00228f2ecc6dbso1376548pjb.0
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 22:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2+TZM6gnKSL+usszgItsx0GXiO6zhY9IMjx4r1b89B0=;
 b=cU2Hs9e0pys58UYWj1Fu2ePePkv4Fqq7fK4ajPYQc3oo2FpfC2GDf22mm06qQevPdk
 xw8z3LmjQ5R4hyANDuyPJ87X1P/sjTi2NzBGkPUGXHKltOUri+4+H+XB7SMPV1qR+TBr
 KAWu4BBI8TNFVFtOcH29TXkZtsaJeyKvgRiP+7Dia1ib4AYFvA5dxePYXuVV+fHgJ6XB
 sQYvWNoIAm3JPlTY2jNUuQifF+AzrKn8bfRf+v9sgVxYDHdCWWruwoOFwxmUesA5gW3B
 02tJPv6xTeoh2iwldAhyXkgshDPO2GxE0yfH3aODyJW/nKLwKzD64BSwVMn+motbJgv1
 dFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2+TZM6gnKSL+usszgItsx0GXiO6zhY9IMjx4r1b89B0=;
 b=bF3SU0GxJj3ED7/KnVyYYyB2tNpeBpOfGLJXXKwW964/H3zEQ77y3C/h1Z+l18N+io
 BrtmtTSy1q2N4/X6+ykuam751V42U2S3wpt7jHsvylhkUTqTocw6rtg+IaKNATXllYQC
 UE3LB09CL7DcBzwn/6lyDlSaQELK3Jwshdf1iQOTaDNy9YBERplLBMOlJjrZoU39OxGg
 pzc/DHHipF4hH1MZuxu9hkYc95xODq6MlYV/XdeOIwizk7S5XVjYwjMGyi65cQNEaiTe
 FitHgCVzIlrv2pn3tGu1YfWpt0pxEYck1dED2ynT/EuvzbXeWJtJ0vE/JnfTi7UrBlHo
 rDtQ==
X-Gm-Message-State: AFqh2kqTYp0Z2gE9/wEE+Q1tmbhSVnjub9/r5p3+Bs/HKQvIXbDTS8o+
 jIEVwYkJg7vs/bzzc1+5e7r1sxf0e29qpA==
X-Google-Smtp-Source: AMrXdXvff9zlolRQw5RF8pIMzqoUcfQ1AGmb6UqChgTtS81WAu1ZUW1v26tZcdxtAT8DPrSEPmYAzg==
X-Received: by 2002:a05:6a20:9e0e:b0:a4:6eeb:91ae with SMTP id
 ms14-20020a056a209e0e00b000a46eeb91aemr4850720pzb.49.1674022481254; 
 Tue, 17 Jan 2023 22:14:41 -0800 (PST)
Received: from localhost ([2400:8902::f03c:93ff:fe27:642a])
 by smtp.gmail.com with ESMTPSA id
 s1-20020a63f041000000b004784cdc196dsm18200760pgj.24.2023.01.17.22.14.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 22:14:40 -0800 (PST)
Date: Wed, 18 Jan 2023 06:14:33 +0000
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
To: qemu-devel@nongnu.org
Cc: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: reverse-{debugging,continue} not working on v7.2.0, i386 guest
Message-ID: <Y8eOSedPWlOjriho@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=42.hyeyoo@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: 22
X-Spam_score: 2.2
X-Spam_bar: ++
X-Spam_report: (2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hello QEMU folks.
I was struggling to fix a recent heisenbug in the Linux kernel,
and fortunately the bug was reproducible with TCG and -smp 1.

I'm using qemu version 7.2.0, and guest architecture is i386.
I tried to inspect the bug using record/replay and reverse-debugging
feature in the QEMU.


recorded with:

qemu-system-i386 \
        -icount shift=auto,rr=record,rrfile=$REPLAY_FILE \
        -kernel arch/x86/boot/bzImage \
        -cpu SandyBridge \
        -initrd debian-i386.cgz \
        -smp 1 \
        -m 1024 \
        -nographic \
        -net none \
        -append "page_owner=on console=ttyS0"

and replayed with:

qemu-system-i386 \
        -icount shift=auto,rr=replay,rrfile=$REPLAY_FILE \
        -kernel arch/x86/boot/bzImage \
        -cpu SandyBridge \
        -initrd debian-i386.cgz \
        -smp 1 \
        -m 1024 \
        -nographic \
        -net none \
        -s \
        -append "page_owner=on console=ttyS0"

(I'm using a initrd image instead of a disk file.)

The record and replay works well. The bug is reliably reproduced
when relaying. but when I try to reverse-continue or reverse-stepi after
kernel panic, the gdb only says:

	"remote failure reply 'E14'"

Is there something I'm missing, or record/replay do not work with
QEMU v7.2.0 or i386?

--
Best regards,
Hyeonggon

