Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4222524641
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 05:18:36 +0200 (CEST)
Received: from localhost ([127.0.0.1]:45677 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSvIR-0002kb-EL
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 23:18:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52696)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hSvHD-0002ML-50
	for qemu-devel@nongnu.org; Mon, 20 May 2019 23:17:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hSvHC-0005Ui-Ai
	for qemu-devel@nongnu.org; Mon, 20 May 2019 23:17:19 -0400
Received: from mga03.intel.com ([134.134.136.65]:34794)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hSvHA-0005RS-35; Mon, 20 May 2019 23:17:16 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 May 2019 20:17:14 -0700
X-ExtLoop1: 1
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by fmsmga006.fm.intel.com with ESMTP; 20 May 2019 20:17:12 -0700
Date: Tue, 21 May 2019 11:16:42 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20190521031642.GA25337@richard>
References: <20190520005957.6953-1-richardw.yang@linux.intel.com>
	<20190520185508-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190520185508-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.65
Subject: Re: [Qemu-devel] [PATCH v5 0/6] Extract build_mcfg
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Wei Yang <richardw.yang@linux.intel.com>
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, thuth@redhat.com,
	qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
	qemu-arm@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>,
	imammedo@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 20, 2019 at 06:55:53PM -0400, Michael S. Tsirkin wrote:
>On Mon, May 20, 2019 at 08:59:51AM +0800, Wei Yang wrote:
>> This patch set tries to generalize MCFG table build process. And it is
>> based on one un-merged patch from Igor, which is included in this serials.
>> 
>> v4->v5:
>>     * ACPI_PCI depends on both ACPI and PCI
>>     * rebase on latest master, adjust arm Kconfig
>>     * miss the reserved[8] of MCFG, add it back
>>     * make sure bios-tables-test all OK
>
>So I am merging 1-4 now - they are unchanged from previous iterations.
>You just need to repost 5-6.
>

Sure, I would repost 5-6.

-- 
Wei Yang
Help you, Help me

