Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E3756601D
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 02:48:01 +0200 (CEST)
Received: from localhost ([::1]:56456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8WjP-0005WD-U8
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 20:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=7kjP=XK=zx2c4.com=Jason@kernel.org>)
 id 1o8Wh3-0004gh-Mz
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 20:45:37 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:60742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=7kjP=XK=zx2c4.com=Jason@kernel.org>)
 id 1o8Wgz-0005tn-PC
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 20:45:32 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8DADFB810AC;
 Tue,  5 Jul 2022 00:45:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6C69C3411E;
 Tue,  5 Jul 2022 00:45:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="FWs2ni2Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1656981917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5SCGtpaht8yQXgppNVc9fUfIVM1H/0jnnNtMTuPFkDg=;
 b=FWs2ni2Q0iKVf8WOqZStq+124DVIqCIXf+qhfZDdJdHlKfo87HS7vyrhi+E+pmlWlcRwz1
 u5+ttApcVoqrmpEjQyvfTyCKnRN23YfCjecuMhWhKyhVhbpMQJpyDxxZC9Wt8QsXXa5a1r
 HztjtpkX0ivJWQ3WsNj4lQKpYTq5DVg=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f2965954
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Tue, 5 Jul 2022 00:45:16 +0000 (UTC)
Date: Tue, 5 Jul 2022 02:45:14 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [PATCH v2] hw/arm/virt: dt: add rng-seed property
Message-ID: <YsOJmmMltjafEcP6@zx2c4.com>
References: <Yr15VHaAVQ11wlw+@zx2c4.com>
 <20220630103739.1727346-1-Jason@zx2c4.com>
 <CAFEAcA-mb2Y1MCWEOw8fgue6DsQuLXwCoCnd8DjfE2561ayiZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA-mb2Y1MCWEOw8fgue6DsQuLXwCoCnd8DjfE2561ayiZA@mail.gmail.com>
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=7kjP=XK=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Hi Peter,

On Mon, Jul 04, 2022 at 03:42:55PM +0100, Peter Maydell wrote:
> We should also add a section to docs/about/deprecated.rst
> noting that the old name is deprecated in favour of the new one.
> I'll fold that in when I add the patch to target-arm.next, to
> save you doing a respin:

Thanks for doing that. Your text looks good to me.

Jason

