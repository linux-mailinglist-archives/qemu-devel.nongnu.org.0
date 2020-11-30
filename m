Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D0C2C8CC9
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 19:29:53 +0100 (CET)
Received: from localhost ([::1]:60294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjnvs-0002i1-LG
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 13:29:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkml@metux.net>) id 1kjntF-0008Ve-Ne
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 13:27:09 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:59175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkml@metux.net>) id 1kjntD-0002L2-LC
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 13:27:09 -0500
Received: from [192.168.1.155] ([95.115.99.253]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Mdevh-1kAT4T13pZ-00Zfjk for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020
 19:27:04 +0100
Subject: Re: [PATCH] python 3.5 compatibility
To: qemu-devel@nongnu.org
References: <20201127183619.8958-1-info@metux.net>
 <CAFEAcA_KQ3q-=AG=b77WDbtrBRXCUKDoMkn9en12Bz48B-GjgQ@mail.gmail.com>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <b04a421d-9844-70b7-9c5e-3a302ca94da9@metux.net>
Date: Mon, 30 Nov 2020 19:27:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_KQ3q-=AG=b77WDbtrBRXCUKDoMkn9en12Bz48B-GjgQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:0PPrJ8dA3ty/ErCIh0t3iAh51ynVcYB0pNacJxQKOXhHGT3Xd85
 o597jaHcRvX4rmL01jdSge14DvrzV1UDwtrvEWQe+RKBv3DOcY9+o8eBHURIaajkRWzT1y5
 y/Ym8v1wtLzcJsx+WvalFa3gq6VySvGQeA1DoCuG8mjoRxkUFyZ1Iugywp3fqeB6A8TjiT/
 3MQg6wv/biTMvXYSMQxYw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WvFW5a68Hsw=:Ci1y7YorTGO02oEiv+Wutt
 nNPKf+KFgatx9NMnRIdc6ngVEOTrQbt15G/1WF9LnAQxQZFkv3wm2gxU9UJG8Vs9cd7+X1qs3
 BGoj/54Bry99Qtaz7MMAbMSzfuKc45zFHn5aux5/Hz2h5Kyp17dca2Ur8KYLNy023nrtVxsDg
 PQ+WpGRO7tYjm1emKZRhFc2CWd2aRtL42pIcdPpZPRnMNCWD9edDHZhgIaDU3XTgnRFiEQkHJ
 53HYdYjECIHNJphE6ZexZa13189vOe/2gbP2AbEnO/DA25mcovuKs8P+L32XvS8Idun+/ak0p
 RGMmqs8wVsSQ6Cjv7yDRAstt6/BmKB3pHCdNJdqi6E9D+00XaNJT9iYksqmiw9G1q37qHRZVG
 0sLS/AcXpl25lIbOSD6VFtt3GEj+lVmYU+X8JlrGwyxarvxQyPduLi3TcDGoR
Received-SPF: none client-ip=212.227.126.131; envelope-from=lkml@metux.net;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On 27.11.20 20:15, Peter Maydell wrote:

Hi,

> Could you say which "stable distros" you have in mind, and whether
> they are covered by our "supported build platforms" policy
> https://www.qemu.org/docs/master/system/build-platforms.html  ?

I'm running on Devuan Ascii.

And packaging python-3.6 just for a few pieces of one application (qemu)
is far too much work.

--mtx

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287

