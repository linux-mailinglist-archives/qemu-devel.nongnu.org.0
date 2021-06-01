Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F5E39797A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 19:49:01 +0200 (CEST)
Received: from localhost ([::1]:36354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo8Vg-00084V-AV
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 13:49:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras.c@gmail.com>)
 id 1lo8Um-0007Es-Su
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 13:48:04 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:33589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leobras.c@gmail.com>)
 id 1lo8Ul-0006mM-Iw
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 13:48:04 -0400
Received: by mail-qt1-x82c.google.com with SMTP id a15so10788317qta.0
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 10:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=7ZJ2QqzmHIc4Xjk20d2YEfcWSCtizwEIc7b9EhLS0o4=;
 b=lnubHr2pYINX8lm5A5W704Ox+cW+D/ceRuZA5gUYROdh750JGIYnFZCCpUVqolT9cp
 Lh9xusCLt3tmC3jsGuoe8fK5e1Dg4Z21BF9BV2EXll4bRFFc77vvsiMjykPgG8U9uxKy
 vNSoHwbLtOVEjeZBh3udzOF3Q3zZiRvm4fjqHS2yeSz7nlq4FwxytqrEDH3K2gHR2UQU
 iU1uJL/sqY842WsyN79+cvFjU2tHdctev+GZND6RIKK2A3M3Qviiai9ZsXiS7pWsKwQ0
 52b0rQxHYNfxe1U2SOrIuyV4Re7d+3vVIZxdkkjZrinRbdHv6gInkRlC533HKNFQFfPG
 L2MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=7ZJ2QqzmHIc4Xjk20d2YEfcWSCtizwEIc7b9EhLS0o4=;
 b=hfNX0aYZzQTFBXIl9jePLiMhu9jGsuhfgZ10kFqMMPkarB4Hv/3tG5vm1pbOeR8tqP
 q84jWfOIX+7KmcU7vrRiRwBx9PDBUtwaFMJ1RO7lJIi+ewBAVtHPrC50tpsN097hr6dP
 32F2GBeHbnjjBTxo26NI+AitiJxyuYmHtUd+2pHXHKYwC72TtZprwa7rQve8WVfR9Mys
 tJVlc1MmU7Nu8SP0XQXS+Nzr2Sq9NIfshdBeoutPVSGl1v4eKaiS2PniCEKkK0QMFfEE
 LnOR5D74uZs+5k8vJaahqYEAW3FcBXsQsZlAoWJI5UkVtFcgzC8M/ZnCtHjiMJ4yuK5u
 iH2A==
X-Gm-Message-State: AOAM5322PsbVfGVvKesfGLmAK1Kjk1fjtch/5qFwAnwtjcsgm7JVIqyE
 6RJ9IvDdk7rNLsGUZ0S04/4=
X-Google-Smtp-Source: ABdhPJxrhXpQL52Zi1iGL0S76jZI/vfvAxG/z5tVyskMT5Nf9hpES9bbiFLiLZY7QgzXwGVrkksIjg==
X-Received: by 2002:ac8:450c:: with SMTP id q12mr20521566qtn.327.1622569682560; 
 Tue, 01 Jun 2021 10:48:02 -0700 (PDT)
Received: from [192.168.1.106] ([177.193.53.28])
 by smtp.gmail.com with ESMTPSA id l4sm10857092qkp.48.2021.06.01.10.47.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 10:48:02 -0700 (PDT)
Message-ID: <c4b88341782669d4f7fd185ea25f317e952ade04.camel@gmail.com>
Subject: Re: [PATCH v3 1/1] yank: Unregister function when using TLS migration
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
To: Lukas Straub <lukasstraub2@web.de>
Date: Tue, 01 Jun 2021 14:48:23 -0300
In-Reply-To: <20210601130013.7bde3a8f@gecko.fritz.box>
References: <20210601054030.1153249-1-leobras.c@gmail.com>
 <20210601130013.7bde3a8f@gecko.fritz.box>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=leobras.c@gmail.com; helo=mail-qt1-x82c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: qemu-devel@nongnu.org, berrange@redhat.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2021-06-01 at 13:00 +0200, Lukas Straub wrote:
> [...]
> Looks good to me,
> Reviewed-by: Lukas Straub <lukasstraub2@web.de>
> 

Thanks!


