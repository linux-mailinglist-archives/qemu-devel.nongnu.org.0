Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC58B324772
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 00:23:50 +0100 (CET)
Received: from localhost ([::1]:56692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF3VV-0002qt-5c
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 18:23:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1lF3UL-0002M3-3N
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 18:22:37 -0500
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:34658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1lF3UJ-0004vA-HV
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 18:22:36 -0500
Received: by mail-qk1-x735.google.com with SMTP id x124so4046325qkc.1
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 15:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :cc:to; bh=NAtjrjkIOkTDc3p89TDlNq//Q7inMGRPt3dH9XKY/ww=;
 b=XGOx/dS+AKc19J18Waoe8BVOfKqT7YnLS+VSA8ks6gBHpHslwZ522fNyy2obwPMGq0
 emMmoQ9SFnkLDNsFTQ+sszBiQvqcVevaozrp0U8nzlK772TQw1AsBEFJyWs1bGSKn3jR
 Vd31IZ/oF1ATQEau6mCIhtY23X4GlflEj7de8/vLSlKgwCCh2V/0+CWXC1IWGCcxdiPk
 ZYMvf31tyrz8PwMf39mvsThZN7XE+9axf2ai6xWeL8b22DRj6368DWlBvZZ9cFoZQz0h
 dqx+2kNzgiOfEnoxM1ENf2asrroz+YQNhOFsxaw1lABNzbBJB1OVRtE6lBvb+YD6EsWY
 sstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:cc:to;
 bh=NAtjrjkIOkTDc3p89TDlNq//Q7inMGRPt3dH9XKY/ww=;
 b=MS24d+HqGU3ANNNLYRhsCyrNilLzVHIywuGjF7JXcSZE6zZMBvadcHRt6mvvCTulgS
 AwQ8na6DwiKUUbma1DSLMS9DNNPK66D35xNT/L3EyXHPgTZw1SHlacLCGahFqD/xhQP/
 F1DPbDHgv3UmzdoeKDeVGLS50/mMs2X1xuwO7h83YReDl6KEEF4FN2nL9b5hEhNlqu72
 fFoIaQyTOsEdHZ8h4JtUDpRJt55dMEj9pm1axQtirCLSJxOQR9jiI2BDaIYzlx49t6l5
 mTZw6cNYBuQI7n6Y4FrjsWxy24N1+ek3i4CjuFseh1JzqkkQYXLu6D9J1Ni+s1gIGyGD
 8BgA==
X-Gm-Message-State: AOAM530sjbhzViZpXnDAm83L8yJ+QPQHUJEz71MnwTc+VQ/Tl16GDAu4
 ip+oghCRqpeEsF+9LGDVVfS2xG49UxCGhQ==
X-Google-Smtp-Source: ABdhPJwc9IG3O1Rg5CiNK9RmxEC2L/Nr2WUAbrimhICywhICLzKtaOcUmzxljQA4Ei7BMBD6x0cn+w==
X-Received: by 2002:a05:620a:e09:: with SMTP id
 y9mr390996qkm.126.1614208953720; 
 Wed, 24 Feb 2021 15:22:33 -0800 (PST)
Received: from [192.168.0.5] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id f17sm2357961qtv.93.2021.02.24.15.22.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Feb 2021 15:22:33 -0800 (PST)
From: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: [PATCH v9 04/11] slirp: feature detection for smbd
Message-Id: <676D2869-5B9E-4FB7-92C2-0DF7974E3B6D@gmail.com>
Date: Wed, 24 Feb 2021 18:22:32 -0500
To: j@getutm.app
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=programmingkidx@gmail.com; helo=mail-qk1-x735.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: QEMU devel list <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I've noticed that my guests like Windows XP and Mac OS 10.4 cannot =
access the internet using the recent versions of QEMU on Mac OS 11. I'm =
on an M1 Mac. Does your patchset enable guests to be able to access the =
internet?=

