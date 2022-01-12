Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EE948BF5B
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 08:57:16 +0100 (CET)
Received: from localhost ([::1]:45350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7YVP-0001uy-MT
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 02:57:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkfssion@mkfssion.com>)
 id 1n7YOd-0002Ae-JO
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 02:50:15 -0500
Received: from mail-108-mta223.mxroute.com ([136.175.108.223]:33963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mkfssion@mkfssion.com>)
 id 1n7YOW-0004hS-2Z
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 02:50:15 -0500
Received: from filter004.mxroute.com ([149.28.56.236] filter004.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta223.mxroute.com (ZoneMTA) with ESMTPSA id
 17e4d43da74000bdf2.001 for <qemu-devel@nongnu.org>
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256);
 Wed, 12 Jan 2022 07:49:59 +0000
X-Zone-Loop: 9da26579dfe2f28ec64c607b5789e4918fc9a945ef14
X-Originating-IP: [149.28.56.236]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mkfssion.com; s=x; h=Content-Transfer-Encoding:Content-Type:Subject:From:Cc
 :To:In-Reply-To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/tddLjBFk6UTkVF4hdiLSs7+k0+qWfsvpq3kBcSJme8=; b=uJIjGSz5ge1zmVgsXkLjm7/mDE
 LQnG6V8TJCBHAkQq2Hb0H602LneY4dPYZcDxVe0Z6+LCJ9Rs2KHcwKwj5ZU6BE4bcZhKuAdGM2BmT
 0Cg0q8b1gO+NAF9nlol7W5hov09+AFu/XN7rRVgVFQlibMlvPnwUN4F1cl7gvC+lU7+qs0zaokRxs
 kCzSwJPOHEz77ibKtI8QNJS2INfg4BLV7s9NdK9hb3hHiSccOkE5XqNpOqFbnYFmSauM8EyrRNV/5
 jFyX3XzmufzKcZLAtZk6Lypz/nx/HLyT720ocv9RwDfntD+CRskh0/25xnet0VLNgUjgctTwz07Gk
 OFWhdv+w==;
Message-ID: <b2dc2606-1a2b-39e7-2e42-1fab23094ca7@mkfssion.com>
Date: Wed, 12 Jan 2022 15:49:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
In-Reply-To: <20211224072511.63894-1-mkfssion@mkfssion.com>
To: mkfssion@mkfssion.com
From: MkfsSion <mkfssion@mkfssion.com>
Subject: Re: [PATCH v2] vl: Add support to set properties when using JSON
 syntax for -device via -set option
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AuthUser: mkfssion@mkfssion.com
X-Zone-Spam-Resolution: no action
X-Zone-Spam-Status: No, score=4.6, required=15, tests=[ARC_NA=0,
 FROM_HAS_DN=0, RCPT_COUNT_THREE=0, TO_DN_SOME=0, MIME_GOOD=-0.1,
 FROM_EQ_ENVFROM=0, MIME_TRACE=0, HFILTER_URL_ONLY=2.2,
 HFILTER_URL_ONELINE=2.5, MID_RHS_MATCH_FROM=0, RCVD_COUNT_ZERO=0,
 NEURAL_SPAM=0]
Received-SPF: pass client-ip=136.175.108.223;
 envelope-from=mkfssion@mkfssion.com; helo=mail-108-mta223.mxroute.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, PYZOR_CHECK=1.392,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping
https://lore.kernel.org/qemu-devel/20211224072511.63894-1-mkfssion@mkfssion.com

