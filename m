Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A933E5C00
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 15:42:57 +0200 (CEST)
Received: from localhost ([::1]:41306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDS1w-0001oy-6v
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 09:42:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1mDS0C-0007Fy-PP; Tue, 10 Aug 2021 09:41:08 -0400
Received: from forward3-smtp.messagingengine.com ([66.111.4.237]:52321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1mDS09-0003ho-2J; Tue, 10 Aug 2021 09:41:08 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailforward.nyi.internal (Postfix) with ESMTP id 1AB341940138;
 Tue, 10 Aug 2021 09:41:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 10 Aug 2021 09:41:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=RIardBH1mTSGd3Guk
 f1lpAbUgykGFuWsjwLIk8uxa5I=; b=ptQl0i++7W6T1/TxKrcKqz78gSDb1iOcm
 jJ1jUAjU9knEaJ7FXzr/At/yulmRCmbPItZhqKYk2zgs1ybf+uxVkP5G+GSHeZMs
 jSyCVP73o5YZ/QpVMeTV0I8/1npmFc1XhxYoSNhw9Nt6R+9TJFLOEXPN75ZyMwNg
 duSPAfWw6yWX5uJvrbau8q6OJKyYDzgEavj6JmkrrAFa2B4G8KeA2xUFL3e0HqxT
 EL+A/Re3abDOwtGMa6wRe0IhjAXMnc0XSG2Onkle9zzUIiSJBf0tJgxeQBa2CX0g
 vc3Yk42wSp9EIsn4NoUZq29wg6H8UkuksPb0OaQRNodcRL3Q7dDIg==
X-ME-Sender: <xms:5oESYQ3nhkQ-4OKgLklrcTyroVDvuzdLH6F2jit1TZYVZuvEQfocFA>
 <xme:5oESYbEq-O6IIRD8Dkx2o296f4jik9yMjIbLpZK6409GrwUYBY0LxamB4CfP98Z19
 fF0pLEZETnbx53eScM>
X-ME-Received: <xmr:5oESYY6LkYb6GPuXfG-D9nR_Ae6fi3X852q4DB_Yz20wLrcv8NuNxRg7E0hmGENMh6A8mErm9wcQ-hz7BMLAzdT4MPT6bfPVD7Cstlbyyes>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrjeelgdeikecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepffgrvhhiugcugfgu
 mhhonhgushhonhcuoegurghvihgurdgvughmohhnughsohhnsehorhgrtghlvgdrtghomh
 eqnecuggftrfgrthhtvghrnhephfeftdeiveelteeuueekffdvffefiefgtddvffegiedt
 geefffeliefhvedtkeefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegurghvihgurdgvughm
 ohhnughsohhnsehorhgrtghlvgdrtghomh
X-ME-Proxy: <xmx:5oESYZ1rJR_l5MvtXSHXUetblso4pycW9ewM26w3i7-fchX7G_2EUg>
 <xmx:5oESYTGknXg16pvpqPHQ-HksKbz0trzQdvmJVd3iUAC2F-SgBTcnJg>
 <xmx:5oESYS-LtVjGVILpx0oRDUCvceqVeulRRoG6cz_GGV8B3zBRVbafWQ>
 <xmx:7YESYZV6f_pmHt5T144ubg6dhsh0aa21LQe73FQxEiPBnyNms3L0kD3VDHk>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Aug 2021 09:40:52 -0400 (EDT)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 2a9d1ee0;
 Tue, 10 Aug 2021 13:40:50 +0000 (UTC)
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/1] hw/pflash_cfi01: Allow an administrator to reduce the
 memory consumption of flash devices
Date: Tue, 10 Aug 2021 14:40:49 +0100
Message-Id: <20210810134050.396747-1-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=66.111.4.237;
 envelope-from=david.edmondson@oracle.com;
 helo=forward3-smtp.messagingengine.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_SOFTFAIL=0.665, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Xu Yandong <xuyandong2@huawei.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Zheng Xiang <zhengxiang9@huawei.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?haibinzhang=28=E5=BC=A0=E6=B5=B7=E6=96=8C=29?=
 <haibinzhang@tencent.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 David Edmondson <david.edmondson@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As described in
https://lore.kernel.org/r/20201116104216.439650-1-david.edmondson@oracle.com
and
https://lore.kernel.org/r/20210222174757.2329740-1-david.edmondson@oracle.com
I'd like to reduce the amount of memory consumed by QEMU mapping UEFI
images on aarch64.

To recap:

> Currently ARM UEFI images are typically built as 2MB/768kB flash
> images for code and variables respectively. These images are both
> then padded out to 64MB before being loaded by QEMU.
>
> Because the images are 64MB each, QEMU allocates 128MB of memory to
> read them, and then proceeds to read all 128MB from disk (dirtying
> the memory). Of this 128MB less than 3MB is useful - the rest is
> zero padding.
>
> On a machine with 100 VMs this wastes over 12GB of memory.

Some of the cleanups in the previous patches were incorporated, but
the patch that reduced memory consumption was not accepted. This is
essentially that patch rebased after some unrelated changes. Having
investigated alternatives, I think that the patch here is useful as it
stands.

All read/write operations to areas outside of the underlying block
device are handled directly. Reads return 0, writes either fail
(read-only devices) or are discarded (writable devices).

This reduces the memory consumption for the AAVMF code image from
64MiB to around 2MB and that for the AAVMF vars from 64MiB to 768KiB
(presuming that the UEFI images are adjusted accordingly).

For read-only devices (such as the AAVMF code) this seems completely
safe.

For writable devices there is a change in behaviour - previously it
was possible to write anywhere in the extent of the flash device, read
back the data written and have that data persist through a restart of
QEMU. This is no longer the case - writes outside of the extent of the
underlying backing block device will be discarded. That is, a read
after a write will *not* return the written data, either immediately
or after a QEMU restart - it will return zeros.

Looking at the AAVMF implementation, it seems to me that if the
initial VARS image is prepared as being 768KiB in size (which it is),
none of AAVMF itself will attempt to write outside of that extent, and
so I believe that this is an acceptable compromise.

It would be relatively straightforward to allow writes outside of the
backing device to persist for the lifetime of a particular QEMU by
allocating memory on demand (i.e. when there is a write to the
relevant region). This would allow a read to return the relevant data,
but only until a QEMU restart, at which point the data would be lost.

It may be possible to persist writes by extending the underlying
backing device to accommodate a new extent. This would definitely add
complication, as ideally the size of the memory sub-region would also
be updated. I have not investigated this further.

There was a suggestion in a previous thread that perhaps the pflash
driver could be re-worked to use the block IO interfaces to access the
underlying device "on demand" rather than reading in the entire image
at startup (at least, that's how I understood the comment).

An implementation of this based around mapping the flash region only
for IO, which meant that every read or write had to be handled
directly by the pflash driver (there was no ROMD style operation),
made booting an aarch64 VM significantly slower - getting through the
firmware went from under 1 second to around 10 seconds. It's possible
that this could be improved by caching blocks or some other mechanism,
but I have not pursued it further.

Philippe implemented a suggestion to use mmap() to avoid the need to
allocate (and dirty) memory for read-only pflash images in
https://lore.kernel.org/qemu-devel/20210301115329.411762-1-philmd@redhat.com/.

This solution was, I believe, considered incomplete, as:
- it does not handle the case where the image underlying a pflash
  device is changed via QAPI,
- it does not handle writable devices.

There is also an assumption that multiple QEMU instances on a single
host will share the same AAVMF code image (to benefit from a shared
mapping) - this is not the case in the environment that I am looking
to support.

If using mmap() for read-only device is particularly valuable, it
could be combined with the patches here - the benefit would be
cumulative.

The only drawback that I see with this patch is the change in
behaviour for writes beyond the extent of an underlying image. Unless
the AAVMF build process is modified to generate smaller images (768kB
for the variables, for example), this will never be a problem in
reality, as the underlying image will match the size of the device.

Only when a deliberate decision is taken to use an image smaller than
the device does this drawback come to the fore, which is a tradeoff
that an administrator can choose to make if they wish.

v2:
- Unify the approach for both read-only and writable devices, saving
  another 63MiB per QEMU instance.

v3:
- Add Reviewed-by: for two changes (Philippe).
- Call blk_pread() directly rather than using
  blk_check_size_and_read_all(), given that we know how much we want
  to read.

v4:
- Remove changes already upstream.
- Rebase.

David Edmondson (1):
  hw/pflash_cfi01: Allow backing devices to be smaller than memory
    region

 hw/block/pflash_cfi01.c | 105 ++++++++++++++++++++++++++++++++--------
 hw/block/trace-events   |   3 ++
 2 files changed, 87 insertions(+), 21 deletions(-)

-- 
2.30.2


