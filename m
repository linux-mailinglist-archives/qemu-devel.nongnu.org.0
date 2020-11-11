Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C86212AEDFC
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 10:42:20 +0100 (CET)
Received: from localhost ([::1]:34784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcmdv-0007VC-S3
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 04:42:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kcmc8-0006qP-Uo
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 04:40:28 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:35766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kcmc7-0004SN-E7
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 04:40:28 -0500
Received: by mail-wr1-x42d.google.com with SMTP id k2so1885493wrx.2
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 01:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qpvAAqakPdKvNsBB1LKL9NmX5QXaOxmkqPNaMlmiRbE=;
 b=Ni5T4YRcX6Trktka85i/LaR1bjIoBm94EyTdZ4Mx+vCfX0I1mZbX9W4Ex/P+BZIAyL
 pHJ2MVPRF+Je1Bn/mm2iPFjnG+St9KmeFG1dmZ7WL3hTQL6oNvwXQWyLl5vENNdkqAz8
 w9ras/LhOGQPMvZuUHetpviPRt5cZKuKnLKWqiDPV5GzNGvxt3iLSCxG2K+4v45PKqrx
 5NYO4sMZzot4K0kVjp1kdD9vpgBoslTKFKo7NPcS/kmBIG85cxE00tV0LVVnhZ6/+MUW
 jiIwtQG+M+BreJC5AR7a+72+ohK07vjyT2LZfQIocnaUUpdOB++WDOKI206rrV1QVECe
 1/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qpvAAqakPdKvNsBB1LKL9NmX5QXaOxmkqPNaMlmiRbE=;
 b=nwNZ+QB0qZpdoCed8hbLrQgFyzzWO2qBXRzUuIKrl8XtKcmGX8GLv7o4JpFfN/R1ja
 5BryM37VIlg+o3IZh5yqPHnipLq37Is3LBugEK27wImWhLHRhtRfOLLfJ/94s9XoUKJ9
 nPLXz4fxUzEuJB45S1kd/c1XtPc+yiq7g4cQ4+div6EMnEJHWqEmkDUu7/rQUghIeq0I
 j+UguRvFlf1qRPb9i6s+WYT5Q7tyIzs5oK1GFmm7Y2MJ8TsMiW82Yt4B6LV0jAIcHtHs
 UJQQ4ZQJOH+lgKAefcVJlF6XjSj+CY8RVgSjqIyZ4J4SvJnqWT2igFQsiv3AFsgdcia6
 sztQ==
X-Gm-Message-State: AOAM530I6mfzG/AJoAm7zyVydkCXrofd/azZKF4ZxbxUtKOS7UEBBbfW
 GW76Ek9no7NCcUJYpCL2JFt8voKecnd2sA==
X-Google-Smtp-Source: ABdhPJyHqJOsHKLeGzeiWglPogYz+5Dw/6Te07TDg5UUNk78mqIu063AxPbzH1HUvQ74T7CRJbWg5Q==
X-Received: by 2002:a5d:6050:: with SMTP id j16mr31162390wrt.158.1605087625657; 
 Wed, 11 Nov 2020 01:40:25 -0800 (PST)
Received: from localhost (85.9.90.146.dyn.plus.net. [146.90.9.85])
 by smtp.gmail.com with ESMTPSA id n67sm1876391wmf.25.2020.11.11.01.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 01:40:24 -0800 (PST)
Date: Wed, 11 Nov 2020 09:40:23 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Fosshost <admin@fosshost.org>
Subject: Re: Fosshost.org
Message-ID: <20201111094023.GB1275139@stefanha-x1.localdomain>
References: <178-5fa73c80-99-9fe6ad0@194753705>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Pd0ReVV5GZGQvF3a"
Content-Disposition: inline
In-Reply-To: <178-5fa73c80-99-9fe6ad0@194753705>
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=stefanha@gmail.com; helo=mail-wr1-x42d.google.com
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
Cc: qemu-devel@nongnu.org, qemu@sfconservancy.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Pd0ReVV5GZGQvF3a
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 08, 2020 at 12:32:28AM +0000, Fosshost wrote:
> We would like to donate some hosting to the QEMU project, mainly in part =
due to the fact that we use it ourselves!=A0
>=20
> If this is something you would like to explore, please let me know.=A0 We=
 look forward to hearing from you.

Hi Thomas,
Thanks for reaching out to QEMU! An area where QEMU currently does not
have server resources is dedicated machines for performance regression
testing. Is that an area where Fosshost could help?

Thanks,
Stefan

--Pd0ReVV5GZGQvF3a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+rsYcACgkQnKSrs4Gr
c8gY4wgAunXLdCCpwMKiBgFuAV6h9K3YynBqMYCehOOenhV+kJj/8DA9oJYr12fJ
+u3QOfHw57UOm2zzUMRH4rpNIOEGVkMFtTuX2BTDLAIGoafWMnrOCyjLsN5SRAOw
hyEsH84AtKav36pIv7/gEZR5KtlcnLok0L7egQ+yZ77O4Q+ULLnTFRR7PXPp7dDR
WSgtcKKrMB05EgRTAVhGdk8DLO77MdvGjupAIHe9ndjVLgRFBG3dWm4uZU8TGN6H
qL+hbpaAIE9eYuXLXDk7Ccxmg96iKw64mhcwaSxBsspqYxu30v0G2xLTk4XqQKbJ
hxuFv0Hdlp/+tW9kWF6S/4+Mvfr2AA==
=KDDm
-----END PGP SIGNATURE-----

--Pd0ReVV5GZGQvF3a--

