Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F32F0231EEC
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jul 2020 15:03:44 +0200 (CEST)
Received: from localhost ([::1]:56106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0lkF-0003AM-Pj
	for lists+qemu-devel@lfdr.de; Wed, 29 Jul 2020 09:03:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1k0ljQ-0002e4-0b; Wed, 29 Jul 2020 09:02:52 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:54517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1k0ljO-0005z2-Ex; Wed, 29 Jul 2020 09:02:51 -0400
Received: by mail-wm1-x331.google.com with SMTP id d190so2643981wmd.4;
 Wed, 29 Jul 2020 06:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=UiAAUsgoxESRAYasZa3Rjo2Nv16PISfy3RzxxRZSHy8=;
 b=C9lar+7a9IzEqAfsHLPr4U7m5KKzinVfze4e9PJpIVveRVtHJY3E7txgZPtnejQuei
 IF15CusP8GmvXxGUdR4nW3JZErcc3LsUPEvXEq6jZAFBqVYvcqNNiJSY9X55s3T69Mwf
 CudF2BgvyfNvZlVoIPfEoFLxfMhifAieDcK8nUwSMQePKFNCwe4oh6pntiwPz0+xwbZL
 wo2+ZeoX72kw79H3z4DNOMtYxZ3IizSMrLuKTubQoj2dLvst522EO8MwYuuEhM5cL7Cw
 1k4CRsNSIh5blvs3SfvKYB76Mln14x6Bk3rgWSo2xlPgDSTl8D2lTKRT2BlcBQP77zZQ
 c/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UiAAUsgoxESRAYasZa3Rjo2Nv16PISfy3RzxxRZSHy8=;
 b=Dh/MzB/brafLlB9h+xhUtKW3t8cY7YHiskb1L8VX6Fzz7+oRO/790095ycibUEPQFe
 zuMmQY/zlMnJRQkgiH1cEcfFqQJgfyM8lS5XXA3LgaMFlQouAldJpLTEGk+DsC11v1s0
 6Zw2y/zztM9scrlqZ86LdUyPtWU4n184jgHccpoktuYpbmAFivDnnR112BbEWY7JY5+V
 XLnaa8i/7EsAQgTYZySHYB27Ndn4x/c6mdZY3axZwV4da1At5XyXNW/DJfVmOzl09RSb
 wm8hmxp4fv5mt7AtaqgrW5S5KV/Jr+SktYyO86roU/F6OcQytUMAxTNol1I+Xp1oW9UH
 zNhQ==
X-Gm-Message-State: AOAM533exh8erwxvyshp7Ms4PY486l1was2rQcepD9HAeE9qsyxVwrXl
 t32ITfum3CXAhjTQcztLQfo=
X-Google-Smtp-Source: ABdhPJy7sh40lOmTZhkMgurgyJBmdShX18znPH7GKIAk2WGYLcP48p48jrZsituJtokj0OBpv2j1FA==
X-Received: by 2002:a1c:660a:: with SMTP id a10mr8163866wmc.115.1596027768388; 
 Wed, 29 Jul 2020 06:02:48 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id t17sm4901057wmj.34.2020.07.29.06.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 06:02:47 -0700 (PDT)
Date: Wed, 29 Jul 2020 14:02:45 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: anthony smith <backtogeek@gmail.com>
Subject: Re: Disk cache defaults
Message-ID: <20200729130245.GH37763@stefanha-x1.localdomain>
References: <CAPf-64Wni=_9byuHt9HyFnZ6PwTF3wp17oEMF2ok-Tvk6UG0RQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Rn7IEEq3VEzCw+ji"
Content-Disposition: inline
In-Reply-To: <CAPf-64Wni=_9byuHt9HyFnZ6PwTF3wp17oEMF2ok-Tvk6UG0RQ@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=stefanha@gmail.com; helo=mail-wm1-x331.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Rn7IEEq3VEzCw+ji
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 22, 2020 at 07:14:59AM +0100, anthony smith wrote:
> Appreciate any assistance even if the answer is just "Not possible" so I
> can at least drop this search for answers.

You can create an /etc/qemu/qemu.conf file but I don't remember if there
is syntax to set -drive cache=none.

CCing Kevin Wolf and Markus Armbruster for ideas.

The hacky "solution" is to write a wrapper script (e.g. a shell script)
that modifies QEMU command-line arguments to use cache=none if no
explicit cache= option was given:

  $ cat qemu-wrapper.sh
  #!/bin/bash
  # Add QEMU -drive cache=none

  declare -a opts

  i=0
  is_drive=0
  for opt in "$@"; do
    if [ "$is_drive" -eq 1 ]; then
      opt="$opt,cache=none" # TODO skip if cache= is already in opts?
    fi
    opts[$i]="$opt"
    if [ "$opt" = "-drive" ]; then
      is_drive=1
    else
      is_drive=0
    fi
    i=$((i + 1))
  done

  exec /usr/bin/qemu-system-x86_64 "${opts[@]}"

--Rn7IEEq3VEzCw+ji
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl8hc3UACgkQnKSrs4Gr
c8ivgAf8DiEUYK/yt9VXrjGGc+aZK2D8Qk/t4fehzzb7C+pcigZu/QYW/HHfM6cW
aPrk8W1JBTQDCot+FwcuiiQ2h1JMa/VFayGGkz7KZjz5Qj3ztoSv7epmekhpQYsK
31AmeMG0ABtKGG1woZsocU3I60m04qrbhbHi7CGJMJjQFXi2BUWbPDYHlaihuZXu
TSyvjXshtqXK44j0YP377lD+VDahSjS7eVa4/CNwC8oZi8HL7q6CL4yoP/5k7VjC
1WMGSqZU55FDoJ/FEv/LI7shgz6qg8kClBZ0hTSvL4+mHbZmTANV/8JJ14cd/Jud
PJbO8VwLXpUoowrT+Z4g1UfDOI+Wfg==
=DSbJ
-----END PGP SIGNATURE-----

--Rn7IEEq3VEzCw+ji--

