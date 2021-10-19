Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F774330B6
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 10:07:37 +0200 (CEST)
Received: from localhost ([::1]:51684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mck9o-0002cB-QV
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 04:07:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mcjwB-0006Hq-RC; Tue, 19 Oct 2021 03:53:31 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:58363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mcjwA-0006H7-3g; Tue, 19 Oct 2021 03:53:31 -0400
Received: from [192.168.100.1] ([82.142.24.54]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N9MlI-1morQK1rTY-015F2p; Tue, 19 Oct 2021 09:53:20 +0200
Subject: Re: [PATCH 0/3] hw/nvram: Fix Memory Leaks in Xilinx eFUSE
To: Tong Ho <tong.ho@xilinx.com>, qemu-arm@nongnu.org
References: <20211015203532.2463705-1-tong.ho@xilinx.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <0fe5997a-adc8-6a0e-fc62-af1aaf3f4f3c@vivier.eu>
Date: Tue, 19 Oct 2021 09:53:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211015203532.2463705-1-tong.ho@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:5A92TUWRAQsBfBcDU+6ncLwKjGLbyf52uE7k8y3NOcsiy6oBa9K
 iJVS6GwjraToc+XVRWb6z+M9/tpu6zb8zbKZcdLzovhDNRiI9dD2pPzCvDst56PoYFhpOBs
 9OtDIb9ac1/vI/MjSUaSP66++XGNoUzPCqB2keQ+ZtIju/LEEpZ6XzY9KvNmaEtxj+oaU51
 vePMyC8IEczaA4R7/zdlQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7hBh8CUCAIo=:Nuj+BqxVySDBvfUzoVpJW3
 HBylQtS8FG0AUq0iEWZiPSxwuQST+JK4PVQbCLYL5OYMB4S3eYWWCcGMHxq/S/Ct8H9PX5b33
 uIhq5s9OtEBlWGfMhlhxicYpSKRY1sulqScQr8C8RIfc/JgQd7RoA5JQaHg/ask06x4C4g9QJ
 RD61PCA8HrIfENfMStUg3eOYXg4EMQQ2VRT5QnZyYvkaPK5copqiYhKFW7tm9q9al+WPiGcGw
 VcpTS+1h7N42v+jHqF6xg1PKjIcPlqST+vAI1gEw/T/RhH4S2fiI1OSxPgiYNNhnRzHE5/Aaz
 WIGhmd+rDcg3xOTn84RArDzuHV6mnHIJfRk4sBGzlJ5+Qy1vR1iohB0THcCcTlrESGsk8wF1p
 +d66ZmZik9BlDp0WM/DH1PrvyYNrt4a52pPLeyr06MVWaVYr1CWt7xq+AAf4nUal6x1oH6OdP
 rWr2zLQjCHuVahb1Pp8CVo7cgSaiK2zHjmBw/cKIzkmAbwOwJ9je78abl/pFGUupRjCWe1wMj
 gAMRI/sENAwVLb/8HQbiQ9gHGUOnR+WVqUQFP6prsZGvxRCiE70qXN8UdUEJi4hzQtHHmW51p
 k/rkMnPgCYvDUjdbgk1CIlVUHbXvlKjLzbX+gX6Oxo95SIahDLK2LDG+RYm9MOnfmD6vnFPJb
 EbTvunLVaKslFkrZO2gjWlRMZZmMQEukDcmKufNwwqWv2N3nfvrcxBZNWd4ulQYBIbXkaLd+S
 nbjJGr6rWVR4e/wjdfGcgTHKsTNBW70kWOhyqA==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 edgar.iglesias@gmail.com, alistair@alistair23.me, qemu-devel@nongnu.org,
 peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 15/10/2021 à 22:35, Tong Ho a écrit :
> This series fixes memory leaks in Xilinx eFUSE devices for
> the Versal and ZynqMP product families.
> 
> The leaks result from failing to free memory allocated
> by object_get_canonical_path().
> 
> Tong Ho (3):
>   hw/nvram: Fix Memory Leak in Xilinx eFuse QOM
>   hw/nvram: Fix Memory Leak in Xilinx Versal eFuse device
>   hw/nvram: Fix Memory Leak in Xilinx ZynqMP eFuse device
> 
>  hw/nvram/xlnx-efuse.c             |  9 ++++++---
>  hw/nvram/xlnx-versal-efuse-ctrl.c | 20 +++++++++++++++-----
>  hw/nvram/xlnx-zynqmp-efuse.c      | 18 ++++++++++++------
>  3 files changed, 33 insertions(+), 14 deletions(-)
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

