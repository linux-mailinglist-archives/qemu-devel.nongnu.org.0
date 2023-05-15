Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3449E70256A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 08:53:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyS4S-0008RI-2g; Mon, 15 May 2023 02:52:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1pyS4P-0008Pc-Jq
 for qemu-devel@nongnu.org; Mon, 15 May 2023 02:52:33 -0400
Received: from pv50p00im-tydg10011801.me.com ([17.58.6.52])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1pyS4O-0006Y0-2n
 for qemu-devel@nongnu.org; Mon, 15 May 2023 02:52:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1684133548; bh=2pUsLdnzV/nrYVHfcQRA0LWNux6a0mtOR49RSCkzBzI=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=QlTKeUp2E8FLfJda7oui48uN+nGe5eXb1/+A+aNXOSOV5CmVWE5ykrOAo6MjMVg8n
 WNIlazKZ2Ie2Hmk8UmnlbAIfOJE7KCiihSP7RIaRWtLGzW2crz2LtjtMSkeWbvr4GA
 N4GAoeyeB3UcfR9uI7WTc/4dL+aqv9UbfUZF7KosgItU45B3BFGkSfHKTRrWbHXbhW
 8M3xB7sw2yVTqXEFfi9uNGLV6QnTt7Hko58L0bd4u4krcQAjNR3RyPy6lolsEJhoEh
 2Aimp7WCrprAiWcu1Vp/8FCsjc9vFwdaWeklSDHCLgz6hbB+Yq0oQPvueM//MN5WHl
 bDn+WhU4tuGbA==
Received: from smtpclient.apple (pv50p00im-dlb-asmtp-mailmevip.me.com
 [17.56.9.10])
 by pv50p00im-tydg10011801.me.com (Postfix) with ESMTPSA id 26C42800796;
 Mon, 15 May 2023 06:52:26 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [PATCH v2 02/12] simpletrace: Annotate magic constants from QEMU
 code
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <20230509143454.GE1008478@fedora>
Date: Mon, 15 May 2023 08:51:55 +0200
Cc: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Content-Transfer-Encoding: 7bit
Message-Id: <AEB2BC52-A085-4D37-AAE0-033556C3964F@ynddal.dk>
References: <20230502092339.27341-1-mads@ynddal.dk>
 <20230502092339.27341-3-mads@ynddal.dk> <20230509143454.GE1008478@fedora>
To: Stefan Hajnoczi <stefanha@redhat.com>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
X-Proofpoint-GUID: 4hxrcEb7SRf4YIbzElzbg3fZ01yPGOGh
X-Proofpoint-ORIG-GUID: 4hxrcEb7SRf4YIbzElzbg3fZ01yPGOGh
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.517,18.0.883,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-06-21=5F08:2022-06-21=5F01,2022-06-21=5F08,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 mlxscore=0
 adultscore=0 suspectscore=0 clxscore=1030 malwarescore=0 mlxlogscore=713
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2305150061
Received-SPF: pass client-ip=17.58.6.52; envelope-from=mads@ynddal.dk;
 helo=pv50p00im-tydg10011801.me.com
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

> 
> From my reply to v1 of this patch series:
> 
> This is fragile since this information will be outdated if the C source
> code changes (e.g. renaming files or variables).
> 
> Instead I would add the following comment:
> 
>  # This is the binary format that the QEMU "simple" trace backend
>  # emits. There is no specification documentation because the format is
>  # not guaranteed to be stable. Trace files must be parsed with the
>  # same trace-events-all file and the same simpletrace.py file that
>  # QEMU was built with.
> 
> I hope that clarifies the scope of the binary format and someone wishing
> to look into the format would then know to look at the "simple" trace
> backend.
> 
> Stefan


I must have missed that. I'll add this too.

