Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DC962AFC1
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 00:55:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ov5kR-00082w-Fp; Tue, 15 Nov 2022 18:53:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ov5kQ-00082i-3i
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 18:53:46 -0500
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ov5kN-0004ob-Qy
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 18:53:45 -0500
Received: by mail-yb1-xb33.google.com with SMTP id 63so19115574ybq.4
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 15:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FqNu60TNqVZ8dYacoboqNB7d9RWXhd9iGMx79rcAXIg=;
 b=FfYG1baGWVzLUH3eb2uiAHZbpOvN20D2xB18LPKfqV4uto1rtKvhw4tCt2W2VQMqj3
 5elqU3/yAqYOorqHMgnB/2pQ7PzJcUiN0AKLA62US8f6+yBTHNBwUweVK0jY6B5K2PwX
 IELyaH0+tv+cyFjjWaXe8pRhosFG5c3uP7fhvs0WAoEl8KBfVqfbBVtNyaGTkLExaqSN
 AlQf/NKBMcnNS4Uf7XsF9IXG4ZvDb6HmJ7pOvAJpIe4x/uTU8M3eop3QjZV1RU/h8JtX
 EWFT8OM7ynzCnnQfXlYIPxPAv5i0jYh1A3iNrTVX58wM3iODSxFfK4vYggBmpa4QcCCf
 cS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FqNu60TNqVZ8dYacoboqNB7d9RWXhd9iGMx79rcAXIg=;
 b=y5dh/Psv0UKAhpMad+LGNSN5Q8Ti6m4MZc2t3fdMvPqIF9WbLwaTYWP9pusbwBXJWx
 oNtUr1qESnJRUs1ix0j7rv6COrAqkaTJwmXy0wKNeujmTmpZwB8FF+w3SkZu9NME7SZo
 wO/ILGaJc2u+7yNIVT1BGMCZjX2M8VTDbDRMyzbK8QzowTk3DZX+prWBJ9NFQCV0P2dx
 NAL+fNHpm7HZJezzTbws84HnXxL9n+KHoJkBG4RRlVQiodyzA3p4HMdmkCTj4PuMoKaC
 h/+ukCeQGnP4mh0BuvVbB1YA6dHfrYaCOzGOv3Bfzb2IJZp6xwFBxhyAuHUqPvGfLE6R
 3FhA==
X-Gm-Message-State: ANoB5pleyGgd9gP+y4Oa+COgGqyryqO67r8iHMCt4ryCjxF9TFdEmLuI
 eXME+3bil1MLv1jPqQV0eJxfJ/RYEr9sfhjnFQY=
X-Google-Smtp-Source: AA0mqf5zAon1IepdY4P1jToulRX6C3cA7JWfWAypPYwwLXhAZHk43hSsCU8+G1g7rnnU3QH1OeWgAKfnWrKUYI7+FL8=
X-Received: by 2002:a25:698a:0:b0:6e4:f81:707b with SMTP id
 e132-20020a25698a000000b006e40f81707bmr4808139ybc.366.1668556422269; Tue, 15
 Nov 2022 15:53:42 -0800 (PST)
MIME-Version: 1.0
References: <20221115133439.2348929-1-alex.bennee@linaro.org>
In-Reply-To: <20221115133439.2348929-1-alex.bennee@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 15 Nov 2022 18:53:30 -0500
Message-ID: <CAJSP0QVigz1nDq7JO2ABquzReGWkqY5dwXKrEaufw+FXnvsvkg@mail.gmail.com>
Subject: Re: [PULL for 7.2 00/10] testing and doc updates
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This pull request causes the following CI failure:

https://gitlab.com/qemu-project/qemu/-/jobs/3328449477

I haven't figured out the root cause of the failure. Maybe the pull
request just exposes a latent failure. Please take a look and we can
try again for -rc2.

Thanks,
Stefan

