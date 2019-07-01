Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C9514347
	for <lists+qemu-devel@lfdr.de>; Mon,  6 May 2019 03:08:04 +0200 (CEST)
Received: from localhost ([127.0.0.1]:48411 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNS6t-0003PJ-O8
	for lists+qemu-devel@lfdr.de; Sun, 05 May 2019 21:08:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37398)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hNS5P-0002n3-Ti
	for qemu-devel@nongnu.org; Sun, 05 May 2019 21:06:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hNS5N-0001F4-Le
	for qemu-devel@nongnu.org; Sun, 05 May 2019 21:06:30 -0400
Received: from mga01.intel.com ([192.55.52.88]:13766)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hNS5M-0001E9-Ug; Sun, 05 May 2019 21:06:29 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 May 2019 18:06:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,435,1549958400"; d="scan'208";a="141611593"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by orsmga006.jf.intel.com with ESMTP; 05 May 2019 18:06:23 -0700
Date: Mon, 6 May 2019 09:05:57 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Message-ID: <20190506010557.GB6343@richard>
References: <20190505200602.12412-1-philmd@redhat.com>
	<20190505200602.12412-6-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190505200602.12412-6-philmd@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.88
Subject: Re: [Qemu-devel] [PATCH 5/5] hw/block/pflash_cfi02: Add the
 DeviceReset() handler
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	Stephen Checkoway <stephen.checkoway@oberlin.edu>,
	qemu-block@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org, qemu-stable@nongnu.org,
	Wei Yang <richardw.yang@linux.intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, May 05, 2019 at 10:06:02PM +0200, Philippe Mathieu-Daud� wrote:
>The pflash device is a child of TYPE_DEVICE, so it can implement
>the DeviceReset handler. Actually it has to implement it, else
>on machine reset it might stay in an incoherent state, as it has
>been reported in the buglink listed below.
>
>Add the DeviceReset handler and remove its call from the realize()
>function.
>
>Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1678713
>Reported-by: Laszlo Ersek <lersek@redhat.com>
>Signed-off-by: Philippe Mathieu-Daud� <philmd@redhat.com>

Reviewed-by: Wei Yang <richardw.yang@linux.intel.com>


-- 
Wei Yang
Help you, Help me

