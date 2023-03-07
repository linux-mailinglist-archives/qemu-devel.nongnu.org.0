Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D356AD54D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 04:06:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZNeZ-0002XM-My; Mon, 06 Mar 2023 22:06:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenbaozi@phytium.com.cn>)
 id 1pZNeW-0002X3-W4; Mon, 06 Mar 2023 22:06:13 -0500
Received: from azure-sdnproxy.icoremail.net ([20.231.56.155])
 by eggs.gnu.org with smtp (Exim 4.90_1)
 (envelope-from <chenbaozi@phytium.com.cn>)
 id 1pZNeU-0007BU-QI; Mon, 06 Mar 2023 22:06:12 -0500
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-6 (Coremail) with SMTP id AQAAfwD3aZuaqgZkhq82AQ--.49641S2;
 Tue, 07 Mar 2023 11:08:10 +0800 (CST)
Received: from smtpclient.apple (unknown [218.76.62.144])
 by mail (Coremail) with SMTP id AQAAfwD3xP4ZqgZkiCsAAA--.1153S3;
 Tue, 07 Mar 2023 11:06:01 +0800 (CST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [PATCH v3] target/arm: Add Neoverse-N1 registers
From: Chen Baozi <chenbaozi@phytium.com.cn>
In-Reply-To: <86b4c656-330a-fefe-5f8a-93ad01804ed9@linaro.org>
Date: Tue, 7 Mar 2023 11:05:50 +0800
Cc: qemu-devel@nongnu.org, Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <17742378-9532-4575-AE83-49FB725A5395@phytium.com.cn>
References: <20230307021442.3915728-1-chenbaozi@phytium.com.cn>
 <d867ae79-0347-3f72-2dcc-e176ab809842@linaro.org>
 <86b4c656-330a-fefe-5f8a-93ad01804ed9@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
X-CM-TRANSID: AQAAfwD3xP4ZqgZkiCsAAA--.1153S3
X-CM-SenderInfo: hfkh0updr2xqxsk13x1xpou0fpof0/1tbiAQALEWQGMh8C8QAAsn
Authentication-Results: hzbj-icmmx-6; spf=neutral smtp.mail=chenbaozi@
 phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvdXoWrtry3Jr1xZFyfZr48XFW8Zwb_yoWktFbEga
 y8CF97Jr1vgF1xWasxAFW3Z345WrW5ArW5tF1Yq34fZryjqay5Gwn5ArZ3Jrn2qayxury7
 GrZFvFWfG342qjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrnU
 Uv73VFW2AGmfu7jjvjm3AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUU
 UUUU=
Received-SPF: pass client-ip=20.231.56.155;
 envelope-from=chenbaozi@phytium.com.cn; helo=azure-sdnproxy.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Richard,

> On Mar 7, 2023, at 10:33, Richard Henderson =
<richard.henderson@linaro.org> wrote:
>=20
> On 3/6/23 18:29, Richard Henderson wrote:
>> On 3/6/23 18:14, Chen Baozi wrote:
>>> Add implementation defined registers for neoverse-n1 which
>>> would be accessed by TF-A. Since there is no DSU in Qemu,
>>> CPUCFR_EL1.SCU bit is set to 1 to avoid DSU registers definition.
>>>=20
>>> Signed-off-by: Chen Baozi <chenbaozi@phytium.com.cn>
>>> Tested-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
>>> ---
>>>   target/arm/cpu64.c     |  2 ++
>>>   target/arm/cpu_tcg.c   | 66 =
++++++++++++++++++++++++++++++++++++++++++
>>>   target/arm/internals.h |  2 ++
>>>   3 files changed, 70 insertions(+)
>> You really need to base on upstream master, as these files have =
moved.
>=20
> I beg your pardon, my mistake.  Only half of the patch set which moves =
these files was applied.  I had to do my own rebase around file movement =
today, but these three are not yet affected.

Never mind. I was aware of that. Waiting for them to be applied and then =
rework.
>=20
> But do be aware that there is a potential conflict out there.
>=20
> My comments re the placement of the array still apply.

Ack.

Cheers,

Baozi.=


