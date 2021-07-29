Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B92873DA0C7
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 12:02:59 +0200 (CEST)
Received: from localhost ([::1]:41156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m92sU-0006sw-RN
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 06:02:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m92qQ-0006Ae-S3
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 06:00:51 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:49227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m92qP-0006zq-Bs
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 06:00:50 -0400
Received: from [192.168.100.1] ([82.142.21.182]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MLhwM-1mQZh535Lk-00Hcpm; Thu, 29 Jul 2021 12:00:43 +0200
Subject: Re: [PATCH 3/3] docs: Move user-facing barrier docs into system manual
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210727204112.12579-1-peter.maydell@linaro.org>
 <20210727204112.12579-4-peter.maydell@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <334078dc-9766-4a57-cb3f-98ccc127d017@vivier.eu>
Date: Thu, 29 Jul 2021 12:00:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727204112.12579-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:g1PvtFgu+Q9C8gNnstyBFVtAKkpoiNfcuqLh0IyyrO24YKahWV4
 FHdg+jdFbky9jUaMvpwGrsbkrWP1LXv1RDipNYgd0VBv/e3D/aN8u5rtiJt1Ksj0nil4IOK
 Rs28Yk0g7VpmH0MfYGh0C4Iicggeza7yZMCrBv7ySaLz7xsaYGPgYOsXx+Gl/pUXXzDH5ss
 YGMjiZD8JqzKzsArU23OA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MBzOqzOBhig=:9O1pGBeRojo2lYm+NgqNej
 tXs1zHNs6aChZD8i70oVXTXq//e8zdZfwVE77SYcTRjw9NcMX/bZQotjX/qW9DpnPvY30VnPy
 g+tafFwxdd6vD52qfg5eg5/S/6sm7tsWsnkm+Lalmg84Xk+ACZI851yKf9DHIbqyXeGFDyicG
 kX0Q7IB1iyhFWEAk2zKZcqj25SCvnjuCUsIbL/nTwmBvgbYeMmBdZiAAw719R4fIHq7FDVV1d
 4bsHiEqWl/Hbpx4c1nZMuH5KY97qi8QAJCL8MBCi9Q1kyDyrJYNAIOkLt1GAp5e6dy6ua8b0g
 6zuCNqLmO4JXBZe7KkDi/Tl/hzfYupQmbK09Qcsuw716aNA6BEH0qVAyEXV1PwZtwGdLm13/l
 UhOBx1mp2hvieMYGWqBiAY9ge8IpLs7Uvul33xv1Q4BBd1cxi3L0dtY8Jb/BMAznw9nJWzOOA
 D68gbx6XgWGw4v9zhCuTHWiT53yV/+xikU6/BTByQUqXLT1hd/HC3LHOG4E1uBNrvC8lNa0T5
 JhLZomVqTf3lDyNPhd0TayTxq80zqcPsoh1uA0pDbzyjjA9nl6WrZDatLmlt6RZSAQakUv57x
 mMCOHoU7g5X5WbO7nhtlB0HKvbwnfTtwb/QJB8WzGdqS1gnvB+sGE3N7Oi6eI0GOqxB8ZxpEg
 WzK0EBfzs3wt1iLfFLQK7oZ0jM3zE8+4RvXzpyDn5T8qQyRyxki9WDIPk6IemV0eMx4SWtTm2
 OTLfWMwCVSCjzl0k9UAiar/8tOFM3/MhqLPlDPdrGPnP1kFznwTkzb9RFSznbkH9l5atn3LI/
 iU/9kfTO7ciA8xiBK/8IrSGTfOzSc2GZM4ZFCZc/rBseBnqobUVR0afBk72IE2zXhzpPlYU
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.277,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 27/07/2021 à 22:41, Peter Maydell a écrit :
> The remaining text in docs/barrier.txt is user-facing description
> of what the device is and how to use it. Move this into the
> system manual and rstify it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/barrier.txt        | 48 -----------------------------------------
>  docs/system/barrier.rst | 44 +++++++++++++++++++++++++++++++++++++
>  docs/system/index.rst   |  1 +
>  3 files changed, 45 insertions(+), 48 deletions(-)
>  delete mode 100644 docs/barrier.txt
>  create mode 100644 docs/system/barrier.rst

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

