Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F9B65210E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 13:53:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7c6Q-0006ND-5E; Tue, 20 Dec 2022 07:52:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1p7c6N-0006Mp-8U
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 07:52:11 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1p7c6L-0005ox-0n
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 07:52:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ibwJZo8UZjvaFqLQ/zBzABrDQArq4H4X6eReV26BD+E=; b=Z/DoeNfgv22CIxYIIZj/menOTR
 ggay0mCahMW3RI8J6OyxbXwhjfzxQ1PlxjeUB+RNideupAR9w/ffXYj0m9wfSQ6HqJ5rPWcgyQxHK
 TTQB2VYChZZejxl3jKqDB+nJ0WojdC+aYOLz4ktjc9HN72WqtJ+oPry5+59tDjDAMRp0=;
Date: Tue, 20 Dec 2022 13:49:20 +0100
To: Taylor Simpson <tsimpson@quicinc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>, "philmd@linaro.org" <philmd@linaro.org>,
 Brian Cain <bcain@quicinc.com>, "Matheus Bernardino (QUIC)"
 <quic_mathbern@quicinc.com>, "stefanha@redhat.com" <stefanha@redhat.com>
Subject: Re: [PULL 00/21] Hexagon update: bug fixes, performance, idef-parser
Message-ID: <20221220134920.31822cd8@orange>
In-Reply-To: <SN4PR0201MB880829F40FA01F4FC3526F31DEE59@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20221216204845.19290-1-tsimpson@quicinc.com>
 <CAFEAcA-drLPfX-q7HT9j-b4CZYckzzht+akxvUsZjOmiS3D47A@mail.gmail.com>
 <SN4PR0201MB880829F40FA01F4FC3526F31DEE59@SN4PR0201MB8808.namprd02.prod.outlook.com>
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

On Mon, 19 Dec 2022 18:54:22 +0000
Taylor Simpson <tsimpson@quicinc.com> wrote:

> > Applied, thanks.  
> 
> Thanks!!

Thanks from our side too! :)

We started this project back in 2015, I'm really happy we finally got
it in!

-- 
Alessandro Di Federico
rev.ng Labs

