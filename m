Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8104F5E93FA
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 17:31:52 +0200 (CEST)
Received: from localhost ([::1]:44744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocTbj-0005Fg-KW
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 11:31:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ocTXm-0000eT-83
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 11:27:46 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:58689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ocTXk-0006Zb-EE
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 11:27:46 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MI5YH-1oR9P03eB5-00FDam; Sun, 25 Sep 2022 17:27:41 +0200
Message-ID: <76198a3e-5245-3a15-319e-1890988e482a@vivier.eu>
Date: Sun, 25 Sep 2022 17:27:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 06/12] linux-user/hppa: Dump IIR on register dump
Content-Language: fr
To: Helge Deller <deller@gmx.de>, Stefan Hajnoczi <stefanha@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220918194555.83535-1-deller@gmx.de>
 <20220918194555.83535-7-deller@gmx.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220918194555.83535-7-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:PX533sUz5tI2fxo0sp6YUTkqgED4ceElnw6me7Smo985ZgjtED5
 PvbdsCJydewUCKU5QRqt3KAqFX/BYZz/R0NX1nwiGbwnEZSSJOGCGVWwuk5+2NAOWCt/Yuz
 K8IPYmfd/i1oH6IWVcCSgdO42J76SPZdZj5AFq5g2RPvlb3PcaVwYwTq5xrvUGTD7dRxPyk
 5L+vy2OSYgb98oGibNmug==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HITMNhz0vO0=:3efUaJAJU4OWDQ99qE0BQ9
 RunN4Lg52Nmoood4/vRCxReBfKQIo4yNi6qbVj9ehK/MoaSES5gFtKzhqZp9DKRoYoaeYCrKZ
 2TTo3q9YMTri7Q/dBkZOw6MI+gDsTh/fz+O2kYfw1UECouTRFUCOistxmbpuAq2RkPsKqRkIt
 XMlxVtPvuyyVhFsrB5RfIXfKUY7d9IYomYjJpxOedi1gyj7t84FL4iAOFfwQxJMtKCZKCdcN5
 grhq9M8Do6iDxnSeLjN8ViwNYx5gGf3KdZgRhtEXl+CVvWQQWQBUYaqOooAor0zcaece5Qdm6
 J9nYZsdkvRKDndrnxl2CYcnXvOTssa9aT+KbsANPxKWTJ7vtmEFHVGGReB4l3Nv+tPVaA49Ko
 AbyQBrSaLHrdQa9gRZEjt5t4X3zZFzqXQaACyPcdBSrn/E43Zy5elFwYfoUOFYBp8LfBdewif
 10AYevTjvHS2xsR2DUHFewFrcqRDTbF+BP1CLJJGdI4Si3XefzsEaq7eil4dwvKUPzKspZTzC
 mUVeYdCVTzv/IpzY8zN7DGThXQlWaC0LaubvOJGAG6au4LBKvG+2Jq/aXLhRM3cZjaxWlfsYi
 oHLUXe5hNUlAUs1eqOnHxlon1/QByHteD8zs89rPs7yeQ2po4i5kLbgfxNH2RkHRzoch+K5L+
 CUeuCoKTytw8uqtDzhD1xWcuuODiqOE+8029h0R9Hwgou99mqDWnRr0rEnfPTcMjWuQPYPzQ6
 /ovn29iqOKwrDzBy0lbdsiL9IkoiMcTaRbxcOuVjQthzTvhfT1RgkWkbMz2MUwci9YXkcqmjl
 l1adggR
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.766,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 18/09/2022 à 21:45, Helge Deller a écrit :
> Include the IIR register (which holds the opcode of the failing
> instruction) when dumping the hppa registers.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>   target/hppa/helper.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>



