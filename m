Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 101E1483112
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 13:37:40 +0100 (CET)
Received: from localhost ([::1]:49432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4Mao-0000Fi-Mi
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 07:37:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkfssion@mkfssion.com>)
 id 1n4MYk-0007vJ-8t
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 07:35:33 -0500
Received: from mail-108-mta106.mxroute.com ([136.175.108.106]:33953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mkfssion@mkfssion.com>)
 id 1n4MYd-0005I5-Jk
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 07:35:25 -0500
Received: from filter004.mxroute.com ([149.28.56.236] filter004.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta106.mxroute.com (ZoneMTA) with ESMTPSA id
 17e1fefcf79000bdf2.001 for <qemu-devel@nongnu.org>
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256);
 Mon, 03 Jan 2022 12:35:16 +0000
X-Zone-Loop: 2908df8e1f76e3adf480e2f7079e630edad550cae1e2
X-Originating-IP: [149.28.56.236]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mkfssion.com; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:Subject:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y/MqIc98wNDXxBGxLvVi4jwM4x3ldXn+YKFXtIfTChU=; b=qWsjMH1mtY7k8akvck1O67Cpdw
 U+p6LAC7aKuJsw3H/3h6TG6xWLQUDp8hvOkmE6BmLaM3kd54y83/zK3SQQ92A6E5MTCZ0kE+smWp0
 F/9+INq9ZxwUGTV+kq2Yl+HEJ+d2Z0eVpHI5uj4yrX5QNJy8wGMKvLpD+z4CyAZ0//QVYGupn7qgK
 f5VR5kqOS+w+0mKos7+wEP9dxzYfnms5CUwEyBrYkq8kwtQyjVHKsBVUN9qL5bwROO0ufLXZzkfNC
 Ho5c2YUOE1JA5NGKSdYRrlo6HiW11RK961fwJ/dIOuT5SKv3pC9wp2awluQgqenmVuIu+zyBeYFaP
 f2yoWdFA==;
Message-ID: <5a6e1f15-e093-c469-cd68-07f6895ca74c@mkfssion.com>
Date: Mon, 3 Jan 2022 20:35:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
To: mkfssion@mkfssion.com
References: <20211224072511.63894-1-mkfssion@mkfssion.com>
Subject: Re: [PATCH v2] vl: Add support to set properties when using JSON
 syntax for -device via -set option
Content-Language: en-US
From: MkfsSion <mkfssion@mkfssion.com>
In-Reply-To: <20211224072511.63894-1-mkfssion@mkfssion.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AuthUser: mkfssion@mkfssion.com
X-Zone-Spam-Resolution: no action
X-Zone-Spam-Status: No, score=3.753846, required=15, tests=[ARC_NA=0,
 NEURAL_SPAM=0, FROM_HAS_DN=0, RCPT_COUNT_THREE=0, MIME_GOOD=-0.1,
 FROM_EQ_ENVFROM=0, MIME_TRACE=0, HFILTER_URL_ONLY=1.353846,
 HFILTER_URL_ONELINE=2.5, MID_RHS_MATCH_FROM=0, RCVD_COUNT_ZERO=0,
 TO_DN_NONE=0]
Received-SPF: pass client-ip=136.175.108.106;
 envelope-from=mkfssion@mkfssion.com; helo=mail-108-mta106.mxroute.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.354, PYZOR_CHECK=1.392,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: pbonzini@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping
https://lore.kernel.org/qemu-devel/20211229064421.5LPUBTk_b7lwFSu6jdh7beB7kZHoVtGGztQSJR1SClI@z/

