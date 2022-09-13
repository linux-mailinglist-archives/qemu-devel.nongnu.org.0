Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABF15B796A
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 20:28:07 +0200 (CEST)
Received: from localhost ([::1]:48442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYAdh-0004Ro-UV
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 14:28:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1oYAXj-0004iG-So
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 14:21:57 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:42660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1oYAXh-0007Ok-IA
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 14:21:55 -0400
Received: by mail-pg1-x530.google.com with SMTP id q63so12083752pga.9
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 11:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=ayjT9dw78q88OYNN96jAT9vn58OKA52hOvroyDlXUQQ=;
 b=G3KD3NXsw7RZpqeqo70EH5CEIulsA9IlIQXoeO+Cbl7t1IcInDrhR6mjPZnvZO0i2J
 s6aRTIc02cQmIuhiKhV5Nf3iok0w8J2TKUtQ33PaTUDTU/tbzBNlMib76xDEcuI/7K8N
 B/r5UjuugbVDFeAYJRlpkAFD5G9qeapip+1r4Bfn1oSQTXWmfvnduFEhI5l/phcCxOav
 LYXxcor7JQGX0jX6IAOQ3KZ11NMOZ1biLxInXV2O+Y+Z60xbgpmQW594Djf8X8wJZsoK
 u0E8u37AYoLleS9z6WMb3CvB6FGrsH7fN0hdeNHKaWU+n28X7OJsFlta05dpMhmlq1PR
 zVcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=ayjT9dw78q88OYNN96jAT9vn58OKA52hOvroyDlXUQQ=;
 b=Fc5NK6gX9si1dJ/9i0sGf5q/Q82FtSrRRuoW/Iht31fpmyhvS5AHjPggwbfRpftj1H
 WKWs0EK+WKzo++ZCBjf3GHToUMULUc0ZlIRAkC2U281tgApp3geg1JHp+D7cQsz1Bu7p
 /17coxC5Yrt1D/BoU0WNkWd/x5Qyho3bCoSurg+PBeTaUdhuYpJqEBdkZ65cwQTURDhB
 Y/1NHDXjS1lqmMgS4QltCHj1D17V0qUFw6/vnyef/RALY5gV55AbgkMCZJuQZqtz9jAX
 9QcDOUDAcji0fV6mP+C3it4x+4b/Zhr1xy+gjXa1dEHJgIhq6dXSI9DTSCLliovTMU0s
 wvDw==
X-Gm-Message-State: ACgBeo39znV6iaiaW3uy65coHpkewe2EroyN+p6e9NfpnTOCoBsdD+cG
 y/RWgmzHm1u2jDNZH2SNfigKCC4e2dELr8ZbweT/EA==
X-Google-Smtp-Source: AA6agR51U2yaBNtcuH150q3KMPXSwxNahdxwZzoPNmCjM8YoZoODmT7agbfIeJYNe8ie8Yguz23c/MWcuPdbynYuCb0=
X-Received: by 2002:a63:7f0c:0:b0:434:5711:7cb6 with SMTP id
 a12-20020a637f0c000000b0043457117cb6mr29114128pgd.8.1663093312058; Tue, 13
 Sep 2022 11:21:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220906220552.1243998-1-titusr@google.com>
 <20220906220552.1243998-2-titusr@google.com>
 <Yxua+pZUn5lSSekN@pdel-fedora-MJ0HJWH9>
In-Reply-To: <Yxua+pZUn5lSSekN@pdel-fedora-MJ0HJWH9>
From: Titus Rwantare <titusr@google.com>
Date: Tue, 13 Sep 2022 11:21:16 -0700
Message-ID: <CAMvPwGprWzOn+YgpOrTTJT67C4JLBewbknbmPn-E5pzFUmTKNw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] hw/peci: add initial support for PECI
To: Peter Delevoryas <peter@pjd.dev>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, patrick@stwcx.xyz, 
 iwona.winiarska@intel.com, tmaimon77@gmail.com, quic_jaehyoo@quicinc.com, 
 Hao Wu <wuhaotsh@google.com>, Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=titusr@google.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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

On Fri, 9 Sept 2022 at 12:58, Peter Delevoryas <peter@pjd.dev> wrote:

> > +/*
> > + * PECI Client device
> > + * Copyright 2021 Google LLC
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
>
> Not sure, but I think the SPDX license identifier is supposed to be in
> the first line? Maybe not though. I would have expected:
>

That's a Linux thing as far as I can tell. QEMU has it in the top comment.

>
> I'm curious if we really need the CPU family here, or if we could just
> base everything off the PECI version.
>
> The PECI specification doesn't mention the CPU family, does it? Or maybe
> it does.
>

I needed the family info anyway for RdPkgConfig() CPU ID, and thought it
would be more readable to specify that in the board file than the PECI version.
We tend to add new machines to QEMU by copying the config of an existing
machine, I think this way makes it more obvious that this is a field
that is changing.


Titus

