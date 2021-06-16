Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 126C53A9CBE
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 15:54:37 +0200 (CEST)
Received: from localhost ([::1]:60924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltW04-0004u4-4d
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 09:54:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1ltVzB-0003Vd-Cc
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 09:53:41 -0400
Received: from pv34p98im-ztdg02172101.me.com ([17.143.234.142]:34101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1ltVz9-0000Zu-P6
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 09:53:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1623851617; bh=vPJPRFWDtQ0KyUdfk+1fU6co7DQD9IF/pfFNzudFuhE=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=CZqWe/y34LnYlD19gnD/Tm4mYWFgHnJoTQSUcDzckr5AQ73EwELG7eyZYtQdCN7rp
 ae/8uJIfJJC/2eaV5CJezYLqX0IZfRmYp0bOjQxo5+wpY+8Nd5PCRlG9JEKtX5y/v+
 SL30ZE8CDk6FLp08cnBJYV0mziC1fK16tEofiRL8kXlacq7KY7NO8T2IUCSm8yV4Po
 k4kJP+3AnJRr7A0mkbekA9hvd2QAZJkWbUZerXH21D1AzybXMLfZhDBs50XlEqZu2U
 zgkJf6GqaHN4qzENChO3DW/r3mxlTYLnWjt3m3EHEaspvk6WDzspJ4DqPEGGy4UEjW
 9E0z+MGmOsTbA==
Received: from smtpclient.apple (unknown [17.234.85.167])
 by pv34p98im-ztdg02172101.me.com (Postfix) with ESMTPSA id AC49054000B;
 Wed, 16 Jun 2021 13:53:36 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3679.0.2\))
Subject: Re: [PATCH 3/4] alpha: Provide a PCI-ISA bridge device node for guest
 OS's that expect it
From: Jason Thorpe <thorpej@me.com>
In-Reply-To: <8DF0550D-3F5C-45E3-A246-D51A527B93DC@me.com>
Date: Wed, 16 Jun 2021 06:53:35 -0700
Cc: qemu-devel@nongnu.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <B552BE81-9A14-40A3-834B-BA9A8A1A1D7C@me.com>
References: <20210613211549.18094-1-thorpej@me.com>
 <20210613211549.18094-4-thorpej@me.com>
 <8346c497-f432-0d75-bc60-0fcceed3420f@linaro.org>
 <8DF0550D-3F5C-45E3-A246-D51A527B93DC@me.com>
To: Richard Henderson <richard.henderson@linaro.org>
X-Mailer: Apple Mail (2.3679.0.2)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-16_07:2021-06-15,
 2021-06-16 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2009150000 definitions=main-2106160081
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


> On Jun 14, 2021, at 9:24 PM, Jason Thorpe <thorpej@me.com> wrote:

>> Why can't we just use the existing device model?
>> Certainly duplicating code like this isn't the best way.
>=20
> Yah, I=E2=80=99m not super happy with that, either, tbh.  When I first =
started working on this several months ago, I it looked like it would be =
invasive to wire it up in the way the Alpha platform expects, but I =
can=E2=80=99t remember exactly what the issue was.
>=20
> Anyways, I=E2=80=99ll look at it again.  Stay tuned.

I spent some time on this last night and figured out the bit I was =
missing before, and just booted NetBSD in the emulator using the =
existing SIO model.  Since you=E2=80=99ve already queued up the others, =
I=E2=80=99ll post a v2 of just that patch in a few minutes (hopefully =
with the correct block comment styling this time :-).

-- thorpej


