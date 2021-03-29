Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B8B34D41E
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 17:39:45 +0200 (CEST)
Received: from localhost ([::1]:38286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQtzU-0001HD-7U
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 11:39:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lQtx7-0008Cy-UJ
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 11:37:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lQtx5-0004U8-H6
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 11:37:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617032234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H/WT/d0cOCNkYZhPHLHnp5FO62wzPNU7DXYVb6WCrsQ=;
 b=dvia3PH5DmxG/AzrGmRFw1T8I2Ft/B9slj1fTngQF932DAVJZ+JRLe/KmQqUuCdW+0xPrK
 rGZ7fPBcaIFBIcgG4oiCl5RxmADeyI5KCyg4AfKScCB4WV0ylZ+8Pldq2rlBKhoMO615x6
 chxkmYFoItfeEIOfL81TpARBA7w2dBg=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-sEkKY6d3P8OuD18Y-2uqvA-1; Mon, 29 Mar 2021 11:37:13 -0400
X-MC-Unique: sEkKY6d3P8OuD18Y-2uqvA-1
Received: by mail-vk1-f199.google.com with SMTP id s23so4571943vkb.21
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 08:37:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H/WT/d0cOCNkYZhPHLHnp5FO62wzPNU7DXYVb6WCrsQ=;
 b=TSGe8LHedauzpiLfjbtWWavH/i0pphgcd4NaNgLfZ6kVuIw/HC+BgEvM3L9qZIFsev
 ZTt+CgAhsJfSJJT+PleUOjlHKwSn+47/l92RfCIPZ9XCu0g3k90TEbqKWuQpF2U5ba7k
 ZzzKZTohhwNa+nSXvhKff1Vu8CdUh2t/lNiEwZ3KrTV4IYwb5ET6d+EVOdebeErpx5wZ
 38J0hdh30oFU73/miy3y/nAELSRq0x9qv2x4qzvnAOfU4/GEo2diJ0JpXnkBCpCVZq0H
 8Qy0lRAIR+HL+ENf3fyuvZ7FPwpfQ4D5sK2/xI4LgelI65/H64o7bmqA3IK1MkW/Ev+f
 NBVg==
X-Gm-Message-State: AOAM5324duwTcHahVuJWTIrme6rHcPXu6+9RvvoAxw1HBQMNGPsz41bu
 APsa4LjjgG4umL22e6h9AEg1XfkfcOkICF2om4nlbdLd2MsO5Gx9IuAOQ9jlA7C1OQ2XYLT6Wsu
 pURr5y8r9XI3pcSb7d3Z+2wcvChywR98=
X-Received: by 2002:ab0:3388:: with SMTP id y8mr14296058uap.113.1617032232582; 
 Mon, 29 Mar 2021 08:37:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyf2w5n6PXxyaa0aKMnybIc9GD2ULcayKQNwDZ+jL5yJ03ZlIDYR/oCQRkW30rhflYphHo5lupCgsSNxDKEZ1s=
X-Received: by 2002:ab0:3388:: with SMTP id y8mr14296045uap.113.1617032232462; 
 Mon, 29 Mar 2021 08:37:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210329132632.68901-1-mreitz@redhat.com>
 <20210329132632.68901-3-mreitz@redhat.com>
In-Reply-To: <20210329132632.68901-3-mreitz@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 29 Mar 2021 12:36:46 -0300
Message-ID: <CAKJDGDbESvNT2RV8LMD_Gn03+6qF_P3=tnt1CVFTpifnJFrtvA@mail.gmail.com>
Subject: Re: [PATCH 2/4] migrate-bitmaps-postcopy-test: Fix pylint warnings
To: Max Reitz <mreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 29, 2021 at 10:28 AM Max Reitz <mreitz@redhat.com> wrote:
>
> pylint complains that discards1_sha256 and all_discards_sha256 are first
> set in non-__init__ methods.  Let's make it happy.
>
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test | 3 +++
>  1 file changed, 3 insertions(+)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


