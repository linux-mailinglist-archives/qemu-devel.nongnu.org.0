Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE02562C3F4
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 17:21:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovL8e-0002xU-4J; Wed, 16 Nov 2022 11:19:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <j.granados@samsung.com>)
 id 1ovL8V-0002ws-0I; Wed, 16 Nov 2022 11:19:39 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <j.granados@samsung.com>)
 id 1ovL8P-000218-LZ; Wed, 16 Nov 2022 11:19:38 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20221116161925euoutp01f7780a73d08b21f2a98d3d339b883346~oHQQFU60J1511515115euoutp01v;
 Wed, 16 Nov 2022 16:19:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20221116161925euoutp01f7780a73d08b21f2a98d3d339b883346~oHQQFU60J1511515115euoutp01v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1668615565;
 bh=288nRFWhIs9UBVL7rYSaiuNSZSY0NUwQWyG9Fhb7KtY=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=j3adMNHI8phTt1nHYLzfCUvCHAZEQGVNWG1rkZtUBrUbjNuKncu7cOVDxsmV1xyUk
 6IFkfq0jNCgwS8i6RW7oZB3CgGZmDDzZwj7dGijQ7/yQMimF9GIDsZMEBzSDuG4gKZ
 Sql3wWbJzN5Xy6LNzeyowMUIKsFdGb80G6KgceVA=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20221116161924eucas1p2e011cf2b9bdd7a43f10b0703b52f4859~oHQP_S8Ib0142301423eucas1p2M;
 Wed, 16 Nov 2022 16:19:24 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id F1.63.10112.C8D05736; Wed, 16
 Nov 2022 16:19:24 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20221116161924eucas1p11216a131bf7f843dec6d95d02e3f61a5~oHQPnUMK72503225032eucas1p19;
 Wed, 16 Nov 2022 16:19:24 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20221116161924eusmtrp19e0f420328364e78e8dee27c973712f2~oHQPmyhLw2084920849eusmtrp1O;
 Wed, 16 Nov 2022 16:19:24 +0000 (GMT)
X-AuditID: cbfec7f4-cf3ff70000002780-53-63750d8cbfbe
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id DD.D9.09026.C8D05736; Wed, 16
 Nov 2022 16:19:24 +0000 (GMT)
Received: from CAMSVWEXC01.scsc.local (unknown [106.1.227.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20221116161924eusmtip10b13c7aa733f280c12b2ea3f7c57fa5a~oHQPZ-xc41939119391eusmtip1Q;
 Wed, 16 Nov 2022 16:19:24 +0000 (GMT)
Received: from localhost (106.210.248.19) by CAMSVWEXC01.scsc.local
 (2002:6a01:e347::6a01:e347) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 16 Nov 2022 16:19:23 +0000
Date: Wed, 16 Nov 2022 17:19:21 +0100
From: Joel Granados <j.granados@samsung.com>
To: Klaus Jensen <its@irrelevant.dk>
CC: <k.jensen@samsung.com>, <qemu-devel@nongnu.org>, <qemu-block@nongnu.org>
Subject: Re: [PATCH v2 3/3] nvme: Add physical writes/reads from OCP log
Message-ID: <20221116161921.2bym6wtu6xmkanzo@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="vn2ahrq3t7rialaw"
Content-Disposition: inline
In-Reply-To: <Y3N3WTpB02g/uxdH@cormorant.local>
X-Originating-IP: [106.210.248.19]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOKsWRmVeSWpSXmKPExsWy7djPc7o9vKXJBkcPGVnsP/iN1WLWu3Y2
 i+O9O1gcmD3O7TjP7vHk2mamAKYoLpuU1JzMstQifbsErox30y8xF0zzrlh4sZWlgfGVRRcj
 J4eEgInE51uTmUFsIYEVjBLPTidA2F8YJQ7vse5i5AKyPzNKrL+5kRWmofdQEyNE0XJGiaNv
 /OCKnu5+xgrhbGGUWHF/DlgHi4CqxMKO/2wgNpuAjsT5N3fA1okIqEg8/beXBcRmFvCRmDun
 iQnEFhbwkPi3ehtYPa+AucT7jafZIWxBiZMzn0DVV0j07/0FVMMBZEtLLP/HARLmFNCXeD5n
 DzPEoUoSzzZOhzq6VmLtsTPsILdJCDzgkNg5/R0jRMJFYvOdeWwQtrDEq+Nb2CFsGYnTk3tY
 IOxsiZ1TdkENLZCYdXIq2F4JAWuJvjM5EGFHiW//ljJBhPkkbrwVhLiST2LStunMEGFeiY42
 IYhqNYkdTVsZJzAqz0Ly1ywkf81C+AsirCOxYPcnTGFtiWULXzND2LYS69a9Z1nAyL6KUTy1
 tDg3PbXYKC+1XK84Mbe4NC9dLzk/dxMjMP2c/nf8yw7G5a8+6h1iZOJgPMSoAtT8aMPqC4xS
 LHn5ealKIrz5k0uShXhTEiurUovy44tKc1KLDzFKc7AoifOyzdBKFhJITyxJzU5NLUgtgsky
 cXBKNTA5rBF7df2AdP/t9YyVi68Xn5p/aqGp3LQA4TW7c5/dN2dlVDuXtd/WKq266GxI95yP
 n95U/DHdfij6VKmVVflJxTsva5pF5wisi+/9o9X65pOZr9/n2eynpwbbc5zWd34lqCkuWXDB
 JkzB5669zfMKP55d9iHnYnTnla7SfLX2b6XvhAgz02sr3t1Y8H3njMcXkr68yNiQOb1t/lcZ
 g49nMtP6XppvMqwNC/kQFTLl0eWDnM0XuwTeen/LPmZRtFIy8wLLY02BV2eNJ58tXHiHZ4fL
 EkF59mNZaY/tZjjfP7M7+rd0i/DV4ECuKudb7X7VD7/ESN3lepQ/1eDY1WZ7dcGc/bNl16t+
 V3HPUAxSYinOSDTUYi4qTgQAC4RH4roDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRmVeSWpSXmKPExsVy+t/xu7o9vKXJBi/mSlnsP/iN1WLWu3Y2
 i+O9O1gcmD3O7TjP7vHk2mamAKYoPZui/NKSVIWM/OISW6VoQwsjPUNLCz0jE0s9Q2PzWCsj
 UyV9O5uU1JzMstQifbsEvYwnX34wF0zxrji1tY+5gfGFRRcjJ4eEgIlE76EmRhBbSGApo8TL
 6xIQcRmJT1c+skPYwhJ/rnWxdTFyAdV8ZJS4fPYPI4SzhVHift8ZJpAqFgFViYUd/9lAbDYB
 HYnzb+4wg9giAioST//tZQGxmQV8JObOaQKrFxbwkPi3ehtYPa+AucT7jafZIa54xSjRtDYS
 Ii4ocXLmE6jeMomDK38BzeQAsqUllv/jAAlzCuhLPJ+zhxniUCWJZxuns0LYtRKv7u9mnMAo
 PAvJpFlIJs1CmAQR1pK48e8lE4awtsSyha+ZIWxbiXXr3rMsYGRfxSiSWlqcm55bbKRXnJhb
 XJqXrpecn7uJERiL24793LKDceWrj3qHGJk4GA8xqgB1Ptqw+gKjFEtefl6qkghv/uSSZCHe
 lMTKqtSi/Pii0pzU4kOMpsBAnMgsJZqcD0wSeSXxhmYGpoYmZpYGppZmxkrivJ4FHYlCAumJ
 JanZqakFqUUwfUwcnFINTDO/NUgbLdO1eZ60oJXHVbhgo3DjmghD08tVW6LfBViv6r9Xp7eZ
 gVnt0EynExvtGsrvCm/Y9cxHI2BnlO+Z5/7hxrEbpIv3fmg7UfH1V+Dz9IcSZ0T9qx597uAO
 mXRoURJPy9yXiSEbGyU6j3bvzyqcdDlkjUtvpFEjW1mvhOvshacVNm3Vm3ln/wzfnrWy265/
 uT03pqWq1S+8gk8yf1OOdHdKXp7T4VLVclYHlbU/SmcXXtLbk9d0XIPRTKfikYj+MeWp/Bv7
 apmWSk7OjhN/f2nL9vbO/VL32YPW37+26bTKVA2LpIVKR/7s/qU8d7W1qO8/jh3BgbM/Zr7e
 f+hl1e+W73In5OcdnqG9VomlOCPRUIu5qDgRAPiWB6daAwAA
X-CMS-MailID: 20221116161924eucas1p11216a131bf7f843dec6d95d02e3f61a5
X-Msg-Generator: CA
X-RootMTR: 20221114135429eucas1p26370f7dd286e514105ae1173bfcc066f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20221114135429eucas1p26370f7dd286e514105ae1173bfcc066f
References: <20221114135043.2958100-1-j.granados@samsung.com>
 <CGME20221114135429eucas1p26370f7dd286e514105ae1173bfcc066f@eucas1p2.samsung.com>
 <20221114135043.2958100-4-j.granados@samsung.com>
 <Y3N3WTpB02g/uxdH@cormorant.local>
Received-SPF: pass client-ip=210.118.77.11;
 envelope-from=j.granados@samsung.com; helo=mailout1.w1.samsung.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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

--vn2ahrq3t7rialaw
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 15, 2022 at 12:26:17PM +0100, Klaus Jensen wrote:
> On Nov 14 14:50, Joel Granados wrote:
> > In order to evaluate write amplification factor (WAF) within the storage
> > stack it is important to know the number of bytes written to the
> > controller. The existing SMART log value of Data Units Written is too
> > coarse (given in units of 500 Kb) and so we add the SMART health
> > information extended from the OCP specification (given in units of byte=
s).
> >=20
> > To accomodate different vendor specific specifications like OCP, we add=
 a
> > multiplexing function (nvme_vendor_specific_log) which will route to the
> > different log functions based on arguments and log ids. We only return =
the
> > OCP extended smart log when the command is 0xC0 and ocp has been turned=
 on
> > in the args.
> >=20
> > Though we add the whole nvme smart log extended structure, we only popu=
late
> > the physical_media_units_{read,written}, log_page_version and
> > log_page_uuid.
> >=20
> > Signed-off-by: Joel Granados <j.granados@samsung.com>
> >=20
> > squash with main
> >=20
> > Signed-off-by: Joel Granados <j.granados@samsung.com>
>=20
> Looks like you slightly messed up the squash ;)
oops. that is my bad

>=20
> Also, squash the previous patch (adding the ocp parameter) into this.
Here I wanted to keep the introduction of the argument separate. In any
case, I'll squash it with the other one.

> Please add a note in the documentation (docs/system/devices/nvme.rst)
> about this parameter.
Of course. I always forget documentation. I'll add it under the
"Controller Emulation" section and I'll call it ``ocp``

>=20
> > ---
> >  hw/nvme/ctrl.c       | 56 ++++++++++++++++++++++++++++++++++++++++++++
> >  include/block/nvme.h | 36 ++++++++++++++++++++++++++++
> >  2 files changed, 92 insertions(+)
> >=20
> > diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> > index 220683201a..5e6a8150a2 100644
> > --- a/hw/nvme/ctrl.c
> > +++ b/hw/nvme/ctrl.c
> > @@ -4455,6 +4455,42 @@ static void nvme_set_blk_stats(NvmeNamespace *ns=
, struct nvme_stats *stats)
> >      stats->write_commands +=3D s->nr_ops[BLOCK_ACCT_WRITE];
> >  }
> > =20
> > +static uint16_t nvme_ocp_extended_smart_info(NvmeCtrl *n, uint8_t rae,
> > +                                             uint32_t buf_len, uint64_=
t off,
> > +                                             NvmeRequest *req)
> > +{
> > +    NvmeNamespace *ns =3D NULL;
> > +    NvmeSmartLogExtended smart_ext =3D { 0 };
> > +    struct nvme_stats stats =3D { 0 };
> > +    uint32_t trans_len;
> > +
> > +    if (off >=3D sizeof(smart_ext)) {
> > +        return NVME_INVALID_FIELD | NVME_DNR;
> > +    }
> > +
> > +    // Accumulate all stats from all namespaces
>=20
> Use /* lower-case and no period */ for one sentence, one line comments.
>=20
> I think scripts/checkpatch.pl picks this up.
There is a checkpatch like in the kernel. Fantastic! I'll make a note to
use it from now on.


>=20
> > +    for (int i =3D 1; i <=3D NVME_MAX_NAMESPACES; i++) {
> > +        ns =3D nvme_ns(n, i);
> > +        if (ns)
> > +        {
>=20
> Paranthesis go on the same line as the `if`.
of course

>=20
> > +            nvme_set_blk_stats(ns, &stats);
> > +        }
> > +    }
> > +
> > +    smart_ext.physical_media_units_written[0] =3D cpu_to_le32(stats.un=
its_written);
> > +    smart_ext.physical_media_units_read[0] =3D cpu_to_le32(stats.units=
_read);
> > +    smart_ext.log_page_version =3D 0x0003;
> > +    smart_ext.log_page_uuid[0] =3D 0xA4F2BFEA2810AFC5;
> > +    smart_ext.log_page_uuid[1] =3D 0xAFD514C97C6F4F9C;
> > +
> > +    if (!rae) {
> > +        nvme_clear_events(n, NVME_AER_TYPE_SMART);
> > +    }
> > +
> > +    trans_len =3D MIN(sizeof(smart_ext) - off, buf_len);
> > +    return nvme_c2h(n, (uint8_t *) &smart_ext + off, trans_len, req);
> > +}
> > +
> >  static uint16_t nvme_smart_info(NvmeCtrl *n, uint8_t rae, uint32_t buf=
_len,
> >                                  uint64_t off, NvmeRequest *req)
> >  {
> > @@ -4642,6 +4678,24 @@ static uint16_t nvme_cmd_effects(NvmeCtrl *n, ui=
nt8_t csi, uint32_t buf_len,
> >      return nvme_c2h(n, ((uint8_t *)&log) + off, trans_len, req);
> >  }
> > =20
> > +static uint16_t nvme_vendor_specific_log(uint8_t lid, NvmeCtrl *n, uin=
t8_t rae,
> > +                                         uint32_t buf_len, uint64_t of=
f,
> > +                                         NvmeRequest *req)
>=20
> `NvmeCtrl *n` must be first parameter.
Any reason why this is the case? I'll change it in my code, but would be
nice to understand the reason.


>=20
> > +{
> > +    NvmeSubsystem *subsys =3D n->subsys;
> > +    switch (lid) {
> > +        case NVME_LOG_VENDOR_START:
>=20
> In this particular case, I think it is more clear if you simply use the
> hex value directly. The "meaning" of the log page id depends on if or
> not this is an controller implementing the OCP spec.
Agreed

>=20
> > +            if (subsys->params.ocp) {
> > +                return nvme_ocp_extended_smart_info(n, rae, buf_len, o=
ff, req);
> > +            }
> > +            break;
> > +            /* Add a case for each additional vendor specific log id */
>=20
> Lower-case the comment.
ok

>=20
> > +    }
> > +
> > +    trace_pci_nvme_err_invalid_log_page(nvme_cid(req), lid);
> > +    return NVME_INVALID_FIELD | NVME_DNR;
> > +}
> > +
> >  static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
> >  {
> >      NvmeCmd *cmd =3D &req->cmd;
> > @@ -4683,6 +4737,8 @@ static uint16_t nvme_get_log(NvmeCtrl *n, NvmeReq=
uest *req)
> >          return nvme_error_info(n, rae, len, off, req);
> >      case NVME_LOG_SMART_INFO:
> >          return nvme_smart_info(n, rae, len, off, req);
> > +    case NVME_LOG_VENDOR_START...NVME_LOG_VENDOR_END:
> > +        return nvme_vendor_specific_log(lid, n, rae, len, off, req);
> >      case NVME_LOG_FW_SLOT_INFO:
> >          return nvme_fw_log_info(n, len, off, req);
> >      case NVME_LOG_CHANGED_NSLIST:
> > diff --git a/include/block/nvme.h b/include/block/nvme.h
> > index 8027b7126b..2ab0dca529 100644
> > --- a/include/block/nvme.h
> > +++ b/include/block/nvme.h
> > @@ -978,6 +978,40 @@ typedef struct QEMU_PACKED NvmeSmartLog {
> >      uint8_t     reserved2[320];
> >  } NvmeSmartLog;
> > =20
> > +typedef struct QEMU_PACKED NvmeSmartLogExtended {
> > +    uint64_t    physical_media_units_written[2];
> > +    uint64_t    physical_media_units_read[2];
> > +    uint64_t    bad_user_blocks;
> > +    uint64_t    bad_system_nand_blocks;
> > +    uint64_t    xor_recovery_count;
> > +    uint64_t    uncorrectable_read_error_count;
> > +    uint64_t    soft_ecc_error_count;
> > +    uint64_t    end2end_correction_counts;
> > +    uint8_t     system_data_percent_used;
> > +    uint8_t     refresh_counts[7];
> > +    uint64_t    user_data_erase_counts;
> > +    uint16_t    thermal_throttling_stat_and_count;
> > +    uint16_t    dssd_spec_version[3];
> > +    uint64_t    pcie_correctable_error_count;
> > +    uint32_t    incomplete_shutdowns;
> > +    uint32_t    reserved0;
>=20
> I know that it is not totally consistent across the code, but please use
> `rsvd<BYTEOFFSET>` for the reserved field names. The above would be
> `rsvd116` if I am not mistaken.
ok

>=20
> > +    uint8_t     percent_free_blocks;
> > +    uint8_t     reserved1[7];
> > +    uint16_t    capacity_health;
> > +    uint8_t     nvme_errata_ver;
> > +    uint8_t     reserved2[5];
> > +    uint64_t    unaligned_io;
> > +    uint64_t    security_ver_num;
> > +    uint64_t    total_nuse;
> > +    uint64_t    plp_start_count[2];
> > +    uint64_t    endurance_estimate[2];
> > +    uint64_t    pcie_retraining_count;
> > +    uint64_t    power_state_change_count;
> > +    uint8_t     reserved3[286];
> > +    uint16_t    log_page_version;
> > +    uint64_t    log_page_uuid[2];
> > +} NvmeSmartLogExtended;
> > +
> >  #define NVME_SMART_WARN_MAX     6
> >  enum NvmeSmartWarn {
> >      NVME_SMART_SPARE                  =3D 1 << 0,
> > @@ -1010,6 +1044,8 @@ enum NvmeLogIdentifier {
> >      NVME_LOG_FW_SLOT_INFO   =3D 0x03,
> >      NVME_LOG_CHANGED_NSLIST =3D 0x04,
> >      NVME_LOG_CMD_EFFECTS    =3D 0x05,
> > +    NVME_LOG_VENDOR_START   =3D 0xC0,
> > +    NVME_LOG_VENDOR_END     =3D 0xFF,
>=20
> Existing style is generally lower-case hex.
No problem

Thx for the review. Will post V3 after running checkpatch
>=20
> >  };
> > =20
> >  typedef struct QEMU_PACKED NvmePSD {
> > --=20
> > 2.30.2
> >=20
> >=20



--vn2ahrq3t7rialaw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmN1DYYACgkQupfNUreW
QU9B0wv/WSKZhCOJgZxpGAsL9PfXCs8PUSFyN3SsCODwYQGrOnV6hMGGi/AWKRT4
A1NnN7HRwUGD/gecEKYb0YX19wm0bcUK3lH0s1rfPwu1hDBf+XSbUjds3+vJxx8O
RUzJMBlbp/vPMYdWd22V+Pk03b1LUNK1/4V9PeSX9CLF8DKPoWhnXufLoJ1ZNSsU
x378tJ61Cp0NBUheQmM0s6//9/iVM4Te2OQhJlZ5AhlMTp4iQA6s+8AH77KJ5Ae5
8kIlfRXE+YIWmtXUHyI/427TluXvj2pawNn+0Pzr74UBjlDwY23w+ZfXW+mBIJJq
J6CkZdc11F+x/02eYWiPSunN040n0uBsgSe2l2Bci5puO9z0Qfywvc/gc+LyRmSp
kJ7W6JPD8wN1M+l7XG6nJv9hVuFycKxgiUPf+we3KvkCmK5G141Iu6FwfXV/VaID
E7KtYKvpV1buHuCDmApo6Z+Aa61xdLYCzBJ+//vSusyf5ZFWnzARIRVD1+Nr7lKG
m9nrHDSA
=RGsi
-----END PGP SIGNATURE-----

--vn2ahrq3t7rialaw--

