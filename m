Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C577154D6C1
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 03:08:42 +0200 (CEST)
Received: from localhost ([::1]:47216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1e01-0007vP-3a
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 21:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=7166425211=pdel@fb.com>)
 id 1o1dx6-0005YM-N3
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 21:05:40 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:47766
 helo=mx0a-00082601.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=7166425211=pdel@fb.com>)
 id 1o1dx4-0006AO-Q8
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 21:05:40 -0400
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.17.1.5/8.17.1.5) with ESMTP id 25FLpuO7007002
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 18:05:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=facebook; bh=jwJDSwI//Z1CpvkGU9lJh2dszDiA5iCdvux1Pc2JrwM=;
 b=W5XN0suPSvK/nlNhdy7cAtQXeW8y/0h1+TwN4K1Yg9/lficwRmYQ/HZheLPbiSKETPW5
 Z9v5Me21jqGHyZQJbNMuEFl7LqRfEJ2vHdHx6qTBqdMkItSVhSFsfuEOJ++tQnWxrCks
 IE2gWXPZ7tZxHiFvNkwxydlS7w2ZQfyfzrA= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by m0001303.ppops.net (PPS) with ESMTPS id 3gpw7r7y0s-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 18:05:35 -0700
Received: from twshared18213.14.prn3.facebook.com (2620:10d:c085:108::4) by
 mail.thefacebook.com (2620:10d:c085:21d::4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 15 Jun 2022 18:05:33 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id F03CE8092C59; Wed, 15 Jun 2022 18:05:27 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <pdel@fb.com>, <samuel.thibault@ens-lyon.org>, <jasowang@redhat.com>,
 <eblake@redhat.com>, <armbru@redhat.com>, <qemu-devel@nongnu.org>
Subject: [PATCH 0/4] slirp: Update submodule to include NC-SI features
Date: Wed, 15 Jun 2022 18:05:22 -0700
Message-ID: <20220616010526.1895564-1-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: D72sk4okDvnzBa4CzgqeFkUPk9myNj9r
X-Proofpoint-ORIG-GUID: D72sk4okDvnzBa4CzgqeFkUPk9myNj9r
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-15_17,2022-06-15_01,2022-02-23_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=7166425211=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I recently submitted some NC-SI changes ([1], [2]) to libslirp, and I'd like
to include them as netdev options in QEMU now.

I'm guessing that before we can do that though, there probably needs
to be a new libslirp release, right? Right now we're on 4.7.0, with
SlirpConfig version 4. I guess I'd like to create (or wait, either
is fine) 4.8.0, and update QEMU to use SlirpConfig version 5 if
that version is available.

By the way: do I need to add #if SLIRP_CHECK_VERSION(4,7,0) around any code
I'm adding? I'm hoping that's not the case, but I see that was necessary
with the recent timer changes.

Let me know what I should do, I am fully expecting that I'll need to either
wait for the next slirp release, submit a v2, etc. Just wanted to get the
ball rolling.

Thanks,
Peter

[1] https://gitlab.freedesktop.org/slirp/libslirp/-/merge_requests/122
[2] https://gitlab.freedesktop.org/slirp/libslirp/-/merge_requests/125



Peter Delevoryas (4):
  slirp: Update submodule to include NC-SI updates
  slirp: Update SlirpConfig version to 5
  slirp: Add mfr-id to -netdev options
  slirp: Add oob-eth-addr to -netdev options

 net/slirp.c   | 18 ++++++++++++++----
 qapi/net.json |  8 +++++++-
 slirp         |  2 +-
 3 files changed, 22 insertions(+), 6 deletions(-)

--=20
2.30.2


