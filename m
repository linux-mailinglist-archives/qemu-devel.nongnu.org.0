Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 676843A72FA
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 02:30:45 +0200 (CEST)
Received: from localhost ([::1]:55304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lswya-0006BB-8n
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 20:30:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1lswxI-0005W4-JO
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 20:29:24 -0400
Received: from pv34p98im-ztdg02162201.me.com ([17.143.234.141]:56198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1lswxH-0001sg-2G
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 20:29:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1623716957; bh=Y8UV54RaFsAC5ablyHvPbA0W1cklEf3v3nIkyCAQl2U=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=a/IEtRoY9O1vkV3Zu2Xe9j/kvTfYIjKb079Jt5oVrl13UbGdEAp5Iq211c1UcqIO5
 6LHCjk/VGog+HUrgwEPckBeIeNXp4NH8rZrZGD9IbesY4f2XcUKszoxbbajNPcYOKr
 jqy51f3LviSn+nVfo+AhsXXes2Cgsscr/8POBaJkaC98eUMPr/XgPqn3l9lXZts6fv
 +Lgl50kziuRTEIXvOOr1RKegQSP+0ChDALd3p/FTFD9JBl1Evw8FOIx6sikEeGS+I8
 DDeQpPb0u+TeEMksvJPqgtspq+BrxApt9l6861RgofP9aWIts6cSWrtwJkvBeS6Eu2
 TbiYvDIjugiKg==
Received: from smtpclient.apple (unknown [17.234.47.223])
 by pv34p98im-ztdg02162201.me.com (Postfix) with ESMTPSA id 08A711C00CA;
 Tue, 15 Jun 2021 00:29:16 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: Re: [PATCH v2 0/1] PALcode fixes for guest OS console initialization
From: Jason Thorpe <thorpej@me.com>
In-Reply-To: <20210613210934.21143-1-thorpej@me.com>
Date: Mon, 14 Jun 2021 17:29:15 -0700
Cc: richard.henderson@linaro.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <0431974F-C568-4617-962E-7EA66E048595@me.com>
References: <20210613210934.21143-1-thorpej@me.com>
To: qemu-devel@nongnu.org
X-Mailer: Apple Mail (2.3654.80.0.2.43)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-14_14:2021-06-14,
 2021-06-14 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=861 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2009150000 definitions=main-2106150001
Received-SPF: pass client-ip=17.143.234.141; envelope-from=thorpej@me.com;
 helo=pv34p98im-ztdg02162201.me.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



> On Jun 13, 2021, at 2:09 PM, Jason Thorpe <thorpej@me.com> wrote:
>=20
> but there is still some research going on about how
> real DEC SRM initializes a particular field in various circumstances;
> this is my best guess based on available documentation and observed
> behavior of real machines, and is sufficient for the BSD operating =
systems.

FWIW, I have since confirmed my hypothesis about how genuine DEC SRM =
fills in the "type" and "term_type" fields on 2 different generations of =
PCI-based Alpha systems (i.e. it matches the patch submitted here).

-- thorpej


