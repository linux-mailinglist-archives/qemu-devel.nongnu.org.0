Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C54265C3A1
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 17:12:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCjtV-0005sW-69; Tue, 03 Jan 2023 11:12:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1pCjtP-0005s0-Uv
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 11:12:00 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1pCjtN-0008Uk-NJ
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 11:11:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4SFNX5uuRS5FmewEVzBo6cpE8IUY6ZrNEIxOMqe8Gt0=; b=BQQvgPUko5gUqWlA+Cb1BUpEUn
 j9wJdCvvUo3dLFgpgQuv/BfGueBP1b/aFgReb4Pn18xB+53UpD0Yuhl5wGKO6DqgWiCekHe2vE8ja
 a784ehj+aldVPyYu+p5G7XOJkadoh6OPR3Yfk52x9bC5ekWYhPUg8iKhGXKPEAG8VsLY=;
Date: Tue, 3 Jan 2023 17:11:49 +0100
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, Taylor Simpson
 <tsimpson@quicinc.com>, Anton Johansson <anjo@rev.ng>, philmd@linaro.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] Update scripts/meson-buildoptions.sh
Message-ID: <20230103171149.3bcf0526@orange>
In-Reply-To: <CAJSP0QUd9Q25pT3OXst4V-1FKLo65jJnn-6-7d_O5hkPeJfPyw@mail.gmail.com>
References: <20230102104113.3438895-1-ale@rev.ng>
 <CAJSP0QVbvgr6wHY9e6f7UgZ-vum5vGUNH+h0Lf93BpdEcFJf0A@mail.gmail.com>
 <20230103162603.74f631aa@orange>
 <CAJSP0QUd9Q25pT3OXst4V-1FKLo65jJnn-6-7d_O5hkPeJfPyw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=ale@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Reply-to:  Alessandro Di Federico <ale@rev.ng>
From:  Alessandro Di Federico via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 3 Jan 2023 10:51:36 -0500
Stefan Hajnoczi <stefanha@gmail.com> wrote:

> QEMU's Makefile used to a use a technique where it generated
> "timestamp" files and used cmp(1) to check if rebuilding was
> necessary:
> 1. Always generate meson-buildoptions.sh-timestamp.

`meson-buildoptions.sh-timestamp` would be the full expected output,
right? It's not just a date or something.
AFAIU that would make sure that if nothing changed in the output you
don't trigger other targets depending on `meson-buildoptions.sh`. It's
a solution for a different problem.

The problem with always rebuilding `meson-buildoptions.sh` is that we
spend 1 extra second on every build, even those that doesn't need to
rebuild anything else.
Not unacceptable, but I think we should strive not to commit generated
files and move the file to the build directory, unless there's a reason
why this is not viable that I'm not seeing.

-- 
Alessandro Di Federico
rev.ng Labs

