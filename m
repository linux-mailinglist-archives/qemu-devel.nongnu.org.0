Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 218DD2DA5C9
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 02:50:01 +0100 (CET)
Received: from localhost ([::1]:54502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kozTU-0000vq-5C
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 20:50:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kozNZ-0007dH-6m
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 20:43:54 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:45532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kozNX-0004S1-3N
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 20:43:52 -0500
Received: by mail-il1-f195.google.com with SMTP id p5so17716763ilm.12
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 17:43:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZHtlIpWN/p6nXF/ocJxAY6vgv6S0Azs84zJbIptHrdY=;
 b=ImZCEShuc+aG8TTCXViDdxj3P6WGkcPt+mrAtcwvjqh836rZ+8kxHmKQ2KDCS2OAct
 p1LJMBa1KyOPbH+yJSTodD0ZiV+U4RaDBtndkcXdPqhw7R1UsArNLgzfPpw+Dah+MApq
 CHAJw7bosJVOq28dn+Vl71tle/Mba4JiRlexEYqsSwOZbLdj1B0AZRtz6XwydHNwWc9D
 DlzABWDTDmQSaSj0BX/HAHY/HK/Hq7dPpbc66AxeXXG/6MjpfAkKsICme3g82v8eLVG3
 7PPv3mhMVsHBpbDqHhA6J2SsWY92yoyq3zWB5RA8JukZPThVuFH+/JQUJVubU3vdvy66
 QPmw==
X-Gm-Message-State: AOAM5303lY1Wn0OaT+STP89stSgZRVPbDsTUjuOLKlVCuApk21NJNva7
 bmLkrNROTmaiNT4DFMDXsjCSdIdihpc=
X-Google-Smtp-Source: ABdhPJyh25mD0c6j8uVgwR1ZAG11RR6qbMXgzGCN2jUbp0LujSUfArxzQH+FH++1njHvfRpJl9d9Tw==
X-Received: by 2002:a05:6e02:4ae:: with SMTP id
 e14mr36656492ils.132.1607996629910; 
 Mon, 14 Dec 2020 17:43:49 -0800 (PST)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com.
 [209.85.166.41])
 by smtp.gmail.com with ESMTPSA id y14sm11852237ilb.66.2020.12.14.17.43.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Dec 2020 17:43:49 -0800 (PST)
Received: by mail-io1-f41.google.com with SMTP id z136so18918178iof.3
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 17:43:49 -0800 (PST)
X-Received: by 2002:a6b:5d07:: with SMTP id r7mr36050966iob.84.1607996629682; 
 Mon, 14 Dec 2020 17:43:49 -0800 (PST)
MIME-Version: 1.0
References: <20201214140314.18544-1-richard.henderson@linaro.org>
 <20201214140314.18544-4-richard.henderson@linaro.org>
In-Reply-To: <20201214140314.18544-4-richard.henderson@linaro.org>
From: Joelle van Dyne <j@getutm.app>
Date: Mon, 14 Dec 2020 17:43:39 -0800
X-Gmail-Original-Message-ID: <CA+E+eSDvN-7ex4vAMs43BCBMq548Qzq7TQ5yh_yZLwKC84GiUw@mail.gmail.com>
Message-ID: <CA+E+eSDvN-7ex4vAMs43BCBMq548Qzq7TQ5yh_yZLwKC84GiUw@mail.gmail.com>
Subject: Re: [PATCH v4 03/43] util: Enhance flush_icache_range with separate
 data pointer
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.166.195; envelope-from=osy86dev@gmail.com;
 helo=mail-il1-f195.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 14, 2020 at 6:02 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We are shortly going to have a split rw/rx jit buffer.  Depending
> on the host, we need to flush the dcache at the rw data pointer and
> flush the icache at the rx code pointer.
>
> For now, the two passed pointers are identical, so there is no
> effective change in behaviour.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Joelle van Dyne <j@getutm.app>

