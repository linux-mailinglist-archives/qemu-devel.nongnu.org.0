Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B253F3710
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 00:55:23 +0200 (CEST)
Received: from localhost ([::1]:45614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHDQ2-0002uw-Pf
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 18:55:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oxr463@gmx.us>) id 1mH8rS-0004W6-Qp
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 14:03:22 -0400
Received: from mout.gmx.net ([212.227.17.22]:46877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oxr463@gmx.us>) id 1mH8rQ-0000ld-W6
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 14:03:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1629482597;
 bh=HqjbGs34H0msbTYRkaJC1tWIpUQBgtqbowfjt2DwWYY=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=E4YzO4n23z86ka7u+I0GhaLgVjzsg99qL3xpo9tIqNq3Z+wEBQj/hdVpO0iMs0KoT
 YzbP60M4ygvTXtV+X6Qu0g7/fkH05c6apqhEj48MRG8J2W9Af7ahvIm0DQSaIyZUth
 r24cKef08WqdKfa45a9ltaorZXHpLSkG2iWNHXa8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [127.0.0.1] ([65.35.46.164]) by mail.gmx.net (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MRTRN-1mSuYL3I8r-00NR8C for
 <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 20:03:17 +0200
Date: Fri, 20 Aug 2021 18:03:14 +0000
From: Lucas Ramage <oxr463@gmx.us>
To: qemu-devel@nongnu.org
Subject: =?US-ASCII?Q?New_contribution=3A_Plain_text_files_in_?=
 =?US-ASCII?Q?docs/_should_be_converted_to_rst=28=23527=29?=
Message-ID: <E788A6D3-B3BF-4D82-A574-881C75955B8C@gmx.us>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:t6vUBxoiIGWE9EWl4JIu/DEahfEhN1OubKUCnzQzw5HHTw8AgMR
 UtpLswhby8pybqR9IecgUYp94KsWFVSkzddku5jhTgNEjZ4tspuYsm9EM1MEwM7KulNc0Tq
 o05IPRudxF2nGqlPMaTy5iB78Gx/aDbGxRnlGKuI3zgsh9Qsaavmh+bPzG2Gkeo7K+Tk6IR
 /BrDxqaAzEE2I648gFmyQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:msncZJNnAIA=:BS2yjIfv1GOAiiTg70yMHI
 X8Fon2DeqPqO1rsVYCZ+cR/F9zk1AraPGivc4f+7zLI3vOogC4dyQvXHWJSKUWH5b2JRLx9c1
 GnxVmuG1upicot73980qvXm21UI9YHaKqppHFBXe1OeNiDHIPJxxXX6b70/TK5DexV8OVgjTw
 cRenLcxe2bJc3Q/OrZC3C77rLYtx3v+SM9C9fhx2n/Y65SVy7C2IZMY7fnH+r7RqCf2YlSCIp
 i+IM/HEoiethosTwHhtlBhSaJ07C5iiXunXE3rsv9LcuRGAkNKaWMKWXqu8uLsuSLwvFrMDA1
 0dotcPEYgnVkLp8GnHAZ5zxmoCDePd/cctMKyse9EF0aJrRFFdAQtujkWu0pSrOiFJ3Kb1F+p
 e57FtnJPhtgVxcDyJD3zhboPTSsvHvlKjgDcAEHTsTEeqkdLocXYLozGDCmDTgaM56v3YxrTL
 eKxs4v0woUREg9IPGKE9KMrobE+ywh7xPfqzrdgkrDSYhAhTCXjRIWO2Z67HT9s8J2nYn89+d
 O5ZeD4mNg20KCPz4+oom/6Y3tPlE6JgfYQob8qEZ2DUDRnpuYvSmE3Mxo0iOt7cBibpDQLWPf
 8rWN5dwyXN0OpLyRVFw5eo1DkiWCCWNBJpz7W+NYdvI7+F1MxtbQKHQ5GnfOrkc9mOxRV3LdT
 Hpau02VKZQsXT4rYsjGQ6yj/ja7fveY3oZovzrBw/dgMqlpQa73tZq7/s3SrFelO35Nc4ZH7C
 O4Ub5RMs5eGXP8YnkAKuT+jx/UqZdmuxVnYZG/Lp5Pl7yje1dkxUuYQfjsPkvrnVGjxGAKp5G
 SvfZeQ9Lfy3eN6hx7bT6OzRiSa23tYFIRIK6mY7BqL/dRl/4rk6GQoXSf4d+APyzxYf1K8cUt
 PZid7U8cFvWN+GytHtCi5hLby0N2hOv4ccsTht5Ax5m7yH5KaPN5I4PgFNDJcvmsfOVaxKAqY
 pTcn6LSbAsZGFkHzuYEOpWITp89uxvyQLsMDdux0wJWFXItUYPSDgp3mLfSdcQRMVnmMjEaWj
 rK1KoNpTGES0CR+PhbvW24T3pSwanvVEkMSPJ68Rewgev5LXv8VeJfRBH9kJl1b152K9JYQjj
 h6NXWyhwg12q0weiBRas30CWFdYjkDlG9qc
Received-SPF: pass client-ip=212.227.17.22; envelope-from=oxr463@gmx.us;
 helo=mout.gmx.net
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 20 Aug 2021 18:53:32 -0400
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

Greetings,

I would like to work on https://gitlab=2Ecom/qemu-project/qemu/-/issues/52=
7=2E

Here is my GitLab account: lucas=2Eramage

I also left a comment on the issue=2E

Regards,

