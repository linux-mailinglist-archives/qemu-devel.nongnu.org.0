Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C738B7D251
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Aug 2019 02:36:56 +0200 (CEST)
Received: from localhost ([::1]:45284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsz5T-0001wZ-Ik
	for lists+qemu-devel@lfdr.de; Wed, 31 Jul 2019 20:36:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46468)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hsz4h-0001WK-JJ
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 20:36:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hsz4g-00027Q-J3
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 20:36:07 -0400
Received: from mga12.intel.com ([192.55.52.136]:64418)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hsz4g-00026R-87
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 20:36:06 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jul 2019 17:36:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,332,1559545200"; d="scan'208";a="175001141"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga003.jf.intel.com with ESMTP; 31 Jul 2019 17:36:02 -0700
Date: Thu, 1 Aug 2019 08:35:39 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Message-ID: <20190801003539.GA6721@richard>
References: <20190724070307.12568-1-richardw.yang@linux.intel.com>
 <20190729135859.GD6771@stefanha-x1.localdomain>
 <20190730005150.GA27925@richard>
 <CAJSP0QV0rvpJU3Ct7khcHgUQ9cCQAfUyJz5m6kQDNjA1dcc8EA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJSP0QV0rvpJU3Ct7khcHgUQ9cCQAfUyJz5m6kQDNjA1dcc8EA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.136
Subject: Re: [Qemu-devel] [PATCH] docs/nvdimm: add example on persistent
 backend setup
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
Reply-To: Wei Yang <richardw.yang@linux.intel.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, ross.zwisler@linux.intel.com,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Wei Yang <richardw.yang@linux.intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 30, 2019 at 07:03:45AM +0100, Stefan Hajnoczi wrote:
>On Tue, Jul 30, 2019 at 1:52 AM Wei Yang <richardw.yang@linux.intel.com> wrote:
>>
>> Hi, Stefan
>>
>> Thanks for your comments :-)
>>
>> On Mon, Jul 29, 2019 at 02:58:59PM +0100, Stefan Hajnoczi wrote:
>> >On Wed, Jul 24, 2019 at 03:03:07PM +0800, Wei Yang wrote:
>> >> Persistent backend setup requires some knowledge about nvdimm and ndctl
>> >> tool. Some users report they may struggle to gather these knowledge and
>> >> have difficulty to setup it properly.
>> >>
>> >> Here we provide two examples for persistent backend and gives the link
>> >> to ndctl. By doing so, user could try it directly and do more
>> >> investigation on persistent backend setup with ndctl.
>> >>
>> >> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>> >> ---
>> >>  docs/nvdimm.txt | 28 ++++++++++++++++++++++++++++
>> >>  1 file changed, 28 insertions(+)
>> >>
>> >> diff --git a/docs/nvdimm.txt b/docs/nvdimm.txt
>> >> index b531cacd35..baba7a940d 100644
>> >> --- a/docs/nvdimm.txt
>> >> +++ b/docs/nvdimm.txt
>> >> @@ -171,6 +171,32 @@ guest software that this vNVDIMM device contains a region that cannot
>> >>  accept persistent writes. In result, for example, the guest Linux
>> >>  NVDIMM driver, marks such vNVDIMM device as read-only.
>> >>
>> >> +Backend File Setup Example
>> >> +..........................
>>
>> Here I use '-' because I want to say this is a sub-section of "Guest Data
>> Persistence".
>>
>> Actually, I struggled a little to pick up a proper character. Do you think '-'
>> is the proper one?
>
>This is a .txt file without syntax.  Whatever you choose might be
>confusing to someone.  If you use a separate '-' section like the rest
>of the document then that avoids confusion.
>

Sure, let me change it. Thanks :)

>Stefan

-- 
Wei Yang
Help you, Help me

