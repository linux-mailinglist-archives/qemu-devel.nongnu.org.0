Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 485103892ED
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 17:47:30 +0200 (CEST)
Received: from localhost ([::1]:34438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljOPx-0000QH-DS
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 11:47:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ljON5-0005I8-5I
 for qemu-devel@nongnu.org; Wed, 19 May 2021 11:44:31 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:41714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ljON3-0003Ny-HI
 for qemu-devel@nongnu.org; Wed, 19 May 2021 11:44:30 -0400
Received: by mail-wr1-x42c.google.com with SMTP id d11so14501950wrw.8
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 08:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Dqy/Tanh3saK9AODAVtPmDxCTsXAVXyWSlG/ifULa3A=;
 b=XxGCiDwENlSAyMFSRqsYybtimivUKelS0EgU/1EH4cYFwPt6pPVUntbQfEwaDSKdNB
 vHr3gCkmNNIj9zhzmrZLQF8QJAB73jc5OnMRS5qxXkQa7s052OE/cBKaCDChnEz1qo+6
 /MXMtNy6TmHvX1BiIicPqbJ6A4ADEq5No9l1p5zuX2SP32FrcJXsGUBRhP6Ve8/UTrCo
 EaD8fXwsTxAJPdws32AdfUiFMK8jjbOUoFW5J51plnLEdbjkzyYPDHWPvFC66Q3TNwEp
 wWGqPhUEpO520strOyuav2ikleggjvcykffViGsUcsV5uzFeuOcXePmryTn22Obj/OyQ
 DLFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Dqy/Tanh3saK9AODAVtPmDxCTsXAVXyWSlG/ifULa3A=;
 b=VHWFd02oGzfXN2289grziBhNPRy79Mvxk4JkkR/Jriqcx8c9g2HxS2lTsRv7nhywRG
 YiO1HuiknEvhRCWw78QS0oWrMH3VeVQL/Rcgel7iIyOMy4clVC4RtKBdmjfONln7f+RT
 anft7JVHQmf9qnUxW2HpEiRLFEFEenNm0otAiUhbmmUMFef20kwcLoj1FB+B7pf1wp9y
 aYxwyDSu6VMczGZa7M8vr3pOkw/5Zbkuyat0jX8Z5ALMnIu2mX0S0lk/HIq3KpZu0mqK
 3AfxDbaV1kiPyNJ9oHpNG9MRz9q5oU8tnBtgBN8qCyLZERMuXQCjObOL5w+dbGjjb3S1
 xUnw==
X-Gm-Message-State: AOAM530TylYyKOBdKnRpT1skgrKadqzACy5IcF0eHcqOedJg1n+2Tvtv
 QsDWfCZ2P2/BWXwOjLCq1ag=
X-Google-Smtp-Source: ABdhPJwhchcpZa8Qb5uVOa3F6mCpne9sNvCEsFZMGfV1NPGzhMu5hwaKwSLGfCGRpn/UBtp9u+GU9Q==
X-Received: by 2002:adf:f98f:: with SMTP id f15mr15677056wrr.4.1621439068174; 
 Wed, 19 May 2021 08:44:28 -0700 (PDT)
Received: from localhost (1.9.90.146.dyn.plus.net. [146.90.9.1])
 by smtp.gmail.com with ESMTPSA id h10sm6204336wrt.3.2021.05.19.08.44.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 08:44:27 -0700 (PDT)
Date: Wed, 19 May 2021 16:44:26 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Ali Shirvani <alishir@routerhosting.com>
Subject: Re: [PATCH] doc: Add notes about -mon option mode=control argument.
Message-ID: <YKUyWpJradPmdLSG@stefanha-x1.localdomain>
References: <0799f0de89ad2482672b5d61d0de61e6eba782da.1621407918.git.alishir@routerhosting.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zjW0yUWjVUcuou2U"
Content-Disposition: inline
In-Reply-To: <0799f0de89ad2482672b5d61d0de61e6eba782da.1621407918.git.alishir@routerhosting.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=stefanha@gmail.com; helo=mail-wr1-x42c.google.com
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
Cc: qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--zjW0yUWjVUcuou2U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 19, 2021 at 11:41:45AM +0430, Ali Shirvani via wrote:
> The mode=3Dcontrol argument configures a QMP monitor.
>=20
> Signed-off-by: Ali Shirvani <alishir@routerhosting.com>
> ---
>  qemu-options.hx | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--zjW0yUWjVUcuou2U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmClMloACgkQnKSrs4Gr
c8ge5AgAoQJcSgA0K5z/GQAzcRd3R7xxHoqmO13OT1VmsVh9h3nXruMUNGQtcMUS
aRqBvmssZs1sSFQNLR8S2EE7GhlmI9ntIeFshQCRecEZiyiWL2LkjCLbvCtnSzKR
eTYk9TRV/4h0nDZ0B/UoU+xjWySVxW9BaeHVXlU9FkX4GDa6Zr6Mxfb2ns3ynB0J
awu6uFynaZhrkEw3q44GwcQKIgb+MLec9lP+6RJGwxOo65S9xJ6lMLht8NQ96+mK
D9InuVXckiVCHTS5UHdSCW/rS/TaISTqTqY3DuCcfMOXE11fHotKzhVRc3w0CEtZ
HUB0LSU244VVbe4Er5zI3GW/7guUKw==
=bjnT
-----END PGP SIGNATURE-----

--zjW0yUWjVUcuou2U--

