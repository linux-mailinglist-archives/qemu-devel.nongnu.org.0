Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A53A04EDF89
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 19:20:15 +0200 (CEST)
Received: from localhost ([::1]:55886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZyT0-0002Ej-9a
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 13:20:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nZyI7-0001ZC-14
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 13:08:59 -0400
Received: from [2a00:1450:4864:20::42b] (port=38478
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nZyI4-0002tx-BG
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 13:08:58 -0400
Received: by mail-wr1-x42b.google.com with SMTP id i4so694637wrb.5
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 10:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VUGSaiq9yiLhf5/jq729pfpbHAwphwgvA7ZvTqPAeX0=;
 b=XQghIHqx3E6JiGWdVfTatvW43sQ47yPCG7QqhsbiU8yoKfwUFLu3opVwXabN5MKFUr
 ZKVSUAWduJlHuDe9nGytg5dO0GSSzp619wpXi4cEtlPu1EM/EVI2gZkpNiYOTY5aj2FA
 zDhOXvnlaPtTlRw4lpaftffAlTo/hvRvBv3NQA5Qmz9bUA2DPx1JiVS4cCHgiJ02OyJd
 gyjN6YNKEfaGyNqlNZPIBj6JDwrauLAVaafaPda8F/puI2v9aJS3a4UYbrDvMQG5meob
 AOg9gM0AuqcoH+ueiPTCR512CI2jl909Vbd4Yyy9JrR0T2kNw1trs2eUgVsI7WzhPXdx
 88pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VUGSaiq9yiLhf5/jq729pfpbHAwphwgvA7ZvTqPAeX0=;
 b=chcmAWVdMWSm1yL/TBx3AGZUXfLlxF2geTIJ80D8vMcVyzeCsfaNhPjKBaS0ojzrAj
 WWj8qBymnuK+1HDz5UpMhUgF/lwWw/z7KYjDHTW/zQj00gd/PFBwDVmq++9jaR0zNGoE
 IWB3aCW+EWlfggiZP1RwiDxMBjRPFfdhQ0U0wRWP5R1wERYrjtPPXQCw0aNaOUHMnBPU
 itGkUnwfe+EvBBSS0RpkxriO3T+E/dNuXWC0crGf4GmogCmCnYKzeDJAKaroW5i+Z5eP
 lEbF3uBu1FaCcBzdMlwlAsEDMCDWrZapQGbTR6tCeHE65hA51m66v9mFrBvVXKfZgr01
 dcWg==
X-Gm-Message-State: AOAM532F/nSwILOAOhPEVa5pkEQkMYFzl4EeuTa4SabPXVz3MaS5I0EB
 K60wUG+iv43rTWXgtoP0YdQ=
X-Google-Smtp-Source: ABdhPJxt5Kfr1xDFLFo497ppcB7g3MD9JEzGqOdtMo/8p+dgW/pqMCSrG+xjIoiQadT/yWSzxS0SbQ==
X-Received: by 2002:a05:6000:1887:b0:204:2917:ad3e with SMTP id
 a7-20020a056000188700b002042917ad3emr4843131wri.138.1648746534012; 
 Thu, 31 Mar 2022 10:08:54 -0700 (PDT)
Received: from localhost (109.9.90.146.dyn.plus.net. [146.90.9.109])
 by smtp.gmail.com with ESMTPSA id
 r14-20020a05600c35ce00b0038c9f469979sm7981993wmq.40.2022.03.31.10.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 10:08:53 -0700 (PDT)
Date: Thu, 31 Mar 2022 18:08:51 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Sakshi Kaushik <sakshikaushik717@gmail.com>
Subject: Re: [PATCH] [PATCH RFC v1] Implements the Backend Program
 conventions for vhost-user-scsi
Message-ID: <YkXgI7mEmr+zFGD4@stefanha-x1.localdomain>
References: <20220331055536.26038-1-sakshikaushik717@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uYRciTetADSENxw0"
Content-Disposition: inline
In-Reply-To: <20220331055536.26038-1-sakshikaushik717@gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=stefanha@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--uYRciTetADSENxw0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 31, 2022 at 12:55:36AM -0500, Sakshi Kaushik wrote:
> Signed-off-by: Sakshi Kaushik <sakshikaushik717@gmail.com>
> ---
>  docs/interop/vhost-user.json | 31 +++++++++++++++++++++++++++++++
>  docs/interop/vhost-user.rst  | 17 +++++++++++++++++
>  2 files changed, 48 insertions(+)

Hi Sakshi,
Thanks for looking into this.

qemu-devel is a high-traffic list and maintainers rely on you to CC them
to get their attention so they don't have to read all emails. You can
use `scripts/get_maintainer.pl -f path/to/source/file.c` to find out who
to CC. Give it a try next time and that will help your patch get
reviews.

This patch defines features for some of the command-line options that
the contrib/vhost-user-scsi program has. It is likely that different
vhost-user-scsi implementations will have different command-line options
because they work in different ways (e.g. connecting to a distributed
storage system instead of a local file like --scsi-file). Therefore
standardizing these options is probably not necessary for
vhost-user-scsi.

(The reason why standard features are important is that some vhost-user
devices may have feature sets that are common across device
implementations. Unfortunately that's not the case here.)

It would be helpful to change
contrib/vhost-user-scsi/vhost-user-scsi.c:main()'s command-line
arguments to follow the vhost-user backend program conventions though.
If you have time to do that it would be great!

Thanks,
Stefan

--uYRciTetADSENxw0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJF4CMACgkQnKSrs4Gr
c8g0LggAx/dg/kG0i0riPDatoGtWRdrYmLrOM+wKODx1no30FGYvkGS90VxORaan
xwxmplg0VGeMxy6LMS0puy6MPTHhrFwxN7lcURerE4pdF9g7e13JVVVTKd1bzi7U
czB/afDrW7gvG8n2Nbxc0CrOpLYPpiDuI4FZe/HBqNuoKtqiOISpeHRrotkOoAfw
gSPPeicC6YTdzddmppXFCLXGQLvvxyhtvUkGMx+QBE9ARtHjtu9Dra11zrdjVNNw
r5N6zEdFklD5oD2wdRtcoCdSdD4nMyrRxqklwRxorJDthMik/Q1HzSgYtjbpyKqI
SOR6UIcrt3IVov98WX9dYp8jtZkntw==
=XnL4
-----END PGP SIGNATURE-----

--uYRciTetADSENxw0--

