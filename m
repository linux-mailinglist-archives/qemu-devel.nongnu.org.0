Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF4C698A59
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 03:07:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSTfA-0001eM-BZ; Wed, 15 Feb 2023 21:06:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmg@gold.funkthat.com>)
 id 1pSRwc-0004Lv-Dg; Wed, 15 Feb 2023 19:16:14 -0500
Received: from gold.funkthat.com ([2001:470:800b::2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmg@gold.funkthat.com>)
 id 1pSRwX-0001qd-1M; Wed, 15 Feb 2023 19:16:14 -0500
Received: from gold.funkthat.com (localhost [127.0.0.1])
 by gold.funkthat.com (8.15.2/8.15.2) with ESMTPS id 31FNmkqk025715
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 15 Feb 2023 15:48:46 -0800 (PST)
 (envelope-from jmg@gold.funkthat.com)
Received: (from jmg@localhost)
 by gold.funkthat.com (8.15.2/8.15.2/Submit) id 31FNmkJg025714;
 Wed, 15 Feb 2023 15:48:46 -0800 (PST) (envelope-from jmg)
Date: Wed, 15 Feb 2023 15:48:46 -0800
From: John-Mark Gurney <jmg@funkthat.com>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Detecting qemu from guest on arm/hvf (apple arm)
Message-ID: <20230215234846.GJ95670@funkthat.com>
Mail-Followup-To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Operating-System: FreeBSD 11.3-STABLE amd64
X-PGP-Fingerprint: D87A 235F FB71 1F3F 55B7  ED9B D5FF 5A51 C0AC 3D65
X-Files: The truth is out there
X-URL: https://www.funkthat.com/
X-Resume: https://www.funkthat.com/~jmg/resume.html
X-TipJar: bitcoin:13Qmb6AeTgQecazTWph4XasEsP7nGRbAPE
X-to-the-FBI-CIA-and-NSA: HI! HOW YA DOIN? can i haz chizburger?
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3
 (gold.funkthat.com [127.0.0.1]); Wed, 15 Feb 2023 15:48:46 -0800 (PST)
Received-SPF: none client-ip=2001:470:800b::2;
 envelope-from=jmg@gold.funkthat.com; helo=gold.funkthat.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 15 Feb 2023 21:06:18 -0500
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

Hello,

I was wondering what the best way to detect that FreeBSD is running
under qemu/hvf on Apple ARM?  FreeBSD doesn't see the ACPI FADT table,
so I'm wondering if keying off of something like the QEMU0002 device
in ACPI is the best way?  Or is there another option?

Thanks for your help.

-- 
  John-Mark Gurney				Voice: +1 415 225 5579

     "All that I will do, has been done, All that I have, has not."

