Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A9E2BA506
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 09:47:11 +0100 (CET)
Received: from localhost ([::1]:51666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg24T-0003Lt-NZ
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 03:47:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1kg22N-00029J-9f
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 03:44:59 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:35106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1kg22K-0006cD-Nb
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 03:44:59 -0500
Received: by mail-wm1-x336.google.com with SMTP id w24so9073407wmi.0
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 00:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=MN+/gxRet20gyHsamSRxyvBPjaURi4lKwnQNgLZYf8I=;
 b=Rs3PomoAlgOudco6OXPp6AKE7XIy6VxLMge13Q/FXl2l7jm0D+qc6eyrtLxJ0Fom3Q
 2ydRVoR1sVUbZ7WYYCMeaeaaVmsfeFNYZi5d9olnpXLF+8FvebWEGo3lmZwvymBtT3b8
 nQKNijmmeEToEZEFJ9cOyTFzaWnDV3agcDbkavGDfCryxYW7fOMPYTMUqqdkSxCA4yJO
 FQihiZmGk2ItCIoIMT9akxVfeiYxj7/ghxfqSfjdEGnplCIgBRPOD5ZVAsO2P0wnH+k+
 n/rApdlmmyM5e7wWz61rq7ScMna6SjEO6GrZgZUKGurGTwJZdQ3whNJZSyJy2wFjMM+l
 TL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=MN+/gxRet20gyHsamSRxyvBPjaURi4lKwnQNgLZYf8I=;
 b=Xo5cwt/wTJmUl/QwL5/F9YP3HdbF4XLbdguGLC76yeTs63MEdG0LnIF2W5uhVvQ4iY
 KVTC91Ns9WMOm5ArO848q6JmOZLVnmmvX89Do+qpWVT+k7Foj1UWXX3Oo6fnPsRmExkL
 8F9trP4Fo5LBzIwBcvg7Jl88mPh/hcdUuUCX5YQgH5id9Yb401PgFeQyxcNeExpVk2m4
 1ksI3cZrp+LgVChjECBbGqTjFxkXSvjqsCzeoTYUhHWTvUT7dVwLOBvdyTPVXZ3NygrV
 QIq4ta/lQN1+SqKLflijR5YMCRMUxuMwrnVRkVE4DjsbCXkyRC+g22voVfS5mMhc+qY7
 ojJQ==
X-Gm-Message-State: AOAM530m4qe5IGgDexaRvXTXfNt04LqcBy1ckNRBJM1ZTog6APBWjNCo
 pFhtWD7EXYzs/d9EM8ocZWswEg==
X-Google-Smtp-Source: ABdhPJx3c6R1rQaTdSvOQUFhtcIR17OCYZhZTbazaTy9BrkEQcp0/oQcZZjQXBeyM5pFyAG3hRCtYw==
X-Received: by 2002:a1c:21c1:: with SMTP id h184mr9128312wmh.106.1605861894286; 
 Fri, 20 Nov 2020 00:44:54 -0800 (PST)
Received: from wks.local ([86.120.180.222])
 by smtp.gmail.com with ESMTPSA id z6sm3773977wmi.1.2020.11.20.00.44.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 20 Nov 2020 00:44:53 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: Peter Maydell
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <5A06DC2D-E6A3-4249-B05F-A424D684BD26@gmail.com>
Date: Fri, 20 Nov 2020 10:44:52 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <1C01B0E2-8730-40F4-8C75-B8FE3E851747@livius.net>
References: <5A06DC2D-E6A3-4249-B05F-A424D684BD26@gmail.com>
To: cavinnarsinghani@gmail.com
X-Mailer: Apple Mail (2.3608.120.23.2.4)
Received-SPF: none client-ip=2a00:1450:4864:20::336;
 envelope-from=ilg@livius.net; helo=mail-wm1-x336.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On 20 Nov 2020, at 07:43, cavinnarsinghani@gmail.com wrote:
>=20
> This issue is about the Qemu=20
> Will the Qemu work on the new m1 macbook pro?=20
> And if yes, when will the arm version of Qemu be available for public

I already distribute a binary version of the xPack QEMU Arm fork which =
runs on Raspberry Pi OS (and most aarch64 Linux distributions), and it =
emulates Cortex-M boards quite fine, so there should be no major =
problems for the mainstream QEMU to run on Apple Silicon.

Regards,

Liviu


