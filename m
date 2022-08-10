Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 118B058EC07
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 14:30:49 +0200 (CEST)
Received: from localhost ([::1]:52918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLkrI-0006b6-5d
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 08:30:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oLkmF-00087H-Hh
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 08:25:35 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:35376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oLkmC-0002NT-Fq
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 08:25:34 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-32269d60830so140776087b3.2
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 05:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=CjPq9WVan4Hj24JpQ0YfeBx2xIKWZzde5d9o4jSyIeA=;
 b=XyluZPMgyrb7pg1GnKkN88sqS8wKv4JpZFMwkKGRffg2JnzbtkhlgKe+Xsdvl4+aDS
 1KwYtFmMT1hmVTmNeuDOLgzEqB2aGzkDhnwtwGdNBlDdZ+3mKNJzjfA64wKQH261G5c1
 7ro8ITHwNSKl3fp7Kag4Zp0LGJvFg+Z/67Xo3I1WpTEv3qVCAgKnrAKDEjJW9WSTZ0XB
 64HL+SMPZPoI+f6gT/kHvOHCrNTguKNaCb/GlfwH9sP+aeO/HTYFDTn7vVdcFm1I0v4q
 3qS7+N0Q1QVS7lmOSoVkoviX+fPA+NscWUtgHOWH9M7rlEXm8BrWWBN4NYfeLZjsClL9
 Ja6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=CjPq9WVan4Hj24JpQ0YfeBx2xIKWZzde5d9o4jSyIeA=;
 b=317DKp4ypOV9zUfzacxLfCNm5c57wlYwRKrQ5vy+JTovNLmxr3qHmApLWsJ4pp4W3p
 n1lryqTouRKLQlHQrcxGPqXqrzL2lrGdLinplxIx7tUgibMcM5gEg8nMGpXDosMviRlJ
 onX8rhy5r+ZfRoVo2Gam0V50FHpmdGoXJ4JwoRo+Dxi79LVZOCRCzAfCsvQsYiYW6TSy
 Byzy16S50aoxehy2IIDqsk5Dug8va8pmC6NYp40sGtUNRGCYHfIBpOjVJ6H9BNAIVuR3
 27ylpNv8e7HYRgkG75xCJmFfKtQxrfoObiO16ZnIPcywv/satCkRoXUyR2Ic9Dr+s/kq
 X10Q==
X-Gm-Message-State: ACgBeo1VZGHk5iIZxzwt25HSAbNqfYVo0OM2AI+BGcbM6iMmdAoIeuCT
 pa58au5jXEzKLyw4F7AsqMGhTm1s8CtCO9ZIbMKQTg==
X-Google-Smtp-Source: AA6agR5oXajHQgZIAxxY2uoNmYwz2ld/j5Cv2xAyHLpSj4VpYhFfo2+KkipSZh+2zDCzP7roD8YGmqtJLNk6Is7o/mA=
X-Received: by 2002:a81:9942:0:b0:326:5dab:8915 with SMTP id
 q63-20020a819942000000b003265dab8915mr26371028ywg.10.1660134331325; Wed, 10
 Aug 2022 05:25:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220725110035.1273441-1-peter.maydell@linaro.org>
 <Yt561CDN+UjmaDK3@redhat.com>
 <CAFEAcA86gdio-3_XcNJGum8qiC93iVR0RK-g_sV1QRAhb8VGUw@mail.gmail.com>
 <CAFEAcA9k_d6hFjz=udMuRgewxYhmnm8=ARB+s_33jNhtXknobg@mail.gmail.com>
 <04bffb14-d497-2d29-9bcc-8a0fbdeffc4d@vivier.eu>
In-Reply-To: <04bffb14-d497-2d29-9bcc-8a0fbdeffc4d@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 10 Aug 2022 13:24:50 +0100
Message-ID: <CAFEAcA_p3XoKSaxxX3sznsEw3J1PLgz+5XFp-WzO-aV8-DWvOA@mail.gmail.com>
Subject: Re: [PATCH] linux-user: Don't assume 0 is not a valid host timer_t
 value
To: Laurent Vivier <laurent@vivier.eu>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel@nongnu.org, Jon Alduan <jon.alduan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, 10 Aug 2022 at 06:59, Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 09/08/2022 =C3=A0 11:51, Peter Maydell a =C3=A9crit :
> > Laurent, ping ?
>
> Sorry, I didn't see your message. I'm going to apply it if it's ok to go =
into rc3?

Not sure about rc3; I'd have been OK with it in rc2 but I think
it could probably use a bit more testing. Since it only shows up
in weird configs, probably better to leave it til 7.2 now.

thanks
-- PMM

