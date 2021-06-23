Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A86143B18C1
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 13:20:27 +0200 (CEST)
Received: from localhost ([::1]:55390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw0vi-0000sa-PR
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 07:20:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lw0uU-00008s-Ar
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 07:19:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lw0uO-0008A5-4t
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 07:19:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624447142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ELTbDzPKPsY4Lbk3j14wn+3KfGWKaUiFPWrK06zBFpY=;
 b=ajtnwc94sSyf6RaIL1+RBL4v1xWrSnokYV7r6g38GxTaos8OVjJMT0ERpteCR0lBu/5wc7
 kwPnmCZlhDKw0673prKOUnWKDQINbSuG8T0BZY5u0TfOK0uFy+k7hLXkuB6u/RV+Asvh2R
 1etR9VyfuRQ1UkIeodaUh2vamRtr6PQ=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-SxFI_Sc_N-qy9ReQU18KWA-1; Wed, 23 Jun 2021 07:19:01 -0400
X-MC-Unique: SxFI_Sc_N-qy9ReQU18KWA-1
Received: by mail-ua1-f71.google.com with SMTP id
 k13-20020a9f30cd0000b029025e3e26edb8so767288uab.9
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 04:19:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ELTbDzPKPsY4Lbk3j14wn+3KfGWKaUiFPWrK06zBFpY=;
 b=UsQlt8gpP3KlGraKL287muJ7uhspso6YQPi87B9CNCY2dzmirz0gmP5G4g24nlqC5M
 MBNT4nlXVbjbmEFmCVMxmlYl2wWjce0qoQntncWVr08YA4Gvn1i904viPxqI9baHw0y+
 W0Ke/UB++MB6NRTbzAEK5jt85ngSVPagqaZiLi5FJNP8LBo+CVLhbNoFp4uzONwMJyXN
 DTcY/0yi//A0sQJROhl4oK5D6BQUsNQP/ZkElKsSLhrwBfVoiLq067+UD4/GtPYdCmAx
 x7c1Wv8bX5z/z3fgf6gZgNkjILppVtv3lOBUrMomB/jcoKnioX6dlfsvKEh9sjhowlyw
 ukrw==
X-Gm-Message-State: AOAM532Uq0C0Xjkg/lTChPHbQl0AbXLFEsYzNrWTUbegZccLFf4m8LEN
 Jr+9RR/N4NWPMfL3666GWrNxXO8kRzqcW87Waq4TIRSReQlo9+aj9K9jmkTn5vASIb1HTSBV0BO
 93eSbP5eQgn8eRtfRk5piBAkYX+pOyt4=
X-Received: by 2002:a67:fa0a:: with SMTP id i10mr6522338vsq.45.1624447141055; 
 Wed, 23 Jun 2021 04:19:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAKKH1w+2rkD7mGkzpd8Kwkd+ibi2hMNQqjqWXwDh9KH4GWiSxlL3egMvakBPbydNbpgEC1Pjp9GHAdM14TBM=
X-Received: by 2002:a67:fa0a:: with SMTP id i10mr6522328vsq.45.1624447140931; 
 Wed, 23 Jun 2021 04:19:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210623102749.25686-1-alex.bennee@linaro.org>
 <20210623102749.25686-2-alex.bennee@linaro.org>
In-Reply-To: <20210623102749.25686-2-alex.bennee@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 23 Jun 2021 08:18:35 -0300
Message-ID: <CAKJDGDZ=bXsnFhn3TCUgvgn0Rcy2sZqSvx9+qE62+TQOwkTyxg@mail.gmail.com>
Subject: Re: [PATCH v1 1/8] tests/acceptance: tweak the tcg/kvm tests for virt
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 23, 2021 at 7:30 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
> Really it's only TCG that can select which GIC model you want, KVM
> guests should always be using the "host" version of the GIC for which
> QEMU already provides a handy shortcut. Make the KVM test use this and
> split the TCG test into it's two versions.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  tests/acceptance/boot_linux.py | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


