Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0164A37B078
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 23:05:48 +0200 (CEST)
Received: from localhost ([::1]:55328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgZZb-0000ti-2Y
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 17:05:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lgZXV-0007Cv-Cp
 for qemu-devel@nongnu.org; Tue, 11 May 2021 17:03:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lgZXT-0001q6-RE
 for qemu-devel@nongnu.org; Tue, 11 May 2021 17:03:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620767015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0DEqQihFW2NA0hrTXLnve/7J6B7hO/tZZBkeN4dYZTU=;
 b=SX/Ic+jcXFgUR9O134PXglpVi2O9LBwx6Fz0DwGHJYOOQHJiMsbjiX332X19CCqFMu+rD3
 dKZin0knji3diyVaYEILAsZqLtcNqA4XuUGFfed2I/hqBTv+w28xZ7CA/MXGLpYaQU2RG/
 epRpyP8xr38nx3uvkYkS1ACYsGBPN4s=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-MBwfcetNOTin0KTlpKu61Q-1; Tue, 11 May 2021 17:03:33 -0400
X-MC-Unique: MBwfcetNOTin0KTlpKu61Q-1
Received: by mail-vs1-f71.google.com with SMTP id
 r2-20020a67c3020000b029022a851392d7so5602981vsj.7
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 14:03:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0DEqQihFW2NA0hrTXLnve/7J6B7hO/tZZBkeN4dYZTU=;
 b=uBIZqwJHd3av6sd2w4aSDjDX576I3GiL3ZlF3i1/+TB4dXNnFLTWvvpv9QOb7bASOR
 BGta3nNHQAK5W5uemqMyaKcIVQJG28fYqpZZw3vY1UhGddEUElbYhBzSrNBNTeHF4B4M
 2ilHmEGZtvUV7b9mugq2EQMXJuRxdsLGPfLJfXoKQlfjAwLQ4KyZG41NMQVfvgLjQbYU
 oSqpxs2T2CGgwW4jtAjDEQXpAc3/9k7iaOAwRLVo0LUTQl41pKBHZ9KHCWQb0Wm/myPc
 Z82WL0iTTjmsWOAPMQ/fwkmT0qHhwypWKFJl0TWuG6jDSRHvyUN2WUTypC5VEgn9iCmt
 kuaQ==
X-Gm-Message-State: AOAM530TgmYWV9ji/KPiFjv16GCd2WDyf+gn4VkpTatXHNBzJzbIZb0U
 H9usWRJOqdlik7iM1TNWSxg/sursbDvZLhS0TEHgmZrCV8nz+q1MbAqCW645To0h88OrM1eZurd
 XBXoQ9KR4MgeUu1EwjQIHvc5gqn7mZUk=
X-Received: by 2002:a67:c31c:: with SMTP id r28mr27470814vsj.50.1620767013119; 
 Tue, 11 May 2021 14:03:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYy7hNZXm+bAGuZx1rWNGk5EbCxj3QoeBJRKrqmd3DT6V1vP/w6d8Uj9RPV2p7slqleYusa1DU0Bbua5tdiLQ=
X-Received: by 2002:a67:c31c:: with SMTP id r28mr27470804vsj.50.1620767012977; 
 Tue, 11 May 2021 14:03:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210511132641.1022161-1-berrange@redhat.com>
 <20210511132641.1022161-11-berrange@redhat.com>
In-Reply-To: <20210511132641.1022161-11-berrange@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 11 May 2021 18:03:07 -0300
Message-ID: <CAKJDGDY+1hy5g3J-i+NzPYGfMX59o1PD7KRenkiT7s+t2HKUSQ@mail.gmail.com>
Subject: Re: [PATCH 10/12] bump min required glib version to 2.50
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 11, 2021 at 10:28 AM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
>
> The glib version was not previously constrained by RHEL-7 since it
> rebases fairly often. Instead SLES 12 and Ubuntu 16.04 were the
> constraints in 00f2cfbbec63fb6f5a7789797a62ccedd22466ea. Both of
> these are old enough that they are outside our platform support
> matrix now.
>
> Per repology, current shipping versions are:
>
>              RHEL-8: 2.56.4
>      Debian Stretch: 2.50.3
>       Debian Buster: 2.58.3
>  openSUSE Leap 15.2: 2.62.6
>    Ubuntu LTS 18.04: 2.56.4
>    Ubuntu LTS 20.04: 2.64.6
>             FreeBSD: 2.66.7
>           Fedora 33: 2.66.8
>           Fedora 34: 2.68.1
>             OpenBSD: 2.68.1
>      macOS HomeBrew: 2.68.1
>
> Thus Debian Stretch is the constraint for GLib version now.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  configure             |   2 +-
>  include/glib-compat.h |   9 --
>  util/oslib-win32.c    | 204 ------------------------------------------
>  3 files changed, 1 insertion(+), 214 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


