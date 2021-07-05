Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6B63BC195
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 18:22:07 +0200 (CEST)
Received: from localhost ([::1]:46814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0RME-0003pX-7Z
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 12:22:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0RC4-0002Nm-R5
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:11:36 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:33550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0RC2-0001Kw-FY
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:11:36 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 g8-20020a1c9d080000b02901f13dd1672aso201525wme.0
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 09:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Sxlr9UcDJytSer5DOPVhFy05eYoa7/rWCRBIA9ftumg=;
 b=FisqiRB2Zxg9WZSha52LdxGigo+W3rnFear+gymznWoBvsTWeOKDQHLkgCY23k7/ZT
 xVxAHzD1xo4Bcm5DCjwJQnFofAS3VL/qVfsh3bTVg8DufiGw74FU4dn1KFnnUVhgj0jT
 GiMxBnYvKXVQSSFL0IxIw4TXj0gm6O9M/p+07KlxQFQeun69wJn6u1uK+HEX0F1fTU+F
 za6tHzB5i/IkyqFjww9hNMjwchhPLFkICdxpKEjGybJez472elWQhfFoa09HdCaD/Wkk
 cXMLfBIcX6dND1nMQeC3gGqYWmWiIzQarRuXXcYSxuz+qALl/n4LnJZPLcadC+qpKILu
 5gCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Sxlr9UcDJytSer5DOPVhFy05eYoa7/rWCRBIA9ftumg=;
 b=ZMchdCuWRNWkHeJIXq01U4n+KvbLidEPuM0SVQDP3Jb1MhWugZDE0SVCueVLkt884f
 TMrU5Uk9Ssan4coj1m4HcsDEmXbFUeUAgJqYfWwDDX0kHy87nsHDFBTPK3ddZXFPm0Az
 iX2WJSi/O25iR6jn1kbsERq9tWu6ScP0q7Ia9rzIbGG3mtIRVjl8R7+Vggztf6zjsMk6
 S035u2Jl4pUXiLaUtDUbAaIhCLM1LxNzKb/MENz3cmzYWAwlwBG93/xP6dmsO3O6hvwI
 9yACAERSTe9Jb4+pnGlzdKCPB5miZkJ3zVFRjJ9apRbt5aVXjuMZxhOG2AFmFm6ZchRf
 WTGA==
X-Gm-Message-State: AOAM530qAZOuUdw/lSQrNEFSmpGFQJ+aZ4KXA0yVFzFRqFHbUBrL++Th
 SfjPtx348+QPYsI1pIaRJTNfOQ==
X-Google-Smtp-Source: ABdhPJyiAo/aBcfJKIs3He4sSIdRF3vXgkxM4O2INX3i5jZMn83U13kBvWj1c/YMWyAOkOSM4vvuyg==
X-Received: by 2002:a05:600c:2dcf:: with SMTP id
 e15mr16241476wmh.185.1625501489009; 
 Mon, 05 Jul 2021 09:11:29 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l2sm12492824wms.20.2021.07.05.09.11.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 09:11:28 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 78D9C1FF7E;
 Mon,  5 Jul 2021 17:11:27 +0100 (BST)
References: <20210623125458.450462-1-ma.mandourr@gmail.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH v4 0/5] plugins: New TCG plugin for cache modelling
Date: Mon, 05 Jul 2021 17:11:19 +0100
In-reply-to: <20210623125458.450462-1-ma.mandourr@gmail.com>
Message-ID: <87fsws3fm8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mahmoud Mandour <ma.mandourr@gmail.com> writes:

> This series introduces a new cache TCG plugin that models separate
> L1 data cache and L1 instruction cache and uses one shared cache for
> all the cores. This is a part of my work for GSoC 2021 under the
> mentorship of Alex Benn=C3=A9e.

Queued to plugins/next, thanks.

--=20
Alex Benn=C3=A9e

