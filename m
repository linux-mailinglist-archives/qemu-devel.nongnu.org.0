Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5214668DD9E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 17:10:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPQY5-0008E4-6i; Tue, 07 Feb 2023 11:10:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>)
 id 1pPQXz-0008Dl-O5; Tue, 07 Feb 2023 11:10:20 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>)
 id 1pPQXx-0003kw-MP; Tue, 07 Feb 2023 11:10:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6ae+QySS9zb9LCfiPK3fdcGJHYoFs6pn7NmHYCDqR4s=; b=d3ywGR5SjGpN5cJ6e1NhHYgism
 RE0D+5lyNBin1O9I+9TSKq2/hqoT4gSvOKDM6TnR+nCBtyWeviHvhd1HckmEbvkEwalGlVNNJ8h6j
 cmZV1SX/38mGPITMYcg8vGgnfjkxkbNwWhNUzi1Phs+YbezNFGP8T0aZK55UB+diaC28=;
Date: Tue, 7 Feb 2023 17:07:11 +0100
To: Taylor Simpson <tsimpson@quicinc.com>
Cc: Thomas Huth <thuth@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVk?=
 =?UTF-8?B?w6k=?= <philmd@linaro.org>, "Matheus Bernardino (QUIC)"
 <quic_mathbern@quicinc.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "anjo@rev.ng" <anjo@rev.ng>, Brian Cain
 <bcain@quicinc.com>, "Antonio Caggiano (QUIC)" <quic_acaggian@quicinc.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>
Subject: Re: [PATCH] Hexagon (meson.build): define min bison version
Message-ID: <20230207170711.2278b2a7@orange>
In-Reply-To: <SN4PR0201MB880806A66F0497F72D0DCC5FDEDB9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <a6763f9f7b89ea310ab86f9a2b311a05254a1acd.1675779233.git.quic_mathbern@quicinc.com>
 <53dd2acc-0eb7-5e49-e803-2625f0841880@linaro.org>
 <0c85ac6c-0787-ba6f-3e19-5dbbc1619fac@redhat.com>
 <SN4PR0201MB880806A66F0497F72D0DCC5FDEDB9@SN4PR0201MB8808.namprd02.prod.outlook.com>
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

The patch makes sense to me.

Reviewed-by: Alessandro Di Federico <ale@rev.ng>

-- 
Alessandro Di Federico
rev.ng Labs

