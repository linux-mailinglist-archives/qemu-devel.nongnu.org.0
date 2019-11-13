Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A114FAC2E
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Nov 2019 09:43:20 +0100 (CET)
Received: from localhost ([::1]:42192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUoFC-0001oB-Mn
	for lists+qemu-devel@lfdr.de; Wed, 13 Nov 2019 03:43:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39071)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tao3.xu@intel.com>) id 1iUoET-0001N8-4s
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 03:42:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1iUoER-0000tE-9m
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 03:42:32 -0500
Received: from mga14.intel.com ([192.55.52.115]:56613)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1iUoER-0000ov-2T
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 03:42:31 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Nov 2019 00:42:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,299,1569308400"; d="scan'208";a="207735222"
Received: from txu2-mobl.ccr.corp.intel.com (HELO [10.239.196.231])
 ([10.239.196.231])
 by orsmga006.jf.intel.com with ESMTP; 13 Nov 2019 00:42:25 -0800
To: ehabkost@redhat.com
From: Tao Xu <tao3.xu@intel.com>
Subject: About MONITOR/MWAIT in i386 CPU model
Message-ID: <d52ddfd1-3d9d-6a3a-5ce9-893df96639cc@intel.com>
Date: Wed, 13 Nov 2019 16:42:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.115
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Guo,
 Xuelian" <xuelian.guo@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eduardo，

After kvm use "-overcommit cpu-pm=on" to expose MONITOR/MWAIT
(commit id 6f131f13e68d648a8e4f083c667ab1acd88ce4cd), the MONITOR/MWAIT 
feature in CPU model (phenom core2duo coreduo n270 Opteron_G3 EPYC 
Snowridge Denverton) may be unused. For example, when we boot a guest 
with Denverton cpu model, guest cannot detect MONITOR and boot with no 
warning. Should we remove this feature from some CPU model?

Tested by Guo, Xuelian <xuelian.guo@intel.com>

Tao Xu


