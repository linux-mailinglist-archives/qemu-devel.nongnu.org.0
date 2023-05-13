Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 219AD701433
	for <lists+qemu-devel@lfdr.de>; Sat, 13 May 2023 05:31:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxfyO-0006qP-Lb; Fri, 12 May 2023 23:31:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pxfyL-0006ph-Nf; Fri, 12 May 2023 23:31:05 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pxfyJ-0005HH-P8; Fri, 12 May 2023 23:31:05 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-64ab2a37812so8812992b3a.1; 
 Fri, 12 May 2023 20:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683948661; x=1686540661;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OCdBsgPRSHa2NKQSWkBBkTINcD/Zg18nngMqVhm3CDs=;
 b=QxDWInDV37L4UeZUwt4a2tOzp3USVGao+3KhhH4aMqzG7U9YUUVHzSiFF8GocA/M7a
 T6OzbKXEk0c3GESTqLln2ZAVBPxs+RJg4ftqmEVOdNyqEMkoqvNxnj2WNWt5K+A4AvWo
 V5xdN8dVskgPLdDI+OBcBJIC8py0S5qk3or5rO1wy3k69zFJO1hHBqwqmaQpQW1jAbhc
 ysGpGS3HPrckLO+911CNpO6oZBD/ROCDw9oCAwTSfC7z3XP/B7p09DiUYoDgCq9pHK4x
 wn3TgC8/6eluh2on5S9QZXq33aBCd1KmpOlEyvW8oMlIAtEphnmxPuZTvejNpVBwIn/U
 2eBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683948661; x=1686540661;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OCdBsgPRSHa2NKQSWkBBkTINcD/Zg18nngMqVhm3CDs=;
 b=bf4jm7AZbaMOWQb2mg0u1K/Fq9Fi3jimJbbwLdNGLNrFos5tLS0G2tFRx46+5b5ST8
 wyY4IxMGVdjnilK+PPw8WLIwuyFazFVqQTsH1rIFSK/v4mqzHwxGSwdS9O4bCMn841OJ
 XDcdn3+aCHsCi3I45IpW4IIZjp1WEn4OoB6E8hjQihb7zSwlC4V3hp6iI6qrW6luE/4H
 eHQv2QWC6W2AtAK48N3mFPYUN4ajdNQwoTDFX8Jf/mACqi9khBJQBkJRkSDIUTr6gdjM
 KyRSR86t2G+Q5+SbSRfxbgyb7/ZaX11mS/Qx3DgDxJUKCz2pJbeBn1HPSWNU06THog40
 NZYw==
X-Gm-Message-State: AC+VfDz0cBJNrko/4AnV4nnk9L7LgF0io+pZOC09V0/SpMlpmfuHmg4f
 fJdLtkQ/oO/fGwfdho/ROkbrD1qtr9k=
X-Google-Smtp-Source: ACHHUZ420XzGbZ/djcP6+LxU2IRmRWi82m3g/fFQNSz4wvkcHgR34BCdVCaifiqjlftdxuDzwglENQ==
X-Received: by 2002:a05:6a20:8e14:b0:101:3c60:6794 with SMTP id
 y20-20020a056a208e1400b001013c606794mr17540881pzj.2.1683948661671; 
 Fri, 12 May 2023 20:31:01 -0700 (PDT)
Received: from localhost ([1.146.114.250]) by smtp.gmail.com with ESMTPSA id
 h1-20020a654801000000b005302682a668sm7055855pgs.17.2023.05.12.20.30.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 May 2023 20:31:01 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 13 May 2023 13:30:55 +1000
Message-Id: <CSKTZ8U3VQHZ.3727FT9EHMMUU@wheely>
Cc: <qemu-devel@nongnu.org>
Subject: Re: [RFC PATCH 3/4] spapr: load and store l2 state with helper
 functions
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Harsh Prateek Bora" <harshpb@linux.ibm.com>, <qemu-ppc@nongnu.org>
X-Mailer: aerc 0.14.0
References: <20230503003954.128188-1-npiggin@gmail.com>
 <20230503003954.128188-4-npiggin@gmail.com>
 <1d0ce917-7ea0-35dd-b79f-5054ac81412b@linux.ibm.com>
In-Reply-To: <1d0ce917-7ea0-35dd-b79f-5054ac81412b@linux.ibm.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri May 5, 2023 at 9:03 PM AEST, Harsh Prateek Bora wrote:
> <correcting my email in CC>
>
> On 5/3/23 06:09, Nicholas Piggin wrote:
> > Arguably this is just shuffling around register accesses, but one nice
> > thing it does is allow the exit to save away the L2 state then switch
> > the environment to the L1 before copying L2 data back to the L1, which
> > logically flows more naturally and simplifies the error paths.
> >=20
> The supposed advantage you have mentioned is coming at the cost of=20
> double copy (env -> l2_state, switch to L1, l2_state -> hvstate/ptregs),=
=20
> but previously we were just doing a single copy that directly conveyed=20
> it to L1 before switching to L1. Additional copy means additional delay=
=20
> in transition of L1/L2. Not sure if it's worth it?

Yeah, the memcpy in the host  is the least of our performance concerns
though (and removing the CPUPPCState memcpy in the series will reduce
the total amount of copying done in entry/exit anyway).

I think clearer code is more important here.

Thanks,
Nick

