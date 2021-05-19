Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A74388A50
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 11:16:46 +0200 (CEST)
Received: from localhost ([::1]:36042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljIJp-0007Hd-SO
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 05:16:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ljIHs-0006M6-6B
 for qemu-devel@nongnu.org; Wed, 19 May 2021 05:14:44 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:42984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ljIHq-0003As-LE
 for qemu-devel@nongnu.org; Wed, 19 May 2021 05:14:43 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 f75-20020a1c1f4e0000b0290171001e7329so2896558wmf.1
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 02:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=AFNWs1FXclFolejGYGyMyRBq4DnTBGu6t5Aj2BKC51s=;
 b=MfqrjPFVCUpqyjzwJwpoC/4Ca/yinSlE4zqjFiqIlGQ3vrlQgNxlJEpQ5Lz4Lz+B5K
 BJbrPKnpX6wnBoKAWEwkVx8PlqpurHUwG8vXnBvKPqDYonKTNRTGcKK/mhoCKhwGwBfX
 xvgm1bDAtww2Hiew8O6Bda/Ve7Qbc8A2kdk/pbLKiP0V+K+dLAxSoHVgUcwod5RAjke+
 0/7ieZO2HCcv5nIKAQ99649OwTFLVZQo7ZoTwHsWCBKxDNAV6NOfh3I09TuBqB5Nhcni
 Paul1q7tyVkizV5ODi/UjsWqAH/y0xm5CxuGH+pEvQn+bmOlBiIXUxiIGHBQ/SfLNNV5
 Bu9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AFNWs1FXclFolejGYGyMyRBq4DnTBGu6t5Aj2BKC51s=;
 b=t+FQflmFpzVYp3TAD1F/s3+NRl9nU4/QnQXEo76X+bAHdpoAN+9c4udmE+F79csBjk
 /vg0KiySUwgF4Sy1ZagBH+rMesKH5kdzqsg4bOuRrxaqfd8an9QanV3K3kLK9WttjgDw
 3GJvodB2VgHZbM6FQ8zWChMw4Ut5C5RS+a1bAjdap5Yp7/mS2C7OODZr58pZbd1NciWg
 oEra2qZWySYb+fsEAqtXHcnTnmfh2bX6j1JenfrrMOoj1JIroDJ61PvE5WU3sU56Q9Cc
 ySf349jXH3FBWEtiBmnhIx3Jo3tq/wtoXyg9KJktvj9DFP4S7/NmPFHQq0iB+oTLRh8q
 eIPg==
X-Gm-Message-State: AOAM532OYi0mQ/84PHaiLsoqbFKjHbs/GwlWI5D5qSgdMDRBHbxDeo9B
 CtHu1pSzvyrsYsUlaxlhSBg=
X-Google-Smtp-Source: ABdhPJy6GHPGb17UsB3iTK+p2JsZ3uJmAFSTCCEe3WgCOiSVpM6hUKOZT19C0UUrOcfoeckVWGWCXg==
X-Received: by 2002:a1c:c242:: with SMTP id s63mr9067556wmf.156.1621415677887; 
 Wed, 19 May 2021 02:14:37 -0700 (PDT)
Received: from localhost (1.9.90.146.dyn.plus.net. [146.90.9.1])
 by smtp.gmail.com with ESMTPSA id s11sm2596537wmf.14.2021.05.19.02.14.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 02:14:37 -0700 (PDT)
Date: Wed, 19 May 2021 10:14:36 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Gaelan Steele <gbs@canishe.com>
Subject: Re: GSoC introduction: Rust vhost-user-scsi device
Message-ID: <YKTW/JztNA7w1Jup@stefanha-x1.localdomain>
References: <250A3378-EA7A-4B8C-8FEA-10AD611F00FA@canishe.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8lac8xsq2z0l714J"
Content-Disposition: inline
In-Reply-To: <250A3378-EA7A-4B8C-8FEA-10AD611F00FA@canishe.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=stefanha@gmail.com; helo=mail-wm1-x336.google.com
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
Cc: qemu-devel@nongnu.org, Sergio Lopez <slp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--8lac8xsq2z0l714J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 18, 2021 at 07:10:31PM -0700, Gaelan Steele wrote:
> I'm Gaelan Steele, one of QEMU's Google Summer of Code students this
> year. My mentor (Sergio Lopez) has asked me to introduce myself and my
> project here.

Welcome, Gaelan! I look forward to your vhost-user-scsi contributions.

I'd like to follow your project. Will you and Sergio use #qemu IRC to
communicate?

Stefan

--8lac8xsq2z0l714J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCk1vwACgkQnKSrs4Gr
c8hh6wgArCDTRBqMbEhrueIimkwJvX6+5y/YaodslrlLKDv63sL3Iiqfw1+Ns1eF
E0OtzSvQg+Z6CaQMspo7imidDVhVtHqlJFZtDDWpgG8rgSUOD9JFEV14xnQ/uriC
UjjeBNM52qmXiXT2V8aKV/umeAvXDi4LIzeFn93fuxHbcxw559PK83HCP58kTTaG
I89AFBZXFus+/ZlYRyVvsVDnORFve7fhEs6EpgVgYYm8SRp3JLy7DWOep6ECnFti
D9awmHW+lpkpMFQjKfcKQLqwXt7ogJdN0+B097jAgzTfmQgbNwWkKebUMcYVu98v
WJMuFuK9J3fWO73MxcYusl6e/2HnYg==
=8JzL
-----END PGP SIGNATURE-----

--8lac8xsq2z0l714J--

