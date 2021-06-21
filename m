Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FE93AF658
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 21:43:51 +0200 (CEST)
Received: from localhost ([::1]:36850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvPpm-0002xR-VY
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 15:43:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1lvPm6-0004hl-Sw
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 15:40:02 -0400
Received: from pv34p98im-ztdg02172101.me.com ([17.143.234.142]:43082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1lvPm5-00018O-7I
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 15:40:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1624304395; bh=akmnEj95ssKZP60UmoY06/mH91qUtXOASbhLMd245vk=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=npLaINLYCzpM5BKCbl/EGOHIrLWmjiLEpB8fmVU4aY2LzAeKIB+bAdKEiWroo+bfO
 5QT9++2SmM4on9t2lfJlHxa27aabbC59zO7sruwNQqGdAfmyQ+07bQqCAZf6/Wcnpp
 O7kmCkfa9chcEAC6Hm6gk5d7W/VDmVHAPHjkGkMPHt2ZvlbBWVXkTQ0QvvV5AWwNQh
 LI/C3SZMif3vcfhDH0f9yeXGSNzAzQAiH5oLU0nIbjfwrhRrEALZU5bkumzduinEFQ
 I6iDQvYgI2rm+Ns8tGRzUPvTWVkL5uf+W+qAZ6xBx278RtuecDN/uDJMOGtRvmxTGF
 HvD3ztjdWMdYg==
Received: from smtpclient.apple (unknown [17.234.100.245])
 by pv34p98im-ztdg02172101.me.com (Postfix) with ESMTPSA id C529F54020F;
 Mon, 21 Jun 2021 19:39:54 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: Re: [PATCH] target/alpha: Honor the FEN bit
From: Jason Thorpe <thorpej@me.com>
In-Reply-To: <20210621171021.1819881-1-richard.henderson@linaro.org>
Date: Mon, 21 Jun 2021 12:39:53 -0700
Cc: qemu-devel@nongnu.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <FADC07C4-E3B2-4DDB-A32A-CEC011C34972@me.com>
References: <20210621171021.1819881-1-richard.henderson@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-21_11:2021-06-21,
 2021-06-21 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=865 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2009150000 definitions=main-2106210115
Received-SPF: pass client-ip=17.143.234.142; envelope-from=thorpej@me.com;
 helo=pv34p98im-ztdg02172101.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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


> On Jun 21, 2021, at 10:10 AM, Richard Henderson =
<richard.henderson@linaro.org> wrote:
>=20
> This bit is used by NetBSD for lazy fpu migration.
>=20
> Reported-by: Jason Thorpe <thorpej@me.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/438
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Applied patch locally and verified that it resolves the issue.

Tested-by: Jason Thorpe <thorpej@me.com>

-- thorpej


