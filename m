Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 763595F2EA2
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 12:11:55 +0200 (CEST)
Received: from localhost ([::1]:55040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofIQT-0003lf-Bi
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 06:11:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1ofIHi-0007xf-1n
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 06:02:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1ofIHT-0005mW-5W
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 06:02:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664791354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XokbgT5FLVTu5mzjbsm6aBjYsThNO/9aMV020dm7gqc=;
 b=GFzezzMUZ8eYsl/H0VL7gtlBVGGEp94eTZQ8AGYy7xXmWlvajHkvIHQ61IdERgWk1hv2WT
 XRz6sdec2S7ZhevYwgIj4OnzHWa0za9r7UUZFS0DHC+BF5SB9mjRoPn9VqO5cYavPFMsBC
 lQA+2fFVKHsrMgrrhyPoqBjgBc1IhhA=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-79-yCgUT7V1O1e7_s70bYRheQ-1; Mon, 03 Oct 2022 06:02:28 -0400
X-MC-Unique: yCgUT7V1O1e7_s70bYRheQ-1
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-131caeb598bso6778214fac.12
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 03:02:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=XokbgT5FLVTu5mzjbsm6aBjYsThNO/9aMV020dm7gqc=;
 b=PIXYlocj+TSPhgICKeZXkivk3uBlkFCfe2IXS+5z45MKBdgg7XbGEEzolRsODCvuxQ
 9a8QJlTXAp8Kh1cKvzWIgdl5wcJlG6UpAgf5VDTxP8YehuNumRo38FAmGyx9UhLPL8a9
 UxtFUR+L73UcoxUTZ6BJzde4bhCcv113I47STQeN25mlfQXWiJv5FuK0LFOBBNmN/z/1
 KQVlJETKtBcxaa/EdmV8Eo5HA49Tb6uzlRpHAkb0eCza4W+KSEJFeXec79ijlxPOuTDN
 TJMXc5B/NS3BzGmNLtGK0PlmdJA4EalUZ1THOA62Ct6okJVdN+hQLsJcRCbG2eZccGJt
 wlig==
X-Gm-Message-State: ACrzQf0BR5qJu5Efm1mGVrojwuin5LSI/p92g/Lym7DZLw0htivmITw+
 xE4LqERl780C3pdsTUOvy8hZP1Iap7mNp3RxD94esLv+UcNwW1wEW5tjmovWI9b2pSOIJnr0LiN
 LohpTnK1vd/zvLhUmyFwvmZ1XBkN6iFU=
X-Received: by 2002:a05:6808:21a3:b0:350:cca1:9f40 with SMTP id
 be35-20020a05680821a300b00350cca19f40mr3828700oib.205.1664791345802; 
 Mon, 03 Oct 2022 03:02:25 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM54OlkvV6cpUiJn9qrGS15DDuEoNM052hMPHX+KbXFBq7NWs3S0QF1seW2g15I8PkJkujn3mNgBXsDxn/sq5UY=
X-Received: by 2002:a05:6808:21a3:b0:350:cca1:9f40 with SMTP id
 be35-20020a05680821a300b00350cca19f40mr3828694oib.205.1664791345631; Mon, 03
 Oct 2022 03:02:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220902111900.3029260-1-marcandre.lureau@redhat.com>
In-Reply-To: <20220902111900.3029260-1-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 3 Oct 2022 14:02:14 +0400
Message-ID: <CAMxuvayRtJ9LC8xBcwHyoxUCWpLQ0BMXW-u_nnWFc_K0iELxaA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] io/command: implement portable spawn
To: qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Fri, Sep 2, 2022 at 3:19 PM <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Hi,
>
> A small series, based on earlier "[PATCH] io/command: implement portable =
spawn"
> to enable Windows support of command spawning in the io/ subsystem.
>

Daniel, please review.
thanks

> Marc-Andr=C3=A9 Lureau (3):
>   io/command: use glib GSpawn, instead of open-coding fork/exec
>   io/command: implement support for win32
>   tests/unit: make test-io-channel-command work on win32
>
>  include/io/channel-command.h         |   2 +-
>  io/channel-command.c                 | 163 +++++++++------------------
>  tests/unit/test-io-channel-command.c |  31 +++--
>  3 files changed, 75 insertions(+), 121 deletions(-)
>
> --
> 2.37.2
>


