Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC54191733
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Mar 2020 18:07:14 +0100 (CET)
Received: from localhost ([::1]:52402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGn1F-0004Sv-H1
	for lists+qemu-devel@lfdr.de; Tue, 24 Mar 2020 13:07:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53759)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrzej.jakowski@linux.intel.com>)
 id 1jGmzm-0003Xu-PT
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 13:05:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrzej.jakowski@linux.intel.com>)
 id 1jGmzl-00080g-QD
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 13:05:42 -0400
Received: from mga02.intel.com ([134.134.136.20]:21597)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrzej.jakowski@linux.intel.com>)
 id 1jGmzf-0007uD-Il; Tue, 24 Mar 2020 13:05:35 -0400
IronPort-SDR: Q/R6RX2dbLbCpbFAkXk2G3stQc0m2cxUGquEie/zT4eivyLNJsGdgkTW1JhIgkJmffTGsIH94t
 SaqiYTeizoDA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2020 10:05:28 -0700
IronPort-SDR: 47M1XGhZnEBU8djlJxqjpkR7X/tzR7EPgZKJ2WUo/vViJrl/Fkqze8uDYEwn25pe0BImWEdPYY
 HapLW7abUIIw==
X-IronPort-AV: E=Sophos;i="5.72,301,1580803200"; d="scan'208";a="446302952"
Received: from ajakowsk-mobl1.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.254.70.225])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2020 10:05:27 -0700
Subject: Re: [PATCH v4] block/nvme: introduce PMR support from NVMe 1.4 spec
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <20200320215029.32727-1-andrzej.jakowski@linux.intel.com>
 <20200323132829.GJ261260@stefanha-x1.localdomain>
From: Andrzej Jakowski <andrzej.jakowski@linux.intel.com>
Message-ID: <ce4e1dd3-1053-d487-0bc4-539174583b13@linux.intel.com>
Date: Tue, 24 Mar 2020 10:05:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200323132829.GJ261260@stefanha-x1.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 134.134.136.20
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
Cc: kwolf@redhat.com, haozhong.zhang@intel.com, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, dgilbert@redhat.com,
 qemu-devel@nongnu.org, yi.z.zhang@linux.intel.com, junyan.he@intel.com,
 kbusch@kernel.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/20 6:28 AM, Stefan Hajnoczi wrote:
> Excellent, thank you!
> 
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

Awesome, thx! Not sure about process...
Is this patch now staged for inclusion in QEMU?

