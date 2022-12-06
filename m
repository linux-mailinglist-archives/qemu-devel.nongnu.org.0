Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 306FE644258
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 12:45:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2WMO-0007F1-TV; Tue, 06 Dec 2022 06:43:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1p2WMI-0007Es-DU
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 06:43:34 -0500
Received: from mail-out-1a.itc.rwth-aachen.de ([2a00:8a60:1:e501::5:44])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1p2WMB-0008FF-Hj
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 06:43:33 -0500
X-IPAS-Result: =?us-ascii?q?A2CqFABPKo9j/5sagoZaHAEBAQEBAQcBARIBAQQEAQFAg?=
 =?us-ascii?q?U8ChQmEToghiE0xnTaBfQ8BAQEBAQEBAQEIARQwBAEBhQUChQ8mPAINAQIEA?=
 =?us-ascii?q?QEBAQMCAwEBAQEBAQMBAQYBAQEBAQEGBIEdhS9GhlUBAQEBAyMECwEFQRAJA?=
 =?us-ascii?q?hUDAgImAgJXBgEMAQUCAQGCeoMjkUGbHXp/M4EBn1eBZwkBgQosAYkHiBA3g?=
 =?us-ascii?q?VVEgTyDAz6IG4JnBIIkilGKIA5wHCUEDgMZKx1AAgELOzIKRTUJAhFMKxwbB?=
 =?us-ascii?q?4EMKigVAwQEAwIGEwMgAg0oMRQEKRMNKyZtCQIDIWEFAwMEKCwDCUAHFREmP?=
 =?us-ascii?q?AdWNwEEAwIPIDgGAwkDAh9UdS4RFQUDCxUlCAVJBAg3BQZTEgIKERIPBiZFD?=
 =?us-ascii?q?kg+ORYGJ0EBMA4OEwNdgWkEM2aBCwovLpsNgSmkDqEZNAeCH4FNgUoGDJ5qB?=
 =?us-ascii?q?kGWf5Idl0AgoXKFQAIEAgQFAhaCEIFnMxokgzZSFwIPnHF0OwIHAQoBAQMJh?=
 =?us-ascii?q?keDWAEB?=
IronPort-Data: A9a23:oEIQV6AV6x9o+RVW/0Diw5YqxClBgxIJ4kV8jS/XYbTApD523zBUy
 2YaW2CPafaLNmGgf9AiOYTloxlVu5GDm9QyOVdlrnsFo1CmCCbmLYnDch2gb3v6wunrFh8PA
 xA2M4GYRCwMZiaA4E3ra9ANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtcAbeORXkXc5
 7sen+WFYAX/gmQsbDpOg06+gEoHUMra6WtwUmMWOKgjUG/2zxE9EJ8ZLKetGHr0KqE88jmSH
 rurIBmRpws1zj91Yj+Xuu+Tnn4iHtY+CTOzZk9+AMBOtDAf/HBogvZjXBYrQRw/Zz2hx7idw
 TjW3HC6YV9B0qbkwIzxX/TEes1zFfUuxVPJHZSwmezM7mSXK13P+rY0UQZmGtMG0Nx3Rn4bo
 JT0KBhVBvyCr9iJ/JKWeqxX3IEJatP0IINas30mwTyx4fQOGMufBfyRvZkCgnFp250m8fX2P
 qL1bRJzax7BagYJIFAaCJczmM+ymWX/NjRRo1KYo+w77gA/ySQqiOO1YIWJILRmQ+1no2qKg
 zybz1/ILR48P9mG0yvd9EOj07qncSTTHdh6+KeD3uZqgVmWykQXCRsfT1z9puO24manVtdCb
 kAZ5Ccqha418kOtU5/6RRLQiGaJohMGHd9ZAuE37AWlzqvS6hyeQG8eQVZ8hMcOrtAqRTE6k
 0TT2tmvHyNzsPicRTSR+994sA+PBMTcFkdaDQdscOfPy4CLTF0b5v4XcuteLQ==
IronPort-HdrOrdr: A9a23:PARhvaNjosgav8BcTiajsMiBIKoaSvp037By7TESdfUnSL38qy
 nOpoVg6faaslYssR0b9OxoW5PwPE80l6QFgrX5VI3KNGKNhILCFu5fBP7ZogEIbBeRygcy78
 tdmuNFebnN5BBB/KHHyRj9F9om3dGB+OShiOrfyDNzQRpxa6dmhj0JbDpyOSVNNXB7LIt8EI
 DZ6ttMpjKmd3hSdMWyHXUJW+DCotbMhdb8ZwIaBxko4AeDii7t8aX9GRSDxBsSOgk/uovK31
 K16zDE2g==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.96,222,1665439200"; d="scan'208";a="30308742"
Received: from rwthex-s2-b.rwth-ad.de ([134.130.26.155])
 by mail-in-1a.itc.rwth-aachen.de with ESMTP; 06 Dec 2022 12:43:17 +0100
Received: from [IPV6:2a02:908:1088:5920:7fc5:a897:a756:e2fb]
 (2a02:908:1088:5920:7fc5:a897:a756:e2fb) by RWTHEX-S2-B.rwth-ad.de
 (2a00:8a60:1:e500::26:155) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Tue, 6 Dec
 2022 12:43:17 +0100
Message-ID: <59771f97-e036-84de-4feb-aab7ef55e659@rwth-aachen.de>
Date: Tue, 6 Dec 2022 12:43:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v6 0/7] Add ARM Cortex-R52 CPU
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>
References: <20221206102504.165775-1-tobias.roehmel@rwth-aachen.de>
 <5f98f1c6-e6a9-cea6-427f-3fa2c4493e5d@linaro.org>
Content-Language: en-US
From: Tobias Roehmel <tobias.roehmel@rwth-aachen.de>
In-Reply-To: <5f98f1c6-e6a9-cea6-427f-3fa2c4493e5d@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2a02:908:1088:5920:7fc5:a897:a756:e2fb]
X-ClientProxiedBy: rwthex-w1-a.rwth-ad.de (2a00:8a60:1:e500::26:156) To
 RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155)
Received-SPF: pass client-ip=2a00:8a60:1:e501::5:44;
 envelope-from=tobias.roehmel@rwth-aachen.de;
 helo=mail-out-1a.itc.rwth-aachen.de
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.265,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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


On 06.12.22 11:39, Philippe Mathieu-Daudé wrote:
> On 6/12/22 11:24, tobias.roehmel@rwth-aachen.de wrote:
>> From: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>
>
>> v6:
>> patch 5:
>> - I'm freeing the PRBAR/... strings explicitly now since
>>    I don't know how to use autofree in this setup correctly.
>>    Maybe {} around the part were the string is created/used,
>>    such that it is dropped at }?
>
> The pointer is declared outside of a for() statement. Then
> inside this statement you alloc/free twice, using the same
> pointer. This is correct.  If you really want to use
> g_autofree in such case, you'd need to declare within the
> same statement, one pointer for each string:
>
>   for (i = 0; i < MIN(cpu->pmsav7_dregion, 32); ++i) {
>       uint8_t crm = 0b1000 | extract32(i, 1, 3);
>       uint8_t opc1 = extract32(i, 4, 1);
>       uint8_t opc2 = extract32(i, 0, 1) << 2;
>       g_autofree char *prbarn_str = g_strdup_printf("PRBAR%u", i);
>       g_autofree char *prlarn_str = g_strdup_printf("PRLAR%u", i);
>
>       const ARMCPRegInfo tmp_prbarn_reginfo = {
>           .name = prbarn_str, .type = ARM_CP_ALIAS | ARM_CP_NO_RAW,
>           .cp = 15, .opc1 = opc1, .crn = 6, .crm = crm, .opc2 = opc2,
>           .access = PL1_RW, .resetvalue = 0,
>           .accessfn = access_tvm_trvm,
>           .writefn = pmsav8r_regn_write, .readfn = pmsav8r_regn_read
>       };
>       define_one_arm_cp_reg(cpu, &tmp_prbarn_reginfo);
>
>       opc2 = extract32(i, 0, 1) << 2 | 0x1;
>       const ARMCPRegInfo tmp_prlarn_reginfo = {
>           .name = prlarn_str, .type = ARM_CP_ALIAS | ARM_CP_NO_RAW,
>           .cp = 15, .opc1 = opc1, .crn = 6, .crm = crm, .opc2 = opc2,
>           .access = PL1_RW, .resetvalue = 0,
>           .accessfn = access_tvm_trvm,
>           .writefn = pmsav8r_regn_write, .readfn = pmsav8r_regn_read
>       };
>       define_one_arm_cp_reg(cpu, &tmp_prlarn_reginfo);
>   }
>
> (Note ARMCPRegInfo can be qualified const).
>
> Regards,
>
> Phil.

Thanks for the explanation! Would that be the preferred way?

Best regards,

Tobias


