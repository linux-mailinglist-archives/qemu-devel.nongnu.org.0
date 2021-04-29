Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 533A636EEE1
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 19:27:24 +0200 (CEST)
Received: from localhost ([::1]:34348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcARf-0001rd-D9
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 13:27:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <k.jensen@samsung.com>)
 id 1lcANM-0006oh-SM
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 13:22:59 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:15060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <k.jensen@samsung.com>)
 id 1lcAN4-0005p4-SO
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 13:22:56 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20210429172224euoutp02b9707477e6a9aaaf2af3990f7e5da5b7~6Y-qophNC1021210212euoutp02d
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 17:22:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20210429172224euoutp02b9707477e6a9aaaf2af3990f7e5da5b7~6Y-qophNC1021210212euoutp02d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1619716944;
 bh=N4k4LG1Va0O7N6+e+WBllK7UyYiDdkFSs0b46pYVUvg=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=VA6BgPwZurPodTksJDCuXPElXl8xQk3u593PZUFVnttuplpcE6JvPyISfM5UHpp0V
 jeOEVNCxCumbOuWyHIsRnhUgIR0r5bcyTBoERsrWZpujBawjJWbnb3C3PTY8QDRdO7
 qBEFNZ71r0lhfOqcTMiDCqeyeEeuM/yIDMPuzoIc=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20210429172224eucas1p1b3ca951a54a9f1d38d3dfa125bacd0d8~6Y-qgNy-X0821408214eucas1p1Z;
 Thu, 29 Apr 2021 17:22:24 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id A4.FE.09439.F4BEA806; Thu, 29
 Apr 2021 18:22:23 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20210429172222eucas1p108dc65f9e3d9cce2ba320c7de29d9dd5~6Y-pd--U_0821408214eucas1p1Y;
 Thu, 29 Apr 2021 17:22:22 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210429172222eusmtrp13282f36b9410bf0932e00d20807504a4~6Y-pdc5k02475824758eusmtrp1A;
 Thu, 29 Apr 2021 17:22:22 +0000 (GMT)
X-AuditID: cbfec7f5-c03ff700000024df-9f-608aeb4f607f
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 1A.D5.08696.E4BEA806; Thu, 29
 Apr 2021 18:22:22 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210429172222eusmtip148977afd8101a5eadf7ba56c129d4246~6Y-pTl0pU2311723117eusmtip1s;
 Thu, 29 Apr 2021 17:22:22 +0000 (GMT)
Received: from apples.localdomain (106.210.248.169) by
 CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Thu, 29 Apr 2021 18:22:22 +0100
Date: Thu, 29 Apr 2021 19:22:20 +0200
From: Klaus Jensen <k.jensen@samsung.com>
To: "Harris, James R" <james.r.harris@intel.com>
Subject: Re: Incorrect NVMe DLFEAT?
Message-ID: <YIrrTIrbOM9ReDp5@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <F676026A-C861-410E-934F-1BBAC20CDCE2@intel.com>
X-Originating-IP: [106.210.248.169]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBIsWRmVeSWpSXmKPExsWy7djP87r+r7sSDObOs7JYsOcDu8Xx3h0s
 Dkwei/e8ZPJ4cm0zUwBTFJdNSmpOZllqkb5dAlfG663zWQum8lZcbmtnamDcxdXFyMkhIWAi
 8ampi7mLkYtDSGAFo8TUpd+YIJwvjBL/nm+Ccj4zSjR3zWeBafnz4QojRGI5o8SprvsscFX3
 Vv6HatnHKHH3yHVGkBYWAVWJlfengdlsApoS2//8BxslImAgcXvVeiYQm1nAWGLJmansILaw
 gLLEn7O3WUFsXgFDiW/9K5ggbEGJkzOfsEDUW0l0fmgCquEAsqUllv/jgAjLSzRvnc0MYnMK
 2EpMPf8A6mpliVU3jjND2LUSp7bcArtTQmAPh8T11VvYIRIuEid/t0E1CEu8Og4Tl5E4PbmH
 BaKhm1Gi78NXZghnBqPE9GXf2UCukBCwlug7kwPR4Chx+d1uVogwn8SNt4IQx/FJTNo2nRki
 zCvR0SY0gVFlFpLPZiH5bBbCZ7OQfLaAkWUVo3hqaXFuemqxcV5quV5xYm5xaV66XnJ+7iZG
 YOI4/e/41x2MK1591DvEyMTBeIhRgoNZSYT397rOBCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8
 u7auiRcSSE8sSc1OTS1ILYLJMnFwSjUwbbaeFyCY2Xe08Gx1vfP3eavPX5p0esep6A9fSqyK
 6nX2H9A+5pHida0+cZnqVYOYtLAbu5fzPvaY1BB+lvN4q8GRWQs+9wery3pEL2855fJwrcTG
 FzzXpt1xjD8nmvfmi6Wa81lNr6dXuSaVNizb+JeXd8kXzU11Hv+n8Qh7tvNe5s5/y1+tMOuH
 v0T9uunvmOS8PmyoiD/nOPVL5sHlWht47LdWPVufuWGp7vvTMd53gxb0753u5eN7J0fasDnO
 49qe7pktt/WmrAh4vCn4x/8Pjxdu8lAOOmJ9+8n/5aGR178fvTzBv3HufLHXh6afUY/e/j3F
 xisi91Xg3nuSbQwPdq/c+q/N22Xis3XiWSxKLMUZiYZazEXFiQA5LzekiwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAIsWRmVeSWpSXmKPExsVy+t/xu7p+r7sSDHpOmlos2POB3eJ47w4W
 ByaPxXteMnk8ubaZKYApSs+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384m
 JTUnsyy1SN8uQS/j9db5rAVTeSsut7UzNTDu4upi5OSQEDCR+PPhCmMXIxeHkMBSRokPZx4y
 QSRkJD5d+cgOYQtL/LnWxQZR9JFRYsr8x6wQzj5GidnLnrOCVLEIqEqsvD+NEcRmE9CU2P7n
 PwuILSJgIHF71XqwqcwCxhJLzkwFmyosoCzx5+xtsF5eAUOJb/0rwGqEBCYwSvRPDoWIC0qc
 nPmEBaLXQmLm/PNA8zmAbGmJ5f84IMLyEs1bZzOD2JwCthJTzz9ggThaWWLVjePMEHatxOe/
 zxgnMIrMQjJ1FpKpsxCmzkIydQEjyypGkdTS4tz03GIjveLE3OLSvHS95PzcTYzAqNp27OeW
 HYwrX33UO8TIxMF4iFGCg1lJhPf3us4EId6UxMqq1KL8+KLSnNTiQ4ymwBCayCwlmpwPjOu8
 knhDMwNTQxMzSwNTSzNjJXFekyNr4oUE0hNLUrNTUwtSi2D6mDg4pRqYis6wx3tdUl+WO+Uw
 y1ZJgdWbt7SWOqzZuGtT8yqtYml3RmODa/e/e5z+JCGrGmaf9ET4vmRoxqLtLe/d77y9cNiT
 zbFy4a0N9w5Pbfwt+23RK94v562lby6LKHsWcfViz8U9K0qbs5vvF/xO/7P61VnF1IkNXf+s
 Kt/ZrZ+l0JkmVu9wbL+r3tfctIaA21vSLvs8a7tZ2JugfrV3uYIoh/fkC8oKMzYUffH1+7xx
 k/+C7KaNkXfd5nQ1ee/eH1gS8uhFRXvDErW1K74dUH/uKX7CzTOipvGfbKXw5h/9olr3OZbF
 qqxVKXSRKQg8yln39Xu+Njd38OHaRt41KkK8Ymem+L672v3j/ueIzuk3lFiKMxINtZiLihMB
 XUtCDTMDAAA=
X-CMS-MailID: 20210429172222eucas1p108dc65f9e3d9cce2ba320c7de29d9dd5
X-Msg-Generator: CA
X-RootMTR: 20210429165141eucas1p267855d81741ff7a775f1345c02703b09
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210429165141eucas1p267855d81741ff7a775f1345c02703b09
References: <CGME20210429165141eucas1p267855d81741ff7a775f1345c02703b09@eucas1p2.samsung.com>
 <F676026A-C861-410E-934F-1BBAC20CDCE2@intel.com>
Received-SPF: pass client-ip=210.118.77.12; envelope-from=k.jensen@samsung.com;
 helo=mailout2.w1.samsung.com
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Apr 29 16:51, Harris, James R wrote:
>Hi,
>

Hi Jim,

>I’m seeing SPDK test failures with QEMU NVMe controllers that I’ve 
>bisected to QEMU commit 2605257a26 (“hw/block/nvme: add the dataset 
>management command”).
>
>The failing tests are related to write zeroes handling.  If an NVMe 
>controller supports DSM, and DLFEAT indicates that deallocated blocks 
>will read back as zeroes, then SPDK uses DEALLOCATE to implement the 
>write zeroes operation.  (Note: SPDK prefers this method to using NVMe 
>WRITE_ZEROES, since the latter is limited to a 16-bit block count.)
>

The Dataset Management command is advisory, the controller gives no 
guarantee that it will actually deallocate anything. You cannot use DSM 
as a realiable alternative to Write Zeroes. The QEMU emulated nvme 
device exploits this and in many cases wont deallocate anything if it 
does not fit nicely with the underlying block device setup.

>QEMU sets DLFEAT = 0x9 – and actually set it to 0x9 even before this 
>commit.  Since the lower 3 bits are 0b001, it is reporting that 
>deallocated blocks will read back later as 0.  This does not actually 
>seem to be the case however – reading previously deallocated blocks do 
>not actually return 0s.
>

Can you share the configuration you use for QEMU? DSM works best with 
4096 byte LBAs (logical_block_size=4096) and the raw format driver.

Also, please test with the Error Recovery feature (and set DULBE) to 
test if the device reports that the block is actually deallocated.

>It seems DLFEAT is being set incorrectly here – should probably be 0x8 
>instead?
>
>Thanks,
>
>Jim
>
>
>

-- 
k

