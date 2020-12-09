Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 138E42D3F82
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 11:06:59 +0100 (CET)
Received: from localhost ([::1]:36264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmwN7-0004K1-V6
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 05:06:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kmwEd-0007sm-P5; Wed, 09 Dec 2020 04:58:11 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:52463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kmwEU-0001zo-NS; Wed, 09 Dec 2020 04:58:11 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 35545580284;
 Wed,  9 Dec 2020 04:57:59 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 09 Dec 2020 04:57:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=3OKo1HbdBAkRHC913D44sf760fP
 FZdn5iquZ2Davlf0=; b=b30Ck+5UEw6YsZRpyYpP2BxmWluGpZDUhR/5PnG4lN0
 oTmsVypFEb7tTofokoK4TlMm7z7UfH9CQnqMBv+w9qsl7mT5W2XUMtZ9/vkxs97v
 OZBT9KL6Z5pOD6drRBAp6EqJ4ez1EoPvfsXl/oe1tn7c7Gr/9UUS2w0/Wf7TSah8
 jKDmXuAMTdNAmlFWDJ7NheoEmIaCupAc5Fp3jXDjBLMK9HRsWXuWQBBZcSaaHCrD
 JwMYbKPJHT7REnKIlcREONLYZi+m85cYIux1bi7RQamr5db38wch0w8PuCt9kyM9
 p83TvKNgGy5ps1lwmmsjQm2d2H2zsGrJSDuIQ6mSoIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=3OKo1H
 bdBAkRHC913D44sf760fPFZdn5iquZ2Davlf0=; b=eWhOBJhbj/Y2e3bZndvIbX
 ZP+73RR39KlY4njXN7jlnjjqpuwNjoBgQrcz8Rw7kmm0Rk4ABCRSY+1yMMeDjCWQ
 EjDGwp17E61S8RYnqbZnZtUxEuZ3t4Hh6AFZf8U8LMCTLc8UXfebhcI67O5xpScQ
 3DiAF+TTuwiq48ggK2r+5taeFUPgSBxYb+2D79LpnZvnx6RKGZqZET8P8wLmkdF5
 txeYruWPTyTxMsp4wL4/RBpnVFP4wg7B7ISbvDAnOrnE8bRlCivVP+dTdQXBE19o
 4ebB6UqEGHg/8SqbNbvY/O3rsu7aM9vgEosl2L23Ep48m6BqEUWMQLgNTk93bc7Q
 ==
X-ME-Sender: <xms:pZ_QX3rpUgF7gHw6XrB7ZOFn6y8vsCBPp6bXTIQZ8Wf3A50Mcb2-2w>
 <xme:pZ_QXzpwq5KcGIjQROvrjIsuPq1qVrj-GHhuFPlsV4rSTVApLJycI91cAlbrE6CKp
 XaARtxxVUYlED3by70>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejkedgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpedtteeikeejffevgfejkeeuheejtdelhffffedugfeivdefleekteeigfdujeeh
 teenucffohhmrghinhepnhhvmhgvgihprhgvshhsrdhorhhgnecukfhppeektddrudeije
 drleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
 rhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:pZ_QX9llwKNw8dvlgsDNOGQtG_TOhabmdG9VP8V0PH7TYHNqhrnGig>
 <xmx:pZ_QX9FInUewH0eOp4QE6e8EhBznviq_gwAWUnR0FhHhfesxvGF7Kg>
 <xmx:pZ_QX-qzuu07zGxKfBg85KlgebxWApU3HDk_UyZCd60mz2Acf1idmg>
 <xmx:p5_QXz_QaW41s4dSnVsQiF3-5XR88FdbY2dMwr5Waw1KEn98dWKlFA>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3886C24005D;
 Wed,  9 Dec 2020 04:57:55 -0500 (EST)
Date: Wed, 9 Dec 2020 10:57:53 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Subject: Re: [PATCH v11 00/13] hw/block/nvme: Support Namespace Types and
 Zoned Namespace Command Set
Message-ID: <X9Cfod3RaAOM9dJP@apples.localdomain>
References: <20201208200410.27900-1-dmitry.fomichev@wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="L6rkk6MEdAFXd54z"
Content-Disposition: inline
In-Reply-To: <20201208200410.27900-1-dmitry.fomichev@wdc.com>
Received-SPF: pass client-ip=66.111.4.230; envelope-from=its@irrelevant.dk;
 helo=new4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Damien Le Moal <damien.lemoal@wdc.com>, qemu-block@nongnu.org,
 Niklas Cassel <niklas.cassel@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, Keith Busch <kbusch@kernel.org>,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Matias Bjorling <matias.bjorling@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--L6rkk6MEdAFXd54z
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

By and large, this looks OK to me. There are still some issues here and
there, and some comments of mine that you did not address, but I will
follow up with patches to fix that. Let's get this merged.

It looks like the nvme-next you rebased on is slightly old and missing
two commits:

  "hw/block/nvme: remove superfluous NvmeCtrl parameter" and
  "hw/block/nvme: pull aio error handling"

It caused a couple of conflicts, but nothing that I couldn't fix up.

Since I didn't manage to convince anyone about the zsze and zcap
parameters being in terms of LBAs, I'll revert that to be
'zoned.zone_size' and 'zoned.zone_capacity'.

Finally, would you accept that we skip "hw/block/nvme: Add injection of
Offline/Read-Only zones" for now? I'd like to discuss it a bit since I
think the random injects feels a bit ad-hoc. Back when I did OCSSD
emulation with Hans, we did something like this for setting up state
through a descriptor text file - I think we should explore something
like that before we lock down the two parameters. I'll amend the final
documentation commit to not include those parameters.

Sounds good?

Otherwise, I think this is mergeable to nvme-next. So, for the series
(excluding "hw/block/nvme: Add injection of Offline/Read-Only zones"):

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

On Dec  9 05:03, Dmitry Fomichev wrote:
> v10 -> v11:
>=20
>  - Address review comments by Klaus.
>=20
>  - Add a patch to separate the handling of controller reset
>    and subsystem shutdown. Place the patch at the beginning
>    of the series so it can be picked up separately.
>=20
>  - Rebase on the current nvme-next branch.
>=20
> v9 -> v10:
>=20
>  - Correctly check for MDTS in Zone Management Receive handler.
>=20
>  - Change Klaus' "Reviewed-by" email in UUID patch.
>=20
> v8 -> v9:
>=20
>  - Move the modifications to "include/block/nvme.h" made to
>    introduce ZNS-related definitions to a separate patch.
>=20
>  - Add a new struct, NvmeZonedResult, along the same lines as the
>    existing NvmeAerResult, to carry Zone Append LBA returned to
>    the host. Now, there is no need to modify NvmeCqe struct except
>    renaming DW1 field from "rsvd" to "dw1".
>=20
>  - Add check for MDTS in Zone Management Receive handler.
>=20
>  - Remove checks for ns->attached since the value of this flag
>    is always true for now.
>=20
>  - Rebase to the current quemu-nvme/nvme-next branch.
>=20
> v7 -> v8:
>=20
>  - Move refactoring commits to the front of the series.
>=20
>  - Remove "attached" and "fill_pattern" device properties.
>=20
>  - Only close open zones upon subsystem shutdown, not when CC.EN flag
>    is set to 0. Avoid looping through all zones by iterating through
>    lists of open and closed zones.
>=20
>  - Improve bulk processing of zones aka zoned operations with "all"
>    flag set. Avoid looping through the entire zone array for all zone
>    operations except Offline Zone.
>=20
>  - Prefix ZNS-related property names with "zoned.". The "zoned" Boolean
>    property is retained to turn on zoned command set as it is much more
>    intuitive and user-friendly compared to setting a magic number value
>    to csi property.
>=20
>  - Address review comments.
>=20
>  - Remove unused trace events.
>=20
> v6 -> v7:
>=20
>  - Introduce ns->iocs initialization function earlier in the series,
>    in CSE Log patch.
>=20
>  - Set NVM iocs for zoned namespaces when CC.CSS is set to
>    NVME_CC_CSS_NVM.
>=20
>  - Clean up code in CSE log handler.
> =20
> v5 -> v6:
>=20
>  - Remove zoned state persistence code. Replace position-independent
>    zone lists with QTAILQs.
>=20
>  - Close all open zones upon clearing of the controller. This is
>    a similar procedure to the one previously performed upon powering
>    up with zone persistence.=20
>=20
>  - Squash NS Types and ZNS triplets of commits to keep definitions
>    and trace event definitions together with the implementation code.
>=20
>  - Move namespace UUID generation to a separate patch. Add the new
>    "uuid" property as suggested by Klaus.
>=20
>  - Rework Commands and Effects patch to make sure that the log is
>    always in sync with the actual set of commands supported.
>=20
>  - Add two refactoring commits at the end of the series to
>    optimize read and write i/o path.
>=20
> - Incorporate feedback from Keith, Klaus and Niklas:
>=20
>   * fix rebase errors in nvme_identify_ns_descr_list()
>   * remove unnecessary code from nvme_write_bar()
>   * move csi to NvmeNamespace and use it from the beginning in NSTypes
>     patch
>   * change zone read processing to cover all corner cases with RAZB=3D1
>   * sync w_ptr and d.wp in case of a i/o error at the preceding zone
>   * reword the commit message in active/inactive patch with the new
>     text from Niklas
>   * correct dlfeat reporting depending on the fill pattern set
>   * add more checks for "attached" n/s parameter to prevent i/o and
>     get/set features on inactive namespaces
>   * Use DEFINE_PROP_SIZE and DEFINE_PROP_SIZE32 for zone size/capacity
>     and ZASL respectively
>   * Improve zone size and capacity validation
>   * Correctly report NSZE
>=20
> v4 -> v5:
>=20
>  - Rebase to the current qemu-nvme.
>=20
>  - Use HostMemoryBackendFile as the backing storage for persistent
>    zone metadata.
>=20
>  - Fix the issue with filling the valid data in the next zone if RAZB
>    is enabled.
>=20
> v3 -> v4:
>=20
>  - Fix bugs introduced in v2/v3 for QD > 1 operation. Now, all writes
>    to a zone happen at the new write pointer variable, zone->w_ptr,
>    that is advanced right after submitting the backend i/o. The existing
>    zone->d.wp variable is updated upon the successful write completion
>    and it is used for zone reporting. Some code has been split from
>    nvme_finalize_zoned_write() function to a new function,
>    nvme_advance_zone_wp().
>=20
>  - Make the code compile under mingw. Switch to using QEMU API for
>    mmap/msync, i.e. memory_region...(). Since mmap is not available in
>    mingw (even though there is mman-win32 library available on Github),
>    conditional compilation is added around these calls to avoid
>    undefined symbols under mingw. A better fix would be to add stub
>    functions to softmmu/memory.c for the case when CONFIG_POSIX is not
>    defined, but such change is beyond the scope of this patchset and it
>    can be made in a separate patch.
>=20
>  - Correct permission mask used to open zone metadata file.
>=20
>  - Fold "Define 64 bit cqe.result" patch into ZNS commit.
>=20
>  - Use clz64/clz32 instead of defining nvme_ilog2() function.
>=20
>  - Simplify rpt_empty_id_struct() code, move nvme_fill_data() back
>    to ZNS patch.
>=20
>  - Fix a power-on processing bug.
>=20
>  - Rename NVME_CMD_ZONE_APND to NVME_CMD_ZONE_APPEND.
>=20
>  - Make the list of review comments addressed in v2 of the series
>    (see below).
>=20
> v2 -> v3:
>=20
>  - Moved nvme_fill_data() function to the NSTypes patch as it is
>    now used there to output empty namespace identify structs.
>  - Fixed typo in Maxim's email address.
>=20
> v1 -> v2:
>=20
>  - Rebased on top of qemu-nvme/next branch.
>  - Incorporated feedback from Klaus and Alistair.
>     * Allow a subset of CSE log to be read, not the entire log
>     * Assign admin command entries in CSE log to ACS fields
>     * Set LPA bit 1 to indicate support of CSE log page
>     * Rename CC.CSS value CSS_ALL_NSTYPES (110b) to CSS_CSI
>     * Move the code to assign lbaf.ds to a separate patch
>     * Remove the change in firmware revision
>     * Change "driver" to "device" in comments and annotations
>     * Rename ZAMDS to ZASL
>     * Correct a few format expressions and some wording in
>       trace event definitions
>     * Remove validation code to return NVME_CAP_EXCEEDED error
>     * Make ZASL to be equal to MDTS if "zone_append_size_limit"
>       module parameter is not set
>     * Clean up nvme_zoned_init_ctrl() to make size calculations
>       less confusing
>     * Avoid changing module parameters, use separate n/s variables
>       if additional calculations are necessary to convert parameters
>       to running values
>     * Use NVME_DEFAULT_ZONE_SIZE to assign the default zone size value
>     * Use default 0 for zone capacity meaning that zone capacity will
>       be equal to zone size by default
>     * Issue warnings if user MAR/MOR values are too large and have
>       to be adjusted
>     * Use unsigned values for MAR/MOR
>  - Dropped "Simulate Zone Active excursions" patch.
>    Excursion behavior may depend on the internal controller
>    architecture and therefore be vendor-specific.
>  - Dropped support for Zone Attributes and zoned AENs for now.
>    These features can be added in a future series.
>  - NS Types support is extended to handle active/inactive namespaces.
>  - Update the write pointer after backing storage I/O completion, not
>    before. This makes the emulation to run correctly in case of
>    backing device failures.
>  - Avoid division in the I/O path if the device zone size is
>    a power of two (the most common case). Zone index then can be
>    calculated by using bit shift.
>  - A few reported bugs have been fixed.
>  - Indentation in function definitions has been changed to make it
>    the same as the rest of the code.
>=20
>=20
> Zoned Namespace (ZNS) Command Set is a newly introduced command set
> published by the NVM Express, Inc. organization as TP 4053. The main
> design goals of ZNS are to provide hardware designers the means to
> reduce NVMe controller complexity and to allow achieving a better I/O
> latency and throughput. SSDs that implement this interface are
> commonly known as ZNS SSDs.
>=20
> This command set is implementing a zoned storage model, similarly to
> ZAC/ZBC. As such, there is already support in Linux, allowing one to
> perform the majority of tasks needed for managing ZNS SSDs.
>=20
> The Zoned Namespace Command Set relies on another TP, known as
> Namespace Types (NVMe TP 4056), which introduces support for having
> multiple command sets per namespace.
>=20
> Both ZNS and Namespace Types specifications can be downloaded by
> visiting the following link -
>=20
> https://nvmexpress.org/wp-content/uploads/NVM-Express-1.4-Ratified-TPs.zip
>=20
> This patch series adds Namespace Types support and zoned namespace
> emulation capability to the existing NVMe PCI device.
>=20
>=20
> Based-on: <20201104102248.32168-1-its@irrelevant.dk>
> Dmitry Fomichev (11):
>   hw/block/nvme: Process controller reset and shutdown differently
>   hw/block/nvme: Generate namespace UUIDs
>   hw/block/nvme: Separate read and write handlers
>   hw/block/nvme: Combine nvme_write_zeroes() and nvme_write()
>   hw/block/nvme: Add Commands Supported and Effects log
>   block/nvme: Make ZNS-related definitions
>   hw/block/nvme: Support Zoned Namespace Command Set
>   hw/block/nvme: Introduce max active and open zone limits
>   hw/block/nvme: Support Zone Descriptor Extensions
>   hw/block/nvme: Add injection of Offline/Read-Only zones
>   hw/block/nvme: Document zoned parameters in usage text
>=20
> Niklas Cassel (2):
>   hw/block/nvme: Add support for Namespace Types
>   hw/block/nvme: Support allocated CNS command variants
>=20
>  hw/block/nvme-ns.h    |  108 +++-
>  hw/block/nvme.h       |    6 +
>  include/block/nvme.h  |  201 +++++-
>  hw/block/nvme-ns.c    |  271 +++++++-
>  hw/block/nvme.c       | 1432 ++++++++++++++++++++++++++++++++++++++---
>  hw/block/trace-events |   32 +-
>  6 files changed, 1927 insertions(+), 123 deletions(-)
>=20
> --=20
> 2.28.0
>=20
>=20

--=20
One of us - No more doubt, silence or taboo about mental illness.

--L6rkk6MEdAFXd54z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAl/Qn58ACgkQTeGvMW1P
DenHCQf+NPYDLywe/J4QPz1rH2TpVy+txIyF0VRX+5wzcymEe6sbnLsNjm71V5nJ
ko4JMAwyvIHlf5evFV4xm27enmrWv4QSfhkNo/4RbTzsP0iRr5p1t2nwOx0F8EHX
OMZciisCvm5+LYIeG2Ce8YaUA5DDvgQT1VIkPoLNSl0zlzOHp1Ra4RiSaNRAvRSp
jzvQ3Hmz0VHx1wPnM09Hm1wGnlroBcioYKiM/D0+4UfvaqNPSL+BsDHz5MQwQjoD
Q1RXKy4hP/k+mJFa3z3hGgbT2C7QfTsFZ2phowXTW/Wu8HeWDmimO/U7ddCNTJRn
zf+nXzqfZQCFx6iC1i7iVQnxgftuzA==
=NASx
-----END PGP SIGNATURE-----

--L6rkk6MEdAFXd54z--

