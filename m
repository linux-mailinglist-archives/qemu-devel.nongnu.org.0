Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B537C2F6B7B
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 20:51:23 +0100 (CET)
Received: from localhost ([::1]:47516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l08eQ-0003l8-Ia
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 14:51:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l08bv-00024J-MY
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:48:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l08bm-0002uQ-Uv
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:48:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610653717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MvIPL9zWl2LIsGonOX4Gh/MSM6CmWYwIZdEBM5TUudE=;
 b=IAILY0v4IIWV94HcRfrW6ygBT8Kc15KYWAXKHGFQ5n+RJ52jvuw08qnpvJi7szu2WFbaNZ
 VL7x/nygpcB89fU6m8we+v4GuAMpYuZIV5/odPAn/zcviQ6XbmEeL994CdTA7dL7mZR5B1
 Q+/2M0UPCRPiKL0yz4P0oObvOeKznFc=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-gdYHcfwcN_-NChBWFuf6CQ-1; Thu, 14 Jan 2021 14:48:33 -0500
X-MC-Unique: gdYHcfwcN_-NChBWFuf6CQ-1
Received: by mail-vk1-f198.google.com with SMTP id m20so2732233vkk.16
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 11:48:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MvIPL9zWl2LIsGonOX4Gh/MSM6CmWYwIZdEBM5TUudE=;
 b=lR0a6BXU4cxN4CS7z+zPR0h2sPgnwuuz8kVZ5eKgg3C+ZyKwHys2U4eVDNcXtrElzJ
 zMOAP+LbORUzLUk/u8IQ5lHj91HaSh/arLrWnS0QZDQt+7mf9bvfHXS++QphJpLgnjyJ
 8Nt/BwXd0paf0XCpz/MRHRCuD4dH9A32ZMYdgdNtd1mnAUTMBl8YWEnW20mC4n2G8MYG
 8W6D2XIqPD+b67BuJovsv3O7hZEpUST9aPvA5mI5AJYIuVDP10WBWH7dmwbeLhRDO8BO
 xfowF7TPBr9n7VF5PPKyUVG0pFVP0sfVEp27liSYq7dtQmMvlOZK4iACkZ+YJvS1fZco
 HeuQ==
X-Gm-Message-State: AOAM5307LQiepTwNIhrKs/Dlnxd/KOJso6DA8EVw7AC5PE5eo8OnoivG
 0E/GGf6L2q+0Wpqir5IvgfEBUYDGensgbZ56yFoodDe5GCNoFzK05YUlLFLtOd5hj+e1C61aj0o
 pJdkC7OG2IBczzUpvYHeJQZHHyUfWm8g=
X-Received: by 2002:a67:e155:: with SMTP id o21mr8017676vsl.39.1610653713434; 
 Thu, 14 Jan 2021 11:48:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy81V6a6WQn0i2VsOXAJ+p/SVi23lxfWnl0Z6FKTE6jIgoLDvOt61RHNL0csjde0TehjnAVNjn+u35H6cv/yy4=
X-Received: by 2002:a67:e155:: with SMTP id o21mr8017668vsl.39.1610653713243; 
 Thu, 14 Jan 2021 11:48:33 -0800 (PST)
MIME-Version: 1.0
References: <20210114165730.31607-1-alex.bennee@linaro.org>
 <20210114165730.31607-7-alex.bennee@linaro.org>
In-Reply-To: <20210114165730.31607-7-alex.bennee@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Thu, 14 Jan 2021 16:48:07 -0300
Message-ID: <CAKJDGDaZmaxKX5yqk8wJ+czS6CUp-QQ1vP=2bSCrPgXhpU0dDQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/12] Makefile: wrap etags in quiet-command calls
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 14, 2021 at 2:41 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
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


