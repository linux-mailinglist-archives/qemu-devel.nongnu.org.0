Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7085F3623
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 21:08:48 +0200 (CEST)
Received: from localhost ([::1]:45922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofQo3-0007OD-1Z
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 15:08:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ofQkQ-0002l2-9O; Mon, 03 Oct 2022 15:05:02 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:33776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ofQkM-0008BY-QU; Mon, 03 Oct 2022 15:05:00 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-354c7abf786so115748297b3.0; 
 Mon, 03 Oct 2022 12:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=esBiXswA+5QoGiY+j9rDHgI1CxhwYwh/qhah7CMJWWU=;
 b=UPa6VAXIHYLpBVle+g04jSZoeiOz0GlYd0ynBSe3r0cgSs5PVlMcM9P4awHOaS5Y0+
 a7QqUwUerwR3xcoa0mc8Pzl72GPSxgrTYlsUzMXttwmJ9uxfUk/HAkHUJXYmbIC5DulE
 jTLWwrUI65jpteq4GEJA+aXKCCQB+ghpGbYRMNM63tGZSy41PXl6RwvovPyf9ad0dGAS
 DXS5/Z8G9TdYtQUF0yxyem6nSXBI6Go8r01QLSj14ux0OrWjQAJYtKHiHQt79SaLs1zO
 8hMPXynRMSo/QhPGVfTult4iJoN9zH1U89MzylBPRZ+2qHlwI3sXgZ/oPPGbn1KP+nhW
 XCiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=esBiXswA+5QoGiY+j9rDHgI1CxhwYwh/qhah7CMJWWU=;
 b=pdPAmk/zyqRfbWXbrP/GqUOC/WLKN3/vyG7Zmak6qW4UAobbb5Q7e2OURwPW/YPyKk
 lkRUaYWVFUhVxC1cunFZ0PgIUpyD4QgwMqOtQaSuEbdkDrROn3d3vqyjfya2zAbWIuca
 0nJ+YYNvWnNkJO5SqraMe3HifmTj/efS2jRYQR83uBQfGuL03A7TRaY9s3133yKcwpJ/
 R/Rks8Ia+4JK7fumZZTC9GW/og2XebdxMfJNvbfPqq+FTk4vycBpEN3v3CaXXk83U2kF
 wGJc3vhaSpqf8Zc/WdNOYGHUL9dXQJZnNUg48Ms/wDg4O/meo4fQ0dNX+gcbcSaAtinX
 JdXA==
X-Gm-Message-State: ACrzQf1gjjq+yEPIncUxpk+DUd6IqlyBdqj7pwVZjYUnLBneZRurDDJw
 s40lwrxVeqLep1N7h1ZI8KrGh02xlWcCJ6+vDqtBFwq/b7U=
X-Google-Smtp-Source: AMsMyM4YfWsdnuXTLYanE4EsSynbdOCdBb9Hp2vB7kEg/i09J8BxsveEzyDP76FmbKa8nLv+pHl0I/7IWoR/Ock5Iu0=
X-Received: by 2002:a81:14cc:0:b0:356:4ab:7b08 with SMTP id
 195-20020a8114cc000000b0035604ab7b08mr16666123ywu.62.1664823897048; Mon, 03
 Oct 2022 12:04:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220930202144.1109310-1-laurent@vivier.eu>
In-Reply-To: <20220930202144.1109310-1-laurent@vivier.eu>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 3 Oct 2022 15:04:45 -0400
Message-ID: <CAJSP0QWbDj42NmV=Yk3DMt7_Skt4k7x+jsJpetWdnr=bbYW2oA@mail.gmail.com>
Subject: Re: [PULL 0/8] Trivial branch for 7.2 patches
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1136.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Sept 2022 at 16:22, Laurent Vivier <laurent@vivier.eu> wrote:
> Philippe Mathieu-Daud=C3=A9 via (1):
>   block/qcow2-bitmap: Add missing cast to silent GCC error

Hi Laurent,
This commit uses a mailing list email, probably due to DKIM/SPF issues:
Author: Philippe Mathieu-Daud=C3=A9 via <qemu-devel@nongnu.org>

I think the policy is to reject such pull requests and fix the
authorship. Could you update your pull request and resend?

Thanks!

Stefan

