Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9F164FE2F
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 10:36:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6q3s-0002FG-12; Sun, 18 Dec 2022 04:34:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1p6q3k-0002Ek-Ao
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 04:34:16 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1p6q3i-0005Ap-IY
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 04:34:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Reply-To:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2lGW2HtAlPqlVk3z28gkI40ekCORzkppXtFvxcUf69A=; b=OtGo7SzqiHcZMi409EQcxBgLzC
 nT1JjfC6RAVxZERMJWrVS3fvifLh6CwnuNrwk+GrJqDn8oKTxssTKT+ToWxZBOWP0Ub5BCJqzVDV3
 obe+bYAQU/xSyQ0vM1zQt1f7Ghs0cuR+khnTEkepQgkucWDyH1Q+AcTKiKEwu4UnPWQU=;
Message-ID: <fced79dd-12c2-aa97-4110-f954de8e6d3e@rev.ng>
Date: Sun, 18 Dec 2022 10:33:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PULL 00/21] Hexagon update: bug fixes, performance, idef-parser
To: Peter Maydell <peter.maydell@linaro.org>,
 Taylor Simpson <tsimpson@quicinc.com>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org, philmd@linaro.org,
 bcain@quicinc.com, quic_mathbern@quicinc.com, stefanha@redhat.com
References: <20221216204845.19290-1-tsimpson@quicinc.com>
 <CAFEAcA-U1jAteU7pt1zHTTdk1tB2mdT4rHRBp_GOqpdtqXrDGg@mail.gmail.com>
Content-Language: en-US
Organization: rev.ng
In-Reply-To: <CAFEAcA-U1jAteU7pt1zHTTdk1tB2mdT4rHRBp_GOqpdtqXrDGg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  anjo@rev.ng
X-ACL-Warn: ,  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/17/22 22:21, Peter Maydell wrote:

> Does that mean somebody needs to do something before I can merge this?
>
> thanks
> -- PMM

Hi Peter,

no one needs to do anything about the CI, it has already been taken care of.

All containers that need flex/bison have it, and the 
debian-hexagon-cross container
has already been rebuilt manually and pushed by Alex.

cheers,

-- 
Anton Johansson,
rev.ng Labs Srl.


