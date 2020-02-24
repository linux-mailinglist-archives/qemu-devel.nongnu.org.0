Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C2D169C5D
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Feb 2020 03:43:12 +0100 (CET)
Received: from localhost ([::1]:58954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j63iB-0007xj-RY
	for lists+qemu-devel@lfdr.de; Sun, 23 Feb 2020 21:43:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53646)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangx.jy@cn.fujitsu.com>) id 1j63hW-0007WI-O2
 for qemu-devel@nongnu.org; Sun, 23 Feb 2020 21:42:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yangx.jy@cn.fujitsu.com>) id 1j63hV-0000Yd-R8
 for qemu-devel@nongnu.org; Sun, 23 Feb 2020 21:42:30 -0500
Received: from mail.cn.fujitsu.com ([183.91.158.132]:58196
 helo=heian.cn.fujitsu.com) by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <yangx.jy@cn.fujitsu.com>) id 1j63hV-0000WY-G9
 for qemu-devel@nongnu.org; Sun, 23 Feb 2020 21:42:29 -0500
X-IronPort-AV: E=Sophos;i="5.70,478,1574092800"; d="scan'208";a="83810926"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 24 Feb 2020 10:42:20 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id BF9F1406AB15;
 Mon, 24 Feb 2020 10:32:37 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Mon, 24 Feb 2020 10:42:21 +0800
Message-ID: <5E53380A.5050403@cn.fujitsu.com>
Date: Mon, 24 Feb 2020 10:42:18 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH] virtiofsd/helper: Add shared/no_shared options to help
 message
References: <20200210104451.20036-1-ice_yangxiao@163.com>
In-Reply-To: <20200210104451.20036-1-ice_yangxiao@163.com>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: BF9F1406AB15.A9B4D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 183.91.158.132
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi David,

Do you have any comment on this patch? :-)
Cc qemu-devel@nongnu.org

Best Regards,
Xiao Yang

On 2020/2/10 18:44, Xiao Yang wrote:
> From: Xiao Yang <yangx.jy@cn.fujitsu.com>
>
> Also add a hint that user should start 'ireg' daemon before using shared cache.
>
> Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
> ---
>  tools/virtiofsd/helper.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/tools/virtiofsd/helper.c b/tools/virtiofsd/helper.c
> index 819c2bc13c..0aa02b99b0 100644
> --- a/tools/virtiofsd/helper.c
> +++ b/tools/virtiofsd/helper.c
> @@ -171,6 +171,10 @@ void fuse_cmdline_help(void)
>             "                               default: no_writeback\n"
>             "    -o xattr|no_xattr          enable/disable xattr\n"
>             "                               default: no_xattr\n"
> +           "    -o shared|no_shared        enable/disable shared cache\n"
> +           "                               default: no_shared\n"
> +           "                               please start 'ireg' daemon before "
> +           "using shared cache\n"
>             );
>  }
>  




