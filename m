Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D71026890D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Sep 2020 12:16:16 +0200 (CEST)
Received: from localhost ([::1]:52042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHlWx-000888-4Q
	for lists+qemu-devel@lfdr.de; Mon, 14 Sep 2020 06:16:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kHlW6-0007eD-Qv
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 06:15:22 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:44094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kHlW5-0007Tm-6g
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 06:15:22 -0400
Received: by mail-wr1-x432.google.com with SMTP id s12so18040621wrw.11
 for <qemu-devel@nongnu.org>; Mon, 14 Sep 2020 03:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1j6iFCN3R8KhmwBqpw1NePKqpf4XYXzO9vRPsnj/qSI=;
 b=So8nvsxYyyzlqoykxH+LdM6/QBbpPfaSLHuNFzstpAsDRvLn99C8tQiEL1DraqTTFL
 XEn/C36Ei7tKLD14InvNey1GOLZ25w0FRb2CaGswvHdpzEbkJ0cdEv09bDrRyTdp95nO
 1nMsxg+uEPT4ytZotKKOTWp3xCoSykJWPBZryaHGi2IGgeCO9leuyzJI95oH+WiuuoRX
 kZT76TTWG91/e1aTGMbRFzTRjjJ74wIeUl70hUZY7awXzuYNSlaqqy62ZPM5LYkgNdwi
 qURqP1Yw27mVllDeqorD/PnXWQs58zrc39u2hLCvpfDevASxivjqK6g0L2fqygw5MiuJ
 rSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1j6iFCN3R8KhmwBqpw1NePKqpf4XYXzO9vRPsnj/qSI=;
 b=n0n4Yf7rlHLhAFrElhpPxnNfrqFZWV1c6szVqR8wfeCKkcwg2BgTf3cXSv4KbIwbnr
 d45d0R8hwsMqHMXWPMq6pEgSqerbYP070eT2fgI31LUSqqr1JRmHPxaVe8hJvTMKnT+Z
 uZGxx0xERugM+acJSwHjBYfc2hHZLkRg6Yd2L6btFgqsBrNy8PK6KFcZSt5m7gU3j6F6
 mm4lq3I0dHG5f1FE4ubE2w/UoJDyj41Rml2ML1c3/Ylis76rIVw2i2x4iKZwsuHQy+7Y
 yw0xv4uKm8IwV/D8n0XTkNMkEhnpVAk/cBKk8pSsdc4SJfni3iNbYA9i6BWzjQy6HNM/
 s7YA==
X-Gm-Message-State: AOAM5326q/zZLgR7HVc/85JKvdtj5GnlXZbFLqNi535Dr8EjrZc/5gmC
 pSvWwULj9ox8Uhczmn5xP3U=
X-Google-Smtp-Source: ABdhPJx57PsXVyigZiZj70FZTG/s+R75WNnJPnFVKDuZNVfjI7udteFdVaxJmW4IjsQ5zl2NBJSG3Q==
X-Received: by 2002:adf:8b48:: with SMTP id v8mr15161044wra.21.1600078519872; 
 Mon, 14 Sep 2020 03:15:19 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id d23sm1802472wmb.6.2020.09.14.03.15.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 03:15:18 -0700 (PDT)
Date: Mon, 14 Sep 2020 11:15:17 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: ppandit@redhat.com
Subject: Re: About 'qemu-security' mailing list
Message-ID: <20200914101517.GD579094@stefanha-x1.localdomain>
References: <nycvar.YSQ.7.78.906.2009111910280.36374@xnncv>
 <CAFEAcA_9BVbqFCHJqS8jj6L3OqVNc60NCjAjRs516VyLH2EFfw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XvKFcGCOAo53UbWW"
Content-Disposition: inline
In-Reply-To: <CAFEAcA_9BVbqFCHJqS8jj6L3OqVNc60NCjAjRs516VyLH2EFfw@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=stefanha@gmail.com; helo=mail-wr1-x432.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: peter.maydell@linaro.org,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--XvKFcGCOAo53UbWW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 11, 2020 at 04:51:49PM +0100, Peter Maydell wrote:
> It sounds like you
> want it to be a larger grouping than that and maybe also
> want to use it as a mechanism for informing downstream distros
> etc about QEMU security issues, which is to say you're
> proposing an overhaul and change to our security process,
> not merely "we'd like to create a mailing list" ?

Yes, please discuss the reasons for wanting a mailing list:

Is the goal to involve more people in triaging CVEs in a timely manner?

Is the goal to include new people who have recently asked to participate?

Is the goal to use an easier workflow than manually sending encrypted
email to a handful of people?

etc

Stefan

--XvKFcGCOAo53UbWW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl9fQrUACgkQnKSrs4Gr
c8j7Qwf+L/qZl5ExVQrNwzxZEZY3W/fDR98kdidczaA/YXjxVEQXrTPiODphYXcC
2YzF+wjtxB1R1qoRFYnkcRcasRjYcpu/H04JJKHBnWfrxTugrxqzva3SU2/b9ZsH
j0j/0Masf6FO70Metb3AHxSznRx0IPMN+na3rQwOFE39j2spPmOn0Um8YvlvYAT/
kbDNHasfHHRM0QjIavA8TN1/f40PBCarEzpMO7tt2DP5LLZPEH/AeI17jUMD5X4e
vDwFCbj+yIncJaEkDz6tr+TYkq8B5Ub5EGwVPipLixMu1aSL5PEWpz2824DRDlnv
i/wPaBgOVaYmwGilQz1fU6iCeOq8eQ==
=X3sB
-----END PGP SIGNATURE-----

--XvKFcGCOAo53UbWW--

