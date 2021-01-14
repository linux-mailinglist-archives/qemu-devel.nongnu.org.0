Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7E62F6B71
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 20:48:26 +0100 (CET)
Received: from localhost ([::1]:40784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l08bZ-0000xT-QS
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 14:48:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l08Wg-00066S-9V
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:43:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l08We-0001Fa-Rd
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:43:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610653400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pVlP1IWmbTKBVscTvSFXw3HKA37bIjJbpSVkgPs6BZM=;
 b=ZMfKhIdsAoQ/LMnjEr/QdT0D27eLltggVEyoOQsdx69JF4h5wGGf6gr8drCTT3wihIfE37
 0x83ALw0WXexabiAxJ6bhKWRrecZVPrAyokMTzon6FE+6hwa1UIJkQiTGvC/AyBRBlk5Wj
 mvs1shmNUt110F+c3HDBWtT7z45+8eE=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-0MwbL2zQN2amUNdDqfezyw-1; Thu, 14 Jan 2021 14:43:18 -0500
X-MC-Unique: 0MwbL2zQN2amUNdDqfezyw-1
Received: by mail-vk1-f200.google.com with SMTP id p184so2731195vkd.18
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 11:43:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pVlP1IWmbTKBVscTvSFXw3HKA37bIjJbpSVkgPs6BZM=;
 b=FdpAcoIk2+6+tAvjktMqNuJCBchXHEqvW+zp4ZkpKPdNzjAYP4qjVC1FqlcM2HsV4E
 rlGmniT4B4w9oQ2UTfaT8COoJBhgv8rDp5zbNQ7vtI3uOHUwfkz8SdOZhAqhXR3PGzV2
 RSidQ8GZ/XhqyREQxUmV7sBEnAkZO4ZnKJj6HSsgIKkq4O/iR7CpKjluulK7t7ROo8Y4
 aNf8KQqL68qGvoGbuJr+zTOmkZMTOoriP68SGi4MGIC6x4QEW4HiSp5HD2x9q66jBpFL
 u6XXOyaOBN0sieaQY6jmbErklfCvlFypxTclpboihSyqMrMCuBJCfYKkX/I/UMykBktv
 jMVQ==
X-Gm-Message-State: AOAM5309q19imaK8Ns0p1IBeORhzD6p2Z0uMdKcy33kYLqGWQBXC0PSK
 cqPZCUGev6QgEJLxmxfMxpRzBkw1ST2PiB7rbFWAlZlK62MtUtihyyd/h9kNkgSm6aLXyOb1/Lc
 8ow3/8gycM/6+QhT/6GqQHftaqcvU57g=
X-Received: by 2002:ab0:770d:: with SMTP id z13mr7822976uaq.110.1610653398279; 
 Thu, 14 Jan 2021 11:43:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZqkYeCXM7deNE5r4lRd9EHYcG+Udnv7u1Y5HtLdNgpcRZXaQEC8t3dJu56XEd+LLdQnXm9C6neLGtIL946Kg=
X-Received: by 2002:ab0:770d:: with SMTP id z13mr7822970uaq.110.1610653398131; 
 Thu, 14 Jan 2021 11:43:18 -0800 (PST)
MIME-Version: 1.0
References: <20210114165730.31607-1-alex.bennee@linaro.org>
 <20210114165730.31607-5-alex.bennee@linaro.org>
In-Reply-To: <20210114165730.31607-5-alex.bennee@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Thu, 14 Jan 2021 16:42:52 -0300
Message-ID: <CAKJDGDY3E=XUF7yd8LRMTEadk3Ui1AfyUCf3K8KWUfuLv2rmww@mail.gmail.com>
Subject: Re: [PATCH v2 04/12] Add newline when generating Dockerfile
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
Cc: Alessandro Di Federico <ale@rev.ng>, Fam Zheng <fam@euphon.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 14, 2021 at 2:37 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
> From: Alessandro Di Federico <ale@rev.ng>
>
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Message-Id: <1610080146-14968-36-git-send-email-tsimpson@quicinc.com>
> ---
>  tests/docker/docker.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


