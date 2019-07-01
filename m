Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DF620076
	for <lists+qemu-devel@lfdr.de>; Thu, 16 May 2019 09:43:02 +0200 (CEST)
Received: from localhost ([127.0.0.1]:50170 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRB2a-0003YA-K6
	for lists+qemu-devel@lfdr.de; Thu, 16 May 2019 03:43:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53306)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hRB1S-0003Bb-3K
	for qemu-devel@nongnu.org; Thu, 16 May 2019 03:41:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hRB1R-0001rg-7c
	for qemu-devel@nongnu.org; Thu, 16 May 2019 03:41:50 -0400
Received: from mga14.intel.com ([192.55.52.115]:21552)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hRB1P-0001nM-6h; Thu, 16 May 2019 03:41:47 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 May 2019 00:41:44 -0700
X-ExtLoop1: 1
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by orsmga003.jf.intel.com with ESMTP; 16 May 2019 00:41:41 -0700
Date: Thu, 16 May 2019 15:41:10 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Message-ID: <20190516074110.GA11938@richard>
References: <20190419003053.8260-1-richardw.yang@linux.intel.com>
	<20190419003053.8260-7-richardw.yang@linux.intel.com>
	<20190514211015-mutt-send-email-mst@kernel.org>
	<d9d265e1-1052-9d8d-c749-5d1e5901f567@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d9d265e1-1052-9d8d-c749-5d1e5901f567@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.115
Subject: Re: [Qemu-devel] [PATCH v4 6/6] acpi: pci: use build_append_foo()
 API to construct MCFG
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
	Wei Yang <richardw.yang@linux.intel.com>, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 15, 2019 at 07:29:17AM +0200, Philippe Mathieu-Daud� wrote:
>
>Thanks Michael for testing...
>
>Wei, can you add a MCFG test in tests/bios-tables-test.c?
>

I took a look into the test, current q35 has already has a reference MCFG in 
tests/data/acpi/q35/MCFG.

And there would be a warning message when reserved[8] is missed.

    /x86_64/acpi/q35/bridge: acpi-test: Warning! MCFG mismatch.

Is this enough? Or what more information prefer to add?

>Regards,
>
>Phil.
>
>>> -    AcpiMcfgAllocation allocation[0];
>>> -} QEMU_PACKED;
>>> -typedef struct AcpiTableMcfg AcpiTableMcfg;
>>> -
>>>  /*
>>>   * TCPA Description Table
>>>   *
>>> -- 
>>> 2.19.1

-- 
Wei Yang
Help you, Help me

