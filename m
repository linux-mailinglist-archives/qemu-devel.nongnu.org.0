Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7689C9FFFB
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Aug 2019 12:34:49 +0200 (CEST)
Received: from localhost ([::1]:34624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2vHs-0003jH-Iu
	for lists+qemu-devel@lfdr.de; Wed, 28 Aug 2019 06:34:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54996)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1i2vGm-0003KG-4R
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 06:33:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1i2vGk-0005bo-WC
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 06:33:39 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:44399)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1i2vGk-0005Zp-Nt
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 06:33:38 -0400
Received: by mail-wr1-x443.google.com with SMTP id j11so1132403wrp.11
 for <qemu-devel@nongnu.org>; Wed, 28 Aug 2019 03:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=XZEYrhVeWQCqVcT2elpVwenKZP630qOnEmkNJqHl+XQ=;
 b=i3YxHVBiB2v78CG4yhuoXSkK9sd8JwPV5ScWKDt7P4NuxvFyY02q5GdIsqBVBxgFlZ
 pEF+MWgnK+285/3lWnFQPGW6eUzqiHXc73OhX/lZs7jiEUZ322QdphKyciqhxsN6CPd8
 OK/4kRH7F3dBGRv5r+4BZc0XxeZRA9Kyu0EFIeIaonwlvF4yPn9kjprxawv85gtcO5fQ
 afpBkDeyKpDQsiQYxXQ6aQQUHLU9PZCAf4O02+xe2MpTqys5pQfk8y/wDbbA2SCnUbwS
 xVuehER+kf09mnvvNsjx9rwTX3xf/fgF+gS+FSzyJqPf3G/wBT5wrCYRhGz76CUCEJX1
 BWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=XZEYrhVeWQCqVcT2elpVwenKZP630qOnEmkNJqHl+XQ=;
 b=NU1zXlAmhrr+ipoTYyuIiJ7aaKkDA0jzn/HgZsJ4DlK9tYSLTXlbal+h/UtJV3VOYj
 tx/cgiLaW5Jpxz2RS7lJsvTnI6M5feocmRis6X+Z4OOTmDSeUSPNj81xq2zk2GTWYEBI
 e0vxf5UzwBgg6UJyDde1eI/V1vGruADbFk0GZdvqpItRXswYpy6H1GsuMLUACZ0cyCMh
 XRIMf2QkR3B9Uj4x1ZxeHrR299L3tj4bZ4jJsrFpkG+hRiTAq/Oaj6GgAKG4TRaC+YhT
 MSofeZ2IFgTdyHNHrLMi5YFgdLuRU1rzFfQcMUVtgJGPMDjuOeoIsk8Zy5+3Pq0lsf1h
 7hqg==
X-Gm-Message-State: APjAAAVpGh1q89koOXk3dTmmduilF+DyYtHbsX0pHwYvRP2oTmY/RTO/
 bGohJXnWvNTBkyTZfmGRVjJelI/U/R8=
X-Google-Smtp-Source: APXvYqxXWSXdJpHpsspyxqGzrtdk7RzxGU6ZUW3AD9HD0kydIxvauc9jqplHjIYOovuznqipiMhBQQ==
X-Received: by 2002:adf:f507:: with SMTP id q7mr3786180wro.210.1566988416057; 
 Wed, 28 Aug 2019 03:33:36 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e11sm4461214wrc.4.2019.08.28.03.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 03:33:35 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B964F1FF87;
 Wed, 28 Aug 2019 11:33:34 +0100 (BST)
References: <20190822122350.29852-1-armbru@redhat.com>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Markus Armbruster <armbru@redhat.com>
In-reply-to: <20190822122350.29852-1-armbru@redhat.com>
Date: Wed, 28 Aug 2019 11:33:34 +0100
Message-ID: <87h86160ld.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: Re: [Qemu-devel] [PATCH 0/2] contrib/gitdm: Minor adjustments
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Markus Armbruster <armbru@redhat.com> writes:

> Markus Armbruster (2):
>   contrib/gitdm: filetype interface is not in order, fix
>   contrib/gitdm: Add armbru@pond.sub.org to group-map-redhat

Queued to gitdm/next, thanks.

>
>  contrib/gitdm/filetypes.txt    | 2 +-
>  contrib/gitdm/group-map-redhat | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)


--
Alex Benn=C3=A9e

