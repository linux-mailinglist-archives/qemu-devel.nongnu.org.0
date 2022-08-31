Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FF95A7683
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 08:27:17 +0200 (CEST)
Received: from localhost ([::1]:52538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTHBz-0008Mt-P6
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 02:27:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1oTH8u-0006Tr-CQ
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 02:24:04 -0400
Received: from mga09.intel.com ([134.134.136.24]:42129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1oTH8s-0004Lg-Dx
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 02:24:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661927042; x=1693463042;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=rAZ9JtZWx5JmTAKE5oF2mrvO/MB2QZbcwoLV/N7WsUI=;
 b=SYVzHYgiSFsA+pPLgZ9vwlckKhqaNnOJbB6+jwWPVhHJ2yL2gE0I2wif
 2Aormx+5ADmPV6YXOtrBiDRgArrK9TzNJYurOoSUwtPkKvp60D/qjj2Kn
 /2DDjwCiC1K5hSqEUfFvDZMzjFMNK6QNXp3dOFY4eg1qxiiuRi1xTYFQ7
 08W5BHsPLFdwJaV3Jx7aVm9Bfabym8DJdKxkdWmUUcqwFRWh4AKJDo5ZT
 j2zvDc9P2M0Yl3IRKlQIZBdpALht/Q2smfPaZbf68szwEmfs5KhBT3CgM
 5xG/1NIjygZtprqmmf1m5PmfYUO6qL5+AG9Ism6bbO1vJM6or13xQI5vz g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="296167445"
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; d="scan'208";a="296167445"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 23:23:54 -0700
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; d="scan'208";a="673225993"
Received: from leiwang7-mobl.ccr.corp.intel.com (HELO [10.238.4.77])
 ([10.238.4.77])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 23:23:53 -0700
Message-ID: <9cb1a173-c703-1787-90e1-4668710b323b@intel.com>
Date: Wed, 31 Aug 2022 14:23:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.13.0
Subject: Re: [Qemu-devel] [RFC PATCH] Add qemu .clang-format
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <1443720628-16512-1-git-send-email-marcandre.lureau@redhat.com>
From: "Wang, Lei" <lei4.wang@intel.com>
In-Reply-To: <1443720628-16512-1-git-send-email-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: permerror client-ip=134.134.136.24;
 envelope-from=lei4.wang@intel.com; helo=mga09.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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


On 10/2/2015 1:30 AM, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> clang-format is awesome to reflow your code according to qemu coding
> style in an editor (in the region you modify).
> 
> (note: clang-tidy should be able to add missing braces around
> statements, but I haven't tried it, it's quite recent)
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   .clang-format | 6 ++++++
>   1 file changed, 6 insertions(+)
>   create mode 100644 .clang-format
> 
> diff --git a/.clang-format b/.clang-format
> new file mode 100644
> index 0000000..6422547
> --- /dev/null
> +++ b/.clang-format
> @@ -0,0 +1,6 @@
> +BasedOnStyle: LLVM
> +IndentWidth: 4
> +UseTab: Never
> +BreakBeforeBraces: Linux
> +AllowShortIfStatementsOnASingleLine: false
> +IndentCaseLabels: false

Hi, any progress on this? I also found a gist on GitHub which can be a 
reference: https://gist.github.com/elmarco/aa5e0b23567f46fb7f0e73cde586a0c1

