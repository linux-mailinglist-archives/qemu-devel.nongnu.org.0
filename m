Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BDA66BA24
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 10:20:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHLeG-0000oG-9v; Mon, 16 Jan 2023 04:19:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pHLeE-0000nI-5O
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 04:19:22 -0500
Received: from mout.kundenserver.de ([212.227.17.10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pHLeB-0003CR-4T
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 04:19:21 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MC3H1-1pR0pg3cRZ-00CT0d; Mon, 16
 Jan 2023 10:19:14 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 0/4] M68k next patches
Date: Mon, 16 Jan 2023 10:19:08 +0100
Message-Id: <20230116091912.1882152-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.38.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:gRkpTVTz9OLgl0UrM3ImAV0mdizOkzKabq42RId1Fo/LoEsQXTz
 tza4ZPVa4J8DUYJDIdEMIHGhtDMZ42oMS8TySKs212vBDhEaFLLBPfYJRH4vSUj6KsHPQAY
 rnA6pa1KViKeO5FmJdDPxFruxb3SbujGXRCdKdGpb8vZ57xaBsbYsqZPrLxDWMWC2yiYtHb
 TkveGwDEwoTWXBHV4kOJw==
UI-OutboundReport: notjunk:1;M01:P0:hdXEVLq8ffM=;FJp567WEMYUag6eNW0bzc1K3ldL
 xLxHpHI+x/+4DA3rpbrSv9pIa8TD0YdkVgQ4gMnW8ZPbsbtS6iJyMJFQpO4LUGWsQURUQyH52
 dIGxXsIPJwHOnaoZs53S1LdbE7qv7W2qbMEDc6Yd9w0V4B4GTINrlTF6kyCDsdcwV0dwJbcvb
 1OnFBBI6QAShFV6i+UfjmUXt4gsWKabToCHbWnbb536S9VIzWVTh9cBrS54NVSxs9Xzf1Udsr
 cKHqaNma9k/uS/Ojg4q5+L39vk3rzw8Oh8FpXC6OukLBv0PRHsDDaB70j+qPoXZOA/wY4lINw
 lamuh08aAyxArksV6hZs8gB4zy+8c66NpeqDxkKifXY8Ak8N1glhF37eoxMYGPeliPLX7IuUC
 GfHYQ6C5oiSPMhZhq20l6nKvVgzZcKoyxEhG+hVWW09483NRDjTc7vlzMJzPSrR6inJbwd2pO
 DUi+f9QNfykwqZhxwfIF9CujLeC5wigzGF7fVX8Zkb8NRs4h/ysS90KnwJIDgji2l45rz6OPV
 0Q7uhbUoPNbZoy66HgfSNA6GIXG4EAeJGAVP/LD6FOZ6y3IeMd8IohW5llNz+q0TK3v4Qn84y
 rtg15SbIeBUzqcdlL0Xr4QDZHEvqgCriPK83koSMHGN1374ujj8GPQY+0pM+7Y+zW5Oq0RcJm
 1OCrrqm1PAeyRef0dslqsevIGMRU6Gmee19TbNk/3g==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

The following changes since commit 886fb67020e32ce6a2cf7049c6f017acf1f0d69a:

  Merge tag 'pull-target-arm-20230113' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2023-01-13 14:12:43 +0000)

are available in the Git repository at:

  https://github.com/vivier/qemu-m68k.git tags/m68k-next-pull-request

for you to fetch changes up to 1a282f60a971aa86e3cdd1b7ca000790e43bb310:

  target/m68k: fix FPSR quotient byte for frem instruction (2023-01-16 09:47:31 +0100)

----------------------------------------------------------------
M68K pull request 20230116

fix FPSR quotient byte

----------------------------------------------------------------

Mark Cave-Ayland (4):
  target/m68k: pass quotient directly into make_quotient()
  target/m68k: pass sign directly into make_quotient()
  target/m68k: fix FPSR quotient byte for fmod instruction
  target/m68k: fix FPSR quotient byte for frem instruction

 target/m68k/fpu_helper.c | 49 +++++++++++++++++++++++++---------------
 1 file changed, 31 insertions(+), 18 deletions(-)

-- 
2.38.1


