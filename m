Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2472D702548
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 08:49:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyS0K-0007NC-6d; Mon, 15 May 2023 02:48:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1pyS0D-0007N2-Rn
 for qemu-devel@nongnu.org; Mon, 15 May 2023 02:48:13 -0400
Received: from pv50p00im-ztbu10021601.me.com ([17.58.6.57])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1pyS0A-0005yO-9t
 for qemu-devel@nongnu.org; Mon, 15 May 2023 02:48:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1684133283; bh=I0iqNvkDgxXG/4g3LDKW0wDuvDMcin962Kxjpn4BSCQ=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=F0k+nkzu1WbNl6hyD5vVSjQAUNwkYvDKrVowzp6ZtZWEoLneFx4j06rUnt/k+80li
 9lUrA7I6zV1q/Oql7yF1bKT2SRVlyuLjRIGuaufTTcYTgGk2ygGDuY5wdO7r4fpvxj
 lZM7ydjCe1uKTrvVJMHZbiJx17KRfTV+E15RY9PFwmQU0t11cqgxpqZCkUwWamQV1r
 0lRZ3qU2HYOg70418b+koBZ4T0tSatsVFrEOSrNa2Ko13R3max3evkC0ze32ISMVZb
 sS0V27OKlg1ipM2E06Zk1gTzMN2TnFMY2tA4T7BEHouHAtIJOPDuH6MZv8CbbDUwB3
 SjJoX/ATJTWqA==
Received: from smtpclient.apple (pv50p00im-dlb-asmtp-mailmevip.me.com
 [17.56.9.10])
 by pv50p00im-ztbu10021601.me.com (Postfix) with ESMTPSA id 074388038A;
 Mon, 15 May 2023 06:48:01 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [PATCH v2 04/12] simpletrace: update code for Python 3.11
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <20230509143849.GG1008478@fedora>
Date: Mon, 15 May 2023 08:47:49 +0200
Cc: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Content-Transfer-Encoding: 7bit
Message-Id: <5C9DE1B6-5C37-4974-AE74-EB47E841A6DA@ynddal.dk>
References: <20230502092339.27341-1-mads@ynddal.dk>
 <20230502092339.27341-5-mads@ynddal.dk> <20230509143849.GG1008478@fedora>
To: Stefan Hajnoczi <stefanha@redhat.com>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
X-Proofpoint-GUID: 5xNIHmlJFZgnnwKpRm5Koea0pb61q6fU
X-Proofpoint-ORIG-GUID: 5xNIHmlJFZgnnwKpRm5Koea0pb61q6fU
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.517,18.0.883,17.11.64.514.0000000_definitions?=
 =?UTF-8?Q?=3D2022-06-21=5F08:2022-06-21=5F01,2022-06-21=5F08,2022-02-23?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 clxscore=1030
 mlxscore=0 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0
 mlxlogscore=699 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2305150060
Received-SPF: pass client-ip=17.58.6.57; envelope-from=mads@ynddal.dk;
 helo=pv50p00im-ztbu10021601.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


> On 9 May 2023, at 16.38, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> 
> On Tue, May 02, 2023 at 11:23:31AM +0200, Mads Ynddal wrote:
>> From: Mads Ynddal <m.ynddal@samsung.com>
>> 
>> The call to `getargspec` was deprecated and in Python 3.11 it has been
>> removed in favor of `getfullargspec`.
> 
> Please add that getfullargspec() is available in Python 3.6, the minimum
> Python version required by QEMU.
> 
> That makes it clear that its safe to merge this patch.
> 
> Otherwise:
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

I'll get this added.

