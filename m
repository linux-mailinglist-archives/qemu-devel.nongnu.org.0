Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E326B3130
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 23:42:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paOwj-0002Zl-Fe; Thu, 09 Mar 2023 17:41:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1paOwh-0002ZC-5T
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 17:41:11 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1paOwd-0003mm-Rz
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 17:41:10 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5530E5C019A;
 Thu,  9 Mar 2023 17:41:06 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 09 Mar 2023 17:41:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :content-transfer-encoding:content-type:content-type:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1678401666; x=1678488066; bh=zs
 gf/Mob0CcNqTyKreMrpZmvNoxfdtqo4ThMj9AyQrU=; b=G+qcWFQNQG77Z6pcMC
 4YYGLDGmuPmuDc77IQKIJN7u0HdB5awNYQv5lNHFnoRTMuSZbxLSeoFUj+GviN0c
 aAfIatcnr1dkSiE0W2pWfCQOhOmNpU8i9o0kEaYKtuh/xGfkHB82xdVetKcaOdAF
 To3Z8MQS2yCXrKnxfhFlgAebnlxTtVd/KEAh7QId2K8abI96et93hisNQteX2EhD
 NuvDm+VVha090AELvBhOaLOm2XSTeIb9GkUsHy0fqvrHqaqcQjaGdA6tpfoWesbc
 UHJppd1fhWVhEcW/XV2t2IuOLphB7QjvkdYCdtET1OtcoV2Nzo1iWwYn+Adj+yWa
 n4cA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1678401666; x=1678488066; bh=zsgf/Mob0CcNq
 TyKreMrpZmvNoxfdtqo4ThMj9AyQrU=; b=r7XOQja9t6oCzFZWZ8i2F+hAPSgeO
 9o4UZ6drYdpvEH7Mw4KlU+TjFvLafqcJ4oAcZs5cFCl2hwUgM6GML9ZXqa8obK48
 tOoA4FRPSvoroMmIcAGoyWWRsP8B6ZEIACHXrZKDSrihQjxQBlMOms2323H/VPx7
 tYXBuLwY9MA0xqLkOgPIE2/5i+Mvf8gbWfc446YB5TmJ8OyEQpzqfcFMP/qfvRrp
 WqCU4dzpMUEH0eLNu0Unm6jeWH+iQTUCYKPfsNsAzWo9cKy0j9a7UmBOwNLYt8g4
 n1I8avxS3zw+xMLbGKeLFPemoicCOk6mYT31AUMQze/7LSdTbtWXT7k0Q==
X-ME-Sender: <xms:gmAKZOcEjNWaxfqDHH2CMIB0honBU9MZVxCcUBqERKVEY47L0v44mA>
 <xme:gmAKZIO879dMrdTpr4ZeZ6tGbFkp_sBBEgKRZX_LAwYWLvP6LbsU4xHG3zq-UzL1G
 Igm8H7jDXS_BFc8tg>
X-ME-Received: <xmr:gmAKZPhNla6DJrNk-4RBo5L5jQiJZwb6ALCLvCewsc1XwhQbP9VXyG6N6Vidc76f0eDJRt15PAY6E0GzgGO-e2eOC100KQCT0Q5BDI3ZRm7Q7Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddujecutefuodetggdotefrodftvfcurf
 hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecufghrlhcuvffnffculdejtddmnecujfgurhephffvufffkf
 fogggtgfesthekredtredtjeenucfhrhhomhepffgrnhhivghlucgiuhcuoegugihusegu
 gihuuhhurdighiiiqeenucggtffrrghtthgvrhhnpefhteevudeihfegkedtudfgleehve
 evhfevgeeltdehudejueetleekffeliedugfenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpegugihusegugihuuhhurdighiii
X-ME-Proxy: <xmx:gmAKZL9uIq-taf4z5eL0sxJzwkQmaS4EEJSMQqWHgne1tOiu2IyYqQ>
 <xmx:gmAKZKuFgHdZMo2VF02eeI-i_mwo7u6eXVw0OINn0ITQd9G0bmgeSg>
 <xmx:gmAKZCEoW15osGqqdtmmgUkETEBtoH-x_j6JFeD9MvUkU8EC4FWziw>
 <xmx:gmAKZPXyKrSyyVP9HDgd20AGKorCgjL7nBfBe2jkNBbsSpWW5WOH5g>
Feedback-ID: i6a694271:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Mar 2023 17:41:05 -0500 (EST)
From: Daniel Xu <dxu@dxuuu.xyz>
To: qemu-devel@nongnu.org,
	marcandre.lureau@gmail.com,
	berrange@redhat.com
Subject: [PATCH v5 0/3] qga: Support merging output streams in guest-exec
Date: Thu,  9 Mar 2023 15:40:55 -0700
Message-Id: <cover.1678401400.git.dxu@dxuuu.xyz>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.25; envelope-from=dxu@dxuuu.xyz;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Currently, the captured output (via `capture-output`) is segregated into
separate GuestExecStatus fields (`out-data` and `err-data`). This means
that downstream consumers have no way to reassemble the captured data
back into the original stream.

This is relevant for chatty and semi-interactive (ie. read only) CLI
tools.  Such tools may deliberately interleave stdout and stderr for
visual effect. If segregated, the output becomes harder to visually
understand.

This patchset adds support for merging stderr and stdout output streams
via a backwards compatibile refactor and a new enum variant,
`all-merge`.

---

Changes from v4:
* Rename `all` -> `separated`
* Rename `all-merge` -> `merged`

Changes from v3:
* Split out ASAN fixes into separate patch series
* Refactor `capture-output` flag into an enum
* Avoid using /bin/bash on windows

Changes from v2:
* Error out if `merge-output` on windows guests
* Add FIXMEs for when glib is updated
* Fix memory leaks in qemu-keymap

Changes from v1:
* Drop invalid test fix
* Do not support `merge-output` on windows guests
* Fix a UAF in tests


Daniel Xu (3):
  qga: Refactor guest-exec capture-output to take enum
  qga: Add `merged` variant to GuestExecCaptureOutputMode
  qga: test: Add tests for `merged` flag

 qga/commands.c        |  68 ++++++++++++++++--
 qga/qapi-schema.json  |  35 +++++++++-
 tests/unit/test-qga.c | 158 +++++++++++++++++++++++++++++++++++++-----
 3 files changed, 238 insertions(+), 23 deletions(-)

-- 
2.39.1


