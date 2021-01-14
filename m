Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A20622F6B79
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 20:49:46 +0100 (CET)
Received: from localhost ([::1]:44062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l08cr-0002L2-Lw
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 14:49:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l08aO-00010n-PL
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:47:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l08aN-0002WI-8t
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:47:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610653630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XIDvgEtWICgcfF67okv8bFWND5hbY+xfy5ENn1jz6j4=;
 b=CrO48jADb0CdT/FyYdQxtYxqVaOU2+RYVz6XGCR3lBwAPm7fYSq6EYEeVKPD/56HggkfIv
 Tumm+37IHB6Hy7gIyincnEY5OmP5DROF29smye1vVZbT33P/kcok2Oj/Pd4f4OPvgMlKs0
 pRWiuBOR/4461/U6iq8OgGPVfMLaQKw=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-HnvsIxXHNpGriMsUUMDxCQ-1; Thu, 14 Jan 2021 14:47:09 -0500
X-MC-Unique: HnvsIxXHNpGriMsUUMDxCQ-1
Received: by mail-vk1-f199.google.com with SMTP id n24so2746563vkm.2
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 11:47:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XIDvgEtWICgcfF67okv8bFWND5hbY+xfy5ENn1jz6j4=;
 b=sf41F1gv3FmHM/14OaYmxoarMyt8vEBoJlsIPxj1p4tkHiIF+tqFCTa9rC+sX3FjOR
 23awpZfvgHY4Fe0QC8b583CH+8A5Ls3FIiT1VF7uWsxbuei62l1sVMtE62/BKnWgd/Zs
 IQcvaUiV14lDRvfFnw0wpsojLH8vlzMzYs0SrIHxJKhxe2rc7+rehKzjW0XSLnQReatZ
 oAd+kr41NuLH8YxoMU1yDjInGOtACZoiSASBf6CdkToZDSx6DQU87MjVXeNhQId/a09L
 fFnWQqyaDrILWVU9f1a6F5aXajZL/llcXaQ2ou09d0fDGw4HK9W0JGJGjT2uWILvO/z+
 93ig==
X-Gm-Message-State: AOAM53231U9M0ytFkZrtueedxM3RaynWHTgfWrjEvBHkH3ks3CVMur3b
 m3EwSj3FWjCq+OxZGmOxtgeQDnNgS+s3DV+KKHk6v84inq2X/xjeoqFf3PyhJY7iWOEbHUX8Q/C
 imyvaMgzJ0Zr8RiPdBopmY//64Q/NXMc=
X-Received: by 2002:a9f:240a:: with SMTP id 10mr7243126uaq.124.1610653628677; 
 Thu, 14 Jan 2021 11:47:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/ZbjXgpMqWUsMq+6Hmau/mwTVQzS98wTyPbw4GRqtl9Wi8hWC/Tj8hHbtXNaBb6XcwHE/04BlzUVVTtNEhl0=
X-Received: by 2002:a9f:240a:: with SMTP id 10mr7243117uaq.124.1610653628560; 
 Thu, 14 Jan 2021 11:47:08 -0800 (PST)
MIME-Version: 1.0
References: <20210114165730.31607-1-alex.bennee@linaro.org>
 <20210114165730.31607-6-alex.bennee@linaro.org>
In-Reply-To: <20210114165730.31607-6-alex.bennee@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Thu, 14 Jan 2021 16:46:42 -0300
Message-ID: <CAKJDGDYbpFxdWdPJoQjrNqfrn32eTC0C7s4ybVHVsCuGV3xmBg@mail.gmail.com>
Subject: Re: [PATCH v2 05/12] Makefile: wrap ctags in quiet-command calls
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 14, 2021 at 2:21 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
> For prettier output.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  Makefile | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


