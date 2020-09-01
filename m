Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0492590E8
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 16:41:33 +0200 (CEST)
Received: from localhost ([::1]:43048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kD7TY-0003iJ-JP
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 10:41:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1kD33H-0001er-Ou
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 05:58:07 -0400
Received: from rev.ng ([5.9.113.41]:39863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1kD33F-0004FF-H2
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 05:58:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ExNJzxf5kdXyYvMc7E4jW1CbiPLvZaN1L6WMRVZKYD8=; b=nuy7aOvtWLRdyREe8idXNPStV5
 pioZpjWLSn4RUEQ7xQRXVjnrjq5ynw/Hoywdzr0JBqVmp2hrmDz2dwpwlCh+uKS0Vdt5ntMkvb9fQ
 RoMduJCMu9P4rbqrALtZ4iJQ6f8Hv/djMTVEUMyOJalKhxdGaWowBoWqOMaN90EF+C0g=;
Date: Tue, 1 Sep 2020 11:57:50 +0200
From: Alessandro Di Federico <ale@rev.ng>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v3 33/34] Hexagon (tests/tcg/hexagon) TCG tests
Message-ID: <20200901115750.05c25ba9@orange>
In-Reply-To: <b7ec9b4c-2a2e-2030-4075-45cf8920c41c@linaro.org>
References: <1597765847-16637-1-git-send-email-tsimpson@quicinc.com>
 <1597765847-16637-34-git-send-email-tsimpson@quicinc.com>
 <b7ec9b4c-2a2e-2030-4075-45cf8920c41c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=ale@rev.ng; helo=rev.ng
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 05:57:57
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 01 Sep 2020 10:27:00 -0400
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
Cc: philmd@redhat.com, riku.voipio@iki.fi, laurent@vivier.eu,
 Taylor Simpson <tsimpson@quicinc.com>,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>,
 aleksandar.m.mail@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 28 Aug 2020 20:05:44 -0700
Richard Henderson <richard.henderson@linaro.org> wrote:

> Could you please work with Alex Bennee to set up a
> tests/docker/dockerfile/ script containing the cross-compiler from
> the Qualcomm SDK?  That way these tests can be run automatically.
> 
> Compare debian-xtensa-cross.docker, which is similar.

We already have something similar, but it didn't make it in this
patchset. We put an effort in putting together a fully open source
toolchain.

It takes a while to build, but we'll provide a pre-built image on
dockerhub.
Eventually, upstream LLVM and musl will be in sync and it will be no
longer necessary to build it by hand.

-- 
Alessandro Di Federico
rev.ng

P.S. Richard: thanks a lot for the thorough reviews.

