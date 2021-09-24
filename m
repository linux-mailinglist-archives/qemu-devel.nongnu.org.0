Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7455D417B1C
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 20:29:46 +0200 (CEST)
Received: from localhost ([::1]:44234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTpxB-0005Oq-0X
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 14:29:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1mTpvz-0004g8-Nm
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 14:28:31 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:42890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1mTpvy-0005xr-Bj
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 14:28:31 -0400
Received: by mail-qk1-x72d.google.com with SMTP id t4so28890961qkb.9
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 11:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=tBb3SdLu8c2ib5DHE1A1sRsuYR++mKDzLqBLMiS1QXw=;
 b=M+kXWxt/pcP6mjYXSRPBJet/f16QklbgNHF4uBaYq36uHuTuphuiDzLgTEeDrRey/H
 lr+zmtO7LArH8sIFTvZ6w1k0IK+uMR0kwTI5rAGr8gle/vJ+q11X3dwymyyJfsLFLpcy
 50avYpf16rTx9irmeIOuIexnwbUujfKMmsmzVixOOzv4n4893NKjpwVFyv/wAbq+Uw24
 bGyj0qN6VEMTaETcd1WsDO5Gc8O1DUK1zNAML73eLzzTHwis1Dzoe27UO/iURdffJ5od
 FHHAVaDWfK4lWvsbQuLe1BZAblTDv5On1GmAKjqGhYX/IQ7wCI0qdq9vf37DPRsp5sXy
 +FpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=tBb3SdLu8c2ib5DHE1A1sRsuYR++mKDzLqBLMiS1QXw=;
 b=ld7c90eGi/I8Gko86pPGgsO5WFwZv8eVngZWdRVGgWN+iFEXilHjvqzE8pTy22+hSy
 CZE1c655tqBhA3fGlNAG4bKGuEHIGbmcC+otiZExKhbdFimBL9+EEL4hcsMZXiPjIsRw
 27nVNH67DTyyVX7HMF+BV0/HLJviQ6WQLgJBvkXRnDkgC+a+dhA9Hpds/AXs9a6Qefat
 CZnGiX33SKX+jhI5RAIlm37/s/VceI8v4RvLJV3mPjNSzhaRXr3buctu9zd4+2cUZ5dy
 OEtP05ylSgWOH1D4WOmQEzsDqW2z89thCs8vW2Bro1hE4B3Q/HMv/GkIB/saHLnKReIr
 lYcQ==
X-Gm-Message-State: AOAM5325iwUyUzEFsuKnSyHqb11wYHYgmCnP8NhxenTJtWskXZfwpV3m
 +ZiwutX0d49GactzD4i3RMY=
X-Google-Smtp-Source: ABdhPJzUdTVh1s/odnfVvZ5OSckL21avavuGNNKtT+vnyDF4wq6/tT7MaN3+dzdyhbgFIheBxh/dZQ==
X-Received: by 2002:a05:620a:142:: with SMTP id
 e2mr12330572qkn.249.1632508108861; 
 Fri, 24 Sep 2021 11:28:28 -0700 (PDT)
Received: from [192.168.0.5] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id c19sm7160935qkl.63.2021.09.24.11.28.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Sep 2021 11:28:27 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: Ping: [PATCH 0/2] cocoa.m: keyboard quality of life reborn
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <CAFEAcA9+0BS2m7FxPaiH9f1CF2BT=WxsjnknQ8hgh0RvgxX1JA@mail.gmail.com>
Date: Fri, 24 Sep 2021 14:28:26 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <E8EA40D4-5340-4EB4-835C-3F65EC60BA1D@gmail.com>
References: <89CF5E51-5126-44EF-8311-136CDCC50D8D@gmail.com>
 <CAFEAcA9+0BS2m7FxPaiH9f1CF2BT=WxsjnknQ8hgh0RvgxX1JA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=programmingkidx@gmail.com; helo=mail-qk1-x72d.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Sep 24, 2021, at 5:26 AM, Peter Maydell <peter.maydell@linaro.org> =
wrote:
>=20
> On Fri, 24 Sept 2021 at 00:08, Programmingkid =
<programmingkidx@gmail.com> wrote:
>>=20
>> Hi Peter, are you reviewing cocoa patches? Should someone else see =
these patches?
>=20
> Gerd sent out a message a while back suggesting that people interested
> in the cocoa UI (we have had several people recently submit patches)
> ought to start reviewing each others' patches. I would certainly
> prefer it if those people who are actively using and working on
> the cocoa UI could take on more of this review work.
>=20
> -- PMM

Problem is there isn't anyone else who does actually review cocoa =
patches. Even if there were others, there is no guarantee their =
suggestions would be something you agree with. Since you are the cocoa =
maintainer the only opinion that ultimately matters is yours =F0=9F=98=81.=




