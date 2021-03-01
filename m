Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5E4327F7E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 14:31:46 +0100 (CET)
Received: from localhost ([::1]:41092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGieH-0003p0-5B
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 08:31:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lGiYP-0007gu-QY
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 08:25:43 -0500
Received: from rev.ng ([5.9.113.41]:52253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lGiYN-0005Mk-Hw
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 08:25:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HG8mn7cuSl4oq3lhbdoDzsddBo/zVzb28uJB29RCbiM=; b=wekRiUHgbFe21xCBUURpkwQ6iL
 IRQ3vBSNe+ryLqNupOWhRhKXYqZOBLsbpcGuAbhy23meF7aovE6ccV/CZOr3l6+m5m06dBTtgdBhA
 IFqe8QLLFPJeV5RptRARqWzrGYyQ1xkgsypdBJNR+ZlqqbP28pH69zrDFwnMPueR0Dyw=;
Date: Mon, 1 Mar 2021 14:25:17 +0100
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>, Taylor Simpson
 <tsimpson@quicinc.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@redhat.com>, Alex =?UTF-8?B?QmVubsOpZQ==?=
 <alex.bennee@linaro.org>, Alessandro Di Federico <ale.qemu@rev.ng>, Brian
 Cain <bcain@quicinc.com>
Subject: Re: [PATCH 0/4] hexagon: Add Docker image & testing to gitlab-ci
Message-ID: <20210301142517.7820b922@orange>
In-Reply-To: <20210228222314.304787-1-f4bug@amsat.org>
References: <20210228222314.304787-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=5.9.113.41; envelope-from=ale@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Alessandro Di Federico <ale@rev.ng>
From:  Alessandro Di Federico via <qemu-devel@nongnu.org>

On Sun, 28 Feb 2021 23:23:10 +0100
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> This series is a rework of the 'Add Dockerfile for hexagon' patch
> from Alessandro/Brian that Taylor sent in v8:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg780330.html
> but adapted to mainstream.

All of this looks good to me.

Sadly, we've been doing internally exactly the same thing and were close
to push it upstream. We'll be more explicit on what we're doing.

Anyway, thanks for taking care of this!

--=20
Alessandro Di Federico
rev.ng

