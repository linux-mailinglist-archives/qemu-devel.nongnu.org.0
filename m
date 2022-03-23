Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B32994E4A89
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 02:36:31 +0100 (CET)
Received: from localhost ([::1]:60382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWpvK-0007Xj-RO
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 21:36:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lw945lw945@yahoo.com>)
 id 1nWptw-0006rD-4n
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 21:35:04 -0400
Received: from sonic313-21.consmr.mail.gq1.yahoo.com ([98.137.65.84]:43098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lw945lw945@yahoo.com>)
 id 1nWptt-0004gH-TH
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 21:35:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1647999299; bh=mOfnDFamxuhFbtFp6OuYLuX9M5qMYrWLHeWd2dW/g1U=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=lj497/taPuaUi6zq+Z6hDUy/Lu5w63fzYL7uDMj18SYNO7nwwhSswTy6yamCNYa+EgufFUlf+GgL37Hug8lEcLV9khAtwgNcadaMKPI+vpuyWEF25SblnbpBrbtQ7KeN016GIfweZ76U+phsscApFHDpdmTlpFKqSIfokS/tS3/84A76NaeyzZs5pxhHLvE378/MujXPA/QSfohvR/S1z8Pe/vLIsNdGEK/PnfDhKV4aQcIkG1TqvrvajlHgFs49sjjzPvEFwsOBbZbnOc5oC2kAxQnUegV/7dAp4ot9FiErYk0iM1wZ/5HHLRV7ScDu+iEMEn1hCzV/hGIqc5poTQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1647999299; bh=sqNhj8GD0z5Tref1m8eAdWM+ctpP3OIYeJDDKVvwllA=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=lDIWHtgw+ixXzKxAUf1utY/YEeh3lPih4wt1oQd7048XSpZgJLGrLn4YrLxr0vzajGDbDaIDL90W8/p1Xq/rJMH6axCbRBfMrGz4Qk4qB5HpyJaAaV/3kgRBeu4E4DDYhWaJzau6mukxjLULvhu38A148B0b0XR3I+JqI6T4Gy6XUsaALm82DELseAKMWPWw+65h1vrSVGr8cQatMWqGVSpbmqr1yt2IcniiFsV8HvFgCovNB6M4+JmW5xAXswinz1C+u2qT9VALc6s6a1qxaDmlc4/5FqZTlLJEQ22+m/6bZ3v9KiLSqn5pGonc5LZOKfnqxuDyCUBWkD0y5fXUNA==
X-YMail-OSG: 9RLs3BoVM1ncoW6aCDgEWChpyHLl_CvKq1_HjbhbYAtw.hu.CQgxliX_u7uoajn
 H9iozYCzCy9TPcJGKfaJvwqL395fi93K_PlMxTBXil_9R5nFZ6q49PMMj2Y9euPxhipJlZ9MBT3M
 t0aIx.ISzmncYJr6TdbFwOpRjCitOSyE_s9nus9_LEPt5pNayQO0E7CA4BUhJLEKwwfliXOPg6ix
 iRtvPDp3De3KYM6i2ItBO1rc4SNowq1B9LXrUxa29t5M8bjrudwL5g5jhsgBzADq_4xyYwDxYLUG
 XbJRgcOW_nGkOLJVm9m0Vuju7Nj49AFkQNSsXppp_5MrOGdlEIAGS2RsP7xEMrZvOJil7wK5axvG
 XHVhr8aFxZCBAeswuCciug.XGE.RRouIfTDsPH87Z4f7eT7b8WyM5Q.ryFLHZbHVp7zQK_0yIohq
 LX3QmgnZflJey9jPpkZnGtFrNreIn.Q_bf3QgLEtginfdfdLo_iRWhMUG21SrTYOut.Nc9dFdpBU
 P_qnIkcMDCN9HfP3_TphK2M8KzOPrmq5Sn.WJ8fYOA07jJym6lCfQbl6uWqju1K2BFhvDJe7kmUN
 6YUQgHcjueqspHkA2e3UN0526htawIC4qWEm0UXOQq.pPOF79WmL0.eecAfb0KzqXyrW47nSKPoH
 NX2u7bmSLwrF2iyghqPM9lSkeVWsAPrHqlfbq8ae1ALiI6GDXknSpKUH2WdOBuLdiDnEMdGvePlB
 FtVgKGE8VEztE3HJe1UJmrAIQ0HFJcdoTrdIaq3NmJN48USGD0mzTzpXSvuo3FqmwXGvuoZWY1c1
 2ND0Z3v9XAlwnDvIZbY2fWp5DJWcCA7lfHX6m5IK18ZGZWbMF6bJowCvKp6V1OhH_U1K.o4suOVO
 wpyt0XV1IVmqAnRdHhTffHvGolyPS3tLrBizMKwD3phPA34zCU8xPYmNkUq_4vW5fTWpWy4aTnYl
 1jbArG6W4iD8ud9lFCROsEYkXJrN.w09xYvMED9Tgg0oGdA2lJ0u3.8L7_J5zzP88pLUmgSmknlU
 GB2iEc9l2ejzxg_GC2.BUtNV14FDpGvdGzz9EucIHLlZut0sufTvFuNwuBsT5hAfurVTZN5emEOd
 LJnQ3KpzQJ7i0B.yV.sSoajOXOmJpjQWlLyUJ_eQ894gSS23JLkIEDYB.2IW8jH3QoAQX7wOrX84
 HYCIdHJSgSrrfFynVI6fQA8ZqSOQoKHjnAy2FGsIz_vxDAcPPo4CgX2VYo1iA97AlCU.iY9otLNd
 MyVfM0LX.alAS429dvXfYrDY9S3t._FWeTN00tZUd2UBRjl1JQhsVN4Ol.dARwj.CdezdxGIuqhM
 .f3h5RnNRpdzofPvHOgD7Y2J47p6593LkqfS8kP6.MVjL0wogMrAy0tCx6WQbuK7.6JNkceb7pjG
 NhffRD7VmjG92pEVWmeZS0iGS2xzcWooJFXwB7_fDEbJ9oB97v_t36RiKAv9yUa5BX18dDg198.P
 XWGvTRmfoYDolsR.SqUAGYcf.r.KcPjCCKoXxIRLeHvJAzHS8CTIEtMjapSGvdkH5QAFCnFuyBgQ
 .XaE4MkqpBc0Vt7WDRkGS1vAbuH8eDgbbUka7JEVNhsPEubWeYyrO6CLf5MwIWd3cZqzDZDZ63zY
 TgO7RMqoLcCllPtrODCsgZGnv6kh72fcXEGJXX9.ivA6Ez2r891BytUzJiy6GuL0M20d4S9bQets
 1BmbcbBfJvmGLfQNkzcQaGUR0vSHBTiV2JzFU.FDjWAl6jbCIYmegIQR1UELUP7HTJGOJLqwj8CQ
 vbTiV7jbwP9a35iLYwQ66mK32JAWfIj7wsSc.Y97frYgv_65BkjDVoMP2ZmRvVp4ayM_3BNe6Xwm
 vuzRAqrQWW1IFgPC3L58Sh9AbOrfpN1vtDQ7b17ifALbUjD1AQb.Zrk.CAKqI.Dfzab4.kJIwiiz
 wPc1RUoNKcWe9Qh3B1SQ899cojwLu7REp.0REk_cmokSBMI3GUu1PU2RzgFgyFgDk6s2tEMi9mCB
 CeCw2Ejo289P35o7jkulgcxYdQLpMksH9Gac6C5lrYJIFrLiNVkfa6NCR5aLMRxfqmsoZB.OhQ23
 YLHslGfN_hMOJVWWEjj34um85gPnZ4ejCz.kHM_zMAxr6Hpa3O51e.SnoGgBk5EO3VHyPXK7f67T
 LlCEL0rTCUzJhqV4pQYRCFcPMsv7QAE._qk2_9IY4j2tif0gHvLl_1gPyB1d5YXlCL3gQ1O5cSr4
 YH_beN0GYUYVZuLb2dPWmz3QQOs8IT_abEZ1ytFx_plTTy.Mbr_7cnFFOUh9r.pzjBzCvKX4PYnR
 KU.LHxw1mzD9EPn5BoGpaZ5ACfKUdostN72pi3_5i_mfzTFutewEjGmFivxAjooz3pTCzfS3rrWW
 WdQ--
X-Sonic-MF: <lw945lw945@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic313.consmr.mail.gq1.yahoo.com with HTTP; Wed, 23 Mar 2022 01:34:59 +0000
Received: by kubenode520.mail-prod1.omega.ne1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID ac04c3ae462fd6146ce4d7cc19a3e7ae; 
 Wed, 23 Mar 2022 01:34:53 +0000 (UTC)
From: Wei Li <lw945lw945@yahoo.com>
To: pbonzini@redhat.com,
	richard.henderson@linaro.org,
	eduardo@habkost.net
Cc: qemu-devel@nongnu.org
Subject: [PATCH v4 0/1] cmpxchg and lock cmpxchg should not touch accumulator
Date: Wed, 23 Mar 2022 09:34:16 +0800
Message-Id: <20220323013417.409858-1-lw945lw945@yahoo.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20220323013417.409858-1-lw945lw945.ref@yahoo.com>
Received-SPF: pass client-ip=98.137.65.84; envelope-from=lw945lw945@yahoo.com;
 helo=sonic313-21.consmr.mail.gq1.yahoo.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series fix a bug reported on issues 508.
The problem is cmpxchg and lock cmpxchg would touch accumulator when
the accumulator is equal to the TEMP.

Changes from v3
* Give a consolidated description of the problem fixed.

v3 link:
https://lists.gnu.org/archive/html/qemu-devel/2022-03/msg05584.html

Changes from v2
* Give a better code struture to reduce more code duplication.

v2 link:
https://lists.gnu.org/archive/html/qemu-devel/2022-03/msg05410.html

Changes from v1
* cmpxchg uses the lock cmpxchg path whenever mod != 3 to reduce code
  duplication.
* lock cmpxchg uses movcond to replace branch.
* Combine the two patches into one patch because cmpxchg uses the lock
  cmpxchg path.

v1 link:
https://lists.gnu.org/archive/html/qemu-devel/2022-03/msg05023.html

Wei Li (1):
  fix cmpxchg and lock cmpxchg instruction

 target/i386/tcg/translate.c | 41 +++++++++++++++++--------------------
 1 file changed, 19 insertions(+), 22 deletions(-)

-- 
2.30.2


