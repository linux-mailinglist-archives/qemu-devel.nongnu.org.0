Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B138362975C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 12:28:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouu5b-0006pY-0l; Tue, 15 Nov 2022 06:26:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ouu5E-0006da-7G; Tue, 15 Nov 2022 06:26:28 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ouu5B-0005KR-37; Tue, 15 Nov 2022 06:26:27 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 652153200939;
 Tue, 15 Nov 2022 06:26:21 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 15 Nov 2022 06:26:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1668511581; x=1668597981; bh=BS
 u9fNyMDInUSLPu9EeiuPR6yrQGkIJxuLw46cKSGq0=; b=A/jK8s9LD9QgBW6azZ
 Hy0nGyOlxJNUrBWdvO72aRX0L2JBzGiDTEiiRn8KyN40cqZDUA1uyJi+FIVgRKz0
 Pm5rREHie6bdVA8V0k9xJFoskm7TRKMkGr74gTNgNXipAAZv7H/3Dj3t7oGsCch4
 6cMhtLyu8uVNgZDy1PaZvmRtgGTKZGKfXmvEvdUcQrsVENTHp+upI6GVoVk3hNXS
 wweWPBCh/bqL5ytx7aaxv4QpgX9oSQ0k45EQD6B9js9f3JxTMnqx6L/jW8olXWig
 N56CFM2/Zzvo5EOPJmW8em2g5HL0FX4BvrrFERcSr7WBrBXAQjeWQHadXrixds7n
 5usA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1668511581; x=1668597981; bh=BSu9fNyMDInUSLPu9EeiuPR6yrQG
 kIJxuLw46cKSGq0=; b=Sixm2NM1jTglqzjlT+ahTUhNKp/p8bdAj8M87bfacpl6
 DhHAPTO0X4hXGph98uSubmwNEpEwe3bfkoAOIWMTV44BFk1eHjBJNL6eNPkS79Ja
 V3JwL0Q30sDUdv0ByQXnX1gdxbq/YtbgXE8mD5oJmP6ljM/LN1uuoFjdAW8gwuPL
 X9DYxCGjMoNpPo4yuQXHEEZcD3jlRNjbzyLFhgYcPWniffYk2m7jKU8q8UhWnpm3
 6Fk/WdoFm4RQuKc0FvTpxNk6tbehNuZnQ2IqR1Olumj5Uj/l2+rZC2QEWGGXVSW1
 ApJXaVWNGLgfjyHoc720f4f4x4fmtaOLaxEDZ2jaFw==
X-ME-Sender: <xms:XHdzY-r2p-wHLT699mjwYv6KAzgdrT7Y9sRMyMEQJDZQKRbxYop0sw>
 <xme:XHdzY8p5CH_EmR-rs3A2RffmZI9HxmxPN91BzFeTnrn1vMKISMs7A3JrSL-N08w65
 -N8Q4-k3SIujWLaNIY>
X-ME-Received: <xmr:XHdzYzOvnx08qB_aiSYQ96OtyJLLt3EJsPdiRwVac3xkK6KLI7FH1PP_hsjxwq6gDXiOjuNw80IExKhR0mTy2Pxb5REPcQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeeggddvkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteffffej
 veenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:XHdzY97WTBYXUPn7I5bYZXjoUTRuRob8w4sfGb0_CDbs-3AQyXiNjA>
 <xmx:XHdzY960rlxJtBQY8Lp0LH-Y5QNOHPx8L4As7Y05Z3G0fqfrKK_oXg>
 <xmx:XHdzY9gScS6B7LzODxT8U9wI0H41vLKb36e7314Fqr-vlXyoqT1gHQ>
 <xmx:XXdzY3n7J_7pouzSgWhdngtHGHqtUdONau2ZDq-nrM3fy-FQk8JiZA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Nov 2022 06:26:19 -0500 (EST)
Date: Tue, 15 Nov 2022 12:26:17 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Joel Granados <j.granados@samsung.com>
Cc: k.jensen@samsung.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Subject: Re: [PATCH v2 3/3] nvme: Add physical writes/reads from OCP log
Message-ID: <Y3N3WTpB02g/uxdH@cormorant.local>
References: <20221114135043.2958100-1-j.granados@samsung.com>
 <CGME20221114135429eucas1p26370f7dd286e514105ae1173bfcc066f@eucas1p2.samsung.com>
 <20221114135043.2958100-4-j.granados@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/4p2VqrRpnbknjeR"
Content-Disposition: inline
In-Reply-To: <20221114135043.2958100-4-j.granados@samsung.com>
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


--/4p2VqrRpnbknjeR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 14 14:50, Joel Granados wrote:
> In order to evaluate write amplification factor (WAF) within the storage
> stack it is important to know the number of bytes written to the
> controller. The existing SMART log value of Data Units Written is too
> coarse (given in units of 500 Kb) and so we add the SMART health
> information extended from the OCP specification (given in units of bytes).
>=20
> To accomodate different vendor specific specifications like OCP, we add a
> multiplexing function (nvme_vendor_specific_log) which will route to the
> different log functions based on arguments and log ids. We only return the
> OCP extended smart log when the command is 0xC0 and ocp has been turned on
> in the args.
>=20
> Though we add the whole nvme smart log extended structure, we only popula=
te
> the physical_media_units_{read,written}, log_page_version and
> log_page_uuid.
>=20
> Signed-off-by: Joel Granados <j.granados@samsung.com>
>=20
> squash with main
>=20
> Signed-off-by: Joel Granados <j.granados@samsung.com>

Looks like you slightly messed up the squash ;)

Also, squash the previous patch (adding the ocp parameter) into this.
Please add a note in the documentation (docs/system/devices/nvme.rst)
about this parameter.

> ---
>  hw/nvme/ctrl.c       | 56 ++++++++++++++++++++++++++++++++++++++++++++
>  include/block/nvme.h | 36 ++++++++++++++++++++++++++++
>  2 files changed, 92 insertions(+)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 220683201a..5e6a8150a2 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -4455,6 +4455,42 @@ static void nvme_set_blk_stats(NvmeNamespace *ns, =
struct nvme_stats *stats)
>      stats->write_commands +=3D s->nr_ops[BLOCK_ACCT_WRITE];
>  }
> =20
> +static uint16_t nvme_ocp_extended_smart_info(NvmeCtrl *n, uint8_t rae,
> +                                             uint32_t buf_len, uint64_t =
off,
> +                                             NvmeRequest *req)
> +{
> +    NvmeNamespace *ns =3D NULL;
> +    NvmeSmartLogExtended smart_ext =3D { 0 };
> +    struct nvme_stats stats =3D { 0 };
> +    uint32_t trans_len;
> +
> +    if (off >=3D sizeof(smart_ext)) {
> +        return NVME_INVALID_FIELD | NVME_DNR;
> +    }
> +
> +    // Accumulate all stats from all namespaces

Use /* lower-case and no period */ for one sentence, one line comments.

I think scripts/checkpatch.pl picks this up.

> +    for (int i =3D 1; i <=3D NVME_MAX_NAMESPACES; i++) {
> +        ns =3D nvme_ns(n, i);
> +        if (ns)
> +        {

Paranthesis go on the same line as the `if`.

> +            nvme_set_blk_stats(ns, &stats);
> +        }
> +    }
> +
> +    smart_ext.physical_media_units_written[0] =3D cpu_to_le32(stats.unit=
s_written);
> +    smart_ext.physical_media_units_read[0] =3D cpu_to_le32(stats.units_r=
ead);
> +    smart_ext.log_page_version =3D 0x0003;
> +    smart_ext.log_page_uuid[0] =3D 0xA4F2BFEA2810AFC5;
> +    smart_ext.log_page_uuid[1] =3D 0xAFD514C97C6F4F9C;
> +
> +    if (!rae) {
> +        nvme_clear_events(n, NVME_AER_TYPE_SMART);
> +    }
> +
> +    trans_len =3D MIN(sizeof(smart_ext) - off, buf_len);
> +    return nvme_c2h(n, (uint8_t *) &smart_ext + off, trans_len, req);
> +}
> +
>  static uint16_t nvme_smart_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_l=
en,
>                                  uint64_t off, NvmeRequest *req)
>  {
> @@ -4642,6 +4678,24 @@ static uint16_t nvme_cmd_effects(NvmeCtrl *n, uint=
8_t csi, uint32_t buf_len,
>      return nvme_c2h(n, ((uint8_t *)&log) + off, trans_len, req);
>  }
> =20
> +static uint16_t nvme_vendor_specific_log(uint8_t lid, NvmeCtrl *n, uint8=
_t rae,
> +                                         uint32_t buf_len, uint64_t off,
> +                                         NvmeRequest *req)

`NvmeCtrl *n` must be first parameter.

> +{
> +    NvmeSubsystem *subsys =3D n->subsys;
> +    switch (lid) {
> +        case NVME_LOG_VENDOR_START:

In this particular case, I think it is more clear if you simply use the
hex value directly. The "meaning" of the log page id depends on if or
not this is an controller implementing the OCP spec.

> +            if (subsys->params.ocp) {
> +                return nvme_ocp_extended_smart_info(n, rae, buf_len, off=
, req);
> +            }
> +            break;
> +            /* Add a case for each additional vendor specific log id */

Lower-case the comment.

> +    }
> +
> +    trace_pci_nvme_err_invalid_log_page(nvme_cid(req), lid);
> +    return NVME_INVALID_FIELD | NVME_DNR;
> +}
> +
>  static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
>  {
>      NvmeCmd *cmd =3D &req->cmd;
> @@ -4683,6 +4737,8 @@ static uint16_t nvme_get_log(NvmeCtrl *n, NvmeReque=
st *req)
>          return nvme_error_info(n, rae, len, off, req);
>      case NVME_LOG_SMART_INFO:
>          return nvme_smart_info(n, rae, len, off, req);
> +    case NVME_LOG_VENDOR_START...NVME_LOG_VENDOR_END:
> +        return nvme_vendor_specific_log(lid, n, rae, len, off, req);
>      case NVME_LOG_FW_SLOT_INFO:
>          return nvme_fw_log_info(n, len, off, req);
>      case NVME_LOG_CHANGED_NSLIST:
> diff --git a/include/block/nvme.h b/include/block/nvme.h
> index 8027b7126b..2ab0dca529 100644
> --- a/include/block/nvme.h
> +++ b/include/block/nvme.h
> @@ -978,6 +978,40 @@ typedef struct QEMU_PACKED NvmeSmartLog {
>      uint8_t     reserved2[320];
>  } NvmeSmartLog;
> =20
> +typedef struct QEMU_PACKED NvmeSmartLogExtended {
> +    uint64_t    physical_media_units_written[2];
> +    uint64_t    physical_media_units_read[2];
> +    uint64_t    bad_user_blocks;
> +    uint64_t    bad_system_nand_blocks;
> +    uint64_t    xor_recovery_count;
> +    uint64_t    uncorrectable_read_error_count;
> +    uint64_t    soft_ecc_error_count;
> +    uint64_t    end2end_correction_counts;
> +    uint8_t     system_data_percent_used;
> +    uint8_t     refresh_counts[7];
> +    uint64_t    user_data_erase_counts;
> +    uint16_t    thermal_throttling_stat_and_count;
> +    uint16_t    dssd_spec_version[3];
> +    uint64_t    pcie_correctable_error_count;
> +    uint32_t    incomplete_shutdowns;
> +    uint32_t    reserved0;

I know that it is not totally consistent across the code, but please use
`rsvd<BYTEOFFSET>` for the reserved field names. The above would be
`rsvd116` if I am not mistaken.

> +    uint8_t     percent_free_blocks;
> +    uint8_t     reserved1[7];
> +    uint16_t    capacity_health;
> +    uint8_t     nvme_errata_ver;
> +    uint8_t     reserved2[5];
> +    uint64_t    unaligned_io;
> +    uint64_t    security_ver_num;
> +    uint64_t    total_nuse;
> +    uint64_t    plp_start_count[2];
> +    uint64_t    endurance_estimate[2];
> +    uint64_t    pcie_retraining_count;
> +    uint64_t    power_state_change_count;
> +    uint8_t     reserved3[286];
> +    uint16_t    log_page_version;
> +    uint64_t    log_page_uuid[2];
> +} NvmeSmartLogExtended;
> +
>  #define NVME_SMART_WARN_MAX     6
>  enum NvmeSmartWarn {
>      NVME_SMART_SPARE                  =3D 1 << 0,
> @@ -1010,6 +1044,8 @@ enum NvmeLogIdentifier {
>      NVME_LOG_FW_SLOT_INFO   =3D 0x03,
>      NVME_LOG_CHANGED_NSLIST =3D 0x04,
>      NVME_LOG_CMD_EFFECTS    =3D 0x05,
> +    NVME_LOG_VENDOR_START   =3D 0xC0,
> +    NVME_LOG_VENDOR_END     =3D 0xFF,

Existing style is generally lower-case hex.

>  };
> =20
>  typedef struct QEMU_PACKED NvmePSD {
> --=20
> 2.30.2
>=20
>=20

--/4p2VqrRpnbknjeR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmNzd1kACgkQTeGvMW1P
Dem4kQf/bIwKyYzcMNT+8yWPTv1c8UDNtiEdtcsLBVXpwo8LvMzGb8u8e88w2QU4
mFWO3pI5DoNFI2Q1NSl9NwUyDYeSQN0NdPKjiXNN6tdzDiTU4Uqy6wo37BS9JePn
IxSzGexGwUdbwmQZyEOjf8Myok9ZIZ6V4mIvWVgS+iiGHrORC1Q1i/cAqfi138AM
zCZmcPGeHi8oU7jE2gT+c/URobvuOAlHtIFLjL2meS+rP+O1VDQqlwe/vqtuRmaJ
/0LYsGWfpcnPrvfH4MUIWifARhYgLD6xQ0A2b6RXWYSdqa87Kx9iFxb7mbvdSTxW
kMBqJieIvEoesYs7yicllYQNcZWspg==
=XzbF
-----END PGP SIGNATURE-----

--/4p2VqrRpnbknjeR--

