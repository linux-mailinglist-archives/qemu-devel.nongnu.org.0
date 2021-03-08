Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AA2330864
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 07:46:53 +0100 (CET)
Received: from localhost ([::1]:34468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJ9fI-0002ER-97
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 01:46:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1lJ9bO-000188-GY
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 01:42:50 -0500
Received: from mail-il1-f180.google.com ([209.85.166.180]:34999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1lJ9bN-0005du-4s
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 01:42:50 -0500
Received: by mail-il1-f180.google.com with SMTP id h18so7908299ils.2
 for <qemu-devel@nongnu.org>; Sun, 07 Mar 2021 22:42:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jIYR8iOwdgRB4BdvEppXOOBALFpL9ArrsNR9y6RNiFk=;
 b=pM+dePPMbNmgGiVNd92HzK5A+M04UqunrLovS5UCe6lHXWV4n+SxzIATWnvuLApwYJ
 F7RLdw63s2u86MAz9wrRtErHsBEzXpW/bSWSEWjS43G0pKGpZLs+8rFLzo77rIfZrxKM
 SRpkVEhyFB2Foz0GGKqQh51aNICMB193dvzD/yTCKL3C5CXA5Lc59Cy+anwJ8dMKBqGH
 wxn9JTcvaX/QHNwhjiyJ2LhP3raK40TSCQPT6h54jib9uc3OVjfrX0dLrIITcHXwmJ3R
 56eZCAlPhA/FF1ySNWcV8dtczhkDgKKLaOg6PzS4QR9anyYw7wb/KauGb2e9hmz8Fl1t
 KoUA==
X-Gm-Message-State: AOAM53083St81rT/6FufRwjGcMAgpSLcG2TKv6lUyk9v7cUIytsvE6dl
 9XdwxPnBQej9+K4tROgoXSJf07oz7bg=
X-Google-Smtp-Source: ABdhPJxZ2IIqE7DpxRNNGaNJN3QplTY7G6yK346ii2m4X87JQn6/ekqPwoICLmLqVjzYAqnhppN3wQ==
X-Received: by 2002:a05:6e02:d53:: with SMTP id
 h19mr19351223ilj.157.1615185768177; 
 Sun, 07 Mar 2021 22:42:48 -0800 (PST)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com.
 [209.85.166.52])
 by smtp.gmail.com with ESMTPSA id f11sm4452566ilr.5.2021.03.07.22.42.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Mar 2021 22:42:48 -0800 (PST)
Received: by mail-io1-f52.google.com with SMTP id n132so8842462iod.0
 for <qemu-devel@nongnu.org>; Sun, 07 Mar 2021 22:42:47 -0800 (PST)
X-Received: by 2002:a5d:8416:: with SMTP id i22mr16860404ion.32.1615185767808; 
 Sun, 07 Mar 2021 22:42:47 -0800 (PST)
MIME-Version: 1.0
References: <20210125073427.3970606-1-marcandre.lureau@redhat.com>
 <20210125073427.3970606-3-marcandre.lureau@redhat.com>
In-Reply-To: <20210125073427.3970606-3-marcandre.lureau@redhat.com>
From: Joelle van Dyne <j@getutm.app>
Date: Sun, 7 Mar 2021 22:42:37 -0800
X-Gmail-Original-Message-ID: <CA+E+eSAhvK7F+QM9Cx19todBewQZe+9mup3duFsqoN1Px7Hz2Q@mail.gmail.com>
Message-ID: <CA+E+eSAhvK7F+QM9Cx19todBewQZe+9mup3duFsqoN1Px7Hz2Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] build-sys: make libslirp a meson subproject
To: marcandre.lureau@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.166.180; envelope-from=osy86dev@gmail.com;
 helo=mail-il1-f180.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Joelle van Dyne <j@getutm.app>, QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jan 24, 2021 at 11:34 PM <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Remove the manual build.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Tested-by: Joelle van Dyne <j@getutm.app>

