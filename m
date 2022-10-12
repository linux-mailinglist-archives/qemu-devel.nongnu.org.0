Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E575FC546
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 14:26:24 +0200 (CEST)
Received: from localhost ([::1]:40884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiaoZ-0003qU-Sc
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 08:26:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oiah1-0003rQ-8J
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 08:18:35 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:35390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oiagi-0007QV-O8
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 08:18:34 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 m29-20020a05600c3b1d00b003c6bf423c71so652140wms.0
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 05:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sPNG07ErcPlXEdUHK4/vS3zeUUsMOItuvQUlEsvCOlw=;
 b=voBhjZIEfxmLQN7mGhEaLJlDNxKx0MmwHHrPZCkC6wY/4QKxm6ofNiyG4kPM1YeK00
 USIxqlYYDbCsJ10MWCsrmVkKBtuTV1ice1kS0McCnieg5oNHdOIQBeMmCBjNnbwjOuCS
 IztiBI6Js7RX3HHHx9Orhv30AheJ1CI+v2Gw+/Qk+yx/WrIZvSIl0/qseU/fXiOoANYK
 Ef10uRSW1Dqu/luyqfLvTaIHMrB5qsHlAb1p0k9LCyh40C8yu4GlEMWaXrS2/lv7ATCv
 FxIZ+V5iw2A+uTBFkyjoSpNHdWnRyp4GskqjhKukLl1ANlGXByHaUEg5zQppR9FtDfvP
 0LGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=sPNG07ErcPlXEdUHK4/vS3zeUUsMOItuvQUlEsvCOlw=;
 b=ahcWx2L3D3HXReb7RjEFOHGXRG5jVWALpplNdnS3R7IYnk/Oqku1Uor46qOUnjuSko
 cS3lQH80z7vtpR2I5pr9DJtWlmfRE0vbaEjwUhzEMauhJjkWIHd6tvoqY9ZUp79yzptJ
 cLNndWDhTYFMfQHPOynsbGcpCxejTSbkco20NWzE8P5dWZ+6Jjg2prhPwOFl5FaNOHbe
 MXMtr4WGD6yaFtpY07jc6wZ0PTLJ+FlPhYFSCHsD5oKtqHERlLWTR8laNTYsvWNkHuLN
 vGL/SEa11+E8lftlOi+kzJUWfQyi+dpKdq5okjFE6yLC5bAJXhnOarMN2Zhug768Qpa5
 Jueg==
X-Gm-Message-State: ACrzQf1UjU63DJjB3OC9zo+E3HYwbdFwdwA9u8iZeb8tZum6vaebb23z
 0goQUrfXt3le66WFgA+1sHO0DTPm0Wib6w==
X-Google-Smtp-Source: AMsMyM6Ou1yNXNvSUFizDFJ8iQbK6TwzoOGnijCntLk+XWvtzqJshu8wbM7Lky6zvaWnuwxl+bBmmA==
X-Received: by 2002:a05:600c:510e:b0:3b5:1ab:fa5 with SMTP id
 o14-20020a05600c510e00b003b501ab0fa5mr2596092wms.204.1665577092085; 
 Wed, 12 Oct 2022 05:18:12 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a05600c465200b003a541d893desm1541972wmo.38.2022.10.12.05.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Oct 2022 05:18:11 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 690C21FFB7;
 Wed, 12 Oct 2022 13:18:10 +0100 (BST)
References: <20221012090855.359847-1-pbonzini@redhat.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] build: disable container-based cross compilers by default
Date: Wed, 12 Oct 2022 13:17:15 +0100
In-reply-to: <20221012090855.359847-1-pbonzini@redhat.com>
Message-ID: <878rllqlq5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


Paolo Bonzini <pbonzini@redhat.com> writes:

> Container-based cross compilers have some issues which were overlooked
> when they were only used for TCG tests, but are more visible since
> firmware builds try to use them:

We seem to have dropped our gating somewhere. Previously if a user did
not have docker or podman on their system none of the container stuff
would run.

--=20
Alex Benn=C3=A9e

