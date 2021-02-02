Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B98B930BF22
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 14:18:52 +0100 (CET)
Received: from localhost ([::1]:42900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6vZz-0002OB-Sa
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 08:18:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l6vLd-0001UO-S7; Tue, 02 Feb 2021 08:04:01 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:62572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l6vLb-0007hc-64; Tue, 02 Feb 2021 08:04:01 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 94D5D7462D6;
 Tue,  2 Feb 2021 14:03:54 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 67B227462BD; Tue,  2 Feb 2021 14:03:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 65A9B7456B7;
 Tue,  2 Feb 2021 14:03:54 +0100 (CET)
Date: Tue, 2 Feb 2021 14:03:54 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PULL 10/11] trace: document how to specify multiple --trace
 patterns
In-Reply-To: <87v9babq13.fsf@dusky.pond.sub.org>
Message-ID: <c2e476b5-10c0-3cf7-4c3b-f39ee98a67b3@eik.bme.hu>
References: <20210201154703.180022-1-stefanha@redhat.com>
 <20210201154703.180022-11-stefanha@redhat.com>
 <d5e9b59a-f7df-5a7b-55bb-cc6066b18a70@eik.bme.hu>
 <20210201161352.GH13157@merkur.fritz.box>
 <cbab5846-b5d-d256-89d7-b2bf9f7c69f@eik.bme.hu>
 <20210201165445.GI13157@merkur.fritz.box>
 <32b015e1-f182-8557-72d1-6827e4f0a09b@redhat.com>
 <81fbad73-b911-cfb6-dc9f-142ccaee678f@eik.bme.hu>
 <87v9babq13.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2 Feb 2021, Markus Armbruster wrote:
> And now I'm ready to answer your question:
>
>    -trace enable=pattern1,enable=pattern2
>
> is a confusing way to say
>
>    -trace enable=pattern2
>
> To specify both patterns, use
>
>    -trace enable=pattern1 -trace enable=pattern2
>
> Lovely, isn't it?

OK, interesting. The conclusion is then that the doc change in this patch 
_is_ the simplest way to enable multiple traces as only repeating the 
-trace option works and enable= is optional in this case. Thank you for 
the detailed explanation.

Regards,
BALATON Zoltan

