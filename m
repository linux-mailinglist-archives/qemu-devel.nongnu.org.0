Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8CF2294A5
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jul 2020 11:16:55 +0200 (CEST)
Received: from localhost ([::1]:51884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyAru-0003lS-G1
	for lists+qemu-devel@lfdr.de; Wed, 22 Jul 2020 05:16:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jan.kiszka@siemens.com>)
 id 1jyAr3-00035g-Hp
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 05:16:01 -0400
Received: from gecko.sbs.de ([194.138.37.40]:60231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jan.kiszka@siemens.com>)
 id 1jyAr0-00051f-QG
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 05:16:00 -0400
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
 by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 06M9Fi8T031874
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jul 2020 11:15:44 +0200
Received: from [167.87.24.251] ([167.87.24.251])
 by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 06M9FhCg028144;
 Wed, 22 Jul 2020 11:15:44 +0200
To: qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: 5.1.0-rc1 regression: reset fails with kvm and -cpu host
Message-ID: <bf007af9-f81e-3542-0237-5ea467f34377@siemens.com>
Date: Wed, 22 Jul 2020 11:15:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=194.138.37.40;
 envelope-from=jan.kiszka@siemens.com; helo=gecko.sbs.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/22 05:15:45
X-ACL-Warn: Detected OS   = Linux 3.1-3.10
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, PDS_TONAME_EQ_TOLOCAL_SHORT=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

Hi all,

this locks up the guest:

- qemu-system-x86_64 -enable-kvm -cpu host
- trigger hard reset

Host kernel: 5.7.7.
Host CPU: i7-8850H

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

