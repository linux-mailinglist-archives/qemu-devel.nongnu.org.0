Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F106EF04C
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 10:33:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1praZe-0000ny-96; Wed, 26 Apr 2023 04:32:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tismith@tibco.com>) id 1praZV-0000nk-Fq
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 04:32:17 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tismith@tibco.com>) id 1praZT-00043p-Dj
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 04:32:17 -0400
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2a8bcfbf276so62592081fa.3
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 01:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tibco.com; s=googleworkspace; t=1682497933; x=1685089933;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FAG+xOASBWEyoJ95L+7VR6/AeiEj+lhH28fE7GiisHI=;
 b=Q2EmAqJ0z7ZZ3JG2zydIs5QSjQ4LZeXZprixf37Xsaq+NayOK+LOFhG3KmEqS9DYGo
 +GaMf0+YaOELAquJwJtIXWsWDuzzuqU0rVdlNwh3D4cKU+MBL42CPOPTkhWn9IE+8jXG
 YX4IxOtsO946q66afTq0TDolBTkt5xBpk9rsK9XhdAwI0Kw/1P0t4XQj+DznxkkMhvAw
 6eiWMl5kPlwkrGdQq9Of5i8M9svZH0IgMrWH+XO/xgGaXPCOIKNAyUZtZjg+1osLvnVZ
 48QS18GtP/p7SO9IbALxMP7nkU5zeR/Fz6f7ETvHiW3R9IQ1sElakKGUbGwTlUs4K+cc
 EGVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682497933; x=1685089933;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FAG+xOASBWEyoJ95L+7VR6/AeiEj+lhH28fE7GiisHI=;
 b=TGWSEbXdq6v7Yem7lo4J+szdQTPMBCRqnVE3nIVLwAO2ZnRmaBLBqVybyKrBOeXlKE
 56IJFkhFmyInDWZm+35GyYUFni6SM7sGNK6BWzVhxdl4PtcU/ntqUxXdxrVTJNr1KddQ
 kXwf5SSvilPWRFYSLZVse02/klm/sGOS3LO4v/gg5VD3e76EJ+62XvGjcSjQyYAcE/Gs
 8LrZ4ouoMKcVJEpUcbg6juWnZgjigVLY02VF1P6ZUX5FCXlmaKzSjeiwFDc01H2DeyKg
 6i09yaQr2jxpnQHPs4olJu/xdmHBK//SbtHZwnZU3byrYef2iv0Y9JPjGiwKqcTyRxrM
 aB4A==
X-Gm-Message-State: AAQBX9fw7FXDU+OnDw7c7xrHV3aA1PWpozZr1JIViH5AWovEuYAs07Ql
 0tyqGUa0X2WwqYgyRwfVXkZiOeo19hVuJ8dPuvctGw==
X-Google-Smtp-Source: AKy350a51CbIJJguxBdXXfGOE0FWIwuFtCZZ62Rcqkvukt1rfuPtFG/noW8O+B6X0NzUCMuAN9WyuLoUzwn0/nyDIu4=
X-Received: by 2002:a2e:9d44:0:b0:2aa:43cd:57c9 with SMTP id
 y4-20020a2e9d44000000b002aa43cd57c9mr3541695ljj.36.1682497933062; Wed, 26 Apr
 2023 01:32:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230420110205.688689-1-mark.syms@citrix.com>
 <54a37172-cad5-3b27-36fc-3b7768e39df8@xen.org>
 <CAPYKksVtGyfv3TbAjLH1G=N6=pH-pH2-FTX5c3+E5PsOKo2aOQ@mail.gmail.com>
 <CALUK5G5T=8MkxaQxdeid_ypo1e4DJ-zBRAMb7D+dcHkVdJt2tQ@mail.gmail.com>
 <f1325cdb-9e0f-b955-7041-826fb6c78174@xen.org>
In-Reply-To: <f1325cdb-9e0f-b955-7041-826fb6c78174@xen.org>
From: Tim Smith <tismith@tibco.com>
Date: Wed, 26 Apr 2023 09:32:02 +0100
Message-ID: <CALUK5G4zgRqQrinibOf06vydR1AMwdp=jTvLrC9FWqg385Tw_g@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND] xen: Fix SEGV on domain disconnect
To: paul@xen.org
Cc: Mark Syms <mark.syms@cloud.com>, mark.syms@citrix.com,
 qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, 
 xen-devel@lists.xenproject.org, tim.smith@citrix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=tismith@tibco.com; helo=mail-lj1-x229.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, Apr 24, 2023 at 2:51=E2=80=AFPM Paul Durrant <xadimgnik@gmail.com> =
wrote:
>
> So if you drop the ring drain then this patch should still stop the
> SEGVs, right?
>

I think that's worth a few test runs. I recall some coredumps in that
condition when I was investigating early on, but I don't have them in
my collection so maybe I'm misremembering.

Tim

